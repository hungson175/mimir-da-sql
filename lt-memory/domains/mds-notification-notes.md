# MDS Notification — Domain Notes

## Domain IDs
| Domain | ID | Use |
|--------|----|-----|
| Notification for BU | `bcae6a77-3995-49e5-85ca-36b1ed664c13` | Volume + engagement metrics ✅ WORKING |
| Notification for Platform | `750780b7-b20f-46b6-ab05-2a4241b591c6` | ⚠️ schema load TIMEOUT (2026-03-04) |

**Use BU domain (bcae6a77) for all notification questions — Platform domain consistently times out.**

## BQ Table
`momovn-mds-dc.dwh.daily_notification_metrics`
- Project: `momovn-mds-dc` (different from momovn-prod!)
- BQ access: UNVERIFIED (quota blocked) but Mimir can query it

## Key Columns
| Column | Description |
|--------|-------------|
| `event_date` | DATE — use BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD' |
| `noti_source` | TEMPLATE \| CAMPAIGN \| JOURNEY \| PROMOTION_FLOW |
| `touchpoint` | outapp_message \| push (= out-app) vs others (= in-app) |
| `BE_sent` | Backend sent count (total sends) |
| `BE_delivery_outapp` | Out-app deliveries (denominator for out-app CTR) |
| `FB2_click_read` | Click/read count |
| `FB2_impression` | In-app impressions (denominator for in-app CTR) |

## Standard Queries

### Total send volume by source type
```sql
SELECT noti_source, SUM(BE_sent) AS total_sent
FROM `momovn-mds-dc.dwh.daily_notification_metrics`
WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
GROUP BY noti_source ORDER BY total_sent DESC
```

### CTR (out-app and in-app)
```sql
SELECT
  SUM(CASE WHEN touchpoint IN ('outapp_message','push') THEN FB2_click_read ELSE 0 END) AS outapp_clicks,
  SUM(BE_delivery_outapp) AS outapp_delivery,
  SUM(CASE WHEN touchpoint NOT IN ('outapp_message','push') THEN FB2_click_read ELSE 0 END) AS inapp_clicks,
  SUM(CASE WHEN touchpoint NOT IN ('outapp_message','push') THEN FB2_impression ELSE 0 END) AS inapp_impressions
FROM `momovn-mds-dc.dwh.daily_notification_metrics`
WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
```

## Jan 2026 Numbers (Mimir, UNVERIFIED — BQ quota)

### Volume
| Source | Count | Share |
|--------|-------|-------|
| TEMPLATE | 777,044,024 | 64.6% |
| CAMPAIGN | 308,936,288 | 25.7% |
| JOURNEY | 100,489,946 | 8.4% |
| PROMOTION_FLOW | 16,083,866 | 1.3% |
| **TOTAL** | **1,202,554,124** | 100% |

### Engagement
| Metric | Value | Raw numbers |
|--------|-------|-------------|
| Out-app CTR | **2.66%** | 10.3M clicks / 387.6M deliveries |
| In-app CTR | **7.38%** | 43.7M clicks / 591.6M impressions |
| Open rate | N/A | iOS policy blocks out-app impression tracking |

**Note:** No "open rate" for push notifications — iOS prevents impression tracking. CTR = clicks / deliveries (out-app) or clicks / impressions (in-app).

## Distill History
| Date | Q | Verdict |
|------|---|---------|
| 2026-03-04 | Send volume Jan 2026 by type | MIMIR-ONLY (BQ quota) |
| 2026-03-04 | CTR Jan 2026 (out-app + in-app) | MIMIR-ONLY (BQ quota) |

## Campaign CTR Breakdown (Jan 2026)

| Metric | CAMPAIGN source | Overall (all sources) |
|--------|----------------|----------------------|
| Out-app CTR | **1.00%** | 2.66% |
| Deliveries | 106.8M | 387.6M |
| Clicks | 1.07M | 10.3M |

**Key insight:** Campaign out-app CTR (1.00%) is 2.66× lower than overall (2.66%). Templates + Journey drive the bulk of engagement.

### Top 3 Campaigns by Click Volume (Jan 2026)
| Rank | Campaign Name | Clicks |
|------|--------------|--------|
| 1 | 20260112_sme_soundbox_NT_mass_information (15-day trial) | 71,656 |
| 2 | 260113_NT_GMC_PROJECT_R_VOUCHER_NONA30_6CRM | 70,384 |
| 3 | 20260127_LX26_USER_REG_DKS_NOT_CHECK_CIC | 67,954 |

Column: `campaign_name` in `daily_notification_metrics` — filterable by `noti_source = 'CAMPAIGN'`
