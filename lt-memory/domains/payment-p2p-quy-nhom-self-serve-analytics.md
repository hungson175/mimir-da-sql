# Domain: BU Payment:  P2P QUY NHOM SELF SERVE ANALYTICS

## Identity
- **Domain ID:** `58aa0bc4-eda4-4442-9d64-9f67d36a54ca`
- **Description:** 
- **Tables:** 3
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_PAYMENT_SOF
> Báº£ng fact lÆ°u trá»¯ chi tiáº¿t giao dá»ch nguá»n tiá»n (source of fund â SOF) khi ngÆ°á»i dÃ¹ng thanh toÃ¡n trong quá»¹ nhÃ³m (P2P MONEYPOOL).
- PhÃ¢n tÃ­ch dÃ²ng tiá»n vÃ o/ra tá»«ng quá»¹ nhÃ³m theo thá»i gian thá»±c.
- Theo dÃµi phÃ­, loáº¡i quá»¹, vai trÃ² thÃ nh viÃªn Äá» tÃ­nh toÃ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| PAYMENT_TID | STRING | MÃ£ giao dá»ch thanh toÃ¡n trong quá»¹ nhÃ³m, unique trÃªn toÃ n há» thá»ng. | 107043207989, 106994261324, 103851850389 |
| TID_mp | STRING | MÃ£ giao dá»ch cá»§a quá»¹ nhÃ³m (MONEYPOOL transaction ID) Äá» liÃªn káº¿t vá»i cÃ¡c báº£n ghi ... | 0, 109490202117, 114037498604 |
| ACTION | FLOAT | Loáº¡i hÃ nh Äá»ng trÃªn nguá»n tiá»n: -2. | -5, -2, -4 |
| amount | FLOAT | Sá» tiá»n thanh toÃ¡n trong quá»¹ (Äá»ng Viá»t Nam). | 50000, 100000, 10000 |
| date | DATE | NgÃ y giao dá»ch (yyyy-MM-dd). | 2026-01-14, 2025-12-05, 2026-01-12 |
| datetime | DATETIME | NgÃ y giá» giao dá»ch Äáº§y Äá»§. | 2025-11-02 14:22:37.582, 2026-01-11 19:55:08.080, 2025-08-26 19:35:50.542 |
| month | DATE | ThÃ¡ng tham chiáº¿u (ngÃ y Äáº§u thÃ¡ng cá»§a date). | 2025-12-01, 2025-11-01, 2025-10-01 |
| FUND_ID | STRING | Äá»nh danh duy nháº¥t cá»§a quá»¹ nhÃ³m (kÃ¨m user owner). | mp_62008438_7maztr7yrfqkvs0bj7grch, mp_40717421_7vgadegl2n3sdl7exnqyai, mp_82923... |
| FUND_TYPE | STRING | Loáº¡i quá»¹: [1] Individual (cÃ¡ nhÃ¢n) hoáº·c [2] Couple (cáº·p ÄÃ´i). | [1]. Individual, [2]. 2 People, [3]. 3-4 People, [4]. 5+ People |
| USER_ID | STRING | Agent ID cá»§a ngÆ°á»i thá»±c hiá»n thanh toÃ¡n trong quá»¹. | 62008438, 40717421, 6755173 |
| MESSAGE_TRANSFER | STRING | Ná»i dung tin nháº¯n ÄÃ­nh kÃ¨m giao dá»ch. |  |
| SERVICE_CODE | STRING | MÃ£ dá»ch vá»¥ háº¡ táº§ng thanh toÃ¡n. | u2u, cardcashout.mbbank_w2b, cardcashout.0916715134 |
| SERVICEID | STRING | MÃ£ dá»ch vá»¥ nghiá»p vá»¥ mapping vá»i service_code. | transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload |
| specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t mÃ  giao dá»ch thuá»c vá». | P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, SME OFFLINE, DATA, AIRTIME |
| FEE | FLOAT | PhÃ­ giao dá»ch (0 náº¿u miá»n phÃ­). | 0, 2200, 3950 |
| usecase | STRING | Ká»ch báº£n sá»­ dá»¥ng nghiá»p vá»¥. | SCAN VIETQR, P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, SME OFFLINE, DATA |
| ROLE | FLOAT | MÃ£ vai trÃ² (chÆ°a dÃ¹ng, giÃ¡ trá» toÃ n NaN).MÃ£ vai trÃ² (chÆ°a dÃ¹ng, giÃ¡ trá» toÃ n NaN). | 1, 3, 2 |
| user_id_owner | STRING | Agent ID chá»§ quá»¹ (null náº¿u quá»¹ khÃ´ng cÃ³ chá»§ rÃµ rÃ ng theo ká»ch báº£n). | 106705567, 53443465, 10871014 |
| ROLE_TYPE | STRING | TÃªn vai trÃ² (null náº¿u quá»¹ khÃ´ng phÃ¢n quyá»n cá»¥ thá»). | [1]. Chủ quỹ, [2]. Phó quỹ |

