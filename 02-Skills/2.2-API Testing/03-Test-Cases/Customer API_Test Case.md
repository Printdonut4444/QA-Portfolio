# Customer API Test Cases

## Overview

This document contains the test cases designed for the **Customer REST API** developed in Microsoft Dynamics 365 Business Central.

The test cases focus on validating API functionality, request and response data, business rules, and expected behavior for common customer operations.

---

## Test Scope

The test cases cover:

- GET — Retrieve customer data
- POST — Create customer
- PATCH — Update customer
- DELETE — Delete customer
- Positive testing
- Negative testing
- Boundary testing
- Required field validation
- Duplicate data validation
- Enum validation
- Data type validation

---

## Preconditions

Before executing the test cases:

1. Business Central is available.
2. The `Customer API` table and `QA Customer API` page are deployed.
3. The API endpoint is accessible.
4. The API client is authenticated.
5. The test company is available.
6. Test data can be created and removed without affecting production data.

---

# GET Test Cases

## GET-001 — Get All Customers

**Objective**

Verify that the API can retrieve the list of customers.

**Method**

`GET`

**Endpoint**

```text
/customers
```

**Test Data**

No request body.

**Expected Result**

- API returns a successful response.
- Response contains the customer collection.
- Returned records contain the expected customer fields.
- Data matches the records stored in Business Central.

---

## GET-002 — Get Customer by No.

**Objective**

Verify that a specific customer can be retrieved using a valid customer identifier.

**Method**

`GET`

**Endpoint**

```text
/customers({id})
```

**Test Data**

Use an existing customer.

Example:

```text
Customer No.: C00001
```

**Expected Result**

- API returns a successful response.
- The response contains the requested customer.
- The returned customer number matches the requested record.
- Customer data matches Business Central.

---

## GET-003 — Get Non-existing Customer

**Objective**

Verify the API behavior when requesting a customer that does not exist.

**Method**

`GET`

**Endpoint**

```text
/customers({id})
```

**Test Data**

Use a non-existing customer identifier.

Example:

```text
Customer No.: C99999
```

**Expected Result**

- API does not return an existing customer.
- An appropriate error response is returned.
- No customer record is created or modified.

---

# POST Test Cases

## POST-001 — Create Customer with Valid Data

**Objective**

Verify that a customer can be successfully created using valid data.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00001",
  "name": "Donut Technology Co., Ltd.",
  "email": "contact@donut-tech.com",
  "phoneNo": "0812345678",
  "address": "123 Sukhumvit Road",
  "city": "Bangkok",
  "country": "TH",
  "postalCode": "10110",
  "customerType": "Company",
  "status": "Active",
  "creditLimit": 100000,
  "currencyCode": "THB",
  "marketingConsent": true
}
```

**Expected Result**

- API accepts the request.
- A successful creation response is returned.
- The response contains the created customer.
- Customer `C00001` exists in Business Central.
- Customer data matches the submitted request.

---

## POST-002 — Create Customer with Minimum Data

**Objective**

Verify API behavior when only the minimum required customer data is provided.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00002",
  "name": "John Smith",
  "email": "john.smith@example.com"
}
```

**Expected Result**

- Request is accepted if these fields satisfy the configured Business Central requirements.
- A customer record is created.
- Optional fields use their configured default values or remain empty.

> Note: The expected result depends on the validation rules implemented in the Business Central table.

---

## POST-003 — Missing Required Customer No.

**Objective**

Verify that the API handles a request without the customer number correctly.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "name": "Missing Number Customer",
  "email": "missing.no@example.com",
  "customerType": "Individual",
  "status": "Active"
}
```

**Expected Result**

- Request is rejected if `No.` is configured as required.
- No incomplete customer record is created.
- An appropriate validation error is returned.

> Note: Business Central's actual behavior should be verified during execution because `DelayedInsert` and table validation rules affect the result.

---

## POST-004 — Duplicate Customer No.

**Objective**

Verify that the API prevents duplicate customer numbers.

**Precondition**

Customer `C00001` already exists.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00001",
  "name": "Duplicate Customer",
  "email": "duplicate@example.com",
  "customerType": "Company",
  "status": "Active"
}
```

**Expected Result**

- Request is rejected.
- Existing customer `C00001` is not overwritten.
- An appropriate duplicate-key or validation error is returned.

---

## POST-005 — Invalid Customer Type

**Objective**

Verify that the API rejects a customer type that is not defined by the API.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00003",
  "name": "Invalid Type Customer",
  "email": "invalid.type@example.com",
  "customerType": "Unknown",
  "status": "Active"
}
```

**Expected Result**

- Request is rejected.
- Customer is not created.
- An appropriate validation error is returned.

---

## POST-006 — Invalid Status

**Objective**

Verify that the API rejects an unsupported customer status.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00004",
  "name": "Invalid Status Customer",
  "email": "invalid.status@example.com",
  "customerType": "Company",
  "status": "Pending"
}
```

**Expected Result**

- Request is rejected.
- Customer is not created.
- An appropriate validation error is returned.

---

## POST-007 — Invalid JSON Data Type

**Objective**

