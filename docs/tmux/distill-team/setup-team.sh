#!/bin/bash

# Distill Team — Automated Setup Script
# 2 roles: PO (Nguyen Manh Tuong persona) + DA (Mimir Distill specialist)

set -e

PROJECT_ROOT="${PROJECT_ROOT:-/Users/sonph36/dev/deep_research_mrW/mimir-da-sql}"
SESSION_NAME="${SESSION_NAME:-distill_team}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPTS_DIR="$SCRIPT_DIR/prompts"

NUM_PANES=2
MIN_WIDTH_PER_PANE=120
WINDOW_WIDTH=$((NUM_PANES * MIN_WIDTH_PER_PANE))
WINDOW_HEIGHT=50

echo "========================================"
echo "  Distill Team Setup"
echo "  PO: Nguyen Manh Tuong (MoMo CEO)"
echo "  DA: Mimir Distill Specialist"
echo "========================================"
echo "Project Root: $PROJECT_ROOT"
echo "Session Name: $SESSION_NAME"

# 1. Kill existing session if needed
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session '$SESSION_NAME' already exists!"
    read -p "Kill and recreate? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        tmux kill-session -t $SESSION_NAME
        echo "Killed existing session"
    else
        echo "Attaching to existing session..."
        tmux attach -t $SESSION_NAME
        exit 0
    fi
fi

# 2. Create session
echo "Creating tmux session '$SESSION_NAME'..."
cd "$PROJECT_ROOT"
tmux new-session -d -s $SESSION_NAME

# 3. Create 2-pane layout (side by side)
tmux split-window -h -t $SESSION_NAME
tmux select-layout -t $SESSION_NAME even-horizontal
tmux resize-window -t $SESSION_NAME -x $WINDOW_WIDTH -y $WINDOW_HEIGHT

# 4. Set pane titles and role names
tmux select-pane -t $SESSION_NAME:0.0 -T "PO | Nguyen Manh Tuong"
tmux select-pane -t $SESSION_NAME:0.1 -T "DA | Mimir Distill"

tmux set-option -p -t $SESSION_NAME:0.0 @role_name "PO"
tmux set-option -p -t $SESSION_NAME:0.1 @role_name "DA"

# 5. Get pane IDs
PANE_IDS=$(tmux list-panes -t $SESSION_NAME -F "#{pane_id}")
PO_PANE=$(echo "$PANE_IDS" | sed -n '1p')
DA_PANE=$(echo "$PANE_IDS" | sed -n '2p')

echo "Pane IDs:"
echo "  PO (Pane 0): $PO_PANE"
echo "  DA (Pane 1): $DA_PANE"

# 6. Check tm-send
if ! command -v tm-send > /dev/null 2>&1; then
    echo "ERROR: tm-send not installed. Install to ~/.local/bin/tm-send first."
    tmux kill-session -t $SESSION_NAME
    exit 1
fi
echo "tm-send: $(which tm-send) ✓"

# 7. Start Claude Code in each pane
echo "Starting Claude Code instances..."
tmux send-keys -t $SESSION_NAME:0.0 "cd $PROJECT_ROOT && unset CLAUDECODE && claude" C-m
tmux send-keys -t $SESSION_NAME:0.1 "cd $PROJECT_ROOT && unset CLAUDECODE && claude" C-m

echo "Waiting for Claude Code to start (15 seconds)..."
sleep 15

# 8. Initialize roles
echo "Initializing roles..."
tmux send-keys -t $SESSION_NAME:0.0 "/init-role PO" C-m
tmux send-keys -t $SESSION_NAME:0.0 C-m

tmux send-keys -t $SESSION_NAME:0.1 "/init-role DA" C-m
tmux send-keys -t $SESSION_NAME:0.1 C-m

echo "Waiting for role initialization (10 seconds)..."
sleep 10

echo ""
echo "========================================"
echo "  Distill Team Ready!"
echo "========================================"
echo ""
echo "Session: $SESSION_NAME"
echo "  PO (Tuong): $PO_PANE"
echo "  DA:         $DA_PANE"
echo ""
echo "Attach:    tmux attach -t $SESSION_NAME"
echo "Send msg:  tm-send PO \"BOSS: your message\""
echo "List:      tm-send --list"
echo ""
echo "Next steps:"
echo "  1. Attach to session"
echo "  2. PO will read BACKLOG and ask DA the first question"
echo "  3. DA will run Mimir Distill workflow and report back"
echo "========================================"
