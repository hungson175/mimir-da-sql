# Domain: BU Payment: P2P W2B

## Identity
- **Domain ID:** `526c040d-6956-4cb9-8919-87828de05cfc`
- **Description:** records all transaction of P2P W2B
- **Tables:** 8
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING
> Báº£ng lÆ°u trá»¯ dá»¯ liá»u gá»c cá»§a cÃ¡c giao dá»ch cho vay P2P (peer-to-peer) tá»« vÃ­ cÃ¡ nhÃ¢n (P) sang doanh nghiá»p (B) â W2B. Bao gá»m thÃ´ng tin giao dá»ch, kÃªnh thanh toÃ¡n, quá»¹, phÃ­ vÃ  thÃ´ng tin ngÃ¢n hÃ ng liÃªn quan.

ThÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y:
- Theo d...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TID | STRING | MÃ£ giao dá»ch duy nháº¥t cá»§a tá»«ng láº§n cho vay P2P W2B. | 112704777407, 112725474447, 112651059438 |
| datetime | DATETIME | Thá»i Äiá»m giao dá»ch ÄÆ°á»£c táº¡o, gá»m cáº£ ngÃ y vÃ  giá». | 2025-11-11 19:38:58, 2025-11-10 17:52:23, 2025-12-15 19:17:26 |
| DATE | DATE | NgÃ y diá»n ra giao dá»ch.NgÃ y diá»n ra giao dá»ch.

**Sample value**: 2024-11-27 | 2026-01-10, 2026-01-15, 2026-01-17 |
| month | DATE | ThÃ¡ng tÆ°Æ¡ng á»©ng cá»§a giao dá»ch, luÃ´n lÃ  ngÃ y Äáº§u tiÃªn cá»§a thÃ¡ng. | 2025-12-01, 2026-01-01, 2025-11-01 |
| user_id | STRING | Sender, ngÆ°á»i thá»±c hiá»n giao dá»ch, ngÆ°á»i chuyá»n tiá»n W2B. | 25847745, 76962598, 63631128 |
| SERVICE_CODE | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n giao dá»ch cho vay. | cardcashout.mbbank_w2b, cardcashout.balvccb_cashout, cardcashout.0911597342, car... |
| SERVICEID | STRING | MÃ£ Äá»nh danh dá»ch vá»¥ cho giao dá»ch cho vay. | transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload, transfe... |
| FUNDID | FLOAT | Nguá»n tiá»n, SOF (source of fund).Nguá»n tiá»n, SOF (source of fund) | 1, 2, 6 |
| AMOUNT | FLOAT | Sá» tiá»n gá»c cá»§a giao dá»ch cho vay (ÄÆ¡n vá» VND). | 50000, 100000, 20000 |
| TOTAL_AMOUNT | FLOAT | Tá»ng sá» tiá»n giao dá»ch (thÆ°á»ng báº±ng AMOUNT, chÆ°a bao gá»m phÃ­). | 50000, 100000, 20000 |
| FEE | FLOAT | PhÃ­ giao dá»ch ÄÆ°á»£c tÃ­nh; 0 náº¿u miá»n phÃ­. | 0, 3950, 4600 |
| BANK_ACC_NO | STRING | Sá» tÃ i khoáº£n ngÃ¢n hÃ ng nháº­n tiá»n.Sá» tÃ i khoáº£n ngÃ¢n hÃ ng nháº­n tiá»n. |  |
| BANK_NAME | STRING | TÃªn ngÃ¢n hÃ ng cá»§a tÃ i khoáº£n nháº­n tiá»n. | MBBank, Vietcombank, Techcombank, BIDV, Vietinbank |
| ACC_NAME | STRING | TÃªn chá»§ tÃ i khoáº£n ngÃ¢n hÃ ng nháº­n tiá»n.TÃªn chá»§ tÃ i khoáº£n ngÃ¢n hÃ ng nháº­n tiá»n. |  |
| BENF_PHONE_NUMBER_DETECT_AID | STRING | Sá» Äiá»n thoáº¡i cá»§a ngÆ°á»i hÆ°á»ng lá»£i ÄÆ°á»£c phÃ¡t hiá»n qua mÃ£ ID. | 47430166, 72867953, 96112399 |
| PAYMENT_CHANNEL | STRING | KÃªnh thanh toÃ¡n hoáº·c tab mÃ  giao dá»ch ÄÆ°á»£c thá»±c hiá»n. | scan_vietqr, scan_vietqr_upload, bank_popular, tab_p2p, bank_saved |

