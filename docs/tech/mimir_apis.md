# Mimir API Reference (Domain Discovery Only)

> This project uses Mimir **only for domain discovery** (metadata, available domains).
> SQL queries are written by the DA and executed directly. No question-answer API.

Base URLs:
- **Prod:** `https://s.mservice.io/mimir-server-to-server`
- **Dev:** `https://s.dev.mservice.io/mimir-server-to-server`

---

## 1. Discovery APIs

### List Available Domains

```bash
curl -s --request GET \
  --url https://s.mservice.io/mimir-server-to-server/v1/domain/available
```

Returns all domains the user has access to. Use this to **map the data landscape**.

### Get Domain Metadata

```bash
curl -s --request GET \
  --url 'https://s.mservice.io/mimir-server-to-server/v1/domain/metadata?domain_id=DOMAIN_ID'
```

Returns metadata for a specific domain — **tables, columns, column types**. This is your primary tool for understanding table schemas before writing SQL.

**What you get back:**
- Table names
- Column names and data types
- Metric definitions
- Available dimensions and filters

**Use this to build your SQL.** Every SQL query should only reference columns confirmed by this API or by verified patterns in `lt-memory/`.

---

## 2. Known Domain IDs

**65 domains discovered** via `/v1/domain/available` (last verified 2026-02-25). Full list in `lt-memory/domains/_all.md`.

Key domains for C-level questions:

| Domain | ID | What it covers |
|--------|----|----------------|
| Transaction MoMo | `e5beb7b6-4273-47ff-9755-a5bcf8d51b97` | All MoMo wallet transactions (375M/mo) |
| CreditTech Paylater | `7e23d41a-0baf-4b36-84c3-07fb850bdb6e` | Paylater MAU, GMV, segments (1.45M MAU) |
| Tui Than Tai | `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11` | Money market users (11.6M users) |
| Financial Hub | `c80e0c61-0d52-4fd6-a2e5-9d2892da7955` | Financial hub login traffic (5.97M users) |
| DLS Online | `ca851de3-b3cb-42bf-96d6-979acde0a7da` | Daily Life Services txns (113.5M/mo) |
| P2P W2W | `f3d8838b-5f96-4f78-8c39-2b146978dbd8` | Wallet-to-wallet transfers (43.3M/mo) |
| P2P W2B | `526c040d-6956-4cb9-8919-87828de05cfc` | Wallet-to-bank transfers (35M/mo) |
| Airtime | `3165cb58-8f0a-4c7d-96e6-ae0b189ff572` | Phone top-up txns (14M/mo) |
| Expense Management (Moni) | `af241589-f5be-4b97-8928-fe0823c8dc75` | QLCT/Moni product analytics (290K MAU) |
| Vay Nhanh | `bb231763-b11c-45c6-9b0d-eb6d24588e3d` | Quick loan disbursement (3.1T VND/mo) |
| FI Solutions | `5cd09ae2-90b8-4102-a717-0ae6f649ff69` | CLO lending disbursement (124.6B/mo) |
| MiniApp Performance | `a8e52ce3-b404-42fe-afff-30201ea2897e` | All miniapp usage (1.57B uses/mo) |

Previously unknown domain `896f849b-9d4c-471d-9143-ed235935a777` was NOT found in prod — likely dev-only.

---

## 3. Error Codes

| Code | Meaning | Action |
|------|---------|--------|
| 200 | Success | Proceed |
| 401 | "Mimir Session Token is required" | Infra issue — escalate |
