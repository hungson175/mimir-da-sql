# FI Solutions (CLO) — DA Knowledge (Mimir Corrections)

**Source:** `lt-memory/domains/bu-fs-fi-solutions.md` → `## Memory`
**Entries:** 9
**Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`

---

1. Số giải ngân (disbursed amount) được tính bằng cột CONTRACT_AMOUNT trong bảng momovn-prod.BU_FI.FIS_TCST. _BU-FS: FI Solutions · 2025-08-13_
2. Khi người dùng hỏi về 'home', 'FE', 'CRO', hoặc 'VIB', hãy sử dụng PARTNER_ID tương ứng: 'home' -> 'lending_mp_homecredit', 'FE' -> 'clo_fecredit', 'CRO' -> 'cro_vib', 'VIB' -> 'cro_vib' _FS - FI Solutions · 2025-08-13_
3. Khi xử lý vấn đề liên quan tới việc loại trừ user_id, sử dụng điều kiện 'where not exists' thay vì 'user_id NOT IN' _2025-09-24_
4. Khi so sánh lượng application submitted, cần sử dụng status_code bao gồm: 'APPLICATION_CANCELED', 'APPLICATION_REJECTED', 'APPLICATION_APPROVED', 'APPLICATION_RESUBMIT', 'APPLICATION_SUBMITTED', 'DISBURSED', 'CONTRACT_SIGNED', 'RESET' _2025-08-20_
5. New user = Người dùng mới phát sinh giao dịch lần đầu. Retention user = Người dùng đã từng dùng dịch vụ trước đó và tiếp tục dùng trong tháng này. Reactive user = Người dùng từng dùng trước đây, rớt trong các tháng gần đây, nay quay lại dùng. Churn user = Người dùng ngưng sử dụng trong tháng. _2025-10-13_
6. Để tính tổng số tiền giải ngân cho dịch vụ CLO, sử dụng CONTRACT_AMOUNT thay vì DISBURSED_CREDIT_AMOUNT _FS - FI Solutions · 2025-07-17_
7. Trong bảng momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW, sử dụng cột VALUE để lọc theo đối tác thay vì PARTNER_ID _2025-11-25_
8. Khi truy vấn số liệu giải ngân, luôn thêm điều kiện service_type = 'CLO' _FS - FI Solutions · 2025-08-13_
9. Khi tính trung bình CONTRACT_AMOUNT, sử dụng sum(CONTRACT_AMOUNT)/count(distinct ticket_id) thay vì AVG(CONTRACT_AMOUNT) _2025-09-23_