### momovn-prod.MBI_DA.LOAN_P2P_W2B_ERROR_TRANS_RAW
> Giao dá»ch bá» lá»i kÃ¨m thÃ´ng tin: mÃ£ lá»i, bank bá» lá»i vÃ  giáº£i thÃ­ch vá» lá»i ÄÃ³. Báº£ng nÃ y dÃ¹ng Äá» ghi láº¡i cÃ¡c thÃ´ng tin giao dá»ch bá» lá»i giá»¯a vÃ­ ngÆ°á»i dÃ¹ng vÃ  ngÃ¢n hÃ ng, bao gá»m mÃ£ lá»i, tÃªn ngÃ¢n hÃ ng bá» lá»i vÃ  thÃ´ng Äiá»p pháº£n há»i l...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng phÃ¡t sinh lá»i giao dá»ch. | 2025-11-01, 2025-10-01, 2025-12-01 |
| date | DATE | NgÃ y phÃ¡t sinh lá»i giao dá»ch. | 2025-11-10, 2025-11-13, 2025-10-10 |
| tid | STRING | MÃ£ Äá»nh danh cho má»i giao dá»ch. | 1763009237303, 1763004988665, 1758553609009 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n giao dá»ch lá»i. | 51895755, 107517346, 106083142 |
| response_code | STRING | MÃ£ lá»i tráº£ vá» tá»« giao dá»ch. | 1001, -9999, -200101 |
| RESPONSE_MESSAGE | STRING | ThÃ´ng Äiá»p pháº£n há»i mÃ´ táº£ chi tiáº¿t vá» lá»i trong giao dá»ch. | Da co loi xay ra trong qua trinh xu ly, ban vui long thu lai giup Momo nhe., He ... |
| bank_name | STRING | TÃªn ngÃ¢n hÃ ng liÃªn quan Äáº¿n lá»i giao dá»ch. | Techcombank, MBBank, Vietcombank, VPBank, BIDV |

### momovn-prod.MBI_DA.TUAN_P2P_W2B_EXC_VIETQR_ACQUISITION_ALL_SOURCES
> Báº£ng nÃ y lÆ°u trá»¯ thÃ´ng tin liÃªn quan Äáº¿n viá»c thu hÃºt khÃ¡ch hÃ ng thÃ´ng qua táº¥t cáº£ cÃ¡c nguá»n cho giao dá»ch tá»« vÃ­ MoMo sang ngÃ¢n hÃ ng ngoáº¡i trá»« VietQR. ThÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y bao gá»m: 
- Thá»i gian giao dá»ch vá»i cá»t 'month', 'date' vÃ  '...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng giao dá»ch. | 2025-12-01, 2026-01-01, 2025-11-01 |
| date | DATE | NgÃ y giao dá»ch. | 2025-12-01, 2026-01-01, 2025-11-01 |
| datetime | DATETIME | Thá»i gian chi tiáº¿t giao dá»ch. | 2024-11-01 10:13:31, 2025-09-01 18:16:14, 2024-09-01 17:46:07 |
| tid | STRING | MÃ£ Äá»nh danh duy nháº¥t cho má»i giao dá»ch. | 34725838234, 34681368200, 34687293409 |
| serviceid | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n giao dá»ch. | transfer_p2b, transfer_p2b_scan_vietqr_upload, transfer_p2b_globalsearch, transf... |
| user_id | STRING | ID ngÆ°á»i dÃ¹ng tham gia giao dá»ch. | 33944377, 40263048, 65130831 |
| amount | FLOAT | Sá» tiá»n cá»§a giao dá»ch. | 100000, 200000, 50000 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng tham gia giao dá»ch. | 02. Retention, 2. Retention, 03. Reactivation, 3.Reactive, 01. New to service |
| citygroup | STRING | PhÃ¢n nhÃ³m thÃ nh phá» nÆ¡i thá»±c hiá»n giao dá»ch. | Thành Phố Hồ Chí Minh, Tỉnh khác, KCN Miền Nam, Hồ Chí Minh, Hà Nội |
| lv1_acq | STRING | Level 1: chia 2 type, Scheme hoáº·c Organic.level 1: chia 2 type, Scheme hoáº·c Organic | [1]. Organic, [2]. Scheme |
| lv2_acq | STRING | Level 2: chia thÃ nh cÃ¡c loáº¡i scheme nhÆ° Voucher, Fixed Amount, Game. | [2]. > 10K, [1]. <= 10K, 01. Voucher, 03. Game, 02. Fixed Amount |
| lv3_acq | STRING | Level 3: chia cá»¥ thá» cÃ¡c scheme cá»§a level 2 thÃ nh tá»«ng gift_id, game_id. | [2]. > 10K, [1]. <= 10K, Scheme 2024đ |

