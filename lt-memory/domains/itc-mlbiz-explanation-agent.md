# Domain: ITC MLBIZ: Explanation Agent

## Identity
- **Domain ID:** `7e533485-3f9d-45d1-b97c-82eb59aa3d01`
- **Description:** 
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD
> Báº£ng momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i VÃ­ Tráº£ Sau (VTS) liÃªn quan Äáº¿n cÃ¡c merchant trong má»t khoáº£ng thá»i gian cá»¥ thá». Báº£ng nÃ y cung cáº¥p dá»¯ liá»u Äá» phÃ¢n tÃ­ch vÃ  theo dÃµi cÃ¡c khuyáº¿n...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| merchant_code | STRING | MÃ£ Äá»nh danh duy nháº¥t cho má»i merchant. | MOMOLMJL20250520, MOMOSRYL20230522, MOMOD9JS20250301 |
| merchant_type | STRING | Loáº¡i hÃ¬nh cá»§a merchant. | BPU, P2M, PRE_MERCHANT, AGENT_NETWORK, TOP_BRAND |
| onboarding_actor | STRING | NgÆ°á»i thá»±c hiá»n onboard cho merchant. | SELF, SALE, COLLABORATOR, ADMIN, PARTNER |
| onboard_date | DATETIME | NgÃ y merchant ÄÆ°á»£c onboard. | 2022-10-18 11:06:08, 2022-04-22 11:03:01, 2022-04-22 11:03:00 |
| adhoc_offer_date | STRING | NgÃ y diá»n ra chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i ad-hoc. | 250712, 250813, 251117 |
| daily_offer_date | STRING | NgÃ y diá»n ra chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i hÃ ng ngÃ y. | 251228, 251117, 251119 |
| offer_source | STRING | Nguá»n gá»c cá»§a chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i. | no offer, daily offer, adhoc offer, adhoc + daily |
| soundbox_install_date | DATE | NgÃ y láº¯p Äáº·t Soundbox cho merchant. | 2025-11-15, 2025-12-26, 2025-12-31 |
| is_blacklisted | STRING | Tráº¡ng thÃ¡i merchant cÃ³ trong danh sÃ¡ch Äen hay khÃ´ng. | no, yes |
| in_dls_block | INTEGER | Khá»i gá»m nhá»¯ng merchant trong há» thá»ng DLS. | 0, 1 |
| in_online_offline_block | INTEGER | Khá»i gá»m nhá»¯ng merchant há» trá»£ giao dá»ch online vÃ  offline. | 0, 1 |
| in_fs_block | INTEGER | Khá»i gá»m cÃ¡c merchant cÃ³ trong há» thá»ng FS. | 0, 1 |
| in_v2_block | INTEGER | Khá»i gá»m nhá»¯ng merchant há» trá»£ báº£n V2. | 0, 1 |
| in_sme_bpu_block | INTEGER | Khá»i SME/BPU mÃ  merchant Äang thuá»c vá». | 0, 1 |
| in_soundbox_risk | INTEGER | Merchant thuá»c diá»n rá»§i ro khi sá»­ dá»¥ng Soundbox. | 0, 1 |
| in_rm_quasi_list | INTEGER | Merchant náº±m trong danh sÃ¡ch RM quasi. | 0, 1 |
| paylater_active | BOOLEAN | Tráº¡ng thÃ¡i hoáº¡t Äá»ng cá»§a dá»ch vá»¥ VÃ­ Tráº£ Sau (true: Äang hoáº¡t Äá»ng, false: khÃ... | true, false |
| ccm_active | BOOLEAN | Tráº¡ng thÃ¡i hoáº¡t Äá»ng cá»§a dá»ch vá»¥ CCM (true: Äang hoáº¡t Äá»ng, false: khÃ´ng hoáº¡t... | false, true |
| last_updated | TIMESTAMP | Thá»i Äiá»m láº§n cuá»i cÃ¹ng báº£ng dá»¯ liá»u ÄÆ°á»£c cáº­p nháº­t. | 2025-06-13 10:28:48+00, 2025-06-13 10:25:33+00, 2025-06-13 10:32:59+00 |

## Domain Knowledge (from Mimir)

- Merchant MOMOJVUP20251209: BPU merchant, tự onboard và cài đặt soundbox ngày 2025-12-09, không bị blacklist nhưng không được offer VTS vì chưa đạt đủ điểm score theo quy định giai đoạn sau 8.9.2025
- Merchant MOMOJVUP20251209: BPU merchant, tự onboard và cài đặt soundbox ngày 2025-12-09, không bị blacklist nhưng không được offer VTS vì chưa đạt đủ điểm score theo quy định giai đoạn sau 8.9.2025

## Suggested Probe Questions

- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
