# Domain: BU FS: Chứng khoán CV

## Identity
- **Domain ID:** `ef8cc111-d13a-4b0b-a1fd-8cccb065fc74`
- **Description:** Hỏi về thông tin đăng ký tài khoản, giao dịch chứng khoán và traffic user.
- **Tables:** 2
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-cvs.BU_CVS.MIMIR_CVS_TRANSACTION
> Báº£ng data chá»©a toÃ n bá» giao dá»ch ngÆ°á»i dÃ¹ng sáº£n pháº©m Chá»©ng khoÃ¡n CV (cÅ©ng hay gá»i táº¯t lÃ  CVS). Báº£ng nÃ y cÃ³ thá» dÃ¹ng Äá»c láº­p Äá» tra cá»©u giao dá»ch trading cá»§a user. NgoÃ i ra cÅ©ng cÃ³ thá» mapping báº±ng cá»t AGENT_ID vá»i báº£ng KHÃC Äá» tÃ¬m ra h...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TRANS_CATE | STRING | Loáº¡i giao dá»ch record: "MONEY" lÃ  giao dá»ch náº¡p/rÃºt tiá»n, "STOCK" lÃ  lá»nh Äáº·t mua/... | STOCK, MONEY |
| AGENT_ID | STRING | MÃ£ Äá»nh danh cá»§a khÃ¡ch hÃ ng trÃªn á»©ng dá»¥ng MoMo, ÄÃ¢y khÃ³a chÃ­nh dÃ¹ng Äá» mapping ... | 10423891, 40032050, 49299661 |
| ACCO_NAME | STRING | Loáº¡i tÃ i khoáº£n chá»©ng khoÃ¡n user thao tÃ¡c náº¡p/rÃºt tiá»n, Äáº·t lá»nh mua/bÃ¡n chá»©ng ... | CASH, MARGIN |
| TRADE_MONTH | DATE | ThÃ¡ng giao dá»ch. | 2024-08-01, 2025-07-01, 2024-07-01 |
| TRADE_DATE | DATE | NgÃ y giao dá»ch. | 2024-08-01, 2024-08-12, 2024-08-05 |
| CREATE_TIME | DATETIME | Äá»i vá»i giao dá»ch "MONEY" lÃ  thá»i gian user thá»±c hiá»n giao dá»ch, giao dá»ch "STOCK"... | 2025-06-30 16:00:33, 2024-10-04 16:00:20, 2024-10-04 16:00:06 |
| CONFIRM_TIME | DATETIME | Thá»i gian lá»nh ÄÆ°á»£c xÃ¡c nháº­n. | 2025-08-07 09:00:00, 2025-07-28 09:00:01, 2025-06-23 09:00:01 |
| TRANS_ID | STRING | MÃ£ giao dá»ch/Äáº·t lá»nh, thÆ°á»ng dÃ¹ng Äá» Äáº¿m sá» lÆ°á»£ng giao dá»ch/Äáº·t lá»nhM... | TRADING_, CASH_IN_, 2024110820003571 |
| STATUS_NAME | STRING | Tráº¡ng thÃ¡i giao dá»ch: "MONEY" vá»i "ÄÃ£ duyá»t" lÃ  thÃ nh cÃ´ng, cÃ¡c status khÃ¡c khÃ´ng t... | Đã duyệt, Khớp hết, Unknown, Khớp 1 phần |
| TRANS_TYPE | STRING | Loáº¡i giao dá»ch: "MONEY" vá»i "CASH_IN" lÃ  náº¡p tiá»n, "CASH_OUT" lÃ  rÃºt tiá»n; "STOCK" vá... | BUY, SELL, TRADING, CASH_OUT, CASH_IN |
| MONEY_SOURCE_RECEIPT | STRING | Nguá»n hoáº·c ÄÃ­ch cá»§a tiá»n trong giao dá»ch "MONEY" dá»±a trÃªn TRANS_TYPEChá» cÃ³ giÃ¡ tr... | TTT, MOMO, BANK LINKED, VIRTUAL ACCOUNT |
| AMOUNT | FLOAT | GiÃ¡ trá» náº¡p/rÃºt tiá»n hoáº·c giÃ¡ trá» khá»p lá»nh giao dá»ch mua/bÃ¡n chá»©ng khoÃ¡nGiÃ¡... | 0, 10000, 1000 |
| MAT_QTY | FLOAT | Sá» lÆ°á»£ng cá» phiáº¿u khá»p lá»nh (mua/bÃ¡n)Sá» lÆ°á»£ng cá» phiáº¿u khá»p lá»nh (mua/ bÃ... | 0, 1, 100 |
| ORD_QTY | FLOAT | Sá» lÆ°á»£ng cá» phiáº¿u Äáº·t lá»nh ban Äáº§uSá» lÆ°á»£ng cá» phiáº¿u Äáº·t lá»nh ban Äáº... | 1, 100, 10 |
| ORD_PRICE | FLOAT | GiÃ¡ Äáº·t lÃºc mua cá» phiáº¿uGiÃ¡ Äáº·t lÃºc mua cá» phiáº¿u | 13, 12, 25 |
| FEE_AMT | FLOAT | PhÃ­ giao dá»ch mua/bÃ¡n chá»©ng khoÃ¡nPhÃ­ giao dá»ch mua/ bÃ¡n chá»©ng khoÃ¡n | 0, 24, 11 |
| STOCK_CD | STRING | MÃ£ cá» phiáº¿uMÃ£ cá» phiáº¿u | HPG, VIX, MBB, FPT, TPB |
| TRADE_LOT_TYPE | STRING | Giao dá»ch "LÃ´ cháºµn" cháºµn hay "LÃ´ láº»"Giao dá»ch "LÃ´ cháºµn" cháºµn hay "LÃ´ láº»" | Lô lẻ, Lô chẵn |
| MAU | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n giao dá»ch náº¡p/rÃºt tiá»n (thÃ nh cÃ´ng) theo hÃ n... | 5 Retain in day, 4 Retain in month, 1 New, 2 Retain, 3 Reactive |
| MTU | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng cÃ³ thá»±c hiá»n giao dá»ch Äáº·t vÃ  khá»p lá»nh mua/bÃ¡n chá»©ng ... | 5 Retain in day, 4 Retain in month, 2 Retain, 1 New, 3 Reactive |

### momovn-cvs.BU_CVS.MIMIR_CVS_EVENT_DATA
> Báº£ng data chá»©a event (lÃ  hÃ nh vi ngÆ°á»i dÃ¹ng trÃªn app chá»©ng khoÃ¡n). Má»i láº§n hiá»n screen hay user click gÃ¬ ÄÃ³ sáº½ record má»t dÃ²ng theo thá»i gian. Báº£ng nÃ y dÃ¹ng cho viá»c user há»i vá» "truy cáº­p CVS", "traffic CVS"... Má»i láº§n váº­y thÃ¬ chá» cáº§n count_distin...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| EVENT_DATE | DATE | NgÃ y xáº£y ra EVENTNgÃ y xáº£y ra EVENT | 2025-07-18, 2025-07-17, 2025-07-22 |
| EVENT_TIME | DATETIME | Thá»i gian xáº£y ra EVENT, lÃ  DATETIME ÄÃ£ theo GMT+7Thá»i gian xáº£y ra EVENT, lÃ  DATETIME ÄÃ... | 2025-06-26 10:16:49.192, 2025-08-05 15:17:50.025, 2025-06-17 23:36:12.266 |
| AGENT_ID | STRING | MÃ£ Äá»nh danh UNIQUE cá»§a user. | 71554809, 59744200, 20485330 |
| SESSION_ID | STRING | Äá»nh danh momo app session id. | 241B19DB-D714-46FF-AFFA-7E3325A20333, 5a79baf1-f4d0-4e14-b39b-cf91407b985a, 2da7... |
| TRAIL_ID | STRING | Äá»nh danh 1 mini app session tá»« entry point Äáº¿n exit point. | Tbh0NjE3X8L8Hyh05WC7P, fCeTimOUXeNoWxQpQvh5Z, wmsezOv3zhL4puXXbBr5C |
| EVENT_ID | STRING | Äá»nh danh cá»§a má»i event phÃ¡t sinh theo user táº¡i má»t thá»i Äiá»m. | doS50Oemf8V2iRXY-JzUQ, HTPwDWw6vt2dL1nCl8c6f, WOxauY3zbPsiF5vegw1Tk |
| OBJECT | STRING | Äá»i tÆ°á»£ng event Äang record: 'SCREEN' cho mÃ n hÃ¬nh, 'COMPONENT' cho Ã´ hiá»n thá» trÃªn m... | SCREEN |
| ACTION | STRING | HÃ nh Äá»ng vá»i OBJECT: 'VIEW' lÃ  xem SCREEN/COMPONENT, 'CLICK' lÃ  nháº¥n vÃ o Äá»i tÆ°á»£ng... | VIEW |
| SCREEN_NAME | STRING | TÃªn mÃ n hÃ¬nh Äang load. | stock_detail, stock_home, stock_center, stock_port_management, market_prediction... |
| OBJECT_NAME | STRING | Náº¿u OBJECT khÃ´ng pháº£i lÃ  'SCREEN', thá» hiá»n tÃªn OBJECT tÆ°Æ¡ng á»©ng (vÃ­ dá»¥ COMPONENT)... |  |
| STOCK_NAME | STRING | Náº¿u SCREEN_NAME lÃ  'stock_detail', giÃ¡ trá» lÃ  3 chá»¯ cÃ¡i Äáº¡i diá»n cho cá» phiáº¿u. | VIX, HPG, VIC, FPT, MBB |
| SCREEN_SOURCE | STRING | MÃ n hÃ¬nh mÃ  user ÄÃ£ Äi tá»« ÄÃ³ Äáº¿n mÃ n hÃ¬nh hiá»n táº¡i. | stock_market, , stock_home, stock_portfolio, stock_center |

## Domain Knowledge (from Mimir)

- Màn hình Home có screen_name = 'stock_home'
- Xem stock_detail có nghĩa là VIEW SCREEN với screen_name = 'stock_detail'

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