### momovn-prod.MBI_DA.LOAN_P2P_W2B_USER_TYPE
> Báº£ng chá»©a thÃ´ng tin vá» ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n cÃ¡c khoáº£n vay P2P W2B. CÃ¡c thÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y bao gá»m:
- XÃ¡c Äá»nh loáº¡i ngÆ°á»i dÃ¹ng dá»±a trÃªn sá» lÆ°á»£ng giao dá»ch vÃ  xáº¿p háº¡ng.
- PhÃ¢n tÃ­ch xu hÆ°á»ng ngÆ°á»i dÃ¹ng theo nhÃ³m tuá»i...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»§a giao dá»ch hoáº·c hoáº¡t Äá»ng. | 2025-12-01, 2026-01-01, 2025-11-01 |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n khoáº£n vay. | 43801703, 42394269, 42834373 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch hoáº·c hoáº¡t Äá»ng. | 2025-12-01, 2026-01-01, 2025-11-01 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng trong cÃ¡c giao dá»ch P2P W2B. | 2. Retention, 3.Reactive, 1. New |
| city_group | STRING | NhÃ³m thÃ nh phá» nÆ¡i ngÆ°á»i dÃ¹ng sá»ng. DÃ¹ng Äá» phÃ¢n loáº¡i theo khu vá»±c Äá»a lÃ½. | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng. DÃ¹ng Äá» phÃ¢n loáº¡i theo Äá» tuá»i. | [3].18-23, [4].24-29, [5].30-40, [6].41-60, [2].15-17 |

### momovn-prod.MBI_DA.P2P_W2B_USER_NEW
> Báº£ng nÃ y chá»©a thÃ´ng tin ngÆ°á»i dÃ¹ng má»i trong hoáº¡t Äá»ng chuyá»n tiá»n P2P vÃ  W2B. ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng má»i theo thÃ¡ng. Theo dÃµi hoáº¡t Äá»ng giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. NghiÃªn cá»©u tÃ¡c Äá»ng cá»§a...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng thá»±c hiá»n giao dá»ch hoáº·c sá»± kiá»n cá»§a ngÆ°á»i dÃ¹ng má»i. | 2025-12-01, 2025-11-01, 2024-09-01 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch hoáº·c sá»± kiá»n cá»§a ngÆ°á»i dÃ¹ng má»i. | 2024-07-01, 2026-01-12, 2024-07-10 |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng má»i. | 104693443, 99819220, 30872829 |
| ntmm_p2p | STRING | ThÃ´ng tin chuyá»n tiá»n P2P cá»§a ngÆ°á»i dÃ¹ng má»i. | 61864416, 95156702, 102769333 |
| ntmm | STRING | ThÃ´ng tin liÃªn quan Äáº¿n ngÆ°á»i dÃ¹ng má»i. | 94105987, 101616201, 101944004 |