### project-5400504384186300846.MBI_DA.fact_quy_owner_monthly
> Báº£ng fact lÆ°u trá»¯ thÃ´ng tin hÃ ng thÃ¡ng cho ngÆ°á»i sá» há»¯u quá»¹. CÃ³ thá» sá»­ dá»¥ng Äá»:
- Theo dÃµi hoáº¡t Äá»ng hÃ ng thÃ¡ng cá»§a chá»§ sá» há»¯u quá»¹.
- PhÃ¢n tÃ­ch loáº¡i hÃ¬nh hoáº¡t Äá»ng hÃ ng thÃ¡ng vÃ  hÃ nh Äá»ng cá»§a quá»¹.
- XÃ¡c Äá»nh cÃ¡c chiáº¿n thuáº­t v...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng ghi nháº­n dá»¯ liá»u | 2025-12-01, 2025-09-01, 2025-11-01 |
| owner_aid | STRING | MÃ£ Äá»nh danh cá»§a chá»§ sá» há»¯u | 18646614, 64442103, 90838115 |
| monthly_active_type | STRING | Loáº¡i hoáº¡t Äá»ng hÃ ng thÃ¡ng cá»§a chá»§ sá» há»¯u | [02]. Retention, [03]. Reactivation, [01]. New to service |
| action_type | STRING | Loáº¡i hÃ nh Äá»ng thá»±c hiá»n trong thÃ¡ng | final_action |
| fund_id | STRING | ID cá»§a quá»¹ | mp_55669058_1sveblsuk9meqiwpka2d7m, mp_19089896_5zsrjpawad9qodi6ggypkc, mp_66916... |
| fund_type | STRING | Loáº¡i quá»¹ | [1]. Individual, [2]. 2 People, [3]. 3-4 People, [4]. 5+ People |
| tid | FLOAT | MÃ£ Äá»nh danh cá»§a giao dá»ch | 0, 83218265540, 83165031073 |
| date | DATE | NgÃ y xáº£y ra giao dá»ch hoáº·c hoáº¡t Äá»ng | 2025-12-01, 2026-01-01, 2025-11-01 |
| datetime | DATETIME | NgÃ y giá» xáº£y ra giao dá»ch hoáº·c hoáº¡t Äá»ng | 2025-11-01 21:36:15.289, 2025-10-22 22:01:17.597, 2025-04-01 09:20:07.531 |
| milisecond_diff | INTEGER | KhÃ¡c biá»t thá»i gian tÃ­nh báº±ng mili giÃ¢y | 0, 3920640, 1630974 |
| detail_id | STRING | ID chi tiáº¿t cho tá»«ng má»¥c ghi nháº­n | , 0P1339PSCDRC4, 113867570544 |
| tactic | STRING | Chiáº¿n thuáº­t Ã¡p dá»¥ng trong thÃ¡ng | Organic, voucher, gamification, reward, comm |
| kpi_type | STRING | Loáº¡i KPI ÄÆ°á»£c Ã¡p dá»¥ng | Organic, growth, engage |
| sub_tactics | STRING | Chiáº¿n thuáº­t phá»¥ ÄÆ°á»£c sá»­ dá»¥ng | Organic, tran_game, redeem_voucher_collect, collect_voucher, redeem_reward_gift |
| campaign_name_lv1 | STRING | TÃªn chiáº¿n dá»ch cáº¥p Äá» 1 | Organic, , SC25 |
| campaign_name_lv2 | STRING | TÃªn chiáº¿n dá»ch cáº¥p Äá» 2 | Organic, , qn_w2b_251204_cbttt_100pt3k_hje7k |
| priority_rank_lv1 | INTEGER | Xáº¿p háº¡ng Æ°u tiÃªn cáº¥p 1 | 0, 3, 2 |
| priority_rank_lv3 | INTEGER | Xáº¿p háº¡ng Æ°u tiÃªn cáº¥p 3 | 0, 3, 2 |
| attribution_rank | INTEGER | Thá»© háº¡ng gÃ¡n thuá»c tÃ­nh | 1 |

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER
> Báº£ng nÃ y quáº£n lÃ½ cÃ¡c giao dá»ch quá»¹ trong P2P MONEYPOOL, cung cáº¥p thÃ´ng tin chi tiáº¿t vá» cÃ¡c hoáº¡t Äá»ng nhÆ° gÃ³p quá»¹, rÃºt quá»¹, vÃ  hoÃ n tiá»n cÃ¡c giao dá»ch liÃªn quan Äáº¿n kÃªnh thanh toÃ¡n vÃ  tráº¡ng thÃ¡i quá»¹. 
Má»¥c ÄÃ­ch sá»­ dá»¥ng cá»§a báº£ng nÃ y:
- Theo...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng diá»n ra giao dá»ch | 2025-12-01, 2025-11-01, 2025-10-01 |
| date | DATE | NgÃ y diá»n ra giao dá»ch trong quá»¹ nhÃ³mNgÃ y diá»n ra giao dá»ch trong quá»¹ nhÃ³m

