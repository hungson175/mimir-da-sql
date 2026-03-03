# Domain: CDO: User Consent

## Identity
- **Domain ID:** `350f9466-757c-4292-af88-5e7e16e65d6a`
- **Description:** Dữ liệu user đồng ý chia sẻ dữ liệu cá nhân với MoMo
- **Tables:** 7
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.BEHALF_USERS_CONSENT_HISTORY

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| CHANGE_ID | STRING | ID thay Äá»i, Äá»nh danh duy nháº¥t cho má»i láº§n cháº¥p thuáº­n hoáº·c thay Äá»i quyá»n. | 1756409280640-ea5bb11c-7916-422c, 1750051649664-95e11118-2416-4b57, 490efb11-f0c... |
| PERMISSION_ID | STRING | ID quyá»n, Äá»nh danh duy nháº¥t cho má»i loáº¡i quyá»n ÄÆ°á»£c cáº¥p cho ngÆ°á»i dÃ¹ng. | 81, 80, 75 |
| ACTION | INTEGER | HÃ nh Äá»ng thá»±c hiá»n, loáº¡i hÃ nh Äá»ng liÃªn quan Äáº¿n viá»c cháº¥p thuáº­n quyá»n. | 1, 0 |
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo cá»§a ngÆ°á»i Äáº¡i diá»n. | 77471588, 96586354, 51839407 |
| ATTRIBUTE | STRING | Thuá»c tÃ­nh cá»§a quyá»n hay hÃ nh Äá»ng cháº¥p thuáº­n. | privacy_ttat_optional_v1, privacy_ttat_require_v1, policy_1.0_0623 |
| MINI_APP_ID | STRING | ID cá»§a mini app liÃªn quan Äáº¿n hÃ nh Äá»ng cháº¥p thuáº­n. | internal.mservice.onboarding_paylater, vn.momo.appx, internal.mservice.service-b... |
| MINI_APP_USER_ID | STRING | ID ngÆ°á»i dÃ¹ng trong mini app. |  |
| PARTNER_CODE | STRING | MÃ£ Äá»i tÃ¡c, xÃ¡c Äá»nh Äá»i tÃ¡c liÃªn káº¿t vá»i hÃ nh Äá»ng cháº¥p thuáº­n. | onboarding_paylater, , service-bank-v2 |
| PARTNER_USER_ID | STRING | ID ngÆ°á»i dÃ¹ng bÃªn Äá»i tÃ¡c. |  |
| UPDATE_AT | DATETIME | Thá»i Äiá»m cáº­p nháº­t hÃ nh Äá»ng cháº¥p thuáº­n. | 2025-06-25 08:54:55, 2025-05-16 05:57:12, 2025-05-05 06:56:53 |
| USER_ID | STRING | ID ngÆ°á»i dÃ¹ng MoMo cÃ³ hÃ nh Äá»ng cháº¥p thuáº­n. |  |
| DT | DATE | NgÃ y thá»±c hiá»n hÃ nh Äá»ng cháº¥p thuáº­n. | 2025-10-09 |

### momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_TRANS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 26290715, 43774219, 70357099 |
| IS_A30_USER | STRING | Tráº¡ng thÃ¡i ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng trong vÃ²ng 30 ngÃ y trÆ°á»c ngÃ y hiá»n táº¡i. | A30 |
| IS_A60_USER | STRING | Tráº¡ng thÃ¡i ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng trong vÃ²ng 60 ngÃ y trÆ°á»c ngÃ y hiá»n táº¡i. | A60 |
| IS_A90_USER | STRING | Tráº¡ng thÃ¡i ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng trong vÃ²ng 90 ngÃ y trÆ°á»c ngÃ y hiá»n táº¡i. | A90 |
| HAVE_TRANS | STRING | Tráº¡ng thÃ¡i cho biáº¿t ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n giao dá»ch nÃ o khÃ´ng. | Have at least 1 trans |
| LAST_TRANS | DATETIME | Thá»i gian thá»±c hiá»n giao dá»ch cuá»i cÃ¹ng cá»§a ngÆ°á»i dÃ¹ng. | 2025-10-10 20:29:29, 2025-10-10 21:28:49, 2025-10-10 21:00:12 |
| TTAT_REQUIRE | BOOLEAN | Tráº¡ng thÃ¡i cho biáº¿t cÃ¡c Äiá»u khoáº£n vÃ  chÃ­nh sÃ¡ch cáº§n thiáº¿t mÃ  ngÆ°á»i dÃ¹ng pháº... | false, true |
| TTAT_OPTIONAL | BOOLEAN | Tráº¡ng thÃ¡i cho biáº¿t cÃ¡c Äiá»u khoáº£n vÃ  chÃ­nh sÃ¡ch tÃ¹y chá»n mÃ  ngÆ°á»i dÃ¹ng cÃ³ th... | true, false |
| OLD_POLICY | BOOLEAN | Tráº¡ng thÃ¡i cho biáº¿t ngÆ°á»i dÃ¹ng cÃ³ Äá»ng Ã½ vá»i chÃ­nh sÃ¡ch cÅ© khÃ´ng (true: cÃ³ Äá»... | false, true |
| CONSENT_TYPE | STRING | Loáº¡i hÃ¬nh Äá»ng Ã½ cá»§a ngÆ°á»i dÃ¹ng Äá»i vá»i cÃ¡c Äiá»u khoáº£n vÃ  chÃ­nh sÃ¡ch. | [4]. Chưa consent, N/A, [1]. Consent cho cả Platform và 3rd Party, [2]. Consent ... |

### momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_LOGIN

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 77124227, 47055898, 55584489 |
| IS_A30_LOGIN | STRING | XÃ¡c Äá»nh ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n ÄÄng nháº­p khÃ´ng. | A30 |
| IS_A60_LOGIN | STRING | XÃ¡c Äá»nh ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n ÄÄng nháº­p khÃ´ng. | A60 |
| IS_A90_LOGIN | STRING | XÃ¡c Äá»nh ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n ÄÄng nháº­p khÃ´ng. | A90 |
| LOGIN_SINCE_2022 | STRING | XÃ¡c Äá»nh náº¿u ngÆ°á»i dÃ¹ng ÄÃ£ thá»±c hiá»n ÄÄng nháº­p tá»« nÄm 2022. | Login at least 1 time since 2022-01-01 |
| LAST_LOGIN | DATE | NgÃ y ngÆ°á»i dÃ¹ng thá»±c hiá»n ÄÄng nháº­p láº§n cuá»i. | 2025-10-10, 2025-10-09, 2025-10-08 |
| TTAT_REQUIRE | BOOLEAN | XÃ¡c Äá»nh yÃªu cáº§u tÃ­nh nÄng tÃºi tháº§n tÃ i trong quÃ¡ trÃ¬nh Äá»ng Ã½. | true, false |
| TTAT_OPTIONAL | BOOLEAN | XÃ¡c Äá»nh tÃ¹y chá»n tÃ­nh nÄng tÃºi tháº§n tÃ i trong quÃ¡ trÃ¬nh Äá»ng Ã½. | true, false |
| OLD_POLICY | BOOLEAN | XÃ¡c Äá»nh náº¿u sá»± Äá»ng Ã½ theo chÃ­nh sÃ¡ch cÅ©. | false, true |
| CONSENT_TYPE | STRING | Loáº¡i sá»± Äá»ng Ã½ cá»§a ngÆ°á»i dÃ¹ng. | [4]. Chưa consent, [1]. Consent cho cả Platform và 3rd Party, N/A, [2]. Consent ... |

### momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_MINIAPP

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 100824124, 43575064, 50694790 |
| MINIAPP_NAME | STRING | TÃªn cá»§a á»©ng dá»¥ng miniapp. | Highlands Coffee, The Coffee House, Jollibee, KFC, Thuê xe |
| MINI_APP_ID | STRING | MÃ£ Äá»nh danh cá»§a á»©ng dá»¥ng miniapp. | miniapp.R18Dwd2LljOg00Wbt2Cm.highlandscoffee, miniapp.my5lEou2y4J26uNfUDfw.jolli... |
| MINIAPP_LOGIN_NO | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng ÄÃ£ ÄÄng nháº­p vÃ o á»©ng dá»¥ng miniapp. | 1, 2, 3 |
| IS_CONSENT | BOOLEAN | LÃ  giÃ¡ trá» boolean xÃ¡c Äá»nh ngÆ°á»i dÃ¹ng cÃ³ Äá»ng Ã½ Äiá»u khoáº£n cá»§a miniapp hay ... | false, true |
| MINIAPP_WITH_TRANS_NO | INTEGER | Sá» lÆ°á»£ng giao dá»ch ÄÆ°á»£c thá»±c hiá»n qua miniapp. | 0, 1, 2 |

### momovn-prod.MBI_DA.USER_CONSENT_DAILY

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| CONSENT_DAY | DATE | NgÃ y mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ vá»i cÃ¡c yÃªu cáº§u hoáº·c tÃ¹y chá»n trÃªn ná»n táº£ng... | 2025-04-17, 2025-07-28, 2025-05-09 |
| TOTAL_USER_CONSENT | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ vá»i cÃ¡c yÃªu cáº§u hoáº·c tÃ¹y chá»n trong ngÃ y ÄÃ³... | 39769, 47005, 43512 |
| TOTAL_CONSENT_REQUIRE_POPUP | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ sau khi xem popup báº¯t buá»c. | 22709, 23130, 22208 |
| TOTAL_CONSENT_OPTIONAL_POPUP | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ sau khi xem popup tÃ¹y chá»n. | 24696, 26484, 20876 |
| TOTAL_CONSENT_OLD_POPUP | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ sau khi xem popup cÅ©. | 12630, 11669, 12062 |
| TOTAL_CONSENT_MINIAPP | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ thÃ´ng qua miniapp. | 46, 22925, 21227 |

### momovn-prod.MBI_DA.USER_CONSENT_MONTHLY

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| CONSENT_MONTH | DATE | ThÃ¡ng mÃ  dá»¯ liá»u sá»± Äá»ng Ã½ cá»§a ngÆ°á»i dÃ¹ng ÄÆ°á»£c ghi nháº­n. |  |
| TOTAL_USER_CONSENT | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng ÄÃ£ Äá»ng Ã½ cho phÃ©p sá»­ dá»¥ng dá»ch vá»¥ trong thÃ¡ng. |  |
| TOTAL_CONSENT_REQUIRE_POPUP | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng yÃªu cáº§u sá»± Äá»ng Ã½ qua giao diá»n pop-up báº¯t buá»c. |  |
| TOTAL_CONSENT_OPTIONAL_POPUP | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng Äá»ng Ã½ thÃ´ng qua giao diá»n pop-up tÃ¹y chá»n. |  |
| TOTAL_CONSENT_OLD_POPUP | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng Äá»ng Ã½ thÃ´ng qua giao diá»n pop-up cÅ©. |  |
| TOTAL_CONSENT_MINIAPP | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng Äá»ng Ã½ thÃ´ng qua mini app. |  |

### project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | INTEGER | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. |  |
| phone_new | STRING | Sá» Äiá»n thoáº¡i má»i cá»§a ngÆ°á»i dÃ¹ng. |  |
| phone_old | STRING | Sá» Äiá»n thoáº¡i cÅ© cá»§a ngÆ°á»i dÃ¹ng. |  |
| is_end_user | BOOLEAN | Äiá»u kiá»n xÃ¡c Äá»nh ngÆ°á»i dÃ¹ng cuá»i. |  |
| is_deleted | BOOLEAN | Äiá»u kiá»n xÃ¡c Äá»nh náº¿u tÃ i khoáº£n ngÆ°á»i dÃ¹ng ÄÃ£ bá» xÃ³a. |  |
| is_active | BOOLEAN | Tráº¡ng thÃ¡i hoáº¡t Äá»ng cá»§a tÃ i khoáº£n ngÆ°á»i dÃ¹ng. |  |
| register_datetime | DATETIME | NgÃ y vÃ  giá» ÄÄng kÃ½ tÃ i khoáº£n cá»§a ngÆ°á»i dÃ¹ng. |  |
| deletion_datetime | DATETIME | NgÃ y vÃ  giá» tÃ i khoáº£n ngÆ°á»i dÃ¹ng bá» xÃ³a. |  |
| email | STRING | Email liÃªn káº¿t vá»i tÃ i khoáº£n ngÆ°á»i dÃ¹ng. |  |
| phone_carrier | STRING | NhÃ  máº¡ng cá»§a sá» Äiá»n thoáº¡i ngÆ°á»i dÃ¹ng. |  |
| device_os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» ngÆ°á»i dÃ¹ng Äang sá»­ dá»¥ng. |  |
| capset | STRING | ThÃ´ng tin vá» thiáº¿t bá» vÃ  cÃ i Äáº·t cá»§a ngÆ°á»i dÃ¹ng. |  |
| last_login | DATE | NgÃ y cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng ÄÄng nháº­p. |  |
| is_momo_employee | BOOLEAN | Äiá»u kiá»n xÃ¡c Äá»nh nhÃ¢n viÃªn MoMo. True: lÃ  MoMoer, False: khÃ´ng pháº£i MoMoer. |  |
| user_name | STRING | TÃªn ngÆ°á»i dÃ¹ng trÃªn tÃ i khoáº£n MoMo. |  |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng. |  |
| gender_source | STRING | Nguá»n xÃ¡c Äá»nh thÃ´ng tin giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng. |  |
| age | INTEGER | Tuá»i cá»§a ngÆ°á»i dÃ¹ng. |  |
| yob | INTEGER | NÄm sinh cá»§a ngÆ°á»i dÃ¹ng. |  |
| dob | DATE | NgÃ y sinh cá»§a ngÆ°á»i dÃ¹ng. |  |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng. |  |
| age_source | STRING | Nguá»n xÃ¡c Äá»nh thÃ´ng tin tuá»i cá»§a ngÆ°á»i dÃ¹ng. |  |
| is_face_matching | BOOLEAN | Äiá»u kiá»n xÃ¡c nháº­n náº¿u ÄÃ£ Äá»i chiáº¿u khuÃ´n máº·t ngÆ°á»i dÃ¹ng. |  |
| is_kyc | BOOLEAN | Äiá»u kiá»n xÃ¡c nháº­n KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| verify_info | STRING | ThÃ´ng tin xÃ¡c thá»±c cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_confirm | STRING | XÃ¡c nháº­n thÃ´ng tin KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_id_card_type | STRING | Loáº¡i tháº» ID sá»­ dá»¥ng Äá» xÃ¡c minh KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_id_card_type_detail | STRING | Chi tiáº¿t loáº¡i tháº» ID cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_issue_place | STRING | NÆ¡i phÃ¡t hÃ nh tháº» ID cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_level | STRING | Cáº¥p Äá» xÃ¡c minh KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_nationality | STRING | Quá»c gia ÄÃ£ xÃ¡c minh trong KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_name | STRING | TÃªn ÄÃ£ xÃ¡c minh trong KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_address | STRING | Äá»a chá» ÄÃ£ xÃ¡c minh trong KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_dob | DATE | NgÃ y sinh xÃ¡c minh trong KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_issue_date | DATE | NgÃ y phÃ¡t hÃ nh tháº» ID xÃ¡c minh KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_expired_date | DATE | NgÃ y háº¿t háº¡n tháº» ID xÃ¡c minh KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_gender | STRING | Giá»i tÃ­nh xÃ¡c minh trong KYC cá»§a ngÆ°á»i dÃ¹ng. |  |
| kyc_expiration_type | STRING | Kiá»u háº¿t háº¡n cá»§a tháº» ID trong KYC. |  |
| bank_code | STRING | MÃ£ ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| bank_name | STRING | TÃªn ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| bank_verify_name | STRING | TÃªn xÃ¡c minh tá»« ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| bank_verify_personalid | STRING | ID cÃ¡ nhÃ¢n ÄÃ£ xÃ¡c minh tá»« ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| bank_acc_no | STRING | Sá» tÃ i khoáº£n ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| bank_verify_dob | DATE | NgÃ y sinh ÄÃ£ xÃ¡c minh tá»« ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| email_bank | STRING | Email liÃªn káº¿t vá»i tÃ i khoáº£n ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| map_visa | BOOLEAN | Äiá»u kiá»n káº¿t ná»i vá»i tháº» Visa. True: ÄÃ£ káº¿t ná»i, False: chÆ°a káº¿t ná»i. |  |
| first_map_visa | DATETIME | NgÃ y vÃ  giá» Äáº§u tiÃªn káº¿t ná»i vá»i Visa. |  |
| map_bank | BOOLEAN | Äiá»u kiá»n káº¿t ná»i vá»i ngÃ¢n hÃ ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| first_map_bank | DATE | NgÃ y Äáº§u tiÃªn káº¿t ná»i vá»i ngÃ¢n hÃ ng. |  |
| mapbank_last_status | STRING | Tráº¡ng thÃ¡i cuá»i cÃ¹ng cá»§a káº¿t ná»i vá»i ngÃ¢n hÃ ng. |  |
| mapbank_last_date | DATETIME | NgÃ y cuá»i cÃ¹ng káº¿t ná»i vá»i ngÃ¢n hÃ ng. |  |
| name_first_bank_cashin | STRING | TÃªn ngÃ¢n hÃ ng Äáº§u tiÃªn ngÆ°á»i dÃ¹ng náº¡p tiá»n vÃ o. |  |
| first_date_bank_cashin | DATETIME | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng náº¡p tiá»n vÃ o ngÃ¢n hÃ ng. |  |
| name_last_bank_cashin | STRING | TÃªn ngÃ¢n hÃ ng cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng náº¡p tiá»n vÃ o. |  |
| last_date_bank_cashin | DATETIME | NgÃ y cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng náº¡p tiá»n vÃ o ngÃ¢n hÃ ng. |  |
| n_time_map_bank | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng káº¿t ná»i vá»i ngÃ¢n hÃ ng. |  |
| n_time_unmap_bank | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng huá»· káº¿t ná»i ngÃ¢n hÃ ng. |  |
| last_date_unmap_bank | DATETIME | NgÃ y cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng huá»· káº¿t ná»i ngÃ¢n hÃ ng. |  |
| map_napas | BOOLEAN | Äiá»u kiá»n káº¿t ná»i vá»i Napas. True: ÄÃ£ káº¿t ná»i, False: chÆ°a káº¿t ná»i. |  |
| first_map_napas | DATE | NgÃ y Äáº§u tiÃªn káº¿t ná»i vá»i Napas. |  |
| n_time_map_napas | INTEGER | Sá» láº§n káº¿t ná»i vá»i Napas. |  |
| n_time_unmap_napas | INTEGER | Sá» láº§n huá»· káº¿t ná»i vá»i Napas. |  |
| last_date_unmap_napas | DATETIME | NgÃ y cuá»i cÃ¹ng huá»· káº¿t ná»i vá»i Napas. |  |
| name_last_bank_napas | STRING | TÃªn ngÃ¢n hÃ ng cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng káº¿t ná»i vá»i Napas. |  |
| map_sacom_card | BOOLEAN | Äiá»u kiá»n káº¿t ná»i vá»i tháº» Sacom. True: ÄÃ£ káº¿t ná»i, False: chÆ°a káº¿t ná»i. |  |
| first_map_sacom_card | DATE | NgÃ y Äáº§u tiÃªn káº¿t ná»i vá»i tháº» Sacom. |  |
| first_a30_trans | DATETIME | NgÃ y vÃ  giá» thá»±c hiá»n giao dá»ch A30 Äáº§u tiÃªn. |  |
| is_a30_user | BOOLEAN | Äiá»u kiá»n xÃ¡c Äá»nh ngÆ°á»i dÃ¹ng A30. |  |
| last_trans | DATETIME | NgÃ y vÃ  giá» thá»±c hiá»n giao dá»ch cuá»i cÃ¹ng. |  |
| first_service_code | STRING | MÃ£ dá»ch vá»¥ Äáº§u tiÃªn ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| first_group_code_l1 | STRING | MÃ£ nhÃ³m L1 Äáº§u tiÃªn ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| first_newvertical_merchant | STRING | NgÆ°á»i bÃ¡n má»i thuá»c ngÃ nh dá»c Äáº§u tiÃªn káº¿t ná»i. |  |
| first_service_description | STRING | MÃ´ táº£ dá»ch vá»¥ Äáº§u tiÃªn ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| first_specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t Äáº§u tiÃªn ngÆ°á»i dÃ¹ng tham gia. |  |
| second_service_code | STRING | MÃ£ dá»ch vá»¥ thá»© hai ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| second_group_code_l1 | STRING | MÃ£ nhÃ³m L1 thá»© hai ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| second_newvertical_merchant | STRING | NgÆ°á»i bÃ¡n má»i thuá»c ngÃ nh dá»c thá»© hai káº¿t ná»i. |  |
| second_service_description | STRING | MÃ´ táº£ dá»ch vá»¥ thá»© hai ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| second_specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t thá»© hai ngÆ°á»i dÃ¹ng tham gia. |  |
| third_service_code | STRING | MÃ£ dá»ch vá»¥ thá»© ba ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| third_group_code_l1 | STRING | MÃ£ nhÃ³m L1 thá»© ba ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| third_newvertical_merchant | STRING | NgÆ°á»i bÃ¡n má»i thuá»c ngÃ nh dá»c thá»© ba káº¿t ná»i. |  |
| third_service_description | STRING | MÃ´ táº£ dá»ch vá»¥ thá»© ba ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. |  |
| third_specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t thá»© ba ngÆ°á»i dÃ¹ng tham gia. |  |
| most_service_code | STRING | MÃ£ dá»ch vá»¥ ngÆ°á»i dÃ¹ng sá»­ dá»¥ng nhiá»u nháº¥t. |  |
| most_newvertical_merchant | STRING | NgÆ°á»i bÃ¡n má»i thuá»c ngÃ nh dá»c ngÆ°á»i dÃ¹ng káº¿t ná»i nhiá»u nháº¥t. |  |
| most_service_description | STRING | MÃ´ táº£ dá»ch vá»¥ ngÆ°á»i dÃ¹ng sá»­ dá»¥ng nhiá»u nháº¥t. |  |
| most_specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t ngÆ°á»i dÃ¹ng tham gia nhiá»u nháº¥t. |  |
| is_cheat_user | BOOLEAN | Äiá»u kiá»n xÃ¡c Äá»nh ngÆ°á»i dÃ¹ng gian láº­n. |  |
| cheat_source | STRING | Nguá»n phÃ¡t hiá»n hÃ nh vi gian láº­n cá»§a ngÆ°á»i dÃ¹ng. |  |
| location_month | DATE | ThÃ¡ng vÃ  nÄm cá»§a vá» trÃ­ ngÆ°á»i dÃ¹ng. |  |
| most_city_a60 | STRING | ThÃ nh phá» ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng nhiá»u nháº¥t trong 60 ngÃ y qua. |  |
| most_district_a60 | STRING | Quáº­n ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng nhiá»u nháº¥t trong 60 ngÃ y qua. |  |
| most_ward_a60 | STRING | PhÆ°á»ng ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng nhiá»u nháº¥t trong 60 ngÃ y qua. |  |
| location_method | STRING | PhÆ°Æ¡ng phÃ¡p xÃ¡c Äá»nh vá» trÃ­ ngÆ°á»i dÃ¹ng. |  |
| most_region | STRING | VÃ¹ng ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng nhiá»u nháº¥t. |  |
| most_group_region_vn | STRING | NhÃ³m vÃ¹ng ngÆ°á»i dÃ¹ng Viá»t Nam hoáº¡t Äá»ng nhiá»u nháº¥t. |  |
| is_consent | BOOLEAN | Äiá»u kiá»n xÃ¡c nháº­n Äá»ng Ã½ cá»§a ngÆ°á»i dÃ¹ng. |  |
| creation_date | DATE | NgÃ y táº¡o tÃ i khoáº£n cá»§a ngÆ°á»i dÃ¹ng. |  |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
