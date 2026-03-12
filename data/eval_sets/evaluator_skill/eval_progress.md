# DA Evaluator — Progress & Recovery File

> **PURPOSE:** After auto-compact, read this file to resume evaluation.
> **RULE:** NO learning (no writing to lt-memory/). Only append to eval_results.csv.
> **RULE:** Launch eval-da and eval-mimir subagents in parallel (3 questions = 6 agents per batch).

## Status

- **Total evaluable:** 75 (with Gold SQL)
- **Done:** 62 (TTT001, VTS001, Q7, TTT003, VTS008, Q2, TTT007, VTS014, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q1, Q4, Q5, Q6, Q15, Q3, Q16, Q17, Q18, TTT004, TTT006, TTT008, TTT009, TTT010, TTT011, TTT012, TTT013, TTT014, TTT015, TTT016, TTT017, TTT018, TTT019, TTT023, TTT024, TTT026, TTT028, TTT030, TTT032, TTT033, TTT034, TTT035, TTT036, TTT037, TTT038, TTT039, TTT040, TTT041, TTT043, TTT044, TTT046, TTT047, TTT048, TTT049, TTT050, TTT051, VTS002)
- **Remaining:** 13
- **Results file:** `data/eval_sets/evaluator_skill/eval_results.csv`

## How to Resume After Compact

1. Read this file
2. Read `eval_results.csv` — check which IDs are already done
3. Pick next 3 undone IDs from the batch list below
4. For each question, launch 2 agents in parallel:
   - `eval-da` (subagent_type, model=sonnet): send reversed question + domain name
   - `eval-mimir` (subagent_type, model=sonnet): send reversed question + domain name + domain_id
5. Wait for all agents to return
6. Score against golden data (in this file)
7. Append rows to `eval_results.csv` (see CSV format in `patterns.md`)
8. Update "Done" count in this file
9. Repeat until all 67 done

## Domain ID Map

| Domain | Mimir Domain ID |
|--------|----------------|
| VAYNHANH | `bb231763-b11c-45c6-9b0d-eb6d24588e3d` |
| TTT | `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11` |
| VTS | `7e23d41a-0baf-4b36-84c3-07fb850bdb6e` |

## Batch Plan (3 per batch, 23 batches)

### Batch 1: Q8, Q9, Q10
### Batch 2: Q11, Q12, Q13
### Batch 3: Q14, Q1, Q4
### Batch 4: Q5, Q6, Q15
### Batch 5: Q3, Q16, Q17
### Batch 6: Q18, TTT004, TTT006
### Batch 7: TTT008, TTT009, TTT010
### Batch 8: TTT011, TTT012, TTT013
### Batch 9: TTT014, TTT015, TTT016
### Batch 10: TTT017, TTT018, TTT019
### Batch 11: TTT023, TTT024, TTT026
### Batch 12: TTT028, TTT030, TTT032
### Batch 13: TTT033, TTT034, TTT035
### Batch 14: TTT036, TTT037, TTT038
### Batch 15: TTT039, TTT040, TTT041
### Batch 16: TTT043, TTT044, TTT046
### Batch 17: TTT047, TTT048, TTT049
### Batch 18: TTT050, TTT051, VTS002
### Batch 19: VTS003, VTS004, VTS005
### Batch 20: VTS006, VTS007, VTS009
### Batch 21: VTS010, VTS011, VTS012
### Batch 22: VTS013, VTS015, VTS016
### Batch 23: VTS017

---

## All 67 Questions — Reversed + Golden Data

### VAYNHANH (16 questions)

