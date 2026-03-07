# BigQuery Access Map

> **Last audit:** 2026-03-06 | Account: `son.pham9@mservice.com.vn` | Job project: `momovn-bu-fi-shared`
> Full audit source: `docs/notes/2026-03-06-bq-domain-access-audit.md`
> 32 ACCESS / 27 DENIED / 5 NO SCHEMA / 1 NOT FOUND (out of 65 domains)

## Accessible Datasets

| BQ Project/Dataset | Key Tables / Domains |
|--------------------|---------------------|
| `momovn-prod.BU_FI` | All FS: Paylater, Vay Nhanh, InsurTech, TTT, CLO, Bank Partnership, Merchant Financing |
| `momovn-prod.MBI_DA` | QLCT/Moni, P2P (all variants), EDC, Journey, Promotion Performance, Offline M4B |
| `momovn-prod.PRODUCT_BANK` | Financial Hub |
| `momovn-prod.CS` | Customer Service tickets |
| `momovn-prod.ALEXIS` | ITC MLBIZ CreditTech |
| `momovn-prod.REPORT` | OTA (partial), MDS |
| `momovn-cvs.BU_CVS` | Chung Khoan CV |
| `project-5400504384186300846.REPORT` | Transaction MoMo (DAILY_PAID_USER_TRANS_VER2), GMC Termination |

## Blocked Datasets

| BQ Project/Dataset | Blocked Domains |
|-------------------|----------------|
| `momovn-prod.BU_ECOM` | DLS Online |
| `momovn-prod.BU_UTILITIES_TELCO` | Telco Funnel |
| `momovn-prod.SHERLOCK` | Report Scam |
| `momovn-prod.STRONGHOLD_ANALYTICS` | Device Info |
| `project-5400504384186300846.MBI_DA` | Business Page, Donation, Tho Dia, EPS-TopBrand, M4B Hub, SME Offline |
| `project-5400504384186300846.BU_UTILITIES_TELCO` | Airtime, Billpay, Data, Supplier, VTTI |
| `project-5400504384186300846.SHERLOCK` | Check Scam |
| `momovn-mds-dc.dwh` | Notification (BU + Platform) |
| `momovn-cdo-shared.DATA_OWNERSHIP` | CDO Data Ownership |
| `momovn-cee-shared.CEE_MAIL` | CEE User Suggestions |
| `momovn-res-data-services.DLP` | Data Loss Prevention |
| `momovn-growth-shared.GMC_SHARE` | GMC GTBB |
| `momovn-growth-analytics.REPORT_MEDIA` | Media Ad Platform |
| `momovn-mini-app-analyst.MINI_APP_PLATFORM` | MiniApp Performance |
| `momovn-mimir.MIMIR` | Mimir Performance |

## Rule: Access by BQ Project

- **`momovn-prod`** — mostly open. Blocked sub-datasets: `BU_ECOM`, `BU_UTILITIES_TELCO`, `STRONGHOLD_ANALYTICS`, `SHERLOCK`
- **`project-5400504384186300846`** — only `REPORT` accessible; everything else blocked
- **All other projects** — fully blocked (mds-dc, cdo-shared, cee-shared, growth-*, mini-app-analyst, mimir)

## No Schema (Mimir-accessible but untestable from our side)

| Domain | ID |
|--------|----|
| Promotion Campaign Performance | `e9363d1c-6486-4072-8dc5-8d06260e9c7f` |
| Rewards MEU | `be488435-9b4d-4449-92ba-7cb7fad81012` |
| Airtime (Non Sensitive) | `63e7a2bc-2f9d-4b8f-9a1d-03c5ea7e16e8` |
| SME Offline Ops | `4ece5632-02ec-4d9d-9ea9-70ed5d6cc1ed` |
| Fraud | `2892bd4e-f624-4d5e-b9b3-1477c5fd9a44` |

## Fallback Strategy

- **Blocked domains:** Use Mimir question API only. Mark verdicts MIMIR-ONLY.
- **Demographics:** `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` — has GENDER, AGE_GROUP, CITY. Partial coverage (~80-90% of FS users).
- **Notification:** BQ blocked (`momovn-mds-dc.dwh`) — Mimir-only. Use BU domain `bcae6a77`.
- **DLS:** BQ blocked (`momovn-prod.BU_ECOM`) — Mimir-only. But Mimir has date format bug on MONTH column (use `'2026-01-01'` not `'2026-01'`).
