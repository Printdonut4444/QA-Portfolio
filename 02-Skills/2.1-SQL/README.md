# SQL Database Testing Test Cases — Customer API Table

## 1. Test Scope

| Item | Detail |
|---|---|
| Database | `w1-ls-central-release-27-0-0-0` |
| Tool | SQL Server Management Studio (SSMS) 20 |
| Target Table | [Customer API](../2.2-API%20Testing/02-Business-Central-API/Table/CustomerAPI.Table.al) |
| Test Type | Database Testing / Data Validation / Data Integrity |
| Difficulty | Basic → Intermediate → Advanced |
| Total Test Cases | 30 |

## 2. Target Table

```sql
USE [w1-ls-central-release-27-0-0-0];
GO

SELECT
    [timestamp],
    [No_],
    [Name],
    [Email],
    [$systemId],
    [$systemCreatedAt],
    [$systemCreatedBy],
    [$systemModifiedAt],
    [$systemModifiedBy],
    [Phone No_],
    [Address],
    [City],
    [Country],
    [Postal Code],
    [Customer Type],
    [Status],
    [Registration Date],
    [Last Modified Date],
    [Credit Limit],
    [Currency Code],
    [Marketing Consent]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
GO
```

---

# 3. Test Case Template

ทุก Test Case ควรบันทึก: >>เดี๋ยวใส่ไฟล์จาก one drive

- Test Case ID
- Level
- Objective
- Precondition
- Test Data
- SQL Query
- Expected Result
- Actual Result
- Status
- Notes / Evidence

---

# 4. Basic SQL

## TC-SQL-001 — Verify Table Can Be Queried

**Level:** Basic

**Objective:** ตรวจสอบว่าสามารถ Query Customer table ได้

**SQL Query:**

```sql
SELECT *
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
```

**Expected Result:**
- Query สำเร็จ
- ไม่มี SQL Error
- มี Customer records หรือแสดง empty result โดยไม่เกิด error

**Evidence:** <br> 
<img width="1676" height="374" alt="image" src="https://github.com/user-attachments/assets/14019442-7c84-4a5e-b2a7-d2f5ac97ed10" />

---

## TC-SQL-002 — Select Required Customer Fields

**Level:** Basic

**Objective:** ตรวจสอบการดึงเฉพาะข้อมูล Customer ที่ต้องการ

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email],
    [Phone No_],
    [City],
    [Country],
    [Status]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
```

**Expected Result:**
- Result มีเฉพาะ 7 columns ที่ระบุ
- ข้อมูลของแต่ละ column ตรงกับ Customer record

**Evidence:** <br> 
<img width="915" height="184" alt="image" src="https://github.com/user-attachments/assets/de91fa02-830b-4cbe-adfc-0f2bda668dbb" />


---

## TC-SQL-003 — Search Customer by No_

**Level:** Basic

**Objective:** ตรวจสอบการค้นหา Customer ด้วย Customer Number

**Test Data:**
- `[No_]` = `CUST002`

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email],
    [Status]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [No_] = 'CUST002';
```

**Expected Result:**
- แสดงเฉพาะ Customer ที่ `[No_]` ตรงกับ Test Data
- ไม่แสดง Customer หมายเลขอื่น

**Evidence:** <br> 
<img width="599" height="146" alt="image" src="https://github.com/user-attachments/assets/898ecc3f-15a5-417a-8539-a783d341620c" />


---

## TC-SQL-004 — Filter Active Customers

**Level:** Basic

**Objective:** ตรวจสอบการใช้ WHERE กับ Status

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Status]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Status] = '0';
```

**Expected Result:**
- ทุก Record ที่ได้ต้องมี `Status = 0` เนื่องจาก  OptionMembers = Active,Inactive,Blocked;

**Evidence:** <br> 
<img width="473" height="193" alt="image" src="https://github.com/user-attachments/assets/ed1b440d-b9e7-4e61-a801-e7981cf44766" />

---

## TC-SQL-005 — AND Condition

**Level:** Basic

**Objective:** ตรวจสอบ Customer ที่ Active และยินยอม Marketing

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Status],
    [Marketing Consent]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Status] = '0'
  AND [Marketing Consent] = 1;
```

**Expected Result:**
- ทุก Record ต้องเป็น Active(0)
- ทุก Record ต้องมี Marketing Consent = 1

**Evidence:** <br> 
<img width="570" height="137" alt="image" src="https://github.com/user-attachments/assets/9b3eb429-1cf1-4327-9c02-bc4002e35479" />

---

## TC-SQL-006 — LIKE Search

**Level:** Basic

