# MoMo Product Strategy Report: 2024-2025 Performance & 2026-2028 Roadmap

> **Date:** 2026-02-28  
> **Author:** DA SQL (Internal Analysis)  
> **Data Sources:** MoMo internal BigQuery (BU_FI, MBI_DA), Mimir domain metadata, external market research  
> **Scope:** Product performance 2024-2025, Vietnam/SEA fintech market trends, strategic recommendations 2026-2028

---

## Executive Summary

MoMo đạt lợi nhuận lần đầu tiên trong năm 2024 (+27% revenue YoY). Hai sản phẩm dẫn đầu là **Tui Than Tai** (13.3M users, AUM 11.3T VND cuối 2025) và **Paylater** (1.44M MAU, tăng 107% từ 693K đầu 2024). P2P W2W vẫn là backbone với 6.1M MAU và volume tăng mạnh. Thị trường fintech Việt Nam đang bùng nổ (CAGR 21.48%, đạt $15.67B năm 2024). Cơ hội lớn nhất 2026-2028: **B2B/SME fintech**, **AI-powered financial services**, và **wealth management democratization**.

---

## Part 1: MoMo Internal Data — Product Performance 2024-2025

### 1.1 Tui Than Tai (Money Market Fund) — STAR PRODUCT

| Period | Users | AUM (VND) | AUM Growth |
|--------|-------|-----------|------------|
| Q1 2025 (Jan) | 9.62M | 8.20T | baseline |
| Q2 2025 (Apr) | 10.32M | 9.59T | +17% |
| Q3 2025 (Jul) | 11.21M | 10.45T | +27% |
| Q4 2025 (Oct) | 12.26M | 10.93T | +33% |
| Dec 2025 | 13.04M | 11.18T | +36% |
| Dec 2025 (end) | **13.30M** | **11.30T** | **+38%** |

**Key Insights:**
- TTT tăng trưởng đều đặn cả users lẫn AUM trong suốt 2025
- Từ ~9.6M users (Jan 2025) → 13.3M users (Dec 2025): **+38% trong 1 năm**
- AUM tăng từ 8.2T → 11.3T VND: **+38% YoY**
- Đây là sản phẩm có tốc độ tăng trưởng user cao nhất trong portfolio MoMo
- Note: Data 2024 không accessible (TTT mart chỉ lưu ~2 năm), nhưng domain router ghi nhận 11.6M users tháng 1/2026

### 1.2 Paylater (Vi Tra Sau) — HIGH GROWTH LENDING

| Month | MAU | MoM Growth |
|-------|-----|------------|
| Jan 2024 | 693K | baseline |
| Jun 2024 | 782K | +13% |
| Dec 2024 | 996K | +44% |
| Mar 2025 | 1.04M | +5% |
| Jun 2025 | 1.17M | +18% |
| Sep 2025 | 1.28M | +30% |
| Dec 2025 | **1.44M** | **+107% vs Jan 2024** |

**Key Insights:**
- Paylater tăng trưởng liên tục không ngừng trong 24 tháng
- Từ 693K → 1.44M MAU: **tăng 107% trong 2 năm**
- Tốc độ tăng trưởng đang tăng tốc: H2 2025 tăng nhanh hơn H1 2025
- Đây là sản phẩm lending có tốc độ tăng trưởng MAU cao nhất

### 1.3 Vay Nhanh (Quick Loans) — RAPID SCALE-UP

| Period | Monthly Loans | Unique Borrowers | Disbursed (VND) |
|--------|--------------|-----------------|-----------------|
| Jul 2024 | 51,395 | 49,732 | 469.6B |
| Oct 2024 | 63,325 | 60,511 | 683.0B |
| Dec 2024 | 70,771 | 66,227 | 802.7B |
| Jan 2025 | 84,682 | 78,295 | 936.4B |
| Mar 2025 | 88,621 | 78,404 | 956.9B |
| Jun 2025 | 96,183 | 83,947 | 1,190.7B |
| Aug 2025 | 91,213 | 77,567 | 1,132.1B |
| Dec 2025 | 69,562 | 49,813 | 963.1B |

