# Domain Router

> Maps business questions to the right Mimir domain(s). Updated 2026-02-03.

## Quick Reference — Key Domains

| When they ask about... | Use domain | ID | Scale (Jan 2026) |
|------------------------|------------|----|-------------------|
| **Overall MoMo transactions** | Transaction MoMo | `e5beb7b6-...` | 375M txns/mo |
| **DLS / Daily Life Services** | DLS Online | `ca851de3-...` | 113.5M txns/mo |
| **P2P transfers (W2W)** | P2P W2W | `f3d8838b-...` | 43.3M txns/mo |
| **P2P transfers (W2B)** | P2P W2B | `526c040d-...` | 35M txns/mo |
| **P2P transfers (QR)** | P2P AIO QR | `05cf9a74-...` | 14.1M txns/mo |
| **P2P revenue** | P2P Revenue | `67150ae4-...` | 49.4B VND/mo |
| **Phone top-up (Airtime)** | Airtime | `3165cb58-...` | 14M txns/mo |
| **Bill payment** | Billpay | `28214cde-...` | 8.18M txns/mo |
| **All VTTI (Airtime+Data+Billpay+DVC)** | VTTI Overview | `1d4022aa-...` | 28.7M txns/mo |
| **Topbrand merchants** | EPS Topbrand | `72fbb966-...` | 9.95M txns/mo |
| **Offline merchant payments** | SME Offline Payment | `03f0b56d-...` | (specify merchant type!) |
| **EDC device payments** | EDC | `fa727a68-...` | 8.6K txns/mo |
| **Moni / Expense Management** | Expense Management | `af241589-...` | 290K MAU |
| **Paylater / Vi Tra Sau** | CreditTech Paylater | `7e23d41a-...` | 1.45M MAU |
| **Tui Than Tai (money market)** | Tui Than Tai | `fa0fb3af-...` | 11.6M users |
| **Vay Nhanh (quick loans)** | Vay Nhanh | `bb231763-...` | 3.1T VND/mo disbursement |
| **CLO lending** | FI Solutions | `5cd09ae2-...` | 124.6B VND/mo |
| **Merchant financing** | CreditTech Merchant | `076f32ab-...` | (not probed) |
| **Insurance** | InsurTech | `800bf3e8-...` | 127K orders/mo |
| **Securities / stocks** | Chung khoan CV | `ef8cc111-...` | 26K accounts/mo |
| **Bank partnerships (link/topup/withdraw)** | Bank Partnership | `7102da6a-...` | 5M txns/mo |
| **Financial Hub traffic** | Financial Hub | `c80e0c61-...` | 5.97M logins/mo |
| **MiniApp metrics** | MiniApp Performance | `a8e52ce3-...` | 1.57B uses/mo |
| **Travel / OTA bookings** | OTA | `7172ddb9-...` | 0 bookings (data gap?) |
| **Business Pages** | Business Page | `3220e3ea-...` | 18.5K active |
| **Rewards / MEU** | Rewards MEU | `be488435-...` | 2.52M users/mo |
| **Tho Dia MoMo** | Tho Dia MoMo | `c123d8bc-...` | 22.4K logins/mo |
| **Donations** | Donation | `dd5f63eb-...` | 3.76M donations/mo |
| **Promotions / vouchers** | Promo Platform | `9d86b9d9-...` | 4.34M redeemed/mo |
| **Campaign performance** | Promo Campaign | `e9363d1c-...` | (not probed) |
| **Notifications** | Noti for Platform | `750780b7-...` | (core team only) |
| **Customer service** | CS | `63409031-...` | 253K requests/mo |
| **User feedback** | CEE Suggestions | `20e405eb-...` | (not probed) |
| **Chatbot Moni** | Chatbot Moni | `9066c2ad-...` | 479K convos/mo |
| **Scam reports (database)** | Check Scam | `4f353121-...` | 643K reports/mo |
| **Ad spend / media marketing** | Media AD Platform | `bf6c7cb8-...` | 9.76B VND/mo |
| **User consent** | User Consent | `350f9466-...` | (not probed) |
| **Device info** | STRONGHOLD Device | `7994ad65-...` | (not probed) |
| **Referral program (GTBB)** | GTBB | `16f33834-...` | RESTRICTED — permission denied |
| **Fraud** | Fraud | `2892bd4e-...` | RESTRICTED — permission denied |

## Multi-Domain Decomposition

When an executive asks a broad question, decompose it across domains:

### "Tinh hinh lam an" (overall business health)
Query these domains in order:
1. **Transaction MoMo** → total transaction volume + GMV
2. **P2P Revenue** → P2P revenue
3. **DLS Online** → DLS volume
4. **CreditTech Paylater** → lending MAU
5. **Tui Than Tai** → investment users
6. **MiniApp Performance** → platform engagement

### "So sanh cac mang kinh doanh" (compare business lines)
Query one domain per business line:
- Payment: Transaction MoMo or VTTI Overview
- Financial Services: FI Solutions + CreditTech Paylater + Tui Than Tai
- MDS/Commerce: OTA + Business Page + Rewards MEU
- Growth: Expense Management (Moni)

### "Moni dang phat trien hay di xuong?" (is Moni growing?)
Two domains — Expense Management (primary) + Chatbot Moni (complement):
1. MAU trend monthly (Expense Management)
2. DAU + WAU for recent month (Expense Management)
3. Feature breakdown: QLCT vs CHAT (Expense Management)
4. Retention month-over-month (Expense Management)
5. Registered vs active users (Expense Management)
6. Chatbot conversations trend (Chatbot Moni)
7. Avg messages per conversation (Chatbot Moni)
Compute: DAU/MAU, WAU/MAU, activation rate, messages/conversation

## Complementary Domains

Some products have data split across multiple domains. Query both for a complete picture:

| Product | Primary Domain | Complement | What complement adds |
|---------|---------------|------------|---------------------|
| Moni | Expense Management | Chatbot Moni | Conversation-level data (messages, conversations per user) |
| Payments | Transaction MoMo | P2P Revenue | Revenue numbers alongside volume |
| Lending | CreditTech Paylater | FI Solutions | CLO lending vs Paylater comparison |
| Platform health | MiniApp Performance | Individual BU domains | Drill-down from platform aggregate |
| Scam | Check Scam | CS | Scam reports + related customer service volume |

## Gotchas

| Domain | Gotcha |
|--------|--------|
| SME Offline Payment | Must specify merchant type — Mimir will ask for clarification |
| Offline M4B | Contains engagement/cluster data only, NOT transactions |
| Report Scam | Returns 0 — use Check Scam domain instead for scam data |
| OTA | 0 bookings in Jan 2026 — may be data lag |
| Notification domains | Platform version is core-team-only; BU version needs exact campaign name |
| InsurTech | Mimir responds with persona greeting ("Chao ban, minh la vinh.nguyen13...") — ignore it |