**Objective:** ตรวจสอบ Partial Search จาก Customer Name

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Name] LIKE 'A%';
```

**Expected Result:**
- ทุก Name ที่แสดงต้องขึ้นต้นด้วย `A`

**Evidence:** <br> 
<img width="583" height="114" alt="image" src="https://github.com/user-attachments/assets/db46a9fc-0941-4a60-bac6-dc183ff850d3" />

---

## TC-SQL-007 — NULL Email

**Level:** Basic

**Objective:** ตรวจสอบ Customer ที่ไม่มี Email

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Email] IS NULL;
```

**Expected Result:**
- ทุก Record ต้องมี Email เป็น NULL

**Important:**

ห้ามใช้:

```sql
WHERE [Email] = NULL
```

ให้ใช้:

```sql
WHERE [Email] IS NULL
```

**Evidence:** <br> 
<img width="835" height="142" alt="image" src="https://github.com/user-attachments/assets/a9c56f4f-af62-491e-a397-b019b22d703c" />

---

## TC-SQL-008 — ORDER BY Credit Limit

**Level:** Basic

**Objective:** ตรวจสอบการเรียงข้อมูล

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Credit Limit]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
ORDER BY [Credit Limit] DESC;
```

**Expected Result:**
- Credit Limit เรียงจากมากไปน้อย

**Evidence:** <br> 
<img width="669" height="185" alt="image" src="https://github.com/user-attachments/assets/dedacd1b-282b-4979-9ead-b35e482f6490" />

---

## TC-SQL-009 — TOP 10 Customers

**Level:** Basic

**Objective:** ตรวจสอบการจำกัดจำนวน Record

**SQL Query:**

```sql
SELECT TOP 10
    [No_],
    [Name],
    [Credit Limit]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
ORDER BY [Credit Limit] DESC;
```

**Expected Result:**
- ได้ไม่เกิน 10 Records
- เป็น Customer ที่มี Credit Limit สูงสุด

**Evidence:** <br> 
<img width="824" height="321" alt="image" src="https://github.com/user-attachments/assets/a584776b-e425-4b47-b98f-10cd4fb365eb" />

---

## TC-SQL-010 — DISTINCT Country

**Level:** Basic

**Objective:** ตรวจสอบ Country ที่ไม่ซ้ำกัน

**SQL Query:**

```sql
SELECT DISTINCT
    [Country]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
ORDER BY [Country];
```

**Expected Result:**
- Country แต่ละค่าปรากฏเพียงครั้งเดียว
- ไม่มี duplicate Country

**Evidence:** <br> 
<img width="341" height="179" alt="image" src="https://github.com/user-attachments/assets/40d3ffc3-8d5f-4b61-986e-ba0311373506" />

---

# 5. Intermediate QA — Aggregate / Business Data

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

---

# 6. Advanced — Data Quality

## TC-SQL-018 — Duplicate Customer No_

**Level:** Advanced

**Objective:** ตรวจสอบ Duplicate Customer Number

**Business Rule:**
- สมมติ `[No_]` ต้อง Unique

**SQL Query:**

```sql
SELECT
    [No_],
    COUNT(*) AS DuplicateCount
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
GROUP BY [No_]
HAVING COUNT(*) > 1;
```

**Expected Result:**
- `0 rows`

ถ้ามี Result ถือเป็น Potential Data Integrity Defect และต้องตรวจสอบ Requirement ก่อนเปิด Defect

**Evidence:** <br> 
<img width="1102" height="587" alt="image" src="https://github.com/user-attachments/assets/a1e90d2c-dc05-4649-8e86-4ffd1830db95" />

---

## TC-SQL-019 — Duplicate systemId

**Level:** Advanced

**Objective:** ตรวจสอบว่า `$systemId` ไม่ซ้ำกัน

**SQL Query:**

```sql
SELECT
    [$systemId],
    COUNT(*) AS DuplicateCount
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [$systemId] IS NOT NULL
GROUP BY [$systemId]
HAVING COUNT(*) > 1;
```

**Expected Result:**
- `0 rows` หาก `$systemId` ถูกกำหนดให้ Unique

**Evidence:** <br> 
<img width="1081" height="568" alt="image" src="https://github.com/user-attachments/assets/f39ca138-9120-49db-92ae-0546d22c6a73" />

---

## TC-SQL-020 — Required Field Validation

**Level:** Advanced

**Objective:** ตรวจสอบ Required Fields ที่เป็น NULL

**Assumption:**
- `[No_]`
- `[Name]`
- `[Customer Type]`
- `[Status]`
- `[Currency Code]`

ต้องมีข้อมูล

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Customer Type],
    [Status],
    [Currency Code]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [No_] IS NULL
   OR [Name] IS NULL
   OR [Customer Type] IS NULL
   OR [Status] IS NULL
   OR [Currency Code] IS NULL;
```

