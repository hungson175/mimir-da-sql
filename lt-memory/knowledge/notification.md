# Knowledge: MDS Notification
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04
> Source: migrated from domains/mds-notification-notes.md

## Domain IDs
| Domain | ID | Status |
|--------|----|--------|
| Notification for BU | `bcae6a77-3995-49e5-85ca-36b1ed664c13` | WORKING |
| Notification for Platform | `750780b7-b20f-46b6-ab05-2a4241b591c6` | TIMEOUT |

**Use BU domain for all notification questions — Platform domain consistently times out.**

## BQ Table
`momovn-mds-dc.dwh.daily_notification_metrics`
- Project: `momovn-mds-dc` (different from momovn-prod!)
- BQ access: UNVERIFIED

## Key Columns
| Column | Description |
|--------|-------------|
| `event_date` | DATE |
| `noti_source` | TEMPLATE \| CAMPAIGN \| JOURNEY \| PROMOTION_FLOW |
| `touchpoint` | outapp_message \| push (= out-app) vs others (= in-app) |
| `BE_sent` | Backend sent count |
| `BE_delivery_outapp` | Out-app deliveries (denominator for out-app CTR) |
| `FB2_click_read` | Click/read count |
| `FB2_impression` | In-app impressions |

## Jan 2026 Baselines (Mimir, UNVERIFIED)
- Total sends: 1.2B (TEMPLATE 65%, CAMPAIGN 26%, JOURNEY 8%, PROMO 1%)
- Out-app CTR: 2.66% (10.3M / 387.6M)
- In-app CTR: 7.38% (43.7M / 591.6M)
- Campaign out-app CTR: 1.00% (2.66× lower than overall)
- No "open rate" for push — iOS prevents impression tracking

## Jan 2026 In-App CTR by Source (Mimir, 2026-03-06)
| noti_source | In-app CTR | Rank |
|-------------|-----------|------|
| JOURNEY | 7.85% | 1st |
| TEMPLATE | 7.00% | 2nd |
| CAMPAIGN | 5.20% | 3rd |

- Out-app CTR = null for ALL sources (FB2_click_read only tracks in-app; outapp push clicks not in this table)
- Journey CTR 1.51× Campaign CTR
- Mimir SQL logic matched our expected query exactly

## Insight
Templates + Journey drive engagement. Campaign CTR underperforms Journey by 1.51×.
Out-app CTR unmeasurable from daily_notification_metrics — FB2 columns are in-app only.
