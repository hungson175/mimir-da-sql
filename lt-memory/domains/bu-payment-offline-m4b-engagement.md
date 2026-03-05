# BU Payment: OFFLINE M4B ENGAGEMENT

**Domain ID:** `68f8f83f-cd21-4efc-9743-5c238b325818`

## Description
A DATASET containing processed information about offline payment

## Tables

### `momovn-prod.MBI_DA.kmean-feature-20251012-firstsaved`
> Bảng này lưu trữ dữ liệu liên quan đến các đặc tính của cụm (cluster) được xác định bằng phương pháp phân cụm k-means. Mục đích của bảng này bao gồm: 
- Phân tích các đặc tính quan trọng của mỗi cụm người dùng dựa trên các đặc trưng đã lưu lần đầu.
- Đánh giá độ tuổi và tính lưu giữ của từng đặc trưng qua các tháng.
- Phân tích độ lưu giữ sản phẩm để hiểu rõ hơn về hành vi khách hàng trong từng cụm.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `feature` | STRING | Tên của đặc trưng hoặc tính năng đang được phân tích. | [Celebration]. Bấm nút X để đóng popup Celebration, [GoldenPocket]. Bấm nút "Khám phá" block sinh lời, [Top Navigator]. Bấm CTA Tạo lời nhắc đ.kỳ |
| `feature_age_in_month` | INTEGER | Độ tuổi của đặc trưng tính theo tháng. | 11, 2, 3 |
| `users` | FLOAT | Số lượng người dùng liên quan đến đặc trưng này. | 265, 2540, 805218 |
| `feature_reten` | FLOAT | Tỷ lệ giữ chân của đặc trưng. | 0, 0.0077529742013099853, 0.11328412597635529 |
| `product_reten` | FLOAT | Tỷ lệ giữ chân của sản phẩm. | 0.59793814432989689, 0.33677832951007475, 0.86497813103801269 |
| `Cluster` | INTEGER | Mã định danh cho cụm được xác định bởi k-means. | 1, 3, 5 |
| `Cluster_name` | STRING | Tên của cụm đã được đặt theo đặc điểm chung các đối tượng trong cụm. | Cluster 1 High Feature Volume, Weak Engagement, Cluster 3 Bloated Features With Low Stickiness, Cluster 5 Strong Supporting Features |
