# Domain: BU Payment: OFFLINE M4B ENGAGEMENT

## Identity
- **Domain ID:** `68f8f83f-cd21-4efc-9743-5c238b325818`
- **Description:** A DATASET containing processed information about offline payment
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.kmean-feature-20251012-firstsaved
> Báº£ng nÃ y lÆ°u trá»¯ dá»¯ liá»u liÃªn quan Äáº¿n cÃ¡c Äáº·c tÃ­nh cá»§a cá»¥m (cluster) ÄÆ°á»£c xÃ¡c Äá»nh báº±ng phÆ°Æ¡ng phÃ¡p phÃ¢n cá»¥m k-means. Má»¥c ÄÃ­ch cá»§a báº£ng nÃ y bao gá»m: 
- PhÃ¢n tÃ­ch cÃ¡c Äáº·c tÃ­nh quan trá»ng cá»§a má»i cá»¥m ngÆ°á»i dÃ¹ng dá»±a trÃªn cÃ¡c Äáº...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| feature | STRING | TÃªn cá»§a Äáº·c trÆ°ng hoáº·c tÃ­nh nÄng Äang ÄÆ°á»£c phÃ¢n tÃ­ch. | [Celebration]. Bấm nút X để đóng popup Celebration, [GoldenPocket]. Bấm nút "Khá... |
| feature_age_in_month | INTEGER | Äá» tuá»i cá»§a Äáº·c trÆ°ng tÃ­nh theo thÃ¡ng. | 11, 2, 3, 4, 8 |
| users | FLOAT | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n Äáº·c trÆ°ng nÃ y. | 265, 2540, 805218 |
| feature_reten | FLOAT | Tá»· lá» giá»¯ chÃ¢n cá»§a Äáº·c trÆ°ng. | 0, 0.0077529742013099853, 0.11328412597635529 |
| product_reten | FLOAT | Tá»· lá» giá»¯ chÃ¢n cá»§a sáº£n pháº©m. | 0.59793814432989689, 0.33677832951007475, 0.86497813103801269 |
| Cluster | INTEGER | MÃ£ Äá»nh danh cho cá»¥m ÄÆ°á»£c xÃ¡c Äá»nh bá»i k-means. | 1, 3, 5, 2 |
| Cluster_name | STRING | TÃªn cá»§a cá»¥m ÄÃ£ ÄÆ°á»£c Äáº·t theo Äáº·c Äiá»m chung cÃ¡c Äá»i tÆ°á»£ng trong cá»¥m. | Cluster 1 High Feature Volume, Weak Engagement, Cluster 3 Bloated Features With ... |

## Suggested Probe Questions

- Numeric aggregation possible (has numeric columns)
- Status: **Not yet probed**
