# Pending Mimir Requests — Timed Out / Incomplete

> DA checks this file at the start of every session and retries before asking new questions.
> Format: log when a request times out, retry next session, mark DONE when resolved.

## How to Retry
```bash
# Poll a previously sent request_id (some complete hours/days later):
curl -s "https://s.mservice.io/mimir-server-to-server/v1/domain/get_answer?request_id=REQUEST_ID"

# Or resend the question fresh:
curl -s -X POST "https://s.mservice.io/mimir-server-to-server/v1/domain/send_question" \
  -H 'Content-Type: application/json' \
  -d '{"user_email":"son.pham9@mservice.com.vn","domain_id":"DOMAIN_ID","question":"QUESTION KHÔNG cần chart."}'
```

---

## Pending / Timed Out

| Date | Q# | Domain | Domain ID | Question | request_id | Status |
|------|----|--------|-----------|----------|------------|--------|
| 2026-03-04 | Q7 | Notification BU | bcae6a77 | CTR của JOURNEY notifications tháng 1/2026 là bao nhiêu? Top 3 journey theo click volume và CTR? | (schema timeout, no request_id) | ✅ RESOLVED 2026-03-06 |
| 2026-03-04 | Q8 | Paylater | 7e23d41a | Tháng 1/2026 MoMo có bao nhiêu user mới đăng ký? | (schema timeout) | ✅ RESOLVED 2026-03-06 (domain doesn't have this data) |
| 2026-03-06 | Q8 | Transaction MoMo | e5beb7b6 | Tháng 1/2026 MoMo có bao nhiêu user mới đăng ký? KHÔNG cần chart. | 97bbd0aa | ✅ RESOLVED — domain says no registration data |
| 2026-03-06 | Q11 | Paylater | 7e23d41a | — | — | ✅ RESOLVED 2026-03-06 — see batch notes |

---

## Resolved

| Date resolved | Q# | Question | Answer |
|---------------|----|----------|--------|
| 2026-03-06 | Q7 | Journey CTR Jan 2026 | Out-app 2.63%, In-app 8.56% |
| 2026-03-06 | Q9 | Rewards MAU Jan 2026 | 2,521,103 users (table: momovn-mds-shared.REWARD_STORE.reward_user_funnel) |
| 2026-03-06 | Q12 | Bank Partnership Jan 2026 | BQ 806,426 total unique. Mimir 610K (sum of top 5 per-bank, no global dedup). Bank breakdown exact. |
| 2026-03-06 | Q13 | Merchant Financing Jan 2026 | 0 disbursements — product inactive (MATCH) |
| 2026-03-06 | Q14 | Financial Hub Jan 2026 | BQ 5,967,883 users. Mimir used SUM(NO_USER_SCREEN)=10.9T (MISMATCH) |
| 2026-03-06 | Q15 | TTT AUM Mar 1-5 | BQ=Mimir exact. Daily ~12.23-12.35T VND |
| 2026-03-06 | Q16 | InsurTech V/T Mar 1-5 | MATCH. Vehicle ~74-99M/day, Travel ~30-36M/day |
| 2026-03-06 | Q17 | VN disbursement Mar 1-5 | EXACT MATCH. 470.28B VND total |
| 2026-03-06 | Q18 | DLS top CATE Jan 2026 | Mimir-only. SME OFFLINE 52.6M txns #1, LOGISTICS 19.6M #2 |
| 2026-03-06 | Q10 | DLS top 5 merchant Jan 2026 | TikTok 1.67T, Grab 770B, Google VN 576B, Apple 555B, Google 243B |
