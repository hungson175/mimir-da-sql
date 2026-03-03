# Domain: [PAYMENT PLATFORM] Electronic Data Capture

## Identity
- **Domain ID:** `fa727a68-0970-4e47-b52b-ed5b5cb7451d`
- **Description:** Bảng fact lưu trữ toàn bộ giao dịch thanh toán qua thiết bị EDC (Electronic Data Capture) tại các merchant.
- Phân tích hiệu suất hoạt động của EDC theo merchant, store, partner_code.
- Tính toán GMV, tỷ lệ giao dịch thành công, lý do lỗi theo từng ngân hàng, loại thẻ.
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.THAI_CDO_EDC_PAYMENT
> Báº£ng fact lÆ°u trá»¯ toÃ n bá» giao dá»ch thanh toÃ¡n qua thiáº¿t bá» EDC (mÃ¡y quáº¹t tháº») táº¡i Äiá»m bÃ¡n láº», bao gá»m cáº£ giao dá»ch gá»c vÃ  hoÃ n tiá»n.
- PhÃ¢n tÃ­ch hiá»u suáº¥t hoáº¡t Äá»ng cá»§a EDC theo merchant, store, partner_code.
- TÃ­nh toÃ¡n GMV, tá»· lá» giao dá...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| note | STRING | KÃªnh phÃ¡t sinh giao dá»ch: 'pay_v2' (giao dá»ch gá»c), 'sdk' (giao dá»ch qua SDK). | sdk, pay_v2 |
| trans_date | DATE | NgÃ y giao dá»ch theo mÃºi giá» VN.NgÃ y giao dá»ch theo mÃºi giá» VN. | 2025-10-19, 2025-11-23, 2025-11-02 |
| trans_datetime | DATETIME | Thá»i Äiá»m giao dá»ch Äáº§y Äá»§ giá»-phÃºt-giÃ¢y. | 2025-10-17 11:51:53, 2025-10-08 08:26:21, 2025-11-19 15:12:42 |
| req_type | STRING | Loáº¡i yÃªu cáº§u API: 'payWithEdc' â thanh toÃ¡n báº±ng EDC. | payWithEdcStatic, payWithEdc |
| pay_type | STRING | Kiá»u giao dá»ch: 'edcDevice' â thanh toÃ¡n tháº» quáº¹t, 'refund' â hoÃ n tiá»n. | edcDevice, refund |
| partner_code | STRING | MÃ£ Äá»i tÃ¡c triá»n khai EDC. | MOMO2TLF20230322, MOMO41BH20240226, MOMOSHYZ20240507 |
| merchant_name | STRING | TÃªn merchant sá» há»¯u thiáº¿t bá» EDC. | EVERY HALF COFFEE ROASTERS, KOHNAN, REVI COFFEE, ADIDAS, BONCHON |
| store_id | STRING | MÃ£ Äá»nh danh cá»­a hÃ ng (store) cá»§a merchant. | VmERDYIRYl4ICqQG, 1011Pos1, 1018Pos2 |
| store_name | STRING | TÃªn cá»­a hÃ ng EDC.TÃªn cá»­a hÃ ng EDC.

**Sample value**: BCNVC |  |
| request_id | STRING | MÃ£ request duy nháº¥t do há» thá»ng phÃ¡t sinh cho má»i giao dá»ch. | MOMOOZW520250903_MOMOOZW520250903_532301489720, MOMO41BH20240226_MOMO41BH2024022... |
| bill_id | STRING | MÃ£ hÃ³a ÄÆ¡n Äá»i tÃ¡c (bill_id) theo policy tag 'Bill Id'. |  |
| core_tran_id | STRING | MÃ£ giao dá»ch cá»t lÃµi dáº¡ng sá» nguyÃªn. | 109044297940, 107877777671, 107884518637 |
| core_tran_id_new | STRING | MÃ£ giao dá»ch má» rá»ng, bao gá»m cáº£ suffix tá»« Äá»i tÃ¡c hoáº·c EDC. | 104269062732-MOMOSHYZ20240507_529001115192, 109046770905-MOMOSHYZ20240507_533301... |
| agent_id | STRING | agent_id Äá»nh danh vÃ­ MoMo (ÄÃ£ áº©n theo policy). |  |
| money_source_id | STRING | ID nguá»n tiá»n: '0'=unidentified, '1'=VÃ­ MoMo, . | 0, 1 |
| money_source | STRING | TÃªn hiá»n thá» cá»§a nguá»n tiá»n. | Unidentified, MoMo Wallet |
| GMV | FLOAT | Tá»ng GiÃ¡ trá» ÄÆ¡n hÃ ng (VNÄ) khÃ´ng bao gá»m giáº£m giÃ¡. | 60000, 55000, 75000 |
| paymnet_status | STRING | Tráº¡ng thÃ¡i cuá»i cá»§a giao dá»ch: 'success'/'failed'. | success |
| result_code | FLOAT | MÃ£ káº¿t quáº£ ná»i bá» tá»« middleware EDC. | 0, 1001 |
| result_description | STRING | MÃ´ táº£ báº±ng tiáº¿ng Viá»t káº¿t quáº£ giao dá»ch. | Thành công, Tài khoản không đủ tiền, Successful. |
| core_result_code | FLOAT | MÃ£ tráº£ vá» tá»« há» thá»ng Core.MÃ£ tráº£ vá» tá»« há» thá»ng Core.

