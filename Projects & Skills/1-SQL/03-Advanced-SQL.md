# Advanced SQL — Test Cases

[← Back to SQL Overview](./README.md)

---

## Data Quality

### TC-SQL-018 — Duplicate Customer No_

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

### TC-SQL-019 — Duplicate systemId

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

### TC-SQL-020 — Required Field Validation

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

### TC-SQL-021 — Active Customer Without Email

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

### TC-SQL-022 — Invalid Credit Limit

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

**Evidence:** <br>
<img width="1201" height="547" alt="image" src="https://github.com/user-attachments/assets/13a5a3bb-7480-4cd2-a824-ae7540194504" />

---

### TC-SQL-023 — Email Data Quality

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

## Business Rules

### TC-SQL-024 — CASE WHEN Credit Category

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

### TC-SQL-025 — Registration Date vs Last Modified Date

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

### TC-SQL-026 — System Created vs System Modified

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

### TC-SQL-027 — Audit Field Completeness

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

## Subquery / CTE / Window Function

### TC-SQL-028 — Credit Limit Above Average

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

### TC-SQL-029 — Rank Customer by Credit Limit

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

### TC-SQL-030 — Top 3 Customers Per Country

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
