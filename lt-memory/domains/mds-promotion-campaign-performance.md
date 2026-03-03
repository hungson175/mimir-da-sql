# Domain: BU MDS: Promotion - Campaign Performance

## Identity
- **Domain ID:** `e9363d1c-6486-4072-8dc5-8d06260e9c7f`
- **Description:** Ghi nhận các tương tác của user với promotion campaign và gift (impression, click). Data được aggregate theo ngày, touchpoint của Promotion, campaign_id và gift_type_id
- **Tables:** 0
- **Metadata fetched:** 2026-02-03

## Domain Knowledge (from Mimir)

- Bounce user được định nghĩa là người dùng đã thấy voucher nhưng không thực hiện bất kỳ tương tác nào
- Khi phân tích theo một cấp độ touchpoint_level cụ thể (ví dụ: touchpoint_level = 2), cần bao gồm các cột touchpoint_level trước đó (ví dụ: touchpoint_level_1) trong truy vấn.

## Suggested Probe Questions

- Status: **Not yet probed**