### momovn-prod.MBI_DA.P2P_W2B_USER_RETENTION_TYPE
> Báº£ng momovn-prod.MBI_DA.P2P_W2B_USER_RETENTION_TYPE chá»©a thÃ´ng tin vá» viá»c giá»¯ chÃ¢n ngÆ°á»i dÃ¹ng chuyá»n tiá»n giá»¯a vÃ­ MoMo vÃ  vÃ­ doanh nghiá»p. Dá»¯ liá»u tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng theo thÃ¡ng, ÄÃ¡nh giÃ¡ sá»± t...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng ghi nháº­n dá»¯ liá»u. | 2025-12-01, 2026-01-01, 2025-11-01 |
| date | DATE | NgÃ y ghi nháº­n dá»¯ liá»u. | 2025-12-01, 2026-01-01, 2025-11-01 |
| user_id | STRING | Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng, mÃ£ hÃ³a Äá» báº£o máº­t thÃ´ng tin cÃ¡ nhÃ¢n. | 63824741, 82987624, 59590842 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng, phÃ¢n loáº¡i theo hÃ¬nh thá»©c sá»­ dá»¥ng dá»ch vá»¥ (vÃ­ dá»¥: cÃ¡ nhÃ¢n, ... | 2. Retention, 02. Retention |
| citygroup | STRING | NhÃ³m thÃ nh phá» nÆ¡i ngÆ°á»i dÃ¹ng sinh sá»ng, cÃ³ thá» dÃ¹ng Äá» phÃ¢n tÃ­ch Äá»a lÃ½. | Thành Phố Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng, dÃ¹ng Äá» phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng theo nhÃ³m tuá»i... | [3].18-23, [2].18-22, [4].24-29, [3].23-27, [5].30-40 |
| active_type | STRING | Loáº¡i hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng, xÃ¡c Äá»nh má»©c Äá» hoáº¡t Äá»ng cá»§a ngÆ°á»i d... | 03. Active at least 4M, 01. Active 2M, 02. Active 3M |

### momovn-prod.MBI_DA.HA_P2P_GIFT
> Báº£ng chá»©a thÃ´ng tin vá» quÃ  táº·ng P2P (Peer-to-Peer) trÃªn ná»n táº£ng MoMo. ThÃ´ng tin láº¥y tá»« báº£ng nÃ y bao gá»m: 
- Loáº¡i dá»ch vá»¥ quÃ  táº·ng P2P 
- Thá»i gian giao dá»ch quÃ  táº·ng 
- Nguá»n gá»c giao dá»ch quÃ  táº·ng 
- Sá» tiá»n vÃ  loáº¡i quÃ  táº·ng 
- ThÃ´ng tin...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| service | STRING | TÃªn dá»ch vá»¥ liÃªn quan Äáº¿n quÃ  táº·ng P2P. | W2B, W2W |
| month | DATE | ThÃ¡ng diá»n ra giao dá»ch quÃ  táº·ng. | 2024-10-01, 2025-12-01, 2025-11-01 |
| date | DATE | NgÃ y diá»n ra giao dá»ch quÃ  táº·ng. | 2025-12-11, 2024-10-10, 2025-12-01 |
| datetime | DATETIME | Thá»i Äiá»m cá»¥ thá» diá»n ra giao dá»ch quÃ  táº·ng. | 2024-10-10 00:00:00, 2024-10-11 00:00:00, 2024-10-05 00:00:00 |
| source | STRING | Nguá»n gá»c cá»§a giao dá»ch quÃ  táº·ng. | kgs_sp302_w2b_iphone_7d_cb, kgs_sp302_w2b_copytransfer_cb, kgs_sp_w2w_tid_0424 |
| gift_id | STRING | MÃ£ Äá»nh danh cá»§a quÃ  táº·ng P2P. | gift_M1J44C0C_0, gift_M0NQK0FB_5, rw_w2b_awo_251209_cbttt_100pt1k_dx1n5 |
| amount | FLOAT | Sá» tiá»n liÃªn quan Äáº¿n giao dá»ch quÃ  táº·ng. | 1000, 7, 2000 |
| p2p_amount | FLOAT | Sá» tiá»n P2P liÃªn quan Äáº¿n quÃ  táº·ng. | 10000, 2000, 100000 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n giao dá»ch quÃ  táº·ng. | 18441403, 44195664, 40577643 |
| gift_type | STRING | Loáº¡i quÃ  táº·ng P2P. | Voucher, Cashback - CAMPAIGN |
| TID_gift | STRING | MÃ£ Äá»nh danh giao dá»ch quÃ  táº·ng. | 52515987715, 68799621627, 68851010007 |
| PARENTID | STRING | MÃ£ Äá»nh danh cha cá»§a quÃ  táº·ng. | 0, 58283213918, 69833637115 |

### momovn-prod.MBI_DA.LOAN_2022_NEWTOMOMO_usecase
> Báº£ng loan 2022 new to momo, sá»­ dá»¥ng cho trÆ°á»ng há»£p má»i tham gia MoMo.
ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c láº¥y tá»« báº£ng nÃ y bao gá»m:
- PhÃ¢n tÃ­ch cÃ¡c trÆ°á»ng há»£p sá»­ dá»¥ng MoMo má»i.
- ÄÃ¡nh giÃ¡ má»©c Äá» phá» biáº¿n cá»§a dá»ch vá»¥ theo thÃ nh phá» vÃ  nhÃ³m tuá»i.
-...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TID | FLOAT | ID giao dá»ch, Äá»nh danh giao dá»ch cá»¥ thá». | 745107119, 933470043, 3837146993 |
| AGENTID | FLOAT | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 68717914, 26853652, 34557623 |
| month | DATE | ThÃ¡ng thá»±c hiá»n giao dá»ch. | 2022-03-01, 2022-04-01, 2022-05-01 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch. | 2020-03-22, 2020-10-27, 2022-08-25 |
| service_code | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n hÃ³a ÄÆ¡n. | u2u, cashinbank, m4becomadyen_apple |
| Mar22_Level1_BUName | STRING | TÃªn ÄÆ¡n vá» kinh doanh cáº¥p Äá» 1 vÃ o thÃ¡ng 3 nÄm 2022. | BU_P2P, BU_VTTI, BU_DLS, BU_Bank, BU_BANK |
| Mar22_Level2_Usecase | STRING | TrÆ°á»ng há»£p sá»­ dá»¥ng cáº¥p Äá» 2 vÃ o thÃ¡ng 3 nÄm 2022. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank, P2P - EWALLET TO BANK, APPLICATION S... |
| Mar22_Level3_SubUsecase | STRING | PhÃ¢n loáº¡i trÆ°á»ng há»£p sá»­ dá»¥ng vÃ o thÃ¡ng 3 nÄm 2022 á» cáº¥p Äá» 3. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank, P2P - EWALLET TO BANK, APPLE |
| city | STRING | TÃªn thÃ nh phá» nÆ¡i diá»n ra giao dá»ch. | Hồ Chí Minh, Hà Nội, UNKNOWN |
| citygroup | STRING | NhÃ³m thÃ nh phá» cho phÃ¢n loáº¡i Äá»a lÃ½. | Tỉnh khác, Hà Nội, Hồ Chí Minh, KCN Miền Nam, UNKNOWN |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i sá»­ dá»¥ng dá»ch vá»¥. | others, [2].18-22, [4].28-35, [5].36-50, [3].23-27 |
| cheat_user | FLOAT | NgÆ°á»i dÃ¹ng bá» phÃ¡t hiá»n cÃ³ hÃ nh vi gian láº­n, giÃ¡ trá» 1 náº¿u phÃ¡t hiá»n, 0 náº¿u k... | 102751296, 21278156, 96223331 |

## Domain Knowledge (from Mimir)

- Để tính số lượng user active hàng ngày của dịch vụ W2B, cần sử dụng bảng MINH_P2P_W2B_ALL_TRANS_MIMIR thay vì LOAN_P2P_W2B_FUNNEL_E2E_EVENT_AGG
- Schema 5M: CASE 3 - amount + amount_before > 50M THEN (amount - (5000000 - amount_before) - 45000000) * 0.008 + 45000000 * 0.0065 + 3300 if amount_before < 5M, else (50000000 - amount_before) * 0.0065 + (amount + amount_before - 50000000) * 0.008 + 3300 if amount_before < 50M, else amount * 0.008 + 3300
- Service_ID "banklink_cashin" không tồn tại trong dữ liệu W2B, chỉ có "banklink_cashout_napas". Banklink_cashin có thể có nghĩa là dịch vụ nạp tiền từ ngân hàng liên kết vào ví MoMo (cash in = tiền vào)
- tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING, lấy điều kiện này (serviceid <> 'transfer_p2b_scan_vietqr' OR serviceid IS NULL)
- Điều kiện lọc giao dịch W2B: (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL)
- TTT là viết tắt của Túi Thần Tài, tương ứng với FUNDID = 6
- Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.
- Trong "schema 5M" không có quy định liên quan đến money_source. Tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING cần được lọc với điều kiện (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL)
- Cách tính revenue theo các schema dựa vào số lượng giao dịch và amount trong tháng
- Schema 5M: CASE 1 - amount + amount_before <= 5M THEN (amount * 0.0065 + 3300) if tran_before > 30, else 0
- Trong "schema 5M", không có quy định liên quan đến money_source
- Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.
- Trong "schema 5M" không có quy định liên quan đến money_source
- FUNDID mapping: 1=momo, 2=bank_link, 3=napas, 4=visa debit, 5=visa credit, 6=TTT, 7=pay_later, 8=cashback, 9=visa ao ccm, 10=BNPL, 11=newton, 12=direct debit, 13=group fund, 14=transfer
- Schema 5M: CASE 2 - 5M < amount + amount_before <= 50M THEN (amount - (5000000 - amount_before)) * 0.0065 + 3300 if amount_before < 5M, else amount * 0.0065 + 3300
- Mã lỗi -100031 có nghĩa là "Thẻ quà tạm hết lượt sử dụng."
- "người dùng mới của MoMo" = người có 1st active trans (trong cả lifetime) trong tháng
- Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.
- Nhóm 'hard core' bao gồm '[3]. Super hardcore' hoặc '[4]. Hardcore upload'
- Khi tính số user có giao dịch đầu tiên trong tháng 10/2025 với giá trị 2025, không bao gồm serviceid 'transfer_p2b_scan_vietqr', cần sử dụng bảng 'momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING' và đảm bảo chỉ lấy giao dịch đầu tiên của mỗi user trong tháng bằng cách sử dụng ROW_NUMBER()
- MAU VietQR/W2B: active dịch vụ VietQR hoặc W2B và chỉ tính users có giao dịch đầu tiên tháng. Nếu user A dùng VietQR đầu tiên thì count là MAU VietQR, nếu user đó sau đó dùng W2B và giao dịch đó là first active thì count MAU W2B luôn và user đó vẫn là MAU VietQR = người này là overlap VietQR và W2B. Overlap VietQR và W2B nghĩa là tháng đó có active 2 dịch vụ. Only VietQR hoặc W2B nghĩa là tháng đó active chỉ VietQR hoặc chỉ W2B.
- MAU (Tổng VietQR): Tổng số người dùng có ít nhất một giao dịch VietQR trong tháng. MAU (Tổng W2B): Tổng số người dùng có ít nhất một giao dịch W2B (không phải VietQR) trong tháng. MAU overlap W2B, VietQR: Số người dùng có ít nhất một giao dịch VietQR VÀ ít nhất một giao dịch W2B (không phải VietQR) trong cùng tháng. MAU (Chỉ VietQR): Số người dùng có ít nhất một giao dịch VietQR VÀ không có giao dịch W2B (không phải VietQR) nào trong tháng. MAU (Chỉ W2B): Số người dùng có ít nhất một giao dịch W2B (không phải VietQR) VÀ không có giao dịch VietQR nào trong tháng.
- Danh sách đầy đủ các Service ID thuộc phạm vi W2B: transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload, transfer_p2b_globalsearch, transfer_p2b_search_paste, transfer_p2b_capture, banklink_cashout, banklink_cashout_napas, transfer_p2p_search_paste, transfer_p2p_globalsearch, transfer_gp2b
- Trong "schema 5M" không có quy định liên quan đến money_source. Tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING cần được lọc với điều kiện (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL)

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
