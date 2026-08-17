# Customer API Test Cases

## Overview

This document contains the test cases designed for the **Customer REST API** developed in Microsoft Dynamics 365 Business Central.

## The test cases focus on validating API functionality, request and response data, business rules, and expected behavior for common customer operations. <br> 
[👉 Link to Google Drive with task](https://docs.google.com/spreadsheets/d/1iPMz0umkHpiaKKFS_dCT20KML73zl27V/edit?usp=sharing&ouid=106458769860966290112&rtpof=true&sd=true)

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

------------------------------------------------------------------------

## Preconditions

Before executing the test cases:

1.  Business Central is available.
2.  The `Customer API` table and `QA Customer API` page are deployed.
3.  The API endpoint is accessible.
4.  The API client is authenticated.
5.  The test company is available.
6.  Test data can be created and removed without affecting production data.

------------------------------------------------------------------------

## Test Data Mapping

Each test case uses a unique test data ID to keep test data traceable
and avoid ambiguity between scenarios.

| Test Case  | Test Data | Purpose                               |
|------------|-----------|---------------------------------------|
| GET-002    | `TD-001`  | Existing customer `CUST001`           |
| GET-003    | `TD-002`  | Non-existing customer `CUST102`       |
| POST-001   | `TD-003`  | Valid customer creation (`CUST101`)   |
| POST-002   | `TD-004`  | Minimum required customer data        |
| POST-003   | `TD-005`  | Missing required `No.`                |
| POST-004   | `TD-006`  | Duplicate customer number (`CUST001`) |
| POST-005   | `TD-007`  | Invalid customer type                 |
| POST-006   | `TD-008`  | Invalid customer status               |
| POST-007   | `TD-009`  | Invalid JSON data types               |
| POST-008   | `TD-010`  | Negative credit limit                 |
| PATCH-001  | `TD-011`  | Update customer name                  |
| PATCH-002  | `TD-012`  | Update multiple customer fields       |
| PATCH-003  | `TD-013`  | Update non-existing customer          |
| PATCH-004  | `TD-014`  | Update with invalid status            |
| DELETE-001 | `TD-015`  | Delete existing customer              |
| DELETE-002 | `TD-016`  | Delete non-existing customer          |

------------------------------------------------------------------------

# GET Test Cases

### GET-001 — Get All Customers

| Field                | Details                                                                                                                                                                                                                                                                                                                           |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Test Case ID         | GET-001                                                                                                                                                                                                                                                                                                                           |
| Test Objective       | Verify that the API successfully returns the customer collection.                                                                                                                                                                                                                                                                 |
| Preconditions        | API service is available and customer data exists in the system.                                                                                                                                                                                                                                                                  |
| HTTP Method          | `GET`                                                                                                                                                                                                                                                                                                                             |
| Endpoint             | `/api/v1/customers`                                                                                                                                                                                                                                                                                                               |
| Headers              | `Accept: application/json`                                                                                                                                                                                                                                                                                                        |
| Test Data            | N/A                                                                                                                                                                                                                                                                                                                               |
| Test Steps           | 1. Send a `GET` request to the customers endpoint.<br>2. Send the request without any query parameters.<br>3. Verify the response.                                                                                                                                                                                               |
| Expected Status Code | `200 OK`                                                                                                                                                                                                                                                                                                                          |
| Expected Result      | API returns 200 OK with a valid JSON response containing the customer collection. Each customer object contains the expected fields.                                                                                                                                                                                              |
| Actual Status Code   | `200 OK`                                                                                                                                                                                                                                                                                                                          |
| Actual Result        | API returned `200 OK` and successfully returned a list of customer records in valid JSON format. The response contained the expected customer fields including `id`, `number`, `displayName`, `phoneNumber`, and `city`. The returned customer data matched the corresponding records in Microsoft Dynamics 365 Business Central. |
| Test Status          | `PASS`                                                                                                                                                                                                                                                                                                                            |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
GET /api/v1/customers
```

**Response Status:**

``` text
200 OK
```

**Response Validation:**

- Response was returned successfully.
- Response contained the customer collection.
- Response was valid JSON.
- Customer records contained the expected fields.
- Returned customer data matched the corresponding records in Microsoft Dynamics 365 Business Central.

**Evidence:**

<img width="1074" height="902" alt="image" src="https://github.com/user-attachments/assets/43ad447c-565c-4f61-8f2b-898fea4cd5ee" />

The screenshot shows the Postman request, response status, and response body containing the customer collection.

------------------------------------------------------------------------

### GET-002 — Get Customer by Customer Number.

| Field                | Details                                                                                                                                                                                                                                    |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Test Case ID         | GET-002                                                                                                                                                                                                                                    |
| Test Objective       | Verify that a specific customer can be retrieved using a valid customer number.                                                                                                                                                            |
| Preconditions        | API service is available and the specified customer exists in the system.                                                                                                                                                                  |
| HTTP Method          | `GET`                                                                                                                                                                                                                                      |
| Endpoint             | `/api/v1/customers?$filter=no eq 'CUST001'`                                                                                                                                                                                                |
| Headers              | `Accept: application/json`                                                                                                                                                                                                                 |
| Test Data            | `TD-001` (`CUST001`)                                                                                                                                                                                                                       |
| Test Steps           | 1\. Send a `GET` request to the customer endpoint.<br>2. Provide a valid customer number (`CUST001`) as a filter.<br>3. Send the request.<br>4. Verify the response.                                                                       |
| Expected Status Code | `200 OK`                                                                                                                                                                                                                                   |
| Expected Result      | API returns the requested customer successfully. The returned customer number matches the requested customer number, and the customer data matches the corresponding record in Microsoft Dynamics 365 Business Central.                    |
| Actual Status Code   | `200 OK`                                                                                                                                                                                                                                   |
| Actual Result        | API returned `200 OK` and successfully returned customer `CUST001`. The returned customer number matched the requested customer number, and the customer data matched the corresponding record in Microsoft Dynamics 365 Business Central. |
| Test Status          | `PASS`                                                                                                                                                                                                                                     |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
GET /api/v1/customers?$filter=no eq 'CUST001'
```

**Response Status:**

``` text
200 OK
```

**Response Validation:**

- Response was returned successfully.
- Response contained the requested customer CUST001.
- Returned customer number matched the requested customer number.
- Returned customer data matched the corresponding record in Microsoft Dynamics 365 Business Central.

**Evidence:**

<img width="1054" height="846" alt="image" src="https://github.com/user-attachments/assets/5fe33f41-f6e6-4aa5-a239-4fe9cd7b3084" />

The screenshot shows the Postman request, response status, and response
body containing the requested customer CUST001.

------------------------------------------------------------------------

### GET-003 — Get Customer by Non-existing No.

| Field                    | Details                                                                                                                                                                                              |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | GET-003                                                                                                                                                                                              |
| **Test Objective**       | Verify that the API returns an empty customer collection when searching for a non-existing customer number.                                                                                          |
| **Preconditions**        | API service is available.                                                                                                                                                                            |
| **HTTP Method**          | `GET`                                                                                                                                                                                                |
| **Endpoint**             | `/api/v1/customers?$filter=no eq 'CUST102'`                                                                                                                                                          |
| **Headers**              | `Accept: application/json`                                                                                                                                                                           |
| **Test Data**            | `TD-002` (`CUST102`)                                                                                                                                                                                 |
| **Test Steps**           | 1. Send a `GET` request to the customer endpoint.<br>2. Provide a non-existing customer number (`CUST102`) as a filter.<br>3. Send the request.<br>4. Verify the response status and response body. |
| **Expected Status Code** | `200 OK`                                                                                                                                                                                             |
| **Expected Result**      | API returns `200 OK` with an empty `value` array because no customer matches the specified customer number. No existing customer record is returned.                                                 |
| **Actual Status Code**   | `200 OK`                                                                                                                                                                                             |
| **Actual Result**        | API returned `200 OK` with an empty `value` array. No customer matched the specified customer number `CUST102`, and no existing customer record was returned.                                        |
| **Test Status**          | `PASS`                                                                                                                                                                                               |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
GET /api/v1/customers?$filter=no eq 'CUST102'
```

**Response Status:**

``` text
200 OK
```

**Response Validation:**

- Response was returned successfully.
- Response status was 200 OK.
- Response contained an empty value array.
- No customer matched the specified customer number CUST102.
- No existing customer record was returned.

**Evidence:**

<img width="1666" height="367" alt="image" src="https://github.com/user-attachments/assets/b3410a6e-418f-46fb-b148-9b079d3f4e0c" />

<img width="1278" height="908" alt="image" src="https://github.com/user-attachments/assets/727f1b27-e154-431c-a65e-367eb4051444" />

The screenshots show the Postman request using the non-existing customer number CUST102 and the 200 OK response with an empty value array.

------------------------------------------------------------------------

# POST Test Cases

## POST-001 — Create Customer with Valid Data

| Field                    | Details                                                                                                                                                                                                                                                       |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-001                                                                                                                                                                                                                                                      |
| **Test Objective**       | Verify that a customer can be successfully created using valid data.                                                                                                                                                                                          |
| **Preconditions**        | API service is available and the customer number does not already exist.                                                                                                                                                                                      |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                        |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                                |
| **Test Data**            | `TD-003` (`CUST101`)                                                                                                                                                                                                                                          |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide valid customer data in the request body.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify the created customer in Business Central.                                          |
| **Expected Status Code** | `201 Created`                                                                                                                                                                                                                                                 |
| **Expected Result**      | API accepts the request and creates a new customer. The response contains the created customer and the stored data matches the submitted data.                                                                                                                |
| **Actual Status Code**   | `201 Created`                                                                                                                                                                                                                                                 |
| **Actual Result**        | API returned `201 Created` and successfully created customer `CUST101`. The response contained the created customer, and the stored customer data matched the submitted request. The customer record was verified in Microsoft Dynamics 365 Business Central. |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                        |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST /api/v1/customers
```

**Response Status:**

``` text
201 Created
```

**Response Validation:**

- Request was accepted successfully.
- API returned 201 Created.
- Response contained the created customer.
- Customer number CUST101 matched the submitted customer number.
- Submitted customer data matched the stored customer data.
- Customer CUST101 was successfully created and verified in Microsoft Dynamics 365 Business Central.

**Evidence:**

<img width="1664" height="692" alt="image" src="https://github.com/user-attachments/assets/5e89c8a1-0a4a-45b1-a02b-6539924f84f0" />
<img width="1117" height="895" alt="image" src="https://github.com/user-attachments/assets/aa3fec00-e4fb-4607-8af1-3b72e6a78fdf" />
<img width="1652" height="558" alt="image" src="https://github.com/user-attachments/assets/0b9ad3de-e028-49f1-ae53-09c62b96e2a8" />

## The screenshots show the Postman request, 201 Created response, created customer data, and the corresponding customer record in Microsoft Dynamics 365 Business Central.

## POST-002 — Create Customer with Minimum Data

| Field                    | Details                                                                                                                                                                                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-002                                                                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API can create a customer successfully when only the minimum required customer data is provided.                                                                                                                                         |
| **Preconditions**        | API service is available and the provided customer number does not already exist.                                                                                                                                                                        |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                   |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                           |
| **Test Data**            | `TD-004`                                                                                                                                                                                                                                                 |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide only the minimum required customer data.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that the customer record was created successfully.   |
| **Expected Status Code** | `201 Created`                                                                                                                                                                                                                                            |
| **Expected Result**      | API returns `201 Created`. A new customer record is created successfully using the minimum required data. Optional fields that were not provided use their configured default values or remain empty.                                                    |
| **Actual Status Code**   | `201 Created`                                                                                                                                                                                                                                            |
| **Actual Result**        | API returned `201 Created`. The customer was created successfully using the minimum required data. The created customer record was verified successfully. Optional fields that were not provided used their configured default values or remained empty. |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                   |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST /api/v1/customers
```

**Response Status:**

``` text
201 Created
```

**Response Validation:**

- Response was returned successfully.
- Response status was 201 Created.
- Customer was created successfully.
- The returned customer number/identifier matched the customer number provided by the test data.
- The created customer record was verified in Business Central.
- Optional fields were verified according to the configured default/empty-value behavior.

**Evidence:**

<img width="1263" height="907" alt="image" src="https://github.com/user-attachments/assets/b19808b6-5a97-4127-991c-d37b54a8afd6" />
<img width="1678" height="471" alt="image" src="https://github.com/user-attachments/assets/0cd4a7a6-7c34-4e90-ae9d-02ab542361df" />
The screenshots show the Postman request, 201 Created response, created customer data, and the corresponding customer record in Microsoft Dynamics 365 Business Central.

------------------------------------------------------------------------

## POST-003 — Missing Required Customer No.

| Field                    | Details                                                                                                                                                                                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-003                                                                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API rejects a customer creation request when the required customer number (`No.`) is missing.                                                                                                                                            |
| **Preconditions**        | 1. API service is available.<br>2. `No.` is defined as a required field according to the API/Business Central business requirement.<br>3. The test request does not provide a customer number.                                                          |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                   |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                           |
| **Test Data**            | `TD-005` — Customer data without the `No.` field.                                                                                                                                                                                                        |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Omit the required customer number (`No.`) from the request body.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that no customer record was created. |
| **Expected Status Code** | `4xx` validation error                                                                                                                                                                                                                                   |
| **Expected Result**      | API rejects the request because the required `No.` field is missing. An appropriate validation error is returned, and no customer record is created.                                                                                                     |
| **Actual Status Code**   | `201 Created`                                                                                                                                                                                                                                            |
| **Actual Result**        | API returned `201 Created` even though the required `No.` field was omitted from the request. A customer record was created successfully. This behavior does not match the expected validation rule for the test case.                                   |
| **Test Status**          | `FAIL`                                                                                                                                                                                                                                                   |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST /api/v1/customers
```

**Response Status:**

``` text
201 Created
```

**Response Validation:**

- Response was returned successfully.
- Response status was 201 Created.
- The request was accepted even though the required No. field was omitted.
- A customer record was created.
- The actual response does not match the expected 4xx validation error.
- The test case therefore failed.

**Evidence:**
<img width="1414" height="902" alt="image" src="https://github.com/user-attachments/assets/9fb0ddeb-3000-43e3-8e86-53eab19a64db" />
<img width="1677" height="403" alt="image" src="https://github.com/user-attachments/assets/317726e0-c1ff-4116-ac52-2186d72443eb" />

------------------------------------------------------------------------

## POST-004 — Duplicate Customer No.

| Field                    | Details                                                                                                                                                                                                                                                                  |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-004                                                                                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API prevents duplicate customer numbers.                                                                                                                                                                                                                 |
| **Preconditions**        | Customer `CUST001` already exists in the system.                                                                                                                                                                                                                         |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                                   |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                                           |
| **Test Data**            | `TD-006` — Existing customer number `CUST001`.                                                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide the existing customer number `CUST001`.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that the existing customer `CUST001` was not overwritten or modified. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                                                                                        |
| **Expected Result**      | Request is rejected because customer number `CUST001` already exists. An appropriate duplicate-key or validation error is returned. The existing customer record is not overwritten or modified, and no duplicate customer record is created.                            |
| **Actual Status Code**   | `400 Bad Request`                                                                                                                                                                                                                                                        |
| **Actual Result**        | API rejected the request because customer number `CUST001` already exists. An appropriate validation/duplicate-key error was returned. The existing customer `CUST001` was not overwritten or modified, and no duplicate customer record was created.                    |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                                   |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST /api/v1/customers
```

**Response Status:**

``` text
400 Bad Request
```

**Response Validation:**

- Response was returned with the expected 400 Bad Request status.
- The API rejected the request because customer number CUST001 already exists.
- An appropriate duplicate-key/validation error was returned.
- No duplicate customer record was created.
- The existing customer CUST001 was not overwritten or modified.

**Evidence:**
<img width="1399" height="836" alt="image" src="https://github.com/user-attachments/assets/2a323b4f-5f2a-4654-91b5-5d2daa59bde3" />

------------------------------------------------------------------------

## POST-005 — Invalid Customer Type

| Field                    | Details                                                                                                                                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-005                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API rejects a customer type that is not defined by the API.                                                                                                                              |
| **Preconditions**        | API service is available and the customer type field has defined valid values.                                                                                                                           |
| **HTTP Method**          | `POST`                                                                                                                                                                                                   |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                           |
| **Test Data**            | `TD-007`                                                                                                                                                                                                 |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported customer type, `Unknown`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that no customer was created. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                    |
| **Expected Result**      | Request is rejected, the customer is not created, and an appropriate validation error is returned.                                                                                                       |
| **Actual Result**        | TBD                                                                                                                                                                                                      |
| **Test Status**          | `Not Executed`                                                                                                                                                                                           |

------------------------------------------------------------------------

## POST-006 — Invalid Status

| Field                    | Details                                                                                                                                                                                           |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-006                                                                                                                                                                                          |
| **Test Objective**       | Verify that the API rejects an unsupported customer status.                                                                                                                                       |
| **Preconditions**        | API service is available and the status field has defined valid values.                                                                                                                           |
| **HTTP Method**          | `POST`                                                                                                                                                                                            |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                               |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                    |
| **Test Data**            | `TD-008`                                                                                                                                                                                          |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported status, `Pending`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that no customer was created. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                             |
| **Expected Result**      | Request is rejected, the customer is not created, and an appropriate validation error is returned.                                                                                                |
| **Actual Result**        | TBD                                                                                                                                                                                               |
| **Test Status**          | `Not Executed`                                                                                                                                                                                    |

------------------------------------------------------------------------

## POST-007 — Invalid JSON Data Type

| Field                    | Details                                                                                                                                                                                                                                              |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-007                                                                                                                                                                                                                                             |
| **Test Objective**       | Verify that the API rejects values with an incorrect JSON data type.                                                                                                                                                                                 |
| **Preconditions**        | API service is available and the API enforces the expected data types for each field.                                                                                                                                                                |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                               |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                                                                  |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                       |
| **Test Data**            | `TD-009`                                                                                                                                                                                                                                             |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a string value for `creditLimit` instead of a number.<br>3. Provide a string value for `marketingConsent` instead of a Boolean.<br>4. Send the request.<br>5. Verify the response. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                                                |
| **Expected Result**      | Request is rejected. `creditLimit` does not accept a string when a numeric value is expected, and `marketingConsent` does not accept a string when a Boolean value is expected. No invalid customer record is created.                               |
| **Actual Result**        | TBD                                                                                                                                                                                                                                                  |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                                       |

------------------------------------------------------------------------

## POST-008 — Negative Credit Limit

| Field                    | Details                                                                                                                                                                                                      |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-008                                                                                                                                                                                                     |
| **Test Objective**       | Verify the API behavior when a negative credit limit is submitted.                                                                                                                                           |
| **Preconditions**        | API service is available.                                                                                                                                                                                    |
| **HTTP Method**          | `POST`                                                                                                                                                                                                       |
| **Endpoint**             | `/api/v1/customers`                                                                                                                                                                                          |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                               |
| **Test Data**            | `TD-010`                                                                                                                                                                                                     |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a negative value for `creditLimit`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify whether a customer record was created. |
| **Expected Status Code** | `4xx` if the business rule requires `creditLimit >= 0`                                                                                                                                                       |
| **Expected Result**      | Request is rejected if the business rule requires `creditLimit >= 0`. No invalid customer record is created.                                                                                                 |
| **Actual Result**        | TBD                                                                                                                                                                                                          |
| **Test Status**          | `Not Executed`                                                                                                                                                                                               |

> Note: A Decimal field does not automatically reject negative values.
> This test requires an explicit Business Central validation rule if a
> rejection is expected.

------------------------------------------------------------------------

# PATCH Test Cases

## PATCH-001 — Update Customer Name

| Field                    | Details                                                                                                                                                                                             |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | PATCH-001                                                                                                                                                                                           |
| **Test Objective**       | Verify that an existing customer's name can be updated.                                                                                                                                             |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                         |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                             |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                      |
| **Test Data**            | `TD-011`                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide a new customer name.<br>3. Send the request.<br>4. Verify the response.<br>5. Retrieve the customer and verify the updated name. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                               |
| **Expected Result**      | API accepts the request. Customer name is updated, other customer fields remain unchanged, and Business Central displays the updated value.                                                         |
| **Actual Result**        | TBD                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                      |

------------------------------------------------------------------------

## PATCH-002 — Update Multiple Customer Fields

| Field                    | Details                                                                                                                                                                                                    |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | PATCH-002                                                                                                                                                                                                  |
| **Test Objective**       | Verify that multiple customer fields can be updated in a single request.                                                                                                                                   |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                    |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                                  |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                             |
| **Test Data**            | `TD-012`                                                                                                                                                                                                   |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide new values for name, phone number, and city.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify the updated customer data. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                                      |
| **Expected Result**      | API accepts the request. All specified fields are updated, while fields not included in the request remain unchanged. Updated data matches Business Central.                                               |
| **Actual Result**        | TBD                                                                                                                                                                                                        |
| **Test Status**          | `Not Executed`                                                                                                                                                                                             |

------------------------------------------------------------------------

## PATCH-003 — Update Non-existing Customer

| Field                    | Details                                                                                                                                                                                             |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | PATCH-003                                                                                                                                                                                           |
| **Test Objective**       | Verify the API behavior when attempting to update a customer that does not exist.                                                                                                                   |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                      |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                             |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                      |
| **Test Data**            | `TD-013`                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Provide an update value.<br>4. Send the request.<br>5. Verify the response. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                               |
| **Expected Result**      | Request is rejected. No new customer is created, and an appropriate error response is returned.                                                                                                     |
| **Actual Result**        | TBD                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                      |

------------------------------------------------------------------------

## PATCH-004 — Update Customer with Invalid Status

| Field                    | Details                                                                                                                                                                                                                 |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | PATCH-004                                                                                                                                                                                                               |
| **Test Objective**       | Verify that an existing customer cannot be updated with an unsupported status.                                                                                                                                          |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                             |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                 |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                                               |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                          |
| **Test Data**            | `TD-014`                                                                                                                                                                                                                |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the unsupported status `Pending`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that the existing customer data remains unchanged. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                   |
| **Expected Result**      | Request is rejected. Existing customer data remains unchanged, and an appropriate validation error is returned.                                                                                                         |
| **Actual Result**        | TBD                                                                                                                                                                                                                     |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                          |

------------------------------------------------------------------------

# DELETE Test Cases

## DELETE-001 — Delete Existing Customer

| Field                    | Details                                                                                                                                                                                                                                                              |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | DELETE-001                                                                                                                                                                                                                                                           |
| **Test Objective**       | Verify that an existing customer can be deleted.                                                                                                                                                                                                                     |
| **Preconditions**        | API service is available and the test customer exists.                                                                                                                                                                                                               |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                                                             |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                                                                                            |
| **Headers**              | `Accept: application/json`                                                                                                                                                                                                                                           |
| **Test Data**            | `TD-015`                                                                                                                                                                                                                                                             |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the existing customer identifier.<br>3. Send the request.<br>4. Verify the response.<br>5. Send a `GET` request for the deleted customer.<br>6. Verify that the customer is no longer available. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                                                                                                |
| **Expected Result**      | API accepts the delete request. Customer is removed from the Customer API table, and a subsequent `GET` request does not return the deleted customer.                                                                                                                |
| **Actual Result**        | TBD                                                                                                                                                                                                                                                                  |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                                                       |

------------------------------------------------------------------------

## DELETE-002 — Delete Non-existing Customer

| Field                    | Details                                                                                                                                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | DELETE-002                                                                                                                                                                                                                          |
| **Test Objective**       | Verify the API behavior when attempting to delete a customer that does not exist.                                                                                                                                                   |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                                                      |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                            |
| **Endpoint**             | `/api/v1/customers({id})`                                                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`                                                                                                                                                                                                          |
| **Test Data**            | `TD-016`                                                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that existing customer records remain unchanged. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                               |
| **Expected Result**      | Request does not delete any record. An appropriate error response is returned, and existing customer records remain unchanged.                                                                                                      |
| **Actual Result**        | TBD                                                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                      |

------------------------------------------------------------------------

# Test Case Summary

| Category  | Test Cases |
|-----------|-----------:|
| GET       |          3 |
| POST      |          8 |
| PATCH     |          4 |
| DELETE    |          2 |
| **Total** |     **17** |

------------------------------------------------------------------------

# Test Types Covered

| Test Type              | Examples                                           |
|------------------------|----------------------------------------------------|
| Positive Testing       | Valid GET, POST, PATCH, DELETE                     |
| Negative Testing       | Invalid data, duplicate data, non-existing records |
| Boundary Testing       | Minimum data, zero/negative credit limit           |
| Data Validation        | Enum and JSON data types                           |
| Required Field Testing | Missing customer information                       |
| CRUD Testing           | Create, Read, Update, Delete                       |

------------------------------------------------------------------------

## Notes

Expected HTTP status codes are specified where the expected behavior is
defined by the API or business requirement. For unexecuted cases, status
codes may remain at the HTTP class level (for example, `2xx` or `4xx`)
until execution confirms the exact response. After execution, record the
exact actual status code and error response. If the expected status is
defined by the requirement, keep that expectation unchanged and mark the
test `FAIL` when the actual behavior does not meet it.
