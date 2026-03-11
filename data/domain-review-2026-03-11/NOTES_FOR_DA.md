# Domain Review 2026-03-11 — Notes for DA (Claude)

> **Purpose:** When DAs return the filled xlsx files, use this guide to process them.

## What This Is

9 xlsx files sent to FS domain owners (DAs) for review. Each has 4 sheets:

| Sheet | Pre-filled | DA Fills In |
|-------|-----------|-------------|
| **Tổng Quan** | Progress checklist | DA marks ⬜→✅ |
| **Bảng Dữ Liệu** | Header only ("Tên Bảng") | DA lists ALL tables in the domain (1 per row) |
| **Memory DA** | Existing Mimir memory entries (gotchas, filters, SQL tips) | DA reviews each (correct/wrong), adds new entries below "BỔ SUNG" |
| **Thông Tin Domain** | Template placeholder | DA writes full domain description (purpose, key tables, metrics, relationships) |

## Current State (Pre-DA)

All files are **templates with pre-filled memory only**. "Bảng Dữ Liệu" and "Thông Tin Domain" are EMPTY — waiting for DA input.

## Domain Summary — What's Pre-filled

| Domain | Tables (OpenMeta) | Memory Entries | Key Pre-filled Knowledge |
|--------|-------------------|----------------|--------------------------|
| **Bank Partnership** | 6 | 19 | REGEXP for C/D txns, SACOM bank code, success rate formulas |
| **Chứng Khoán CV** | 0 (not in OpenMeta) | 2 | screen_name='stock_home', stock_detail view |
| **Merchant Financing** | 1 | 1 | GMV definition |
| **CreditTech Paylater** | 3 | 15 | MAU_SEGMENT='1.New', trans_type filter, GMV=amount, result_code=0, contract_type, service_name fuzzy match |
| **FI Solutions (CLO)** | 3 | 9 | CONTRACT_AMOUNT for disbursed, status_code for applications, new/retention user defs |
| **Financial Hub** | 0 (not in OpenMeta) | 4 | TTTC=Trung Tâm Tài Chính, correct user count formula, Jan 2026 baselines |
| **InsurTech Insurance** | 10 | 3 | CC_STATUS='SUCCESS'/'CANCEL', Motor Ins SP_DETAIL |
| **Túi Thần Tài** | 3 | 14 | IS_MP not needed, PLUS_TYPE exclusions, AUM includes corp+individual, GRASS_MONTH formula |
| **Vay Nhanh** | 4 | 1 | A30/A60/A90 = access recency buckets |

## When DAs Return — Processing Steps

1. **Extract table lists** from "Bảng Dữ Liệu" → compare with our `lt-memory/domains/` files
2. **Diff memory entries** from "Memory DA" → merge new/corrected items into `lt-memory/knowledge/<domain>.md`
3. **Extract domain descriptions** from "Thông Tin Domain" → enrich `lt-memory/domains/<domain>.md` or create new knowledge files
4. **Cross-check** DA-provided table names against BQ access map — some may be new tables we haven't seen
5. **Update `lt-memory/_index.md`** with any new knowledge files

## Key Insight

The memory entries in these xlsx files come from **Mimir's user-trained memory** (the Memory section at the bottom of each domain .md file). DAs are reviewing whether those memories are still correct. This is essentially a **human validation pass** on our accumulated knowledge.

## File Locations

```
data/domain-review-2026-03-11/
├── bu-fs-bank-partnership/bu-fs-bank-partnership.xlsx
├── bu-fs-chung-khoan-cv/bu-fs-chung-khoan-cv.xlsx
├── bu-fs-credittech-merchant-financing/bu-fs-credittech-merchant-financing.xlsx
├── bu-fs-credittech-paylater/bu-fs-credittech-paylater.xlsx
├── bu-fs-fi-solutions/bu-fs-fi-solutions.xlsx
├── bu-fs-financial-hub/bu-fs-financial-hub.xlsx
├── bu-fs-insurtech-insurance/bu-fs-insurtech-insurance.xlsx
├── bu-fs-tui-than-tai/bu-fs-tui-than-tai.xlsx
└── bu-fs-vay-nhanh/bu-fs-vay-nhanh.xlsx
```
