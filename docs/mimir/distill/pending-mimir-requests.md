# Pending Mimir Requests

Results persist on Mimir servers indefinitely. Poll anytime with:
```bash
curl -s "https://s.mservice.io/mimir-server-to-server/v1/domain/get_answer?request_id=REQUEST_ID"
```

## Queue

| ID | Request ID | Question | Sent | Status |
|----|-----------|----------|------|--------|
| Q1 | `b3a7f7b5-d96e-4b52-be77-9fcf1f8115f2` | InsurTech MAU 8-month trend Jul–Feb | 2026-03-03 22:18 | PENDING (heavy query) |
| Q2 | `14ce0aed-276d-4eec-b138-e599e33793a8` | InsurTech order count + GMV + revenue Sep–Feb (Distribution) | 2026-03-03 22:34 | PENDING (heavy query) |

## Completed

| ID | Request ID | Question | Result |
|----|-----------|----------|--------|
| MAU-3mo | `e8ce5b2b-0fec-45ba-a92f-563ba123fb60` | InsurTech MAU Dec/Jan/Feb | ✅ Dec:127K Jan:140K Feb:149K |
