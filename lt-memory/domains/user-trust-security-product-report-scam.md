# Domain: User Trust: Security Product - Report Scam 

## Identity
- **Domain ID:** `8676e18c-ed5e-401e-8e78-fc08b26a69ad`
- **Description:** This domain stores app-collected user scam reports—incidents in or outside MoMo—with basic context (scenario, channel), loss signals, review status, ... linked to the reporting MoMo user and, when applicable, related MoMo transactions, to support case handling and power Check-Scam features.
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.SHERLOCK.REPORT_SCAM_USER_REPORT_DATA

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| request_id | STRING | MÃ£ Äá»nh danh cho má»i yÃªu cáº§u bÃ¡o cÃ¡o lá»«a Äáº£o. | fd95511b-2b14-4841-8770-1a07b241e469, 6fbf0414-79ec-4131-9e52-6c4da01b82b6, c95b... |
| msg_type | STRING | Loáº¡i tin nháº¯n liÃªn quan Äáº¿n bÃ¡o cÃ¡o lá»«a Äáº£o. | USER_TRUST_APP_SUBMIT_REPORT |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng MoMo liÃªn quan Äáº¿n bÃ¡o cÃ¡o lá»«a Äáº£o. | 0949093726, 0944047667, 01252659720 |
| agent_id | INTEGER | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 38572968, 82946123, 1658018 |
| report_id | STRING | MÃ£ Äá»nh danh cá»§a bÃ¡o cÃ¡o lá»«a Äáº£o. | REPORT_c6f687f5-562d-4e8d-b52c-52e832798301, REPORT_6e61fe0f-615e-487c-8f5a-895b... |
| scenario_code | STRING | MÃ£ ká»ch báº£n lá»«a Äáº£o. | S01, S10, S02 |
| victim_type | STRING | Loáº¡i náº¡n nhÃ¢n trong bÃ¡o cÃ¡o lá»«a Äáº£o. | 1, 7, 3, 2, 5 |
| loss_amount | INTEGER | Sá» tiá»n bá» máº¥t trong vá»¥ lá»«a Äáº£o. | 0, 500000, 15000 |
| narrative_text | STRING | VÄn báº£n mÃ´ táº£ chi tiáº¿t vá» vá»¥ lá»«a Äáº£o. | QC test, Lừa cọc du lịch, Lừa đảo mua hàng
 |
| image_url | STRING | URL cá»§a cÃ¡c hÃ¬nh áº£nh minh chá»©ng cho bÃ¡o cÃ¡o lá»«a Äáº£o. | https://attachment.momocdn.net/social/64134398_1763358341_3dabce5552e04363a70997... |
| cs_support | INTEGER | MÃ£ Äá»nh danh cá»§a nhÃ¢n viÃªn há» trá»£ khÃ¡ch hÃ ng liÃªn quan Äáº¿n bÃ¡o cÃ¡o. | 1, 0 |
| reason | STRING | LÃ½ do cá»§a bÃ¡o cÃ¡o lá»«a Äáº£o. |  |
| update_by | STRING | NgÆ°á»i dÃ¹ng cáº­p nháº­t thÃ´ng tin bÃ¡o cÃ¡o lá»«a Äáº£o. |  |
| status | STRING | Tráº¡ng thÃ¡i cá»§a bÃ¡o cÃ¡o lá»«a Äáº£o. | process |
| create_time | INTEGER | Thá»i gian táº¡o bÃ¡o cÃ¡o lá»«a Äáº£o. | 1764442241579, 1763215584852, 1763208772571 |
| update_time | INTEGER | Thá»i gian cáº­p nháº­t bÃ¡o cÃ¡o lá»«a Äáº£o. | 0 |
| identifier_info | RECORD | ThÃ´ng tin Äá»nh danh liÃªn quan Äáº¿n giao dá»ch lá»«a Äáº£o. |  |
| identifier_detail | RECORD | Chi tiáº¿t Äá»nh danh liÃªn quan Äáº¿n kÃªnh giao dá»ch lá»«a Äáº£o. |  |
| app_ver | INTEGER | PhiÃªn báº£n á»©ng dá»¥ng MoMo cá»§a ngÆ°á»i dÃ¹ng bÃ¡o cÃ¡o. | 50003, 42271, 50103 |
| device_os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng bÃ¡o cÃ¡o sá»­ dá»¥ng. | ios, android |
| device_name | STRING | TÃªn thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng bÃ¡o cÃ¡o sá»­ dá»¥ng. |  |
| source | STRING | Nguá»n thÃ´ng tin liÃªn quan Äáº¿n vá»¥ lá»«a Äáº£o. | Người dùng Momo, enduser |
| scenario_name | STRING | TÃªn ká»ch báº£n lá»«a Äáº£o. | , tôi mua cây qua bài đăng trên fb và nó kêu tôi cọc cả tiền cây và ship, tôi ch... |
| accounts | RECORD | ThÃ´ng tin tÃ i khoáº£n liÃªn quan Äáº¿n bÃ¡o cÃ¡o lá»«a Äáº£o. |  |
| lang | STRING | NgÃ´n ngá»¯ ÄÆ°á»£c sá»­ dá»¥ng trong bÃ¡o cÃ¡o lá»«a Äáº£o. | vi, en |
| ticket_id | STRING | MÃ£ Äá»nh danh cá»§a ticket xá»­ lÃ½ bÃ¡o cÃ¡o lá»«a Äáº£o. | , 251119.0005079, 251127.0007297 |
| user_name | STRING | TÃªn ngÆ°á»i dÃ¹ng MoMo liÃªn quan Äáº¿n bÃ¡o cÃ¡o lá»«a Äáº£o. | Nguyễn Hà My, Lại Đào Hiếu Thảo, Nguyễn Văn Sang |
| path_CRM | STRING | ÄÆ°á»ng dáº«n CRM liÃªn quan Äáº¿n bÃ¡o cÃ¡o lá»«a Äáº£o. | crm_app/2025/11/25/01697565642_1764069813367.jpg, crm_app/2025/11/14/0979975240_... |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Status: **Not yet probed**