Verify that the API rejects values with an incorrect JSON data type.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00005",
  "name": "Wrong Data Type",
  "email": "wrong.type@example.com",
  "customerType": "Company",
  "status": "Active",
  "creditLimit": "100000",
  "marketingConsent": "yes"
}
```

**Expected Result**

- Request is rejected.
- `creditLimit` should not accept a string when a numeric value is expected.
- `marketingConsent` should not accept a string when a Boolean value is expected.
- No invalid customer record is created.

---

## POST-008 — Negative Credit Limit

**Objective**

Verify the behavior when a negative credit limit is submitted.

**Method**

`POST`

**Endpoint**

```text
/customers
```

**Test Data**

```json
{
  "no": "C00006",
  "name": "Negative Credit Customer",
  "email": "negative.credit@example.com",
  "customerType": "Company",
  "status": "Active",
  "creditLimit": -1000,
  "currencyCode": "THB"
}
```

**Expected Result**

- Request should be rejected if the business rule requires `creditLimit >= 0`.
- No invalid customer should be created.

> Note: A Decimal field does not automatically reject negative values. This test requires an explicit Business Central validation rule if a rejection is expected.

---

# PATCH Test Cases

## PATCH-001 — Update Customer Name

**Objective**

Verify that an existing customer's name can be updated.

**Method**

`PATCH`

**Endpoint**

```text
/customers({id})
```

**Test Data**

```json
{
  "name": "Donut Technology Updated"
}
```

**Expected Result**

- API accepts the request.
- Customer name is updated.
- Other customer fields remain unchanged.
- Business Central displays the updated value.

---

## PATCH-002 — Update Multiple Customer Fields

**Objective**

Verify that multiple customer fields can be updated in one request.

**Method**

`PATCH`

**Endpoint**

```text
/customers({id})
```

**Test Data**

```json
{
  "name": "Donut Technology Updated",
  "phoneNo": "0899999999",
  "city": "Nonthaburi"
}
```

**Expected Result**

- API accepts the request.
- All specified fields are updated.
- Fields not included in the request remain unchanged.
- Updated data matches Business Central.

---

## PATCH-003 — Update Non-existing Customer

**Objective**

Verify the API behavior when attempting to update a customer that does not exist.

**Method**

`PATCH`

**Endpoint**

```text
/customers({id})
```

**Test Data**

Use a non-existing customer identifier.

```text
Customer No.: C99999
```

**Request Body**

```json
{
  "name": "Non-existing Customer"
}
```

**Expected Result**

- Request is rejected.
- No new customer is created.
- An appropriate error response is returned.

---

## PATCH-004 — Update Customer with Invalid Status

**Objective**

Verify that an existing customer cannot be updated with an unsupported status.

**Method**

`PATCH`

**Endpoint**

```text
/customers({id})
```

**Test Data**

```json
{
  "status": "Pending"
}
```

**Expected Result**

- Request is rejected.
- Existing customer data remains unchanged.
- An appropriate validation error is returned.

---

# DELETE Test Cases

## DELETE-001 — Delete Existing Customer

**Objective**

Verify that an existing customer can be deleted.

**Method**

`DELETE`

**Endpoint**

```text
/customers({id})
```

**Test Data**

Use an existing test customer.

```text
Customer No.: C00006
```

**Expected Result**

- API accepts the delete request.
- Customer is removed from the `Customer API` table.
- A subsequent GET request should not return the deleted customer.

---

## DELETE-002 — Delete Non-existing Customer

**Objective**

Verify the API behavior when attempting to delete a customer that does not exist.

**Method**

`DELETE`

**Endpoint**

```text
/customers({id})
```

**Test Data**

```text
Customer No.: C99999
```

**Expected Result**

- Request does not delete any record.
- An appropriate error response is returned.
- Existing customer records remain unchanged.

---

# Test Case Summary

| Category | Test Cases |
|---|---:|
| GET | 3 |
| POST | 8 |
| PATCH | 4 |
| DELETE | 2 |
| **Total** | **17** |

---

# Test Types Covered

| Test Type | Examples |
|---|---|
| Positive Testing | Valid GET, POST, PATCH, DELETE |
| Negative Testing | Invalid data, duplicate data, non-existing records |
| Boundary Testing | Minimum data, zero/negative credit limit |
| Data Validation | Enum and JSON data types |
| Required Field Testing | Missing customer information |
| CRUD Testing | Create, Read, Update, Delete |

---

# Execution Result

The `Actual Result`, `Status`, and evidence will be recorded after executing the test cases against the Business Central API.

Example execution record:

| Test Case ID | Actual Result | Status | Evidence |
|---|---|---|---|
| GET-001 | TBD | Not Executed | - |
| GET-002 | TBD | Not Executed | - |
| POST-001 | TBD | Not Executed | - |
| POST-002 | TBD | Not Executed | - |
| POST-003 | TBD | Not Executed | - |
| POST-004 | TBD | Not Executed | - |
| POST-005 | TBD | Not Executed | - |
| POST-006 | TBD | Not Executed | - |
| POST-007 | TBD | Not Executed | - |
| POST-008 | TBD | Not Executed | - |
| PATCH-001 | TBD | Not Executed | - |
| PATCH-002 | TBD | Not Executed | - |
| PATCH-003 | TBD | Not Executed | - |
| PATCH-004 | TBD | Not Executed | - |
| DELETE-001 | TBD | Not Executed | - |
| DELETE-002 | TBD | Not Executed | - |

---

## Notes

Expected HTTP status codes are intentionally not hard-coded for every test case before execution.

The actual status codes and error responses should be verified against the implemented Business Central API and recorded after test execution.

This prevents the test documentation from assuming behavior that has not yet been verified.