#### Q1 | Moderate | Subquery
- **Reversed:** "Trong 30 ngay truoc khi giai ngan, user Vay Nhanh thang 2/2026 thuong truy cap bao nhieu lan? Phan bo theo so lan truy cap. KHONG can chart."
- **Golden SQL:** `WITH disbursed_feb AS (SELECT AGENT_ID, LOAN_ID, DISBURSED_TIME, LOAN_AMOUNT, FINAL_SEGMENT_USER FROM BAOTU_VAYNHANH_LOAN_INFO WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28' AND DISBURSED_DATE IS NOT NULL), access_counts AS (SELECT d.LOAN_ID, d.AGENT_ID, COUNT(*) AS access_count, COUNT(DISTINCT DATE(e.EVENT_TIME)) AS access_days FROM disbursed_feb d JOIN BAOTU_VAYNHANH_ENTRY_POINT e ON d.AGENT_ID=e.AGENT_ID AND e.EVENT_TIME<d.DISBURSED_TIME AND e.EVENT_TIME>=TIMESTAMP_SUB(d.DISBURSED_TIME, INTERVAL 30 DAY) GROUP BY ALL) SELECT CASE buckets ORDER BY access_bucket`
- **Golden Result:** 88.4% access >=2 lan. Top bucket: 6-10 lan (19.6%), 11-20 (18.0%). 8 rows.

#### Q3 | Complex | Window + Complex
- **Reversed:** "Nguon truy cap cuoi cung truoc khi giai ngan cua user Vay Nhanh thang 2/2026, chia theo phan khuc user (NEWLOAN/RELOAN/REPEATED). KHONG can chart."
- **Golden Result:** Last touchpoint by FINAL_SEGMENT_USER

#### Q4 | Moderate | JOIN
- **Reversed:** "So sanh so lan truy cap trung binh va so ngay truy cap truoc khi giai ngan giua nhom NEWLOAN, RELOAN va REPEATED cua Vay Nhanh thang 2/2026. KHONG can chart."
- **Golden Result:** Access patterns differ by segment

#### Q5 | Moderate | Multi-step
- **Reversed:** "Ty le reloan trong 30, 60, 90 ngay sau khi tat toan khoan vay Vay Nhanh, chia theo thang tat toan. KHONG can chart."
- **Golden Result:** Cohort reloan rates by liquidation month

#### Q6 | Moderate | Subquery
- **Reversed:** "Ty le duoc duyet giai ngan (so khoan giai ngan / so don nop) cua Vay Nhanh tu thang 7/2025 den thang 2/2026, chia theo segment user, lender, va nhom diem tin dung. KHONG can chart."
- **Golden Result:** Approval rates by segment x lender x credit score

#### Q8 | Simple | Aggregation
- **Reversed:** "So sanh tong gia tri giai ngan va so khoan vay Vay Nhanh giua thang 1 va thang 2 nam 2026. KHONG can chart."
- **Golden Result:** MoM comparison Jan vs Feb 2026

#### Q9 | Simple | Aggregation
- **Reversed:** "Phan bo so lan giai ngan cua moi user Vay Nhanh trong thang 2/2026 la nhu nao? Co bao nhieu user vay 1 lan, 2 lan, 3 lan...? KHONG can chart."
- **Golden Result:** Distribution of loan count per user

#### Q10 | Simple | Aggregation
- **Reversed:** "Top 10 ly do tu choi pho bien nhat cua don vay Vay Nhanh trong thang 2/2026 la gi? KHONG can chart."
- **Golden Result:** Top 10 rejection reasons

#### Q11 | Simple | Aggregation
- **Reversed:** "Co bao nhieu user duy nhat da giai ngan Vay Nhanh trong thang 2/2026? Trung binh moi user vay bao nhieu khoan? KHONG can chart."
- **Golden Result:** Distinct users + avg loans per user

#### Q12 | Simple | Aggregation
- **Reversed:** "Phan bo ky han (tenor) cac khoan vay Vay Nhanh trong thang 2/2026 la nhu nao? KHONG can chart."
- **Golden Result:** Tenor distribution

#### Q13 | Simple | Aggregation
- **Reversed:** "So khoan giai ngan Vay Nhanh theo tung ngay trong tuan (thu 2 den chu nhat) trong thang 2/2026. KHONG can chart."
- **Golden Result:** Day-of-week disbursement pattern

