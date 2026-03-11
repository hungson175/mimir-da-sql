# Financial Hub — DA Knowledge (Mimir Corrections)

**Source:** `lt-memory/domains/bu-fs-financial-hub.md` → `## Memory`
**Entries:** 4
**Domain ID:** `c80e0c61-0d52-4fd6-a2e5-9d2892da7955`

---

1. TTTC là viết tắt của Trung Tâm Tài Chính _2025-10-14_
2. Financial Hub = FS gateway/navigation hub in MoMo, NOT a transactional product itself. Think "FS tab." _2026-03-06_
3. Jan 2026 baselines: TTTC = 5.6M users, 5 sessions/user/mo. QLTK = 1.2M users, 4.3 sessions/user. 83% enter from tabbar_home. _2026-03-06_
4. Correct user count: COUNT(DISTINCT USER) from FINHUB_TTTC_QLTK_TRAFFIC WHERE MONTH='YYYY-MM-01' → 5,967,883 Jan 2026. NEVER use SUM(NO_USER_SCREEN). _2026-03-06_
