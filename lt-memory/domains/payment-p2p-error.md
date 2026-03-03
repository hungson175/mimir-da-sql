# Domain: BU Payment: P2P ERROR

## Identity
- **Domain ID:** `9e15b462-aa3d-4bdc-80ff-dc86a6f83837`
- **Description:** Dữ liệu về các event lỗi và giao dịch lỗi của người dùng dịch vụ chuyển tiền P2P
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.P2P_ERROR_ALL
> Dá»¯ liá»u vá» cÃ¡c event lá»i vÃ  giao dá»ch lá»i cá»§a ngÆ°á»i dÃ¹ng dá»ch vá»¥ chuyá»n tiá»n P2P. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c dÃ¹ng Äá»:
- Theo dÃµi vÃ  phÃ¢n tÃ­ch cÃ¡c lá»i xáº£y ra trong quÃ¡ trÃ¬nh ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»ch P2P.
- Cáº£i thiá»n tr...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng xáº£y ra event lá»i hoáº·c giao dá»ch lá»i. | 2025-05-01, 2025-04-01, 2025-06-01 |
| date | DATE | NgÃ y xáº£y ra event lá»i hoáº·c giao dá»ch lá»i. | 2025-09-10, 2025-06-03, 2025-06-08 |
| datetime | DATETIME | Thá»i gian cá»¥ thá» xáº£y ra event lá»i hoáº·c giao dá»ch lá»i. | 2025-11-10 17:33:08, 2025-04-05 02:44:33, 2025-11-10 17:41:30 |
| screen | STRING | MÃ n hÃ¬nh mÃ  lá»i xáº£y ra, bao gá»m INPUT (mÃ n hÃ¬nh nháº­p sá» tiá»n vÃ  lá»i nháº¯n), TTA... | TTAT, INPUT, KQGD |
| service | STRING | Loáº¡i dá»ch vá»¥ gáº·p lá»i, W2W lÃ  dá»ch vá»¥ chuyá»n tiá»n vÃ­ (wallet) tá»i vÃ­, W2B lÃ  ... | W2B, W2W |
| src | STRING | Nguá»n dá»¯ liá»u phÃ¡t hiá»n lá»i, cÃ³ thá» tá»« API, event Popup, hoáº·c tá»« cÃ¡c giao dá»c... | API, POPUP, CORE |
| error_code | STRING | MÃ£ lá»i.mÃ£ lá»i | 881200003, 40000, -9999 |
| error_description | STRING | Chi tiáº¿t mÃ´ táº£ cá»§a lá»i. | , Bạn hãy thử lại hoặc quét mã QR để tiếp tục giao dịch nhé, Ngân hàng thụ hưởng... |
| agent_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng (user id). | 83676480, 95573092, 95517812 |
| event_id | STRING | MÃ£ giao dá»ch hoáº·c sá»± kiá»n cá»§a lá»i.mÃ£ giao dá»ch hoáº·c event cá»§a lá»i | ILqYLNwQZhNrRWrILZF-W, zi_eQHKxoMdoos0XcGnR1, rRASU_r6-CZ_1_fxQjbxl |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Time-series query possible (has date column)
- Status: **Not yet probed**
