# 📋 04-Test-Cases

## Overview

This folder contains the **test cases and execution results** for each API/module under test. Each file documents the test steps, test data, expected results, and actual results recorded during test execution, following the team's QA Testing Template (`3.Test Case & Execution`).

---

## Files in this folder

| File | Description |
|---|---|
| [`Customer API_Test Case.md`](./Customer%20API_Test%20Case.md) | Full test cases for the Customer API (GET / POST / PATCH / DELETE) — 17 cases covering retrieval, creation, update, and deletion of customer records against Business Central. |

---

## Related Sections
* [Business Central API](../02-Business-Central-API)
* [API Collection](../03-API-Collection/)
* [Customer API_Test Cases](../04-Test-Cases/Customer%20API_Test%20Case.md)
* [Customer API_Bug Report](../04-Test-Cases/Customer%20API_Bug%20Report.md)

---

## Test Case Summary

| Category  | Test Cases |
| --------- | ---------: |
| GET       |          3 |
| POST      |          8 |
| PATCH     |          4 |
| DELETE    |          2 |
| **Total** |     **17** |

---
## Test Execution Summary

* Test Cases Designed: 17
* Test Cases Executed: 17
* Passed: 15
* Failed: 2
* Not Executed: 0

**Open defects from this run:**
- **BUG-001** (POST-003) — required `No.` field not validated on customer creation. *High / Open — Needs Dev Review.*
- **BUG-002** (POST-008) — negative `creditLimit` accepted. *Medium / Confirmed — Open — Needs Dev Fix.*

> ℹ️ Update this table each time a test case file is re-run, so anyone opening this folder gets an accurate pass-rate snapshot without opening every file.

---

## Legend

- **Pass** — Test executed and result matched the expected result.
- **Fail** — Test executed but result did not match the expected result; a bug should be logged in `05-Bug-Reports/`.
- **Not Run** — Test not yet executed, or execution was blocked.

---

## Test Coverage

The test cases cover:

* GET — Retrieve customer data
* POST — Create customer
* PATCH — Update customer
* DELETE — Delete customer
* Positive testing
* Negative testing
* Boundary testing
* Data type validation
* Required field validation
* Duplicate data validation