**Expected Result:**
- `0 rows`

**Evidence:** <br> 
<img width="1108" height="581" alt="image" src="https://github.com/user-attachments/assets/1d057aec-73e7-40ab-8de9-44a8c8df4853" />

---

## TC-SQL-021 — Active Customer Without Email

**Level:** Advanced

**Objective:** ตรวจสอบ Active Customer ที่ไม่มี Email

**Business Rule:**
- สมมติ Active Customer ต้องมี Email

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Status],
    [Email]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Status] = 'Active'
  AND ([Email] IS NULL ) OR LTRIM(RTRIM([Email])) = '';
```

**Expected Result:**
- `0 rows`

**Evidence:** <br> 
<img width="1249" height="488" alt="image" src="https://github.com/user-attachments/assets/679463a6-d824-448d-a772-7d14dd9b15ba" />

---

## TC-SQL-022 — Invalid Credit Limit

**Level:** Advanced

**Objective:** ตรวจสอบ Credit Limit ติดลบ

**Business Rule:**
- Credit Limit ต้องไม่ติดลบ

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Credit Limit]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Credit Limit] < 0;
```

**Expected Result:**
- `0 rows`
- 
**Evidence:** <br>
<img width="1201" height="547" alt="image" src="https://github.com/user-attachments/assets/13a5a3bb-7480-4cd2-a824-ae7540194504" />

---

## TC-SQL-023 — Email Data Quality

**Level:** Advanced

**Objective:** ตรวจสอบ Email ที่ไม่ตรงกับ Basic Email Pattern

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Email] IS NOT NULL
  AND [Email] NOT LIKE '%_@_%._%';
```

**Expected Result:**
- `0 rows` หาก Requirement กำหนดให้ Email ต้องมีรูปแบบพื้นฐาน

**Note:**
Query นี้เป็น Data Quality Check แบบ Basic ไม่ใช่ RFC-compliant Email Validator

**Evidence:** <br> 
<img width="1098" height="554" alt="image" src="https://github.com/user-attachments/assets/65c0e14c-a3fd-4e6e-8ff0-413c465c379f" />

---

# 7. Advanced — Business Rules

## TC-SQL-024 — CASE WHEN Credit Category

**Level:** Advanced

**Objective:** ตรวจสอบ Business Logic สำหรับ Credit Category

**Business Rule:**

| Credit Limit | Category |
|---:|---|
| >= 100000 | High |
| >= 50000 และ < 100000 | Medium |
| < 50000 | Low |

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Credit Limit],
    CASE
        WHEN [Credit Limit] >= 100000 THEN 'High'
        WHEN [Credit Limit] >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS CreditCategory
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
```

**Expected Result:**
- Category ของแต่ละ Customer ตรงตาม Business Rule

**Evidence:** <br> 
<img width="979" height="396" alt="image" src="https://github.com/user-attachments/assets/db1239fc-deb4-46a3-b806-ec33cf6ac234" />

---

## TC-SQL-025 — Registration Date vs Last Modified Date

**Level:** Advanced / Data Integrity

**Objective:** ตรวจสอบว่า Customer ไม่ถูก Modified ก่อน Registration

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Registration Date],
    [Last Modified Date]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Last Modified Date] < [Registration Date];
```

**Expected Result:**
- `0 rows`

**Evidence:** <br> 
<img width="1056" height="510" alt="image" src="https://github.com/user-attachments/assets/51dda39d-b41a-497d-a041-7558e5628a27" />

---

## TC-SQL-026 — System Created vs System Modified

**Level:** Advanced / Audit Validation

**Objective:** ตรวจสอบ Audit Timestamp

**SQL Query:**

```sql
SELECT
    [No_],
    [$systemCreatedAt],
    [$systemModifiedAt]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [$systemModifiedAt] < [$systemCreatedAt];
```

**Expected Result:**
- `0 rows`

**Evidence:** <br> 
<img width="1081" height="486" alt="image" src="https://github.com/user-attachments/assets/5984e22b-a9ca-4702-8607-3ac7ce1dc360" />

---

## TC-SQL-027 — Audit Field Completeness

**Level:** Advanced / Audit Validation

**Objective:** ตรวจสอบว่าข้อมูล Audit ถูกสร้างครบถ้วน

**SQL Query:**

```sql
SELECT
    [No_],
    [$systemCreatedAt],
    [$systemCreatedBy],
    [$systemModifiedAt],
    [$systemModifiedBy]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [$systemCreatedAt] IS NULL
   OR [$systemCreatedBy] IS NULL;
