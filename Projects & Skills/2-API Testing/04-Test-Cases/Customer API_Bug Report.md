# 🐞 Bug Report — Customer API

> Reference: [`Customer API_Test Case.md`](./Customer%20API_Test%20Case.md)
> Filled-in QA template (per-bug sheets, following `4.Bug Debug Report`): `QA_Testing_Templates_API_Customer.xlsx` — sheets `4.Bug Report - BUG-001` and `4.Bug Report - BUG-002`
> For full test execution logs (all cases, Pass and Fail):<br>
> 👉 **[Customer API — Bug Tracking Sheet](https://docs.google.com/spreadsheets/d/1L4d_CPbux6vtLmcV85wGGop5wDtiRRi5/edit?usp=sharing&ouid=106458769860966290112&rtpof=true&sd=true)**

This file summarizes the **bugs found while executing the Customer API test cases** (cases with result = Fail), following the structure of `4.Bug Debug Report` from the team's QA Testing Template — intended for Dev to pick up and fix. The content below mirrors what's filled in the `.xlsx` template exactly.

- **Project:** Customer REST API (Microsoft Dynamics 365 Business Central)
- **Test Environment:** `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`
- **Reported By:** Phuricha Wichitjomthong
- **Source:** Findings from `Customer_API_Test_Case.md`
- **Execution Tool:** Postman

---

## Summary

| Bug ID | Related Test Case | Summary | Severity | Priority | Status |
| --- | --- | --- | --- | --- | --- |
| BUG-001 | POST-003 | API does not enforce required `No.` field on customer creation | High | High | Open — Needs Dev Review |
| BUG-002 | POST-008 | API accepts a negative value for `creditLimit` | Medium | Medium | Confirmed — Open — Needs Dev Fix |

---

## BUG-001 — API does not enforce required `No.` field on customer creation

**1. Identification**

| | |
|---|---|
| Bug ID | BUG-001 |
| Date Found | `24 Aug 2026` |
| Reported by | Phuricha Wichitjomthong (QA) |
| Related Test Case | POST-003 — Missing Required Customer No. |
| Module / Feature | Customer API — Create Customer (POST) |
| Build/Version Found | Business Central (BC270), Customer API v1.0 |
| HTTP Method / Endpoint | `POST  /v1.0/companies/customers` |
| Summary | API does not enforce required `No.` field on customer creation |

**2. Severity & Priority**

| Severity | Priority |
|---|---|
| High — allows creation of a customer record without its business key (`No.`), which is expected to be mandatory. | High |

**3. Details**

- **Steps to Reproduce:**
  1. Send a POST request to ` /v1.0/companies/customers`.
  2. Omit the `No.` field from the request body (all other fields valid).
  3. Send the request.

- **Expected Result:**
  Request is rejected with 400 Bad Request because `No.` is defined as a required field per the API/Business Central business requirement. No customer record is created, and an appropriate validation error is returned.

- **Actual Result:**
  API returned 201 Created. A customer record was created successfully even though the required `No.` field was omitted from the request.

- **Frequency:** 100% Reproducible
- **Environment:** Business Central (BC270), Customer API v1.0

**4. Evidence**

See test case [POST-003](https://github.com/Printdonut4444/QA-Portfolio/blob/main/Projects%20%26%20Skills/2-API%20Testing/04-Test-Cases/Customer%20API_Test%20Case.md#post-003--missing-required-customer-no) in `Customer_API_Test_Case.md` for full request/response evidence (Postman screenshots included). 

**5. Root Cause & Fix (to be filled in by Dev)**

- **Notes / Suspected Cause:** Actual behavior may be influenced by `DelayedInsert` or a table validation trigger not enforcing the Mandatory property on the `No.` field at the API layer, even though `No.` is the customer's primary key. The customer record created during this test should be removed from the test environment to avoid polluting later test runs, since it was an unintended side effect of the validation not behaving as expected.
- **Recommendation:** Add explicit validation to reject POST requests missing the `No.` field, or confirm the intended behavior with the development team if auto-numbering is meant to apply here.
- **Fixed by:** *(pending)* · **Date Fixed:** *(pending)* · **Commit/Build:** *(pending)*

**6. Status Tracking**

| Current Status | Current Assignee | Regression Test Reference |
|---|---|---|
| Open — Needs Dev Review | Phuricha Wichitjomthong (QA) |  -  |

---

## BUG-002 — API accepts a negative value for `creditLimit`

**1. Identification**

| | |
|---|---|
| Bug ID | BUG-002 |
| Date Found | 24 Aug 2026 |
| Reported by | Phuricha Wichitjomthong (QA) |
| Related Test Case | POST-008 — Negative Credit Limit |
| Module / Feature | Customer API — Create Customer (POST) |
| Build/Version Found | Business Central (BC270), Customer API v1.0 |
| HTTP Method / Endpoint | `POST  /v1.0/companies/customers` |
| Summary | API accepts a negative value for `creditLimit` |

**2. Severity & Priority**

| Severity | Priority |
|---|---|
| Medium — API accepts financially invalid data (negative credit limit), risking downstream reporting/accounting inaccuracies. | Medium |

**3. Details**

- **Steps to Reproduce:**
  1. Send a POST request to ` /v1.0/companies/customers`.
  2. Provide a negative value for `creditLimit` (all other fields valid).
  3. Send the request.

- **Expected Result:**
  Request is rejected with 400 Bad Request because Business Central enforces a `creditLimit >= 0` business rule. No customer record is created.

- **Actual Result:**
  API returned 201 Created. A customer record was created successfully with the negative `creditLimit` value stored as submitted.

- **Frequency:** 100% Reproducible
- **Environment:** Business Central (BC270), Customer API v1.0

**4. Evidence**

See test case [POST-008](https://github.com/Printdonut4444/QA-Portfolio/blob/main/Projects%20%26%20Skills/2-API%20Testing/04-Test-Cases/Customer%20API_Test%20Case.md#post-008--negative-credit-limit) in `Customer_API_Test_Case.md` for full request/response evidence (Postman screenshots included).

**5. Root Cause & Fix (to be filled in by Dev)**

- **Confirmed Root Cause:** Confirmed via *[specify source — e.g., AL code review of Customer table CreditLimit validation trigger, or confirmed with Product Owner on \<date\>]* that Business Central requires `creditLimit >= 0`. The API does not enforce this rule at the REST endpoint level, allowing negative values to bypass validation and be persisted directly to the Customer API table.
- **Notes / Suspected Cause:** The `creditLimit` field is a Decimal type, which does not automatically reject negative values. The Customer API does not currently apply an explicit validation trigger to enforce the confirmed `creditLimit >= 0` business rule at the REST endpoint level, allowing the negative value to be persisted directly.
- **Recommendation:**
  1. Add explicit validation at the API layer to reject POST/PATCH requests where `creditLimit < 0`, consistent with the confirmed Business Central business rule.
  2. Re-run POST-008 after the fix is deployed to confirm the API now returns 400 Bad Request.
  3. Remove the customer record created during this test from the test environment.
- **Fixed by:** *(pending)* · **Date Fixed:** *(pending)* · **Commit/Build:** *(pending)*

**6. Status Tracking**

| Current Status | Current Assignee | Regression Test Reference |
|---|---|---|
| Confirmed — Open — Needs Dev Fix | Phuricha Wichitjomthong (QA) | - |

---

## Overall Notes

- Both bugs originate from negative/boundary test cases designed to validate server-side business rule enforcement, not from positive-path functionality — core CRUD operations (GET, valid POST, valid PATCH, valid DELETE) all passed as expected.
- **BUG-001 is a confirmed defect** — the required-field expectation is stated as a precondition of the test case and the API did not honor it.
- **BUG-002 is not yet a confirmed defect** — it is flagged for investigation because the assumption behind the expected result (a `creditLimit >= 0` rule) was never independently verified before execution. This distinction is intentional and should be preserved when this report is shared with the development team, to avoid mischaracterizing an unconfirmed assumption as a proven defect.
