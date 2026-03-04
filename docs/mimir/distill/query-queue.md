# Mimir Distill — Query Queue

> CEO questions → decomposed into domain-specific queries → prioritized by size.
> Mimir = source of truth. Learn from Mimir's SQL.

## CEO Question: "Tinh hinh mang Financial Services cua MoMo thang 1/2026?"

### Decomposed Queries (FS domains only, Jan 2026)

#### SMALL (fast, single-table COUNT/SUM, <30s expected)

| # | Domain | Question (Vietnamese) | Domain ID | Our SQL Sketch | Status |
|---|--------|-----------------------|-----------|---------------|--------|
| Q1 | Paylater | MAU cua Paylater trong thang 1/2026? | `7e23d41a` | COUNT DISTINCT agent_id WHERE month_trans='2026-01-01' | TODO |
| Q2 | Paylater | Phan bo MAU theo segment (New/Retain/Reactive) trong thang 1/2026? | `7e23d41a` | GROUP BY MAU_segment | TODO |
| Q3 | Vay Nhanh | Tong so giai ngan Vay Nhanh trong thang 1/2026? | `bb231763` | SUM(DISBURSED_AMOUNT) WHERE DISBURSED_DATE, STATUS filter | TODO |
| Q4 | Vay Nhanh | So luong don vay moi vs tai vay trong thang 1/2026? | `bb231763` | GROUP BY PROCESS_TYPE | TODO |
| Q5 | TTT | Tong so user Tui Than Tai (MAU) trong thang 1/2026? | `fa0fb3af` | COUNT DISTINCT USER_ID WHERE MAU_TYPE!='0.Churn' | TODO |
| Q6 | InsurTech | Tong so don bao hiem thanh cong trong thang 1/2026? | `800bf3e8` | COUNT(*) WHERE CC_STATUS='SUCCESS' | TODO |
| Q7 | InsurTech | Tong doanh thu bao hiem trong thang 1/2026? | `800bf3e8` | SUM(FINAL_REV) WHERE CC_STATUS='SUCCESS' | TODO |
| Q8 | FI Solutions | Tong so giai ngan CLO trong thang 1/2026? | `5cd09ae2` | SUM(CONTRACT_AMOUNT) WHERE STATUS_CODE, SERVICE_TYPE='CLO' | TODO |
| Q9 | FI Solutions | Doanh thu CLO trong thang 1/2026? | `5cd09ae2` | SUM(REVENUE) WHERE SERVICE_TYPE='CLO' | TODO |

#### MEDIUM (GROUP BY with multiple dimensions, 30s-2min expected)

| # | Domain | Question (Vietnamese) | Domain ID | Status |
|---|--------|-----------------------|-----------|--------|
| Q10 | Vay Nhanh | Giai ngan theo tung doi tac (lender) trong thang 1/2026? | `bb231763` | TODO |
| Q11 | InsurTech | So don bao hiem theo tung san pham (SP) trong thang 1/2026? | `800bf3e8` | TODO |
| Q12 | FI Solutions | Giai ngan CLO theo tung doi tac trong thang 1/2026? | `5cd09ae2` | TODO |
| Q13 | Paylater | Phan bo MAU theo usecase trong thang 1/2026? | `7e23d41a` | TODO |

#### LARGE (full table scans, >2min expected — QUEUE FOR LATER)

| # | Domain | Question (Vietnamese) | Domain ID | Why Large | Status |
|---|--------|-----------------------|-----------|-----------|--------|
| Q14 | TTT | AUM tong cua TTT trong thang 1/2026? | `fa0fb3af` | Full month scan of 11M-row table | QUEUED |
| Q15 | TTT | Phan bo user TTT theo Individual vs Money Pool? | `fa0fb3af` | GROUP BY on 11M-row table | QUEUED |

## Progress

| Round | Queries Done | Matches | Learned | Date |
|-------|-------------|---------|---------|------|
| (starting) | 0 | 0 | 0 | 2026-03-03 |