#### Q14 | Moderate | Aggregation
- **Reversed:** "Thoi gian trung binh tu luc nop don den khi giai ngan cua Vay Nhanh trong thang 2/2026, chia theo tung lender. KHONG can chart."
- **Golden Result:** Avg processing time by lender

#### Q15 | Moderate | JOIN
- **Reversed:** "Tan suat truy cap theo tung ngay truoc khi giai ngan (tu ngay -30 den ngay 0) cua user Vay Nhanh thang 2/2026. KHONG can chart."
- **Golden Result:** Daily access frequency curve day -30 to day 0

#### Q16 | Complex | Subquery
- **Reversed:** "So sanh so lan truy cap va so ngay truy cap truoc giai ngan giua 3 nhom NEWLOAN, RELOAN, REPEATED cua Vay Nhanh. Tinh trung binh va trung vi. KHONG can chart."
- **Golden Result:** Access stats by segment with median

#### Q17 | Complex | Subquery
- **Reversed:** "Thoi gian trung binh tu khi tat toan khoan vay cu den khi giai ngan khoan vay moi (reloan) cua Vay Nhanh, theo tung thang. KHONG can chart."
- **Golden Result:** Avg days between liquidation and reloan by month

#### Q18 | Complex | Subquery
- **Reversed:** "So sanh luong truy cap cua user chua co khoan vay Vay Nhanh giua ngay 1-11 thang 3/2026 va ngay 1-11 thang 1/2026. KHONG can chart."
- **Golden Result:** Traffic comparison for non-borrowers

### TTT (37 questions)

#### TTT004 | Simple | Aggregation
- **Reversed:** "MoMo tra lai cho nguoi dung Tui Than Tai moi thang bao nhieu tien? Tinh thang gan nhat. KHONG can chart."
- **Golden Result:** Monthly interest payout

#### TTT006 | Moderate | Ranking + Filter
- **Reversed:** "Top 5 vung mien co nhieu nguoi dung Tui Than Tai nhat la vung nao? KHONG can chart."
- **Golden Result:** Top 5 regions by TTT users

#### TTT008 | Moderate | Aggregation
- **Reversed:** "Nhom tuoi nao gui tiet kiem vao Tui Than Tai nhieu nhat? Phan bo so tien gui theo nhom tuoi. KHONG can chart."
- **Golden Result:** Cashin by age group

#### TTT009 | Moderate | Conditional Logic
- **Reversed:** "Bao nhieu phan tram nguoi dung Tui Than Tai dang su dung Tui+? KHONG can chart."
- **Golden Result:** % users using Tui+

#### TTT010 | Moderate | Ranking + Filter
- **Reversed:** "Nguoi dung rut tien tu Tui Than Tai chu yeu qua kenh nao? Phan bo theo kenh rut tien. KHONG can chart."
- **Golden Result:** Cashout channel distribution

#### TTT011 | Moderate | Date/Time
- **Reversed:** "So luong user moi cua Tui Than Tai thang nay so voi thang truoc tang hay giam bao nhieu? KHONG can chart."
- **Golden Result:** New user MoM change

#### TTT012 | Simple | Aggregation
- **Reversed:** "Tui Gop Chung (Money Pool) dang chiem bao nhieu phan tram tong AUM cua Tui Than Tai? Tinh cuoi thang gan nhat. KHONG can chart."
- **Golden Result:** Money Pool % of total AUM

#### TTT013 | Complex | Multi-step
- **Reversed:** "Dong tien vao ra cua Tui Than Tai trong nhung ngay dau thang 3/2026 co gi bat thuong khong? So sanh voi cung ky thang truoc. KHONG can chart."
- **Golden Result:** Early March cash flow anomaly detection

#### TTT014 | Complex | Multi-step
- **Reversed:** "Ty le churn cua Tui Than Tai dang la bao nhieu? Co cao hon muc binh thuong khong? So sanh voi 3 thang truoc. KHONG can chart."
- **Golden Result:** Churn rate + trend

