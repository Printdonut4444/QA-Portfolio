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

**Actual Result:** __________________

**Status:** PASS / FAIL

**Evidence:** __________________

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

**Actual Result:** __________________

**Status:** PASS / FAIL

---

## TC-SQL-003 — Search Customer by No_

**Level:** Basic

**Objective:** ตรวจสอบการค้นหา Customer ด้วย Customer Number

**Test Data:**
- `[No_]` = `YOUR_CUSTOMER_NO`

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Email],
    [Status]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [No_] = 'YOUR_CUSTOMER_NO';
```

**Expected Result:**
- แสดงเฉพาะ Customer ที่ `[No_]` ตรงกับ Test Data
- ไม่แสดง Customer หมายเลขอื่น

**Actual Result:** __________________

**Status:** PASS / FAIL

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
WHERE [Status] = 'Active';
```

**Expected Result:**
- ทุก Record ที่ได้ต้องมี `Status = Active`

**Actual Result:** __________________

**Status:** PASS / FAIL

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
WHERE [Status] = 'Active'
  AND [Marketing Consent] = 1;
```

**Expected Result:**
- ทุก Record ต้องเป็น Active
- ทุก Record ต้องมี Marketing Consent = 1

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

---

## TC-SQL-015 — Registration Date Range

**Level:** Intermediate

**Objective:** ตรวจสอบ Customer ที่ Registration Date อยู่ในปี 2026

**SQL Query:**

```sql
SELECT
    [No_],
    [Name],
    [Registration Date]
FROM [dbo].[CRONUS - LS Central$Customer API$d5b4274d-3408-493a-995b-075155257555]
WHERE [Registration Date] >= '2026-01-01'
  AND [Registration Date] < '2027-01-01'
ORDER BY [Registration Date];
```

**Expected Result:**
- ทุก Record มี Registration Date อยู่ในปี 2026
- Record จากปีอื่นไม่ถูกนำมาแสดง

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Important:**
ต้องยืนยัน Required Field กับ Business Requirement ก่อนใช้เป็น Defect Rule

**Actual Result:** __________________

**Status:** PASS / FAIL

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
  AND (
        [Email] IS NULL
        OR LTRIM(RTRIM([Email])) = ''
      );
```

**Expected Result:**
- `0 rows`

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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

**Actual Result:** __________________

**Status:** PASS / FAIL

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
