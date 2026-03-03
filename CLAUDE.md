# Mimir DA SQL

A self-improving Data Analyst skill that writes SQL directly against MoMo's data domains via Mimir.

## Who Uses This

**C-level executives and department heads.** They ask broad business questions like:

> "Tinh hinh lam an nam 2025 so voi 2024 ntn?"
> "Moni dang phat trien hay di xuong?"
> "So sanh cac mang kinh doanh Q4/2025?"

These are vague on purpose — leaders think in business outcomes, not metrics. The DA must decompose these into multiple specific SQL queries, synthesize the results, and present a coherent business picture.

## How This Project Works

This is a **Claude Code skill**. When activated, you become a DA that explores MoMo business data. Unlike `mimir-da` which asks Vietnamese questions via Mimir's question API, **this DA writes SQL directly** using Mimir's domain metadata to understand table schemas.

**Critical:** To write correct SQL, you must first **understand what data exists**. Call Mimir's metadata/discovery APIs to map out available domains, tables, columns, and types. Store everything in `lt-memory/domains/`. The richer your domain knowledge, the better SQL you write.

## Progressive Disclosure

Load only what you need, when you need it.

| Level | What | When to Load |
|-------|------|--------------|
| **0** | This file | Always (you're reading it) |
| **1** | `docs/DA_PROMPT.md` | When doing DA work — your full skill instructions |
| **2** | `lt-memory/_index.md` → deep files | Before/after every query — your accumulated knowledge |
| **2+** | `docs/ref/` | Reference materials — domain guides, metric defs (loaded by DA_PROMPT.md as needed) |
| **2+** | `docs/scripts/` | Utility scripts — API helpers, formatters (executed, not read into context) |
| **3** | `docs/tech/mimir_apis.md` | Only if you need raw API reference |

## The Learning Loop

```
RECALL → EXPLORE → LEARN → repeat
```

1. **RECALL** — read `lt-memory/_index.md`, load relevant domain/pattern files
2. **EXPLORE** — write SQL, execute it against the domain, get data back
3. **LEARN** — write what you discovered to `lt-memory/` (patterns, errors, domain knowledge)

The more you explore, the better you get.

## lt-memory Structure

```
lt-memory/
├── _index.md         ← Catalog of everything learned (read this FIRST)
├── domains/          ← What we know about each data domain (tables, columns, types)
├── patterns/         ← SQL queries that worked (reusable templates)
├── errors/           ← SQL queries that failed (lessons learned)
└── meta/             ← How Mimir itself behaves
```

## Quick Reference

| Key | Value |
|-----|-------|
| Prod | `https://s.mservice.io/mimir-server-to-server` |
| Dev | `https://s.dev.mservice.io/mimir-server-to-server` |
| User | `son.pham9@mservice.com.vn` |
| Moni domain | `af241589-f5be-4b97-8928-fe0823c8dc75` |

## Pitfalls

- **Empty schema? Fetch it yourself, don't guess or ask.** Before writing SQL, check the domain file for column info. If empty, call `GET /v1/domain/metadata?domain_id=...`, update the domain file, then write SQL. Only ask the user if the API itself returns no schema.
- **Never fabricate column names.** SQL identifiers are exact — no "close enough." If a column name doesn't appear in (1) metadata API, (2) Mimir domain memory, or (3) a pattern file with actual SQL, it doesn't exist in your knowledge. Mark it `[UNKNOWN - verify]` in the SQL. Never interpolate from naming patterns of other tables.
- **Trace claims to exact sources.** When flagging uncertain data, check each piece individually. Don't blanket-blame one source when only specific items are unverified. Three trust tiers: (1) metadata API = verified, (2) Mimir domain memory/past SQL = likely correct, (3) no source = hallucination.
- **Some domains have hidden schemas.** InsurTech metadata returns `?` for all column names. For these, use Mimir question API from `mimir-da` to get a simple query back, then extract column names from the returned SQL.
- **BigQuery access is limited.** Accessible: `momovn-prod.BU_FI`, `momovn-prod.MBI_DA`. Inaccessible: `momovn-prod.BU_ECOM` (DLS tables), `project-5400504384186300846.REPORT` (Transaction MoMo), `D_OP_USER_PROFILE`, `STRONGHOLD_ANALYTICS`. For demographics, fall back to `SEMANTIC_QLCT_VISIT`. See `lt-memory/errors/bigquery-access-map.md`.
- **`PAYLATER_MAU_SEGMENT` is 1 row per user per month.** The `usecase` column is the primary usecase, not transaction-level. Cannot measure multi-usecase breadth from this table. Use `PAYLATER_ALL_TRANS` for that.
- **`groups` is a BigQuery reserved word.** Use `user_groups` for CTE names. See `lt-memory/errors/sql-gotchas.md` for more.
- **TTT `mart_ttt_daily_user_record` stores ~2 years only.** Querying dates before 2025 returns no data. Use quarterly end-of-period snapshots (GRASS_DATE = 'YYYY-MM-DD') for point-in-time user/AUM counts.
- **TTT table has 11M rows but only ~3.4M MAU.** Always filter `MAU_TYPE != '0.Churn'` for active users or `MFU_TYPE != '0.Churn'` for funded users. Without this, `COUNT(DISTINCT USER_ID)` returns total accounts (11M), not active users. Use full-month date range (not single-day snapshot, which underreports at ~720K). See `lt-memory/errors/sql-gotchas.md`.
- **Always save research to `docs/research/YYYY-MM-DD-<slug>.md`.** For complex reports (3+ dimensions), auto-create an SPA dashboard in `docs/research/spa/` and open it in the browser for the user. See `docs/DA_PROMPT.md` > "Presenting Results (UX)".

## Google Cloud CLI (BigQuery)

gcloud SDK is installed at `~/google-cloud-sdk/`. Always set these env vars when calling gcloud/bq:

```bash
export CLOUDSDK_PYTHON=/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
```

| Item | Value |
|------|-------|
| SDK path | `~/google-cloud-sdk/` |
| Auth account | `son.pham9@mservice.com.vn` |
| ADC credentials | `~/.config/gcloud/application_default_credentials.json` |
| Python for gcloud | `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3` |
| `.env` file | Project root — has `GOOGLE_APPLICATION_CREDENTIALS` and paths |

**Usage examples:**
```bash
# BigQuery query
bq query --use_legacy_sql=false 'SELECT * FROM dataset.table LIMIT 10'

# Set project (required before querying)
gcloud config set project PROJECT_ID

# Check auth
gcloud auth list
```

**Job project:** Always use `--project_id=momovn-bu-fs-ondemand` for BigQuery queries. Data lives in `momovn-prod` but you run jobs from `momovn-bu-fs-ondemand`. The default project `totemic-arcana-459117-e0` has no BQ permissions.

> **⚠ TEMPORARY:** `momovn-bu-fs-ondemand` is an expensive on-demand project for demo purposes. Previous project was `momovn-bu-fi-shared` — may revert back later.

## Product Backlog

See `docs/backlog.md` — dump for features, to-do tasks, and ideas.

## Commands

| Command | What it does |
|---------|--------------|
| `/improve-da` | Reviews lt-memory/ learnings and upgrades DA_PROMPT.md |
