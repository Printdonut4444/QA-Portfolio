# Basic SQL — Test Cases

[← Back to SQL Overview](./README.md)

---

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