#### TTT015 | Complex | Date/Time
- **Reversed:** "AUM cua Tui Than Tai nam ngoai cung ky la bao nhieu? Tang truong YoY bao nhieu phan tram? KHONG can chart."
- **Golden Result:** YoY AUM growth

#### TTT016 | Complex | Subquery
- **Reversed:** "Trong so nguoi ngung dung Tui Than Tai thang 1/2026, truoc do ho co gui tien vao khong hay chi mo roi bo? KHONG can chart."
- **Golden Result:** Churn user behavior before leaving

#### TTT017 | Simple | Aggregation
- **Reversed:** "Nam hay nu tiet kiem gioi hon tren Tui Than Tai? So sanh so du trung binh theo gioi tinh. KHONG can chart."
- **Golden Result:** Avg balance by gender

#### TTT018 | Complex | Date/Time
- **Reversed:** "AUM va MAU cua Tui Than Tai quy 4/2025 so voi quy 3/2025 thay doi nhu nao? Tang bao nhieu? KHONG can chart."
- **Golden Result:** Q4 vs Q3 2025 AUM + MAU delta

#### TTT019 | Moderate | Ranking + Filter
- **Reversed:** "Trong thang 1/2026, ngay nao co nhieu nguoi rut tien tu Tui Than Tai nhat? Rut bao nhieu tien? KHONG can chart."
- **Golden Result:** Peak cashout day in Jan 2026

#### TTT023 | Complex | Aggregation
- **Reversed:** "Moi thang co bao nhieu nguoi nap tien qua Virtual Account vao Tui Than Tai tren 10 giao dich trong 1 ngay? KHONG can chart."
- **Golden Result:** Heavy VA depositors count by month

#### TTT024 | Complex | Multi-step
- **Reversed:** "Hanh vi nap rut tien cua nguoi dung Tui Gop Chung khac gi so voi Tui Ca Nhan trong 30 ngay qua? KHONG can chart."
- **Golden Result:** Money Pool vs Individual cashin/cashout behavior

#### TTT026 | Simple | Aggregation
- **Reversed:** "So du trung binh cua moi nguoi dung Tui Than Tai hien tai la bao nhieu? Tinh cuoi thang gan nhat. KHONG can chart."
- **Golden Result:** Avg balance per user

#### TTT028 | Simple | Ranking + Filter
- **Reversed:** "Top 10 nguoi dung dang giu nhieu tien nhat trong Tui Than Tai la ai? So du bao nhieu? KHONG can chart."
- **Golden Result:** Top 10 users by balance

#### TTT030 | Moderate | Conditional Logic
- **Reversed:** "Nguoi dung Tui+ rut tien ve ngan hang (NAPAS) thang truoc la bao nhieu? Co tang so voi thang truoc do khong? KHONG can chart."
- **Golden Result:** Tui+ NAPAS cashout + MoM trend

#### TTT032 | Moderate | Aggregation
- **Reversed:** "Nhom so du nao dong gop nhieu nhat vao tong AUM cua Tui Than Tai? Phan bo theo nhom so du. KHONG can chart."
- **Golden Result:** AUM contribution by balance group

#### TTT033 | Moderate | Aggregation
- **Reversed:** "Nguoi dung Tui+ da duoc hoan tien (cashback) tong cong bao nhieu? Xu huong co dang tang khong? KHONG can chart."
- **Golden Result:** Tui+ cashback total + trend

#### TTT034 | Simple | Aggregation
- **Reversed:** "Co bao nhieu nguoi dung dang nap tu dong (auto invest) vao Tui Than Tai? Trung binh moi nguoi nap bao nhieu? KHONG can chart."
- **Golden Result:** Auto-invest user count + avg amount

#### TTT035 | Moderate | Conditional Logic
- **Reversed:** "Nguoi dung co so du tren 50 trieu trong Tui Than Tai chiem bao nhieu phan tram tong so nguoi dung va tong AUM? KHONG can chart."
- **Golden Result:** High-balance users % of total

