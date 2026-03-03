# Question Decomposition Playbook

> Patterns for breaking broad executive questions into concrete Mimir queries.
> Built from real experience answering investor-grade questions.

## Core Principle

**One Mimir query = one metric + one time range + one domain.**

Broad questions require multiple queries across multiple domains. The DA's job is to decompose, route, execute, and synthesize.

---

## Question Types & Decomposition Patterns

### Type 1: Product Adoption
**Trigger:** "How is [product] doing?", "What's [product] adoption?", "Is [product] working?"

**6 dimensions to query:**

| Dimension | What to ask | Why it matters |
|-----------|-------------|----------------|
| **Scale** | MAU trend (monthly, 12 months) | Growth trajectory |
| **Frequency** | DAU + WAU for recent month | Habit formation |
| **Depth** | Sessions/user, messages/session | Engagement quality |
| **Funnel** | Registered → Active (activation rate) | Conversion efficiency |
| **Context** | Product vs sub-feature penetration | Feature-level health |
| **Retention** | Month-over-month returning users | Stickiness |

**Computed metrics** (not from Mimir — calculate yourself):
- DAU/MAU ratio (daily engagement intensity, good = >20%)
- WAU/MAU ratio (weekly engagement, good = >50%)
- Activation rate (active/registered, good = >30%)
- Feature penetration (sub-feature users / total product users)

**Example: Moni adoption (proven 2026-02-03)**

| Query | Domain | Template |
|-------|--------|----------|
| MAU monthly trend | Expense Management | `MAU cua Moni tu thang 1 den thang 12 nam {YYYY} theo tung thang la bao nhieu? KHONG can chart.` |
| DAU + WAU | Expense Management | `So luong DAU va WAU cua Moni trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.` |
| Feature breakdown | Expense Management | `So luong user su dung tung tinh nang cua Moni (QLCT, CHAT, budget, report) trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.` |
| Retention | Expense Management | `Ti le user quay lai (retention rate) cua Moni trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.` |
| Registered users | Expense Management | `Tong so user dang ky Moni va MAU cua Moni trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.` |
| Chat engagement | Chatbot Moni | `Tong so cuoc hoi thoai va tong so nguoi dung Chatbot Moni tu thang 1 den thang 12 nam {YYYY} theo tung thang la bao nhieu? KHONG can chart.` |
| Chat depth | Chatbot Moni | `Trung binh so tin nhan moi cuoc hoi thoai cua Chatbot Moni trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.` |

---

### Type 2: Business Health Overview
**Trigger:** "Tình hình làm ăn?", "How's the business?", "YoY comparison?"

**Query each BU's primary metric:**

| BU | Domain | Metric |
|----|--------|--------|
| Payment | Transaction MoMo | Total transactions + GMV |
| Payment Revenue | P2P Revenue | Revenue VND |
| Lending | CreditTech Paylater | MAU |
| Lending | Vay Nhanh | Disbursement VND |
| Lending | FI Solutions | Disbursement VND |
| Investment | Tui Than Tai | Total users |
| Insurance | InsurTech | Orders |
| Commerce | Rewards MEU | Users |
| Growth | Expense Management | MAU |
| Platform | MiniApp Performance | Total uses |

**Synthesis pattern:** Lead with total transaction volume, then revenue, then each BU growth story. Highlight trends, not just snapshots.

---

### Type 3: Revenue Breakdown
**Trigger:** "Revenue by business line?", "Where does money come from?", "Margin structure?"

**Query revenue/value from each revenue-generating domain:**

| Domain | What to ask |
|--------|-------------|
| P2P Revenue | `Tong revenue P2P trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |
| FI Solutions | `Tong so giai ngan FI Solutions trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |
| InsurTech | `Tong revenue InsurTech trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |
| Vay Nhanh | `Tong so giai ngan Vay Nhanh trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |
| CreditTech Paylater | `MAU va tong so giao dich Paylater trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |
| Media AD Platform | `Tong chi phi quang cao trong nam {YYYY} theo tung quy la bao nhieu? KHONG can chart.` |

**Note:** Mimir doesn't always return "revenue" directly. Some domains return disbursement, GMV, or transaction value. The DA must note the difference.

---

### Type 4: Competitive Position
**Trigger:** "Market share?", "How do we compare to ZaloPay/VNPAY?"

**What Mimir CAN provide:** MoMo's own metrics (volume, users, value)
**What Mimir CANNOT provide:** Competitor data (need Internet sources)

Query MoMo metrics first, then supplement with external data:

| Query | Domain |
|-------|--------|
| Total MoMo transactions + GMV trend | Transaction MoMo |
| P2P volume by type | P2P W2W, W2B, AIO QR |
| User base | MiniApp Performance (platform-wide usage) |
| Financial services scale | Paylater + TTT + Vay Nhanh |

---

### Type 5: Risk Assessment
**Trigger:** "Fraud rate?", "Default rate?", "What risks?", "Delinquency?"

**Known limitations:**
- **Fraud domain is RESTRICTED** — permission denied
- CS domain shows customer complaints volume (253K/mo)
- Check Scam shows scam report volume (643K/mo)
- Lending risk metrics (default rates) — try CreditTech Paylater or Vay Nhanh domains

---

## Multi-Domain Strategy

Some questions need data from **complementary domains** that show different angles of the same thing:

| Product | Primary Domain | Complementary Domain | What complement adds |
|---------|---------------|---------------------|---------------------|
| Moni | Expense Management | Chatbot Moni | Conversation-level engagement data |
| Payments | Transaction MoMo | P2P Revenue | Revenue alongside volume |
| Lending | CreditTech Paylater | FI Solutions | CLO vs Paylater comparison |
| Platform | MiniApp Performance | Individual BU domains | Drill-down from aggregate |

---

## Parallel Execution

For multi-metric questions, **send all queries in parallel**, then poll all at once:

```
# Send N queries → get N request_ids
# sleep 20s
# Poll all N request_ids
# If any still processing → wait 15s and re-poll those
```

This is dramatically faster than sequential send→wait→send→wait.

---

## Investor Question Archetype

Investor questions are the hardest because they:
1. Require **multiple metrics across multiple domains**
2. Demand **computed ratios** (not just raw numbers)
3. Need **trend analysis** (not just snapshots)
4. Require **honest interpretation** (not just data dump)

**Framework for any investor question:**
1. Identify the **underlying concern** (growth? profitability? risk? moat?)
2. Map to **question type** above
3. Decompose into **6-10 sub-queries**
4. Execute in **parallel**
5. Compute **derived metrics**
6. Synthesize into a **board-level narrative** with honest assessment

---

**Created:** 2026-02-03
**Source evidence:** `lt-memory/patterns/2026-02-03_moni-adoption-deep-dive.md`