```

**Expected Result:**
- `0 rows` หาก Created Audit Fields เป็น Mandatory

**Evidence:** <br> 
<img width="1171" height="478" alt="image" src="https://github.com/user-attachments/assets/b59dc09c-15a9-4c82-877a-c74189c1a8c6" />

---

# 8. Advanced SQL — Subquery / CTE / Window Function

## TC-SQL-028 — Credit Limit Above Average

**Level:** Advanced

**Objective:** ค้นหา Customer ที่มี Credit Limit สูงกว่าค่าเฉลี่ยทั้งหมด

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Credit Limit]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Credit Limit] >
(
    SELECT AVG([Credit Limit])
    FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
)
ORDER BY [Credit Limit] DESC;
```

**Expected Result:**
- ทุก Record ที่แสดงมี Credit Limit มากกว่าค่าเฉลี่ย

**Evidence:** <br> 
<img width="813" height="218" alt="image" src="https://github.com/user-attachments/assets/43338735-9459-4673-9d64-4caaf2a0db20" />

---

## TC-SQL-029 — Rank Customer by Credit Limit

**Level:** Advanced

**Objective:** ฝึก Window Function และ Ranking

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Country],
    [Credit Limit],
    RANK() OVER (
        ORDER BY [Credit Limit] DESC
    ) AS CreditRank
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555];
```

**Expected Result:**
- Customer ที่มี Credit Limit สูงสุดได้ Rank 1
- Customer ที่มี Credit Limit เท่ากันได้ Rank เดียวกัน
- Rank เรียงตาม Credit Limit จากมากไปน้อย



**Evidence:** <br> 
<img width="931" height="420" alt="image" src="https://github.com/user-attachments/assets/d31b259b-3454-4d6c-9d77-427f780b5d46" />

---

## TC-SQL-030 — Top 3 Customers Per Country

**Level:** Advanced

**Objective:** ฝึก CTE + ROW_NUMBER + PARTITION BY

**SQL Query:**

```sql
WITH RankedCustomers AS
(
    SELECT
        [No_],
        [Name],
        [Country],
        [Credit Limit],
        ROW_NUMBER() OVER (
            PARTITION BY [Country]
            ORDER BY [Credit Limit] DESC
        ) AS RowNum
    FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
)
SELECT
    [No_],
    [Name],
    [Country],
    [Credit Limit]
FROM RankedCustomers
WHERE RowNum <= 3
ORDER BY
    [Country],
    [Credit Limit] DESC;
```

**Expected Result:**
- แต่ละ Country มี Customer ไม่เกิน 3 ราย
- Customer ถูกจัดอันดับภายใน Country
- Credit Limit สูงสุดของแต่ละ Country อยู่ด้านบน



**Evidence:** <br> 
<img width="903" height="323" alt="image" src="https://github.com/user-attachments/assets/8c460bd9-1676-44eb-9f9f-0f6c2069aa3b" />

---

# 9. Recommended QA Evidence

สำหรับแต่ละ Test Case โดยเฉพาะกรณี FAIL ควรเก็บ: >> เดี๋ยวใส่ Bug Report

- SQL Query
- Screenshot ของ Query Result
- Test Data
- UI Screenshot
- API Request
- API Response
- Expected Result
- Actual Result
- Execution Date/Time
- Database Name
- Environment
- Related Requirement / User Story
- Defect ID ถ้ามี

---

# 10. SQL Skill Checklist

## Basic 

- [ ] SELECT
- [ ] SELECT specific columns
- [ ] WHERE
- [ ] AND / OR
- [ ] LIKE
- [ ] IS NULL / IS NOT NULL
- [ ] ORDER BY
- [ ] TOP
- [ ] DISTINCT

## Intermediate

- [ ] COUNT
- [ ] GROUP BY
- [ ] SUM
- [ ] AVG
- [ ] MIN / MAX
- [ ] HAVING
- [ ] Date Range
- [ ] GROUP BY Customer Type
- [ ] GROUP BY Currency Code

## Advanced

- [ ] Duplicate detection
- [ ] Data quality validation
- [ ] Required field validation
- [ ] Business Rule validation
- [ ] CASE WHEN
- [ ] Subquery
- [ ] CTE
- [ ] RANK
- [ ] ROW_NUMBER
- [ ] PARTITION BY
- [ ] Audit field validation
- [ ] Data integrity validation
- [ ] UI/API → Database validation

---