**Sample value**: 0.0 | 0, 1001 |
| core_result_description | STRING | MÃ´ táº£ káº¿t quáº£ theo Core.MÃ´ táº£ káº¿t quáº£ theo Core.

**Sample value**: ThÃ nh cÃ´ng | Thành công, Tài khoản không đủ tiền, Bạn không được hỗ trợ thực hiện thao tác nà... |
| extra_data | STRING | JSON chá»©a chi tiáº¿t mÃ£ tráº£ vá» tá»« Äá»i tÃ¡c EDC (approveCode, batchNumber, invoiceNo, car... | {"edcExtraTrans":{"partnerTransactionId":"20251119085557","serialNumber":"149521... |
| cate | STRING | NhÃ³m ngÃ nh hÃ ng: 'FNB' (food-&-beverage), 'RT' (retail), . | FNB, RETAIL |
| bu_name | STRING | TÃªn business unit liÃªn quan: 'BU_DLS' (Äá»i tÃ¡c nhá»/láº»). | BU_DLS |
| service_code | STRING | MÃ£ service mapping dÃ nh cho EDC. | m4bopceveryhalfcoffee, m4btopbrandopc_12045, m4btopbrandopc_10061 |
| service_id | STRING | ID service mapping (thÆ°á»ng giá»ng partner_code). | MOMO2TLF20230322, MOMO41BH20240226, MOMOSHYZ20240507 |
| partner_tran_id | STRING | MÃ£ giao dá»ch do Äá»i tÃ¡c EDC phÃ¡t sinh. | MOMOOZW520250903_529001040249, MOMOSHYZ20240507_528501306839, MOMOSHYZ20240507_5... |
| partner_trans_result | STRING | MÃ£ káº¿t quáº£ giao dá»ch tá»« phÃ­a Äá»i tÃ¡c (náº¿u cÃ³). |  |
| bank_name | STRING | TÃªn ngÃ¢n hÃ ng phÃ¡t hÃ nh tháº» (náº¿u xÃ¡c Äá»nh ÄÆ°á»£c). | Unknown, Techcombank, Vietcombank, VPBank, VIBank |
| card_type | STRING | Loáº¡i tháº»: VISA, MASTER, NAPAS, . | VISA, MASTER, NAPAS, JCB, Unidentified |
| card_number | STRING | Tháº» full ÄÃ£ áº©n (policy tag 'Card number' â sensitive). |  |
| card_payment_method | STRING | CÃ¡ch nháº­p tháº»: 'CLS' â Contactless. | CLS, C, Unidentified |
| card_payment_method_desc | STRING | MiÃªu táº£ phÆ°Æ¡ng thá»©c thanh toÃ¡n tháº». | Contactless, Chip (Contact), Unidentified |
| first_6_number | STRING | 6 chá»¯ sá» BIN Äáº§u tháº». | 454083, 454081, 483931 |
| last_4_number | STRING | 4 chá»¯ sá» cuá»i tháº».4 chá»¯ sá» cuá»i tháº».

**Sample value**: 3523, 7203, 5013 | 3220, 1650, 7953 |
| payment_card | STRING | Tháº» quá»c gia: 'VN' â tháº» ná»i Äá»a, 'ABROAD' â tháº» quá»c táº¿. | ABROAD, VN |
| data_37 | STRING | Trace number chuáº©n ISO 8583 dÃ¹ng cho Äá»i soÃ¡t. | 000000797487615, 000000789547362, 000000882154418 |
| data_38 | STRING | Authorization identification code â approve code. | 08512098, 00748940, 03099867 |
| data_40 | STRING | Reference number giao dá»ch táº¡i switch EDC. | 529001048266, 529601408150, 532401006805 |
| data_41 | STRING | Flag Äá»i soÃ¡t EDC: 'Y'=ÄÃ£ Äá»i soÃ¡t, 'N'=chÆ°a. | Y, N |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