#### TTT036 | Moderate | Date/Time
- **Reversed:** "Cuoi tuan nguoi dung Tui Than Tai co rut tien nhieu hon ngay thuong khong? So sanh cashout theo ngay trong tuan. KHONG can chart."
- **Golden Result:** Weekend vs weekday cashout pattern

#### TTT037 | Moderate | Aggregation
- **Reversed:** "Nguoi dung Tui Than Tai duoc nhan lai trung binh bao nhieu moi ngay? Phan bo theo nhom so du. KHONG can chart."
- **Golden Result:** Daily interest by balance group

#### TTT038 | Complex | Subquery
- **Reversed:** "Nguoi dung Tui Than Tai quay lai (reactive) trong thang 2/2026 gui vao bao nhieu tien? Ho co tiep tuc dung thang sau khong? KHONG can chart."
- **Golden Result:** Reactive users cashin + retention

#### TTT039 | Simple | Conditional Logic
- **Reversed:** "Nguoi dung nap tien vao Tui Than Tai qua P2P va nap truc tiep, nhom nao nhieu nguoi hon? KHONG can chart."
- **Golden Result:** P2P vs direct cashin user count

#### TTT040 | Complex | Multi-step
- **Reversed:** "Nguoi dung Tui+ duoc nhung quyen loi gi? Bao nhieu nguoi dung tung quyen loi? KHONG can chart."
- **Golden Result:** Tui+ benefits usage breakdown

#### TTT041 | Simple | Aggregation
- **Reversed:** "Moi hang cua Tui+ (Bac, Vang, Kim Cuong) co bao nhieu nguoi dung? KHONG can chart."
- **Golden Result:** Tui+ tier user counts

#### TTT043 | Moderate | Aggregation
- **Reversed:** "Nguoi dung Tui Than Tai su dung tien TTT de thanh toan va chuyen tien chiem bao nhieu phan tram tong giao dich MoMo? KHONG can chart."
- **Golden Result:** TTT as funding source % of total MoMo

#### TTT044 | Moderate | Aggregation
- **Reversed:** "So du trung binh cua nguoi dung tier Platinum so voi Silver va Gold trong Tui Than Tai la bao nhieu? KHONG can chart."
- **Golden Result:** Avg balance by tier

#### TTT046 | Complex | Date/Time
- **Reversed:** "Phan tram nguoi dung Tui Than Tai su dung tien TTT de chuyen khoan dang tang hay giam? Tach rieng P2P va thanh toan. KHONG can chart."
- **Golden Result:** TTT funding usage trend, P2P vs payment

#### TTT047 | Moderate | Aggregation
- **Reversed:** "Merchant nap tien payout vao Tui Than Tai tu khi nao? Co bao nhieu merchant dang su dung? KHONG can chart."
- **Golden Result:** Payout merchant count + start date

#### TTT048 | Complex | Conditional Logic
- **Reversed:** "Tier nao su dung Tui Than Tai de thanh toan nhieu nhat? Platinum co dung nhieu hon Silver khong? KHONG can chart."
- **Golden Result:** Payment usage by tier

#### TTT049 | Moderate | Aggregation
- **Reversed:** "Nguoi dung chuyen tien qua ngan hang (E2B) tu Tui Than Tai so voi toan bo MoMo nhu nao? KHONG can chart."
- **Golden Result:** TTT E2B vs total MoMo E2B

#### TTT050 | Complex | Multi-step
- **Reversed:** "So sanh hanh vi su dung Tui Than Tai lam nguon tien cua 3 tier Bac, Vang, Kim Cuong. Ai chuyen tien nhieu, ai thanh toan nhieu? KHONG can chart."
- **Golden Result:** Funding usage by tier comparison

#### TTT051 | Complex | Multi-step
- **Reversed:** "So sanh chi phi hoan tien va doanh thu trung binh moi user cua Tui Gop Chung trong 6 thang qua. KHONG can chart."
- **Golden Result:** Money Pool cashback cost vs revenue per user

