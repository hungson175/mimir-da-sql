# Domain: BU Payment: P2P OVERALL

## Identity
- **Domain ID:** `838c1168-492d-4751-995d-d356dd8b9a42`
- **Description:** Hiện tại đang available data về
- Nguồn tiền (SOF) của user W2W/W2B
- User Type của user P2P
- Receiver của sender P2P
- **Tables:** 3
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.P2P_SOF_ALL_RAW
> Báº£ng nÃ y chá»©a dá»¯ liá»u thÃ´ vá» nguá»n tiá»n trong cÃ¡c giao dá»ch P2P. Báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch cÃ¡c nguá»n tiá»n ÄÆ°á»£c sá»­ dá»¥ng trong giao dá»ch P2P, ÄÃ¡nh giÃ¡ sá» lÆ°á»£ng giao dá»ch theo tá»«ng nguá»n tiá»n, vÃ  theo dÃµi cÃ¡c loáº¡i...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | Thá»i Äiá»m (thÃ¡ng) cá»§a giao dá»ch P2P | 2025-12-01, 2025-11-01, 2025-10-01 |
| date | DATE | NgÃ y diá»n ra giao dá»ch P2P | 2025-12-10, 2025-11-10, 2025-01-10 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»ch P2P | 86013249, 85186806, 41564694 |
| money_src | STRING | Nguá»n tiá»n: bao gá»m momo, bank_link, TTT, direct debit, group fundnguá»n tiá»n: bao gá»m mo... | 2. bank_link, 1. momo, 3. TTT, 5. group fund, 4. direct debit |
| service | STRING | Loáº¡i dá»ch vá»¥ trong giao dá»ch P2P: W2W hoáº·c W2B, gom láº¡i lÃ  P2P chuyá»n tiá»n uniqueW2... | W2W, W2B |
| num_tranx | INTEGER | Sá» lÆ°á»£ng giao dá»ch cá»§a nguá»n tiá»n ÄÃ³sá» lÆ°á»£ng giao dá»ch cá»§a nguá»n tiá»n Ä... | 1, 2, 3 |

### momovn-prod.MBI_DA.P2P_TOTAL_USER_TYPE
> Báº£ng nÃ y chá»©a thÃ´ng tin phÃ¢n loáº¡i ngÆ°á»i dÃ¹ng cho cÃ¡c giao dá»ch P2P. Báº£ng dÃ¹ng Äá» phÃ¢n tÃ­ch giao dá»ch giá»¯a cÃ¡c vÃ­ MoMo, theo dÃµi nhÃ³m khÃ¡ch hÃ ng, vÃ  kiá»m tra xu hÆ°á»ng sá»­ dá»¥ng dá»ch vá»¥ cá»§a ngÆ°á»i dÃ¹ng.

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng trong nÄm mÃ  dá»¯ liá»u ÄÆ°á»£c ghi nháº­n. | 2025-12-01, 2025-01-01, 2026-01-01 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng MoMo. | 40835779, 77192863, 93193591 |
| date | DATE | NgÃ y thÃ¡ng cá»¥ thá» khi dá»¯ liá»u ÄÆ°á»£c ghi nháº­n. | 2025-12-01, 2025-04-01, 2026-01-01 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng tham gia giao dá»ch P2P. | 2. Retention, 3. Churn, 1. New |

### momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW
> Báº£ng thÃ´ng tin giao dá»ch cá»§a P2P bao gá»m W2W vÃ  W2B. 
Báº£ng nÃ y cung cáº¥p thÃ´ng tin chi tiáº¿t vá» ngÃ y thÃ¡ng cá»§a má»i giao dá»ch P2P. 
Dá»¯ liá»u giÃºp theo dÃµi tá»ng sá» giao dá»ch hÃ ng ngÃ y giá»¯a ngÆ°á»i gá»­i vÃ  ngÆ°á»i nháº­n. 
Báº£ng cÃ²n cho biáº¿t loáº¡i dá»c...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng mÃ  giao dá»ch P2P diá»n ra. | 2025-12-01, 2025-05-01, 2025-03-01 |
| date | DATE | NgÃ y mÃ  cÃ¡c giao dá»ch P2P diá»n ra. | 2025-01-10, 2025-12-10, 2025-06-10 |
| user_id | STRING | MÃ£ ngÆ°á»i gá»­i trong giao dá»ch P2P.ngÆ°á»i gá»­i | 83040571, 95573107, 95573079 |
| receiver_id | STRING | MÃ£ ngÆ°á»i nháº­n trong giao dá»ch P2P.ngÆ°á»i nháº­n | +Psh5z9BuZ4X5iR4EEwMVtjzIzeZdfqHDiyyCIyzOf0=, UCmW/QRw27rwh10bMuD6wuPLhJNlQWsOeU... |
| service | STRING | Loáº¡i dá»ch vá»¥ liÃªn quan, bao gá»m W2W (vÃ­ tá»i vÃ­) vÃ  W2B (vÃ­ tá»i ngÃ¢n hÃ ng). | W2W, W2B |
| num_tranx | INTEGER | Tá»ng sá» lÆ°á»£ng giao dá»ch cá»§a cáº·p ngÆ°á»i gá»­i - ngÆ°á»i nháº­n trong ngÃ y ÄÃ³ (ÄÃ£... | 1, 2, 3 |

## Domain Knowledge (from Mimir)

- RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này
- User Type = nhóm người dùng theo New, Retained, Reactivated

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
