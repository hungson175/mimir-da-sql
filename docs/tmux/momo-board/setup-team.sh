#!/bin/bash
# MoMo Board — Executive Discussion Team Setup
# Roles: CEO (Tuong), CMO, CFO, PRESIDENT (Thuan — final approver)
# Topic: New Investment Application inside MoMo

set -e

PROJECT_ROOT="/Users/sonph36/dev/deep_research_mrW/mimir-da-sql"
SESSION_NAME="momo-board"

# 4 panes × 100 columns each
NUM_PANES=4
MIN_WIDTH_PER_PANE=100
WINDOW_WIDTH=$((NUM_PANES * MIN_WIDTH_PER_PANE))
WINDOW_HEIGHT=50

echo "Starting MoMo Board setup..."

# Kill existing session if running
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Killing existing session: $SESSION_NAME"
    tmux kill-session -t $SESSION_NAME
fi

# Create session
cd "$PROJECT_ROOT"
tmux new-session -d -s $SESSION_NAME

# CRITICAL: Resize BEFORE creating layout (prevents 15-char width bug)
echo "Resizing window to ${WINDOW_WIDTH}x${WINDOW_HEIGHT} (${NUM_PANES} panes × ${MIN_WIDTH_PER_PANE} cols)..."
tmux resize-window -t $SESSION_NAME -x $WINDOW_WIDTH -y $WINDOW_HEIGHT

# Create 4-pane horizontal layout
tmux split-window -h -t $SESSION_NAME
tmux split-window -h -t $SESSION_NAME
tmux split-window -h -t $SESSION_NAME
tmux select-layout -t $SESSION_NAME even-horizontal

# Set pane titles (visual display)
tmux select-pane -t $SESSION_NAME:0.0 -T "CEO (Tuong)"
tmux select-pane -t $SESSION_NAME:0.1 -T "CMO"
tmux select-pane -t $SESSION_NAME:0.2 -T "CFO"
tmux select-pane -t $SESSION_NAME:0.3 -T "PRESIDENT (Thuan)"

# Set @role_name options (stable — won't be overwritten by Claude Code)
tmux set-option -p -t $SESSION_NAME:0.0 @role_name "CEO"
tmux set-option -p -t $SESSION_NAME:0.1 @role_name "CMO"
tmux set-option -p -t $SESSION_NAME:0.2 @role_name "CFO"
tmux set-option -p -t $SESSION_NAME:0.3 @role_name "PRESIDENT"

echo "Panes configured. Starting Claude agents..."

# Start Claude Code with specific agent in each pane
# unset CLAUDECODE prevents env var leaking from parent Claude Code session
tmux send-keys -t $SESSION_NAME:0.0 "cd $PROJECT_ROOT && unset CLAUDECODE && claude --agent ceo" C-m
tmux send-keys -t $SESSION_NAME:0.1 "cd $PROJECT_ROOT && unset CLAUDECODE && claude --agent cmo" C-m
tmux send-keys -t $SESSION_NAME:0.2 "cd $PROJECT_ROOT && unset CLAUDECODE && claude --agent cfo" C-m
tmux send-keys -t $SESSION_NAME:0.3 "cd $PROJECT_ROOT && unset CLAUDECODE && claude --agent president" C-m

echo ""
echo "MoMo Board setup complete!"
echo ""
echo "Attach:  tmux attach -t $SESSION_NAME"
echo ""
echo "Roles:"
echo "  Pane 0 (far left)   → CEO       (Nguyen Manh Tuong — Discussion Controller)"
echo "  Pane 1 (center-L)   → CMO       (Marketing & Growth)"
echo "  Pane 2 (center-R)   → CFO       (Finance & Risk)"
echo "  Pane 3 (far right)  → PRESIDENT (Do Quang Thuan — Final Approver)"
echo ""
echo "To send a topic to CEO:"
echo "  tm-send -s $SESSION_NAME CEO \"BOSS: Let's discuss [your topic]\""
echo ""
echo "Flow: Boss → CEO → [CMO + CFO debate] → CEO synthesizes → PRESIDENT approves"
