# Domain: BU Payment: Telco Funnel

## Identity
- **Domain ID:** `fdc4e81a-0f8e-4412-b5b4-1602705daae6`
- **Description:** Funnel cơ bản của user Airtime và Data.
Funnel cơ bản của user SIM

- **Tables:** 2
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.BU_UTILITIES_TELCO.FULL_FUNNEL_TELCO_OPTIMIZE
> Báº£ng FULL_FUNNEL_TELCO_OPTIMIZE trong dá»± Ã¡n momovn-prod.BU_UTILITIES_TELCO dÃ¹ng Äá» tá»i Æ°u hÃ³a quy trÃ¬nh dá»ch vá»¥ viá»n thÃ´ng. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
- Theo dÃµi hÃ nh Äá»ng cá»§a user trong ngÃ y cá»¥ thá» thÃ´ng qua cá»t date_partit...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date_partition | DATE | NgÃ y thá»±c hiá»n hÃ nh Äá»ng cá»§a userNgÃ y thá»±c hiá»n hÃ nh Äá»ng cá»§a user | 2025-11-15, 2025-11-14, 2025-12-16 |
| user_id | STRING | user á» dáº¡ng mÃ£ hÃ³auser á» dáº¡ng mÃ£ hÃ³a | 47349484, 48438303, 8183701 |
| step | STRING | screen_service: user xem mÃ n hÃ¬nh dá»ch vá»¥. | screen_service, CTA, MHTTAT, trans_confirmation, Load_KQGD |
| service_name | STRING | mobilebuycard, mobiletopup: dá»ch vá»¥ Airtime. | mobilebuycard, mobiletopupdata, mobiletopup, mobilecombo, folder_tra_sau |
| service | STRING | Topup_new, Topup, Topup_revamp: dá»ch vá»¥ Topup Airtime. | topup, data_topup, Topup_revamp, Topup_new, data_topup_revamp |
| number_event | INTEGER | sá» lÆ°á»£ng traffic/sá» lÆ°á»£ng giao dá»ch (náº¿u á» step = is_payment_by_core_trans)sá» lÆ°á... | 1, 2, 3 |
| airtime_segment_user | STRING | user_segment cá»§a dá»ch vá»¥ Airtime. | retain_user, recover_user, new_user |
| data_segment_user | STRING | user_segment cá»§a dá»ch vá»¥ Data. | retain_user, new_user, recover_user |
| age_group | STRING | age_group lÃ  nhÃ³m tuá»i cá»§a user. | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [4]. 27 - 30 y/o, [5]. 31 - 35 y/o, [6]. 36 ... |

### project-5400504384186300846.BU_UTILITIES_TELCO.FULL_FUNNEL_SIM_CDOVTTI-189
> Báº£ng nÃ y thu tháº­p dá»¯ liá»u vá» hÃ nh vi ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n dá»ch vá»¥ SIM cá»§a VTTI. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» bao gá»m viá»c theo dÃµi cÃ¡c bÆ°á»c thá»±c hiá»n cá»§a ngÆ°á»i dÃ¹ng qua cÃ¡c bÆ°á»c trong kÃªnh bÃ¡n hÃ ng dá»ch vá»¥ SIM, phÃ¢n loáº¡i loáº¡i ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date_partition | DATE | NgÃ y thá»±c hiá»n hÃ nh Äá»ng cá»§a user.NgÃ y thá»±c hiá»n hÃ nh Äá»ng cá»§a user | 2025-12-13, 2025-01-16, 2025-12-15 |
| user_id | STRING | user á» dáº¡ng mÃ£ hÃ³a.user á» dáº¡ng mÃ£ hÃ³a | 60353774, 39737722, 44194092 |
| step | STRING | MÃ´ táº£ cÃ¡c bÆ°á»c tÆ°Æ¡ng tÃ¡c cá»§a user vá»i dá»ch vá»¥ SIM: 
- screen_service: user xem mÃ ... | screen_service, CTA, trans_confirmation, Load_KQGD, MHTTAT |
| cate | STRING | PhÃ¢n loáº¡i SIM:
- simdulich: SIM du lá»ch. | simdienthoai, simdulich |
| number_event | INTEGER | Sá» lÆ°á»£ng traffic hoáº·c sá» lÆ°á»£ng giao dá»ch (náº¿u á» step = 'is_payment_by_core_trans')... | 1, 2, 3 |

## Domain Knowledge (from Mimir)

- sim điện thoại là sim chính chủ
- Khi xử lý dữ liệu theo tháng, sử dụng date_trunc(date_partition, month) để xác định month_active
- khi nhắc tới dịch vụ Airtime hay dịch vụ Data thì sử dụng cột service_name và filter cho đúng các service thuộc từng dịch vụ:
- Airtime thì filter các giá trị: "mobilebuycard", "mobiletopup". KHÔNG SỬ DỤNG giá trị "airtime" vì giá trị này lâu rồi không dùng nữa
- Data thì filter các giá trị: "mobilecombo", "mobiletopupdata"

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