**Key Insights:**
- Vay Nhanh scale-up nhanh từ Jul 2024 (mới launch) → peak Jun 2025
- Peak disbursement: 1.19T VND/tháng (Jun 2025)
- H2 2025 có dấu hiệu chậm lại (unique borrowers giảm từ 84K → 50K)
- Cần theo dõi NPL rate và credit quality

### 1.4 P2P W2W (Chuyển tiền ví-ví) — BACKBONE PRODUCT

| Period | MAU | Monthly Txns | Monthly Volume (VND) | Monthly Fee (VND) |
|--------|-----|-------------|---------------------|------------------|
| Jan 2024 | 5.72M | 83.8M | 33.7T | 54.2B |
| Jun 2024 | 5.82M | 93.6M | 37.4T | 61.6B |
| Dec 2024 | 6.07M | 104.7M | 39.6T | 57.2B |
| Mar 2025 | 5.62M | 101.6M | 38.5T | 49.8B |
| Jun 2025 | 5.60M | 103.2M | 40.8T | 35.3B |
| Sep 2025 | 5.70M | 111.2M | 43.3T | 47.9B |
| Dec 2025 | **6.08M** | **137.8M** | **51.7T** | **50.3B** |

**Key Insights:**
- P2P W2W là sản phẩm lớn nhất về volume và user base
- Volume tăng mạnh: 33.7T → 51.7T VND/tháng (+53% YoY)
- Transaction count tăng: 83.8M → 137.8M/tháng (+64% YoY)
- Fee revenue giảm từ 61.6B (Jun 2024) → 35.3B (Jun 2025) → phục hồi 50.3B (Dec 2025)
- Dấu hiệu: MoMo có thể đã giảm phí để cạnh tranh với VietQR, sau đó điều chỉnh lại

### 1.5 MDS Commerce (ADS, Promotion, Donation, Reward, Social & BP)

Từ MBI_DA.2024_KPI_MDS_REPORT (Jan 2024):

| Product | MAU (Jan 2024) | MEU (Jan 2024) |
|---------|---------------|---------------|
| ADS (Media Platform) | 1.61M | 2.99M |
| PROMOTION | 1.97M | 5.38M |
| DONATION | 504K | 979K |
| REWARD | 2.26K | 252K |
| SOCIAL & BP | N/A | 1.05M |

**Key Insights:**
- Promotion platform có MEU cao nhất (5.38M) — đây là engagement driver quan trọng
- ADS platform có MAU 1.6M — revenue stream từ merchant marketing
- Donation platform có 504K MAU — social impact product

---

## Part 2: Vietnam & SEA Fintech Market Context

### 2.1 Vietnam Fintech Market

| Metric | Value |
|--------|-------|
| Market size (2024) | USD 15.67B |
| CAGR (2024-2030) | 21.48% |
| Projected size (2030) | USD 50.21B |
| Non-cash txn growth (2024) | +56.8% volume |
| NAPAS transactions (2024) | 9.56B (+30% YoY) |
| Active e-wallet users | 36.23M |
| QR code adoption | 62%+ consumers |
| BNPL market (2024) | USD 3.33B (+41.8%) |
| BNPL CAGR (2024-2029) | 27.6% |
| Smartphone penetration | ~84% |
| Adults with payment accounts | 87% |

### 2.2 MoMo Market Position

