# SQL Database Testing — Customer API Table

## Test Scope

| Item | Detail |
|---|---|
| Database | `w1-ls-central-release-27-0-0-0` |
| Tool | SQL Server Management Studio (SSMS) 20 |
| Target Table | [Customer API](../2.2-API%20Testing/02-Business-Central-API/Table/CustomerAPI.Table.al) |
| Test Type | Database Testing / Data Validation / Data Integrity |
| Total Test Cases | 30 |

## Target Table

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

## Test Case Documentation Format

Every test case below documents:

- Test Case ID
- Level
- Objective
- Precondition
- Test Data
- SQL Query
- Expected Result
- Notes / Evidence

## Test Levels

| Level | File | Test Cases |
|---|---|---|
| Basic | [01-Basic-SQL.md](./01-Basic-SQL.md) | TC-SQL-001 – TC-SQL-010 |
| Intermediate | [02-Intermediate-SQL.md](./02-Intermediate-SQL.md) | TC-SQL-011 – TC-SQL-017 |
| Advanced | [03-Advanced-SQL.md](./03-Advanced-SQL.md) | TC-SQL-018 – TC-SQL-030 |

## Skills Practiced

### Basic

- SELECT
- SELECT specific columns
- WHERE
- AND / OR
- LIKE
- IS NULL / IS NOT NULL
- ORDER BY
- TOP
- DISTINCT

### Intermediate

- COUNT
- GROUP BY
- SUM
- AVG
- MIN / MAX
- HAVING
- Date Range
- GROUP BY Customer Type
- GROUP BY Currency Code

### Advanced

- Duplicate detection
- Data quality validation
- Required field validation
- Business Rule validation
- CASE WHEN
- Subquery
- CTE
- RANK
- ROW_NUMBER
- PARTITION BY
- Audit field validation
- Data integrity validation
- UI/API → Database validation
