# Intermediate SQL — Test Cases (Aggregate / Business Data)

[← Back to SQL Overview](./README.md)

---

## TC-SQL-011 — COUNT Customers by Status

**Level:** Intermediate

**Objective:** ตรวจสอบจำนวน Customer ในแต่ละ Status

**SQL Query:**

```sql
SELECT
    [Status],
    COUNT(*) AS TotalCustomers
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [Status]
ORDER BY TotalCustomers DESC;
```

**Expected Result:**
- ได้หนึ่ง row ต่อหนึ่ง Status
- จำนวน Customer ต่อ Status ถูกต้อง

**Evidence:** <br>
<img width="392" height="129" alt="image" src="https://github.com/user-attachments/assets/d225f46f-be61-449a-9d3c-7b91aa71dd7c" />

---

## TC-SQL-012 — GROUP BY Country

**Level:** Intermediate

**Objective:** ตรวจสอบจำนวน Customer แยกตาม Country

**SQL Query:**

```sql
SELECT
    [Country],
    COUNT(*) AS TotalCustomers
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [Country]
ORDER BY TotalCustomers DESC;
```

**Expected Result:**
- ได้หนึ่ง row ต่อหนึ่ง Country
- จำนวน Customer ของแต่ละ Country ถูกต้อง

**Evidence:** <br>
<img width="436" height="193" alt="image" src="https://github.com/user-attachments/assets/0147e6d6-7d58-41eb-8cc8-bba3b5f826e2" />

---

## TC-SQL-013 — Credit Limit Aggregate

**Level:** Intermediate

**Objective:** ตรวจสอบ Aggregate Function กับ Credit Limit

**SQL Query:**

```sql
SELECT
    SUM([Credit Limit]) AS TotalCreditLimit,
    AVG([Credit Limit]) AS AverageCreditLimit,
    MIN([Credit Limit]) AS MinCreditLimit,
    MAX([Credit Limit]) AS MaxCreditLimit
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
```

**Expected Result:**
- ค่า Aggregate ถูกคำนวณจากข้อมูลจริง
- `MIN <= AVG <= MAX`

**Evidence:** <br>
<img width="1165" height="137" alt="image" src="https://github.com/user-attachments/assets/4c78b3cf-2ae6-496a-96e5-733911814d80" />

---

## TC-SQL-014 — HAVING

**Level:** Intermediate

**Objective:** ค้นหา Country ที่มี Customer มากกว่า 10 ราย

**SQL Query:**

```sql
SELECT
    [Country],
    COUNT(*) AS TotalCustomers
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [Country]
HAVING COUNT(*) > 10
ORDER BY TotalCustomers DESC;
```

**Expected Result:**
- ทุก Country ที่แสดงต้องมี Customer มากกว่า 10
- Country ที่มี 10 หรือน้อยกว่าต้องไม่แสดง

**Evidence:** <br>
<img width="478" height="110" alt="image" src="https://github.com/user-attachments/assets/24e905c5-7a77-4d1f-a492-12a32d763760" />

---

## TC-SQL-015 — Registration Date Range

**Level:** Intermediate

**Objective:** ตรวจสอบ Customer ที่มี Last Modified Date อยู่ในปีที่กำหนด

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email],
    [Last Modified Date]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Last Modified Date] >= '2025-01-01'
  AND [Last Modified Date] < '2026-01-01'
ORDER BY [Last Modified Date];
```

**Expected Result:**
- ทุก Record ที่แสดงต้องมี [Last Modified Date] อยู่ในปี 2025
- Record ที่มีวันที่ก่อน 2025-01-01 หรือวันที่ตั้งแต่ 2026-01-01 เป็นต้นไปต้องไม่ถูกแสดง
- ผลลัพธ์ต้องเรียงจากวันที่เก่าไปใหม่ตาม [Last Modified Date]

**Evidence:** <br>
<img width="857" height="216" alt="image" src="https://github.com/user-attachments/assets/c36af0a8-71e1-4afd-8d8e-51147275faee" />

---

## TC-SQL-016 — Customer Type Summary

**Level:** Intermediate

**Objective:** ตรวจสอบจำนวน Customer ตาม Customer Type

**SQL Query:**

```sql
SELECT
    [Customer Type],
    COUNT(*) AS TotalCustomers
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [Customer Type]
ORDER BY TotalCustomers DESC;
```

**Expected Result:**
- ได้จำนวน Customer แยกตาม Customer Type
- ไม่มี Customer Type ที่หลุดจากการ Group

**Evidence:** <br>
<img width="419" height="122" alt="image" src="https://github.com/user-attachments/assets/8422fbd0-785b-48c3-913f-8d92dc6ae49b" />

---

## TC-SQL-017 — Currency Summary

**Level:** Intermediate

**Objective:** ตรวจสอบจำนวน Customer ตาม Currency Code

**SQL Query:**

```sql
SELECT
    [Currency Code],
    COUNT(*) AS TotalCustomers
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [Currency Code]
ORDER BY TotalCustomers DESC;
```

**Expected Result:**
- ได้จำนวน Customer ต่อ Currency Code
- ข้อมูลสอดคล้องกับ Database

**Evidence:** <br>
<img width="434" height="182" alt="image" src="https://github.com/user-attachments/assets/077da15e-0ea0-4e5c-ba32-1ef759b28d2b" />