- **30M+ users** (Vietnam's #1 fintech)
- **First full-year profit in 2024** (+27% revenue YoY)
- **5.5B transactions in Q1 2025**
- **USD 2B+ valuation** (unicorn)
- **~25% of all cashless transactions** on National Public Service Portal
- **Top 50 Global Fintech** (KPMG), **Top 3 AI Companies Vietnam** (AI4VN 2025)

### 2.3 Competitive Landscape

| Player | Strength | Threat Level |
|--------|----------|-------------|
| ZaloPay | 64M Zalo users integration | HIGH — messaging app moat |
| VNPay | 40+ bank partnerships, profitable | HIGH — B2B/merchant strength |
| ShopeePay | Shopee e-commerce ecosystem | MEDIUM — e-commerce moat |
| ViettelPay | Rural reach, 64 provinces | MEDIUM — rural/telecom moat |
| VietQR | Bank-to-bank QR, free | HIGH — commoditizing payments |

### 2.4 SEA Fintech Trends

- SEA fintech total transaction value: **$907B (2024) → $1.073T (2025)** (+18.3%)
- Digital Lending fastest growing: **+40.1% in 2025**
- Embedded finance: **$264.7B APAC (2024)**, growing to $373.2B by 2030
- B2B payments SEA: **$44.5B (2024) → $105.6B by 2033**
- Super-apps (Grab, GoTo) achieving first profitability in 2024 — validating the model

---

## Part 3: Strategic Recommendations 2026-2028

### Priority Matrix

| Product/Initiative | Revenue Potential | User Growth | Strategic Fit | Priority |
|-------------------|------------------|-------------|---------------|----------|
| Tui Than Tai expansion | HIGH | HIGH | CORE | ⭐⭐⭐⭐⭐ |
| Paylater scale-up | HIGH | HIGH | CORE | ⭐⭐⭐⭐⭐ |
| B2B/SME fintech | VERY HIGH | MEDIUM | EXPANSION | ⭐⭐⭐⭐⭐ |
| AI Financial Advisor | HIGH | HIGH | DIFFERENTIATOR | ⭐⭐⭐⭐ |
| Open Banking/API | MEDIUM | LOW | INFRASTRUCTURE | ⭐⭐⭐⭐ |
| Vay Nhanh optimization | HIGH | MEDIUM | CORE | ⭐⭐⭐⭐ |
| Securities/Stocks | MEDIUM | MEDIUM | EXPANSION | ⭐⭐⭐ |
| Insurance | MEDIUM | LOW | EXPANSION | ⭐⭐⭐ |
| Cross-border payments | HIGH | LOW | FUTURE | ⭐⭐⭐ |

---

### Recommendation 1: DOUBLE DOWN on Tui Than Tai (Wealth Management)

**Why:** TTT là sản phẩm tăng trưởng mạnh nhất (+38% users, +38% AUM trong 2025). Thị trường wealth management SEA đang tăng 14.9%/năm. Vietnam có <5% dân số đầu tư — dư địa khổng lồ.

**Actions 2026-2028:**
1. **Mở rộng sản phẩm đầu tư**: Thêm ETF, trái phiếu, cổ phiếu trực tiếp (qua CVS) vào TTT ecosystem
2. **AI-powered portfolio advisor**: Gợi ý danh mục đầu tư cá nhân hóa dựa trên spending pattern, income, risk profile
3. **TTT for SMEs**: Quản lý dòng tiền doanh nghiệp, đầu tư tiền nhàn rỗi
4. **Target AUM**: 30T VND by end 2027 (từ 11.3T hiện tại)
5. **Target users**: 20M by end 2027

**Revenue model**: Management fee (0.3-0.5% AUM/năm) → 30T VND AUM = 90-150B VND/năm phí quản lý

---

### Recommendation 2: ACCELERATE Paylater + Vay Nhanh (Lending)

**Why:** Paylater tăng 107% trong 2 năm. BNPL Vietnam đạt $3.33B (2024), CAGR 27.6%. Lending là sản phẩm có margin cao nhất trong fintech.

**Actions 2026-2028:**
1. **Paylater limit expansion**: Tăng hạn mức cho users có credit score tốt (dùng CIC + MoMo transaction data)
2. **Merchant BNPL**: Tích hợp Paylater vào checkout của 500K+ merchants trên MoMo
3. **Vay Nhanh credit quality**: Tập trung vào NPL management, không chạy theo volume
4. **Cross-sell**: Paylater users → Vay Nhanh → TTT (financial ladder)
5. **AI credit scoring**: Dùng 6-7 AI models hiện có để cải thiện underwriting accuracy

**Target**: Paylater 3M MAU by 2027, Vay Nhanh 1.5T VND/tháng disbursement

---

### Recommendation 3: PIVOT to B2B/SME Fintech (New Growth Engine)

**Why:** Consumer payment market đang bão hòa (87% adults banked). SME fintech Vietnam tăng 24%/năm. B2B payments SEA: $44.5B → $105.6B by 2033. MoMo đã có 500K+ SME merchants — đây là moat chưa được khai thác.

**Actions 2026-2028:**
1. **MoMo Business Suite**: All-in-one platform cho SMEs: payment acceptance + working capital loan + expense management + payroll
2. **Supply chain finance**: Financing cho suppliers của các merchant lớn trên MoMo
3. **B2B cross-border payments**: Tận dụng Decree 94/2025 sandbox để pilot cross-border B2B payments
4. **SME credit scoring**: Dùng transaction data của 500K merchants để build proprietary credit model
5. **iPOS.vn + Nhanh.vn integration**: Embed financial services vào POS và e-commerce tools

**Revenue model**: Transaction fee (0.5-1.5%) + lending spread (8-15%/năm) + SaaS subscription
**Target**: 100K active SME business accounts by 2027, 5T VND SME loan book

---

### Recommendation 4: BUILD AI Financial Advisor (Differentiator)

**Why:** MoMo đã có 1,000+ tech engineers, 200+ AI/data specialists, và đang xử lý 6-7 AI models per transaction. AI in fintech market: $61.6B by 2032. Đây là cơ hội để differentiate khỏi ZaloPay/VNPay.

**Actions 2026-2028:**
1. **Proactive AI advisor**: Không chỉ chatbot reactive — AI chủ động gợi ý "Tháng này mày chi nhiều hơn 20% cho FnB, muốn tao giúp tiết kiệm không?"
2. **Financial health score**: Score tổng hợp dựa trên spending, saving, debt, investment — gamify financial wellness
3. **Life event detection**: Detect khi user có sự kiện lớn (mua nhà, sinh con, kết hôn) → proactive financial planning
4. **Agentic AI**: AI tự động thực hiện các tác vụ tài chính (chuyển tiền định kỳ, tái đầu tư TTT, nhắc hạn Paylater)
5. **Moni AI upgrade**: Từ expense tracking → full financial planning assistant

**Competitive moat**: ZaloPay không có financial data depth. VNPay không có consumer relationship. MoMo có cả hai.

---

### Recommendation 5: LEVERAGE Open Banking (Infrastructure Play)

**Why:** Decree 94/2025 (effective Jul 2025) mở ra sandbox cho Open API/Data Sharing và Credit Scoring. Vietnam đang "rapidly emerging as SEA's open banking leader". MoMo có thể trở thành fintech infrastructure layer.

**Actions 2026-2028:**
1. **MoMo as Credit Bureau**: Dùng transaction data của 30M users để build alternative credit scoring service — sell to banks và other fintechs
2. **Open Banking API**: Expose MoMo financial data (với user consent) cho third-party apps
3. **BaaS (Banking-as-a-Service)**: White-label MoMo's payment/lending infrastructure cho các fintech nhỏ hơn
4. **CIC integration**: Đã có — mở rộng để provide credit score lookup cho users và partners

**Revenue model**: API monetization, data licensing, BaaS fees

---

## Part 4: Products to Watch / Deprioritize

### Watch Carefully:
- **Vay Nhanh**: H2 2025 slowdown cần điều tra — NPL issue hay market saturation?
- **P2P W2W fee revenue**: Giảm mạnh H1 2025 → phục hồi H2 2025. VietQR đang ăn vào market share?
- **Moni/QLCT**: 290K MAU — nhỏ so với potential. Cần AI upgrade để grow

### Deprioritize:
- **OTA (Travel)**: 0 bookings — data gap hoặc product-market fit issue
- **Donation**: Social impact nhưng không có revenue model rõ ràng
- **EDC**: 8.6K txns/month — quá nhỏ

---

## Sources

### Internal Data (BigQuery)
- `momovn-prod.BU_FI.mart_ttt_daily_user_record` — TTT users & AUM 2025
- `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` — Paylater MAU 2024-2025
- `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO` — Vay Nhanh disbursement 2024-2025
- `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID` — P2P W2W 2024-2025
- `momovn-prod.MBI_DA.2024_KPI_MDS_REPORT` — MDS KPI 2024

### External Research
- Research and Markets / GlobeNewswire — Vietnam Fintech Market Report 2025
- Nikkei Asia / DealStreetAsia — MoMo first profit 2024
- Business Times — Vietnam fintech post-MoMo reality
- DFDL — Decree 94/2025 analysis
- UnaFinancial / Finews Asia — SEA fintech $1T milestone
- Insignia Business Review — Embedded finance & Gen AI in SEA
- GoTo Group / Grab Investor Relations — Super-app profitability data