**Sample... | 2026-01-09, 2026-01-10, 2026-01-14 |
| datetime | DATETIME | Thá»i Äiá»m chÃ­nh xÃ¡c giao dá»ch ÄÆ°á»£c táº¡o (bao gá»m cáº£ giá», phÃºt, giÃ¢y)Thá»i Äi... | 2025-12-26 05:18:10.479, 2025-11-02 07:06:34.874, 2025-10-13 00:40:11.681 |
| FUND_ID | STRING | MÃ£ Äá»nh danh duy nháº¥t cá»§a quá»¹ (mp_<owner_id>_<hash>)MÃ£ Äá»nh danh duy nháº¥t cá»§a quá»... | mp_11050877_lpkwst8a5oq4xghrzx1bf, mp_59832398_4s0zxg5ejhovhmm51rkbvo, mp_415908... |
| USER_ID | STRING | MÃ£ Äá»nh danh ngÆ°á»i thá»±c hiá»n giao dá»ch trong quá»¹MÃ£ Äá»nh danh ngÆ°á»i thá»±c hiá»... | 95936547, 27345607, 71351460 |
| ACTION | FLOAT | Loáº¡i hÃ nh Äá»ng cá»§a giao dá»ch:
- 1: GÃ³p quá»¹
- 2: Refund giao dá»ch thanh toÃ¡n SOF bá»... | 9, 1, -1 |
| ACTION_NAME | STRING | TÃªn cá»§a hÃ nh Äá»ng tÆ°Æ¡ng á»©ng vá»i mÃ£ hÃ nh Äá»ng:
- -1: Withdraw
- 1 and null: Cash In... | Claim Interest, Cash In, Payment SOF, Withdraw, Withdraw to Wallet for Payment |
| ROLE | FLOAT | Vai trÃ² cá»§a ngÆ°á»i thá»±c hiá»n giao dá»ch | 1, 2, 3 |
| FUND_TYPE | STRING | Dáº¡ng quá»¹ theo sá» ngÆ°á»iDáº¡ng quá»¹ theo sá» ngÆ°á»i | [1]. Individual, [2]. 2 People, [3]. 3-4 People, [4]. 5+ People |
| FUND_TYPE_include_B2W | STRING | Dáº¡ng quá»¹ theo sá» ngÆ°á»i bao gá»m cáº£ bank account B2 quá»¹Dáº¡ng quá»¹ theo sá» ngÆ°á»i ... | [1]. Individual, [2]. Couple, [3]. Family & Friends |
| USER_ID_OWNER | STRING | MÃ£ Äá»nh danh chá»§ quá»¹MÃ£ Äá»nh danh chá»§ quá»¹ | 11050877, 36964031, 59832398 |
| STATUS_FUND | FLOAT | Tráº¡ng thÃ¡i ÄÃ£ KhÃ³a quá»¹, CÃ²n má» quá»¹:
- KhÃ³a quá»¹ (0)
- CÃ²n má» quá»¹ (1)
- Pause Dep... | 1, 0, 3 |
| FUND_SIZE | INTEGER | Sá» lÆ°á»£ng thÃ nh viÃªn trong quá»¹ táº¡i thá»i Äiá»m cháº¡y pipelineSá» lÆ°á»£ng thÃ nh viÃª... | 1, 2, 3 |
| STATUS_FUND_final | FLOAT | Tráº¡ng thÃ¡i cuá»i cÃ¹ng cá»§a quá»¹ táº¡i thá»i Äiá»m cháº¡y pipelineTráº¡ng thÃ¡i cuá»i cÃ¹n... | 1, 0, 3 |
| OWNER_AGE | STRING | NhÃ³m tuá»i chá»§ quá»¹ táº¡i thá»i Äiá»m cháº¡y pipelineNhÃ³m tuá»i chá»§ quá»¹ táº¡i thá»i Ä... | [2].Owner >18, [1].Owner Under 18 |
| old_user_type_to_service | STRING | PhÃ¢n loáº¡i user theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| user_type_to_service | STRING | PhÃ¢n loáº¡i user theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| old_FUND_TYPE_active | STRING | PhÃ¢n loáº¡i quá»¹ theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| FUND_TYPE_active | STRING | PhÃ¢n loáº¡i quá»¹ theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| Old_uniqueowner_to_service | STRING | PhÃ¢n loáº¡i owner theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| Uniqueowner_to_service | STRING | PhÃ¢n loáº¡i owner theo '[01]. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| TID | FLOAT | MÃ£ giao dá»ch Quá»¹, má»t sá» case lÃ  chÃ­nh mÃ£ giao dá»ch á» coreMÃ£ giao dá»ch Quá»¹, má»... | 0, 106829895636, 93350268259 |
| PAYMENT_TID | FLOAT | MÃ£ giao dá»ch thanh toÃ¡n liÃªn quanMÃ£ giao dá»ch thanh toÃ¡n liÃªn quan | 74885062480, 107441216285, 114558041745 |
| PARENT_TID | FLOAT | MÃ£ giao dá»ch chaMÃ£ giao dá»ch cha | 105091598789, 114422698202, 85736728906 |
| STATUS | STRING | Tráº¡ng thÃ¡i lá»nh quá»¹Tráº¡ng thÃ¡i lá»nh quá»¹, update vá»¥ success ná»¯a | success, refunded, refunding, failed, processing |
| ERROR_CODE | FLOAT | MÃ£ lá»i giao dá»chMÃ£ lá»i giao dá»ch | 0, 1219101, 1219100 |
| PAYMENT_CHANNEL | STRING | KÃªnh thanh toÃ¡nKÃªnh thanh toÃ¡n | detail_home, scan_qr, link_private, link_public, link_private_requested |
| MESSAGE_TRANSFER | STRING | Ná»i dung tin nháº¯n giao dá»chNá»i dung tin nháº¯n giao dá»ch | Góp vào quỹ chung, Quà từ Đấu Trường Tri Thức, Nạp tiền vào Túi Thần Tài, Góp qu... |
| AMOUNT | FLOAT | Sá» tiá»n giao dá»ch (VND)Sá» tiá»n giao dá»ch (VND) | 1, 20000, 10000 |
| B2W_user_id | STRING | User Back2Wallet mappingUser Back2Wallet mapping | 49305308e5c3bd38203bf9df59d7eb6a028645ede7cd29aa56a5a96fe37a59fd, f043dd0cff4720... |
| tknh_momo_type | STRING | Loáº¡i tÃ i khoáº£n MoMoLoáº¡i tÃ i khoáº£n MoMo | [2]. not overlap, [1]. overlap |
| tknh_tknh_type | STRING | Loáº¡i tÃ i khoáº£n ngÃ¢n hÃ ngLoáº¡i tÃ i khoáº£n ngÃ¢n hÃ ng | [2]. not overlap, [1]. overlap |
| SOURCE_ACCOUNT_MOMO_USER_TYPE | STRING | Loáº¡i tÃ i khoáº£n nguá»nLoáº¡i tÃ i khoáº£n nguá»n | [1]. Đã map, [2]. Chưa map -> Đã map |
| SOURCE_ACCOUNT_MOMO_USER_ID | STRING | MÃ£ user nguá»nMÃ£ user nguá»n | 72559601, 30885744, 36964031 |
| FUND_INVESTMENT_STATUS | FLOAT | Tráº¡ng thÃ¡i Äáº§u tÆ° vÃ o quá»¹Tráº¡ng thÃ¡i Äáº§u tÆ° vÃ o quá»¹ | 1, 0, 2 |
| REGISTER_INVESTMENT_TIME | DATETIME | Thá»i Äiá»m ÄÄng kÃ½ Äáº§u tÆ°Thá»i Äiá»m ÄÄng kÃ½ Äáº§u tÆ° | 2025-02-15 17:55:17.331, 2025-05-13 13:55:53.349, 2025-05-25 21:26:37.551 |
| fund_type_by_purpose | STRING | Má»¥c ÄÃ­ch quá»¹Má»¥c ÄÃ­ch quá»¹ | [2]. Saving, [1]. Spending |
| FUND_INVESTMENT_TYPE | STRING | Loáº¡i hÃ¬nh Äáº§u tÆ°Loáº¡i hÃ¬nh Äáº§u tÆ° | [1]. TTT, [2]. Non-TTT |
| FIRST_INVESTMENT_TID_TYPE | STRING | Loáº¡i giao dá»ch Äáº§u tÆ° Äáº§u tiÃªnLoáº¡i giao dá»ch Äáº§u tÆ° Äáº§u tiÃªn | [1]. ACTION (1) đi kèm ACTION (-3) |
| age_group | STRING | NhÃ³m tuá»i ngÆ°á»i thá»±c hiá»n giao dá»chNhÃ³m tuá»i ngÆ°á»i thá»±c hiá»n giao dá»ch | others, [2].18-22, [3].23-27, [4].28-35, [1].<18  |
| citygroup | STRING | NhÃ³m thÃ nh phá»NhÃ³m thÃ nh phá» | UNKNOWN, Thành Phố Hồ Chí Minh, Hà Nội, Tỉnh khác, KCN Miền Nam |
| gender | STRING | Giá»i tÃ­nhGiá»i tÃ­nh | FEMALE, MALE |
| avail_balance | FLOAT | Sá» dÆ° kháº£ dá»¥ng cá»§a quá»¹Sá» dÆ° kháº£ dá»¥ng cá»§a quá»¹ | 1807525297643, 1680149887402, 1584838726227 |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
