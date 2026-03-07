-- D8: Discover QLCT tables with age_group in MBI_DA
SELECT table_name
FROM `momovn-prod.MBI_DA.INFORMATION_SCHEMA.TABLES`
WHERE UPPER(table_name) LIKE '%QLCT%'
   OR UPPER(table_name) LIKE '%EXPENSE%'
   OR UPPER(table_name) LIKE '%MONI%'
ORDER BY table_name;