### VTS (14 questions)

#### VTS002 | Simple | Aggregation
- **Reversed:** "Thang 12/2025 co bao nhieu nguoi dung Vi Tra Sau theo tung loai active type? KHONG can chart."
- **Golden Result:** User count by active_type

#### VTS003 | Simple | Conditional Logic
- **Reversed:** "Co bao nhieu nguoi dung Vi Tra Sau thuoc nhom light, medium va hardcore trong thang 1/2026? KHONG can chart."
- **Golden Result:** User count by usage intensity

#### VTS004 | Simple | Aggregation
- **Reversed:** "So luong nguoi dung Vi Tra Sau co giao dich tra gop tai TikTok trong thang 1/2026 la bao nhieu? KHONG can chart."
- **Golden Result:** TikTok installment users

#### VTS005 | Simple | Aggregation
- **Reversed:** "So luong MAU cua Vi Tra Sau theo tung nhom tuoi trong thang 3/2025 la bao nhieu? KHONG can chart."
- **Golden Result:** MAU by age group

#### VTS006 | Simple | Aggregation
- **Reversed:** "Phan bo han muc tin dung cua nguoi dung Vi Tra Sau theo so luong user trong thang 2/2025 nhu nao? KHONG can chart."
- **Golden Result:** Credit limit distribution

#### VTS007 | Simple | Ranking + Filter
- **Reversed:** "Nguoi dung Vi Tra Sau o Ho Chi Minh thanh toan tai SME, tach theo loai active type trong thang 3/2025. KHONG can chart."
- **Golden Result:** HCM SME users by active type

#### VTS009 | Moderate | Conditional Logic
- **Reversed:** "So sanh ty le quay lai giua nguoi dung Vi Tra Sau co dung promo va khong dung promo trong thang 11/2025. KHONG can chart."
- **Golden Result:** Retention rate promo vs non-promo

#### VTS010 | Moderate | Conditional Logic
- **Reversed:** "Nguoi dung Vi Tra Sau thanh toan bao nhieu dich vu khac nhau? Phan bo user theo so luong dich vu su dung trong thang 12/2025. KHONG can chart."
- **Golden Result:** User distribution by service count

#### VTS011 | Moderate | Window + Complex
- **Reversed:** "Nguoi dung Vi Tra Sau co giao dich dau tien la nap dien thoai/data thi giao dich thu hai la gi? Thang 1/2026. KHONG can chart."
- **Golden Result:** Second usecase after airtime/data first use

#### VTS012 | Moderate | Conditional Logic
- **Reversed:** "Nguoi dung Vi Tra Sau active dau thang co ty le quay lai cao hon nguoi active cuoi thang khong? Thang 11/2025. KHONG can chart."
- **Golden Result:** Retention by activation timing in month

#### VTS013 | Moderate | Aggregation
- **Reversed:** "Phan tich hanh vi giao dich Vi Tra Sau theo nhom tuoi: trung binh spending, so giao dich, so dich vu su dung trong thang 3/2025. KHONG can chart."
- **Golden Result:** Transaction behavior by age group

#### VTS015 | Complex | Window + Complex
- **Reversed:** "Nguoi dung Vi Tra Sau duoc tang han muc trong thang 9/2025 thi spending tang bao nhieu phan tram? Quan sat trong 3 thang sau do. KHONG can chart."
- **Golden Result:** Spending change after limit increase

#### VTS016 | Complex | Multi-step
- **Reversed:** "Nguoi dung moi (New MAU) cua Vi Tra Sau dang tang nho gift/promo nao? Phan bo theo loai gift. KHONG can chart."
- **Golden Result:** New MAU by gift type

#### VTS017 | Complex | Multi-step
- **Reversed:** "Nguoi dung Vi Tra Sau da ngung su dung (churn) bao lau thi quay lai? Khi quay lai ho co dung promo khong? KHONG can chart."
- **Golden Result:** Churn duration + promo usage on return
