# Domain: BU Payment: P2P SOCIAL

## Identity
- **Domain ID:** `a7a4abe7-ba98-48dd-b9f0-8d0752c75910`
- **Description:** Dữ liệu liên quan các sản phẩm Social của P2P
- **Tables:** 4
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.P2P_SOCIAL_LUCKYMONEY_TRANS_RAW
> Báº£ng lÆ°u tá»«ng giao dá»ch cá»§a chuyá»n tiá»n nhÃ¢n dá»p Äáº·c biá»t. ÄÆ°á»£c gá»i lÃ  chuyá»n tiá»n kÃ¨m thiá»p. Báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
- Theo dÃµi cÃ¡c giao dá»ch chuyá»n tiá»n nhÃ¢n dá»p Äáº·c biá»t mÃ  ngÆ°á»i dÃ¹ng thá»±c hiá»n. 
- PhÃ¢n tÃ­ch ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng thá»±c hiá»n giao dá»ch | 2023-01-01, 2024-02-01, 2025-01-01 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch | 2023-01-22, 2024-02-10, 2025-01-29 |
| datetime | DATETIME | NgÃ y vÃ  giá» cá»¥ thá» thá»±c hiá»n giao dá»ch | 2024-02-10 00:45:41, 2024-02-10 00:00:23, 2023-01-22 00:29:32 |
| tid | STRING | MÃ£ giao dá»ch cá»§a chuyá»n tiá»n Äáº·c biá»t | 98600804590, 98650980026, 107380809165 |
| user_id | STRING | ID cá»§a ngÆ°á»i gá»­i trong giao dá»ch P2P | 21502252, 38744123, 73298381 |
| receiver_id | STRING | ID cá»§a ngÆ°á»i nháº­n trong giao dá»ch P2P | 70595660, 25926797, 40660294 |
| amount | FLOAT | Sá» tiá»n ÄÆ°á»£c chuyá»n trong giao dá»ch | 100, 111, 100000 |
| serviceid | STRING | MÃ£ dá»ch vá»¥ cá»§a giao dá»ch chuyá»n tiá»n Äáº·c biá»t | transfer_luckymoney |
| payment_channel | STRING | KÃªnh thanh toÃ¡n ÄÆ°á»£c sá»­ dá»¥ng trong giao dá»ch | luckymoney_icon_input_w2w, luckymoney_chat, luckymoney_search, luckymoney_icon_h... |

### momovn-prod.MBI_DA.P2P_SOCIAL_TABTOI_PERFORMANCE_RAW
> Báº£ng lÆ°u thÃ´ng tin vá» ngÆ°á»i dÃ¹ng vÃ o trang game Tab TÃ´i. Náº¿u ngÆ°á»i dÃ¹ng tháº¥y há»©ng thÃº vÃ  chÆ¡i game báº±ng cÃ¡ch thá»±c hiá»n giao dá»ch chuyá»n tiá»n, thÃ¬ sáº½ cÃ³ Ã­t nháº¥t giÃ¡ trá» trong cá»t first_w2w_TID hoáº·c first_w2b_TID. Náº¿u cáº£ 2 cá»t Äá»u null thÃ¬ ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| DATETIME | DATETIME | Thá»i Äiá»m vÃ o trang game Tab TÃ´i. | 2025-11-09 15:47:04.745, 2025-11-09 04:32:38.790, 2025-11-09 11:55:39.180 |
| DATE | DATE | NgÃ y vÃ o trang game Tab TÃ´i. | 2025-12-04, 2025-12-05, 2025-12-03 |
| agent_id | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo cá»§a ngÆ°á»i dÃ¹ng. | 42327287, 43106698, 62057366 |
| event_id | STRING | MÃ£ Äá»nh danh cá»§a sá»± kiá»n liÃªn quan Äáº¿n trang game Tab TÃ´i. | _KDo0jpJJcL0vbRMOQtds, foR7TJ52zuqgKX4I5rV1c, B6q6Vbh5uEXcdfcucAUGm |
| max_src | STRING | Nguá»n mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ truy cáº­p Äá» Äáº¿n trang game Tab TÃ´i. | Bottom Nav, Noti |
| first_event_name | STRING | TÃªn sá»± kiá»n Äáº§u tiÃªn mÃ  ngÆ°á»i dÃ¹ng thá»±c hiá»n sau khi vÃ o trang game Tab TÃ´i. | service_button_clicked, service_carousel_swiped, service_icon_clicked |
| first_w2w_TID | STRING | MÃ£ giao dá»ch W2W Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. | 108496627427, 109347867580, 98864194842 |
| first_w2w_tnx_datetime | DATETIME | Thá»i Äiá»m diá»n ra giao dá»ch W2W Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. | 2025-11-28 17:20:28, 2025-12-03 13:32:27, 2025-10-28 13:08:45 |
| first_w2w_receiver | STRING | NgÆ°á»i nháº­n cá»§a giao dá»ch W2W Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. | 50794446, 102737928, 71739730 |
| first_w2b_TID | STRING | MÃ£ giao dá»ch W2B Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. | 105262928924, 109882628049, 103983932674 |
| first_w2b_tnx_datetime | DATETIME | Thá»i Äiá»m diá»n ra giao dá»ch W2B Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. | 2025-09-08 08:24:43, 2025-11-09 05:31:46, 2025-10-15 19:35:30 |
| first_w2b_receiver | STRING | NgÆ°á»i nháº­n cá»§a giao dá»ch W2B Äáº§u tiÃªn sau khi xem trang game Tab TÃ´i. |  |

### momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW
> Báº£ng thÃ´ng tin giao dá»ch cá»§a P2P bao gá»m W2W vÃ  W2B. 
 - Thá»ng kÃª tá»ng sá» lÆ°á»£ng giao dá»ch theo tá»«ng cáº·p ngÆ°á»i dÃ¹ng trong ngÃ y theo W2W hoáº·c W2B. 
 - Theo dÃµi thÃ´ng tin ngÆ°á»i gá»­i vÃ  ngÆ°á»i nháº­n trong cÃ¡c giao dá»ch P2P. 
 - PhÃ¢n tÃ­ch xu hÆ°á»ng vá» t...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng trong nÄm cá»§a giao dá»ch. | 2025-05-01, 2025-03-01, 2025-11-01 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch. | 2025-01-10, 2025-06-10, 2025-11-10 |
| user_id | STRING | ID ngÆ°á»i gá»­i thá»±c hiá»n giao dá»ch.ngÆ°á»i gá»­i | 83040571, 95575101, 95573100 |
| receiver_id | STRING | ID ngÆ°á»i nháº­n trong giao dá»ch.ngÆ°á»i nháº­n | +Psh5z9BuZ4X5iR4EEwMVtjzIzeZdfqHDiyyCIyzOf0=, UCmW/QRw27rwh10bMuD6wuPLhJNlQWsOeU... |
| service | STRING | Loáº¡i hÃ¬nh dá»ch vá»¥ cá»§a giao dá»ch, bao gá»m W2W vÃ  W2B.bao gá»m W2W vÃ  W2B | W2W, W2B |
| num_tranx | INTEGER | Tá»ng sá» lÆ°á»£ng giao dá»ch cá»§a cáº·p ngÆ°á»i gá»­i vÃ  ngÆ°á»i nháº­n vÃ o ngÃ y ÄÃ³ (ÄÃ... | 1, 2, 3, 4, 5 |

### momovn-prod.MBI_DA.P2P_DEVICE_TYPE
> Báº£ng dÃ¹ng Äá» láº¥y thÃ´ng tin thiáº¿t bá» ngÆ°á»i dÃ¹ng Äang sá»­ dá»¥ng, ÄÃ£ ÄÆ°á»£c tá»ng há»£p theo thÃ¡ng. Giáº£ Äá»nh ráº±ng trong suá»t thÃ¡ng ÄÃ³, ngÆ°á»i dÃ¹ng sáº½ chá» sá»­ dá»¥ng má»t thiáº¿t bá» vÃ  ráº¥t hiáº¿m khi thay Äá»i thiáº¿t bá» liÃªn tá»¥c. Báº£ng nÃ y cÃ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng mÃ  dá»¯ liá»u thiáº¿t bá» ÄÆ°á»£c tá»ng há»£p. | 2024-12-01, 2024-08-01, 2024-06-01 |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng trong há» thá»ng P2P. | 7QzjqYw34+4rJuQIrLbGyj1mRuM7siTDbe9oehd5WQQ=, oS7JVmVabMkXlZUQ3OTZNNq8RE4T+bGjTf... |
| device | STRING | TÃªn thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng Äang sá»­ dá»¥ng. | iphone 12 pro max, iphone 11, iphone 11 pro max, iphone 14 pro max, iphone xs ma... |
| device_os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng Äang sá»­ dá»¥ng. | IOS, ANDROID, , IPHONE |
| device_performance | STRING | Hiá»u suáº¥t cá»§a thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng Äang sá»­ dá»¥ng. | high-end, low-end |

## Domain Knowledge (from Mimir)

- RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó
- VIEWER = user load tab tôi
- RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó
- RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
