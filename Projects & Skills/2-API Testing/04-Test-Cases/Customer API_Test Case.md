# Customer API Test Cases

## Overview

This document contains the test cases designed for the **Customer REST API** developed in Microsoft Dynamics 365 Business Central.

The test cases focus on validating API functionality, request and response data, business rules, and expected behavior for common customer operations. <br> 
[👉 Link to Google Drive with task](https://docs.google.com/spreadsheets/d/1ZsHqiaHn-YSTEebcH8itGlkDoWNMotcA/edit?usp=sharing&ouid=106458769860966290112&rtpof=true&sd=true)

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
| GET-001    | `N/A`     | Get All Customers                     |
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

## GET-001 — Get All Customers

| Field                | Details                                                                                                                                                                                                                                                                                                                           |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Test Case ID         | GET-001                                                                                                                                                                                                                                                                                                                           |
| Test Objective       | Verify that the API successfully returns the customer collection.                                                                                                                                                                                                                                                                 |
| Preconditions        | API service is available and customer data exists in the system.                                                                                                                                                                                                                                                                  |
| HTTP Method          | `GET`                                                                                                                                                                                                                                                                                                                             |
| Endpoint             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                                                                                               |
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
GET http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
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

## GET-002 — Get Customer by Customer Number

| Field                | Details                                                                                                                                                                                                                                    |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Test Case ID         | GET-002                                                                                                                                                                                                                                    |
| Test Objective       | Verify that a specific customer can be retrieved using a valid customer number.                                                                                                                                                            |
| Preconditions        | API service is available and the specified customer exists in the system.                                                                                                                                                                  |
| HTTP Method          | `GET`                                                                                                                                                                                                                                      |
| Endpoint             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers?$filter= no eq 'CUST001'`                                                                                                                                                                                                |
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
GET http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers?$filter= no eq 'CUST001''
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

## GET-003 — Get Customer by Non-existing No.

| Field                    | Details                                                                                                                                                                                              |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | GET-003                                                                                                                                                                                              |
| **Test Objective**       | Verify that the API returns an empty customer collection when searching for a non-existing customer number.                                                                                          |
| **Preconditions**        | API service is available.                                                                                                                                                                            |
| **HTTP Method**          | `GET`                                                                                                                                                                                                |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers?$filter= no eq 'CUST102'`                                                                                                                                                          |
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
GET http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers?$filter= no eq 'CUST102''
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
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                           |
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
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
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

The screenshots show the Postman request, 201 Created response, created customer data, and the corresponding customer record in Microsoft Dynamics 365 Business Central.

## POST-002 — Create Customer with Minimum Data

| Field                    | Details                                                                                                                                                                                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Test Case ID**         | POST-002                                                                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API can create a customer successfully when only the minimum required customer data is provided.                                                                                                                                         |
| **Preconditions**        | API service is available and the provided customer number does not already exist.                                                                                                                                                                        |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                   |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                      |
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
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
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
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                           |
| **Test Data**            | `TD-005` — Customer data without the `No.` field.                                                                                                                                                                                                        |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Omit the required customer number (`No.`) from the request body.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that no customer record was created. |
| **Expected Status Code** | `400 Bad Request` validation error                                                                                                                                                                                                                                   |
| **Expected Result**      | API rejects the request because the required `No.` field is missing. An appropriate validation error is returned, and no customer record is created.                                                                                                     |
| **Actual Status Code**   | `201 Created`                                                                                                                                                                                                                                            |
| **Actual Result**        | API returned `201 Created` even though the required `No.` field was omitted from the request. A customer record was created successfully. This behavior does not match the expected validation rule for the test case.                                   |
| **Test Status**          | `FAIL`                                                                                                                                                                                                                                                   |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
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
- The actual response does not match the expected 400 Bad Request validation error.
- The test case therefore failed.
- The customer record created during this test should be removed after execution to avoid polluting later test runs, since it was an unintended side effect of a validation failure.

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
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                                      |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                                           |
| **Test Data**            | `TD-006` — Existing customer number `CUST001`.                                                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide the existing customer number `CUST001`.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that the existing customer `CUST001` was not overwritten or modified. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                                                                                        |
| **Expected Result**      | Request is rejected because customer number `CUST001` already exists. An appropriate duplicate-key or validation error is returned. The existing customer record is not overwritten or modified, and no duplicate customer record is created.                            |
| **Actual Status Code**   | `400 The record in table Customer API already exists. Identification fields and values: Customer No.='CUST001'`                                                                                                                                                                                                                                                        |
| **Actual Result**        | API rejected the request because customer number `CUST001` already exists. An appropriate validation/duplicate-key error was returned. The existing customer `CUST001` was not overwritten or modified, and no duplicate customer record was created.                    |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                                   |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
```

**Response Status:**

``` text
400 The record in table Customer API already exists. Identification fields and values: Customer No.='CUST001'
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

| Field                    | Details                                                                                                                                                                                                                     |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-005                                                                                                                                                                                                                    |
| **Test Objective**       | Verify that the API rejects a customer creation request when `customerType` is set to a value outside the defined enum (`Individual`, `Company`).                                                                          |
| **Preconditions**        | API service is available and the `customerType` field is defined with a fixed set of valid values (`Individual`, `Company`).                                                                                               |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                      |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                         |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                              |
| **Test Data**            | `TD-007` — Customer data with `customerType` set to `Unknown`.                                                                                                                                                             |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported customer type, `Unknown`.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that no customer record was created. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                     |
| **Expected Result**      | API rejects the request because `Unknown` is not a valid `customerType`. An appropriate validation error is returned, and no customer record is created.                                                                    |
| **Actual Status Code**   | `400 Bad Request`                                                                                                                                                                                                           |
| **Actual Result**        | API returned `400 Bad Request` because `customerType` was set to `Unknown`, which is not a supported value. No customer record was created.                                                                                  |
| **Test Status**          | `PASS`                                                                                                                                                                                                                      |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
```

**Response Status:**

``` text
400 Bad Request
```

**Response Validation:**

- Response was returned successfully.
- Response status was 400 Bad Request.
- The API rejected the request because `customerType` was `Unknown`.
- No customer record was created.
- The response behavior matched the expected enum validation.

**Evidence:**

<img width="1432" height="827" alt="image" src="https://github.com/user-attachments/assets/0999b483-fe0d-430f-afa0-0809ff719ba7" />

------------------------------------------------------------------------

## POST-006 — Invalid Status

| Field                    | Details                                                                                                                                                                                                                     |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-006                                                                                                                                                                                                                    |
| **Test Objective**       | Verify that the API rejects a customer creation request when `status` is set to an unsupported value.                                                                                                                       |
| **Preconditions**        | API service is available and the `status` field is defined with a fixed set of valid values.                                                                                                                                |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                      |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                         |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                              |
| **Test Data**            | `TD-008` — Customer data with `status` set to `Pending`.                                                                                                                                                                   |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported status, `Pending`.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that no customer record was created. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                    |
| **Expected Result**      | API rejects the request because `Pending` is not a supported `status` value. An appropriate validation error is returned, and no customer record is created.                                                                |
| **Actual Status Code**   | `400 Bad Request`                                                                                                                                                                                                           |
| **Actual Result**        | API returned `400 Bad Request` because `status` was set to `Pending`, which is not a supported value. No customer record was created.                                                                                       |
| **Test Status**          | `PASS`                                                                                                                                                                                                                      |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
```

**Response Status:**

``` text
400 Bad Request
```

**Response Validation:**

- Response was returned successfully.
- Response status was 400 Bad Request.
- The API rejected the request because `status` was `Pending`.
- No customer record was created.
- The response behavior matched the expected enum validation.

**Evidence:**

<img width="1436" height="845" alt="image" src="https://github.com/user-attachments/assets/93609c26-d815-4cc2-ae2d-1c8c251b8844" />

------------------------------------------------------------------------

## POST-007 — Invalid JSON Data Type

| Field                    | Details                                                                                                                                                                                                                                                                                                                            |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-007                                                                                                                                                                                                                                                                                                                           |
| **Test Objective**       | Verify that the API rejects values with an incorrect JSON data type.                                                                                                                                                                                                                                                               |
| **Preconditions**        | API service is available and the API enforces the expected data types for each field.                                                                                                                                                                                                                                              |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                                                                                             |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                                                                                                |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                                                                                                     |
| **Test Data**            | `TD-009`                                                                                                                                                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a string value for `creditLimit` instead of a number.<br>3. Provide a string value for `marketingConsent` instead of a Boolean.<br>4. Send the request.<br>5. Verify the response status and response body.<br>6. Verify whether the customer record was created. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                                                                                                                                                              |
| **Expected Result**      | Request is rejected because `creditLimit` does not accept a string when a numeric value is expected, and `marketingConsent` does not accept a string when a Boolean value is expected. An appropriate validation error is returned, and no customer record is created.                                                             |
| **Actual Status Code**   | `400 Bad Request`                                                                                                                                                                                                                                                                                                                  |
| **Actual Result**        | API returned `400 Bad Request` when invalid JSON data types were provided. The request was rejected because `creditLimit` was provided as a string instead of a numeric value and `marketingConsent` was provided as a string instead of a Boolean value. No customer record was created.                                          |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                                                                                             |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
```

**Response Status:**

``` text
400 Bad Request
```

**Response Validation:**

- Response was returned with 400 Bad Request.
- The request was rejected by the API.
- creditLimit with an incorrect string data type was rejected.
- marketingConsent with an incorrect string data type was rejected.
- No customer record was created.
- The actual behavior matched the expected validation response.

**Evidence:**

<img width="1450" height="869" alt="image" src="https://github.com/user-attachments/assets/54a1f1cd-216d-409a-9e63-a872fbe019ac" />

------------------------------------------------------------------------

## POST-008 — Negative Credit Limit

| Field                    | Details                                                                                                                                                                                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Test Case ID**         | POST-008                                                                                                                                                                                                                                               |
| **Test Objective**       | Verify that the API rejects a customer request containing a negative credit limit.                                                                                                                                                                     |
| **Preconditions**        | API service is available and the customer data is otherwise valid. This test assumes a business rule requiring `creditLimit >= 0`; this assumption has not been independently confirmed against the Business Central validation logic (AL code) prior to execution.                                                                                                          |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                                 |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers`                                                                                                                                                                                                                                    |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                         |
| **Test Data**            | `TD-010`                                                                                                                                                                                                                                               |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a negative credit limit value.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify whether the customer record was created.                      |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                                                                                  |
| **Expected Result**      | Request is rejected because the credit limit is negative and violates the configured business rule. An appropriate validation error is returned, and no customer record is created.                                                                    |
| **Actual Status Code**   | `201 Created`                                                                                                                                                                                                                                          |
| **Actual Result**        | API returned `201 Created` even though a negative credit limit was provided. The request was accepted and a customer record was created. This does not match the expected result *if* a `creditLimit >= 0` business rule is required. |
| **Test Status**          | `FAIL`                                                                                                                                                                                                                                                 |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
POST http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers
```

**Response Status:**

``` text
201 Created
```

**Response Validation:**

- Response was returned successfully.
- Response status was 201 Created.
- The request was accepted by the API.
- The customer record was created despite the negative credit limit.
- No validation error was returned.
- the `creditLimit >= 0` business rule requirement should be verified against Business Central validation logic before this result is treated as final.
- The customer record created during this test should be removed after execution to avoid polluting later test runs, since it was an unintended side effect of the validation not behaving as assumed.

**Evidence:**

<img width="1380" height="889" alt="image" src="https://github.com/user-attachments/assets/03154d83-ae43-4016-adae-d768cc1b4ab6" />

------------------------------------------------------------------------

# PATCH Test Cases

## PATCH-001 — Update Customer Name

| Field                    | Details                                                                                                                                                                                                                     |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-001                                                                                                                                                                                                                   |
| **Test Objective**       | Verify that an existing customer's name can be updated.                                                                                                                                                                     |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                                 |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                     |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST001')`                                                                                                                                                                                                   |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                              |
| **Test Data**            | `TD-011`                                                                                                                                                                                                                    |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide a new customer name.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Retrieve the customer and verify the updated name. |
| **Expected Status Code** | `200 OK`                                                                                                                                                                                                                       |
| **Expected Result**      | API accepts the request. Customer name is updated, other customer fields remain unchanged, and Business Central displays the updated value.                                                                                 |
| **Actual Status Code**   | `200 OK`                                                                                                                                                                                                                    |
| **Actual Result**        | API returned `200 OK`. The customer name was updated successfully. Other customer fields remained unchanged, and the updated customer name was verified successfully in Business Central.                                   |
| **Test Status**          | `PASS`                                                                                                                                                                                                                      |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
PATCH http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST001')
```

**Response Status:**

``` text
200 OK
```

**Response Validation:**

-  Response was returned successfully.
- Response status was 200 OK.
- The customer name was updated successfully.
- Other customer fields remained unchanged.
- The updated customer name was verified successfully in Business Central.

**Evidence:**

<img width="1687" height="217" alt="image" src="https://github.com/user-attachments/assets/a6eedbe1-3d52-4af8-afb8-43462433fb2d" />
<img width="1410" height="812" alt="image" src="https://github.com/user-attachments/assets/622ddc03-9893-4e91-ba85-bd8336e48bbd" />
<img width="1655" height="228" alt="image" src="https://github.com/user-attachments/assets/541c53cf-859f-42c5-82f6-0b03ebb27fe7" />

------------------------------------------------------------------------

## PATCH-002 — Update Multiple Customer Fields

| Field                    | Details                                                                                                                                                                                                                                             |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-002                                                                                                                                                                                                                                           |
| **Test Objective**       | Verify that multiple customer fields can be updated in a single request.                                                                                                                                                                            |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                                                         |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                                             |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST103')`                                                                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                      |
| **Test Data**            | `TD-012`                                                                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide new values for name, phone number, and city.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify the updated customer data.                  |
| **Expected Status Code** | `200 OK`                                                                                                                                                                                                                                               |
| **Expected Result**      | API accepts the request. All specified fields are updated, while fields not included in the request remain unchanged. Updated data matches Business Central.                                                                                        |
| **Actual Status Code**   | `200 OK`                                                                                                                                                                                                                                            |
| **Actual Result**        | API returned `200 OK`. The customer name, phone number, and city were updated successfully in a single request. Fields not included in the request remained unchanged, and the updated customer data was verified successfully in Business Central. |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                              |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
PATCH http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST103')
```

**Response Status:**

``` text
200 OK
```

**Response Validation:**

- Response was returned successfully.
- Response status was 200 OK.
- Customer name was updated successfully.
- Phone number was updated successfully.
- City was updated successfully.
- Fields not included in the request remained unchanged.
- The updated customer data was verified successfully in Business Central.

**Evidence:**

<img width="1729" height="346" alt="image" src="https://github.com/user-attachments/assets/bdfb3b41-130c-4f11-a0c7-0ab36d55e243" />
<img width="1392" height="865" alt="image" src="https://github.com/user-attachments/assets/5153a19e-92c4-4396-a20d-80d03368bb87" />
<img width="1667" height="312" alt="image" src="https://github.com/user-attachments/assets/84596299-4c14-47f9-9c3c-7fb7fcbb7fdb" />

------------------------------------------------------------------------

## PATCH-003 — Update Non-existing Customer

| Field                    | Details                                                                                                                                                                                                                     |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-003                                                                                                                                                                                                                   |
| **Test Objective**       | Verify the API behavior when attempting to update a customer that does not exist.                                                                                                                                           |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                                              |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                     |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('C99999')`                                                                                                                                                                                                   |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                              |
| **Test Data**            | `TD-013`                                                                                                                                                                                                                    |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Provide an update value.<br>4. Send the request.<br>5. Verify the response status and response body. |
| **Expected Status Code** | `404 Not Found`                                                                                                                                                                                                                       |
| **Expected Result**      | Request is rejected because the specified customer does not exist. An appropriate error response is returned, and no new customer is created.                                                                               |
| **Actual Status Code**   | `404 Not Found`                                                                                                                                                                                                             |
| **Actual Result**        | API returned `404 Not Found` because customer `C99999` does not exist. The update request was rejected, and no new customer record was created.                                                                             |
| **Test Status**          | `PASS`                                                                                                                                                                                                                      |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
PATCH http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('C99999')
```

**Response Status:**

``` text
404 Not Found
```

**Response Validation:**

- Response was returned successfully.
- Response status was 404 Not Found.
- The API rejected the update request because customer C99999 does not exist.
- No new customer record was created.
- The response behavior matched the expected result.

**Evidence:**

<img width="1420" height="843" alt="image" src="https://github.com/user-attachments/assets/238d6943-ab9b-45d3-a03b-3dc9188002b3" />

------------------------------------------------------------------------

## PATCH-004 — Update Customer with Invalid Status

| Field                    | Details                                                                                                                                                                                                                                         |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-004                                                                                                                                                                                                                                       |
| **Test Objective**       | Verify that an existing customer cannot be updated with an unsupported status.                                                                                                                                                                  |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                                                     |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                                         |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST001')`                                                                                                                                                                                                                       |
| **Headers**              | `Accept: application/json`<br>`Content-Type: application/json`                                                                                                                                                                                  |
| **Test Data**            | `TD-014`                                                                                                                                                                                                                                        |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the unsupported status `Pending`.<br>3. Send the request.<br>4. Verify the response status and response body.<br>5. Verify that the existing customer data remains unchanged. |
| **Expected Status Code** | `400 Bad Request`                                                                                                                                                                                                                                           |
| **Expected Result**      | Request is rejected because `Pending` is not a supported customer status. An appropriate validation error is returned, and the existing customer data remains unchanged.                                                                        |
| **Actual Status Code**   | `400 Bad Request`                                                                                                                                                                                                                               |
| **Actual Result**        | API returned `400 Bad Request` because the provided status `Pending` is not supported. The update request was rejected, and the existing customer data remained unchanged.                                                                      |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                          |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
PATCH http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST001')
```

**Response Status:**

``` text
400 Bad Request
```

**Response Validation:**

- Response was returned successfully.
- Response status was 400 Bad Request.
- The API rejected the request because Pending is not a supported customer status.
- The existing customer data remained unchanged.
- No invalid status was saved to the customer record.
- The response behavior matched the expected result.

**Evidence:**

<img width="1418" height="728" alt="image" src="https://github.com/user-attachments/assets/00e5e0bd-66cb-4a7b-af85-fc5f34087ee1" />

------------------------------------------------------------------------

# DELETE Test Cases

## DELETE-001 — Delete Existing Customer

| Field                    | Details                                                                                                                                                                                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | DELETE-001                                                                                                                                                                                                                                                          |
| **Test Objective**       | Verify that an existing customer can be deleted.                                                                                                                                                                                                                    |
| **Preconditions**        | API service is available and customer `CUST108` exists in the system.                                                                                                                                                                                               |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                                                            |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST108')`                                                                                                                                                                                                                                           |
| **Headers**              | `Accept: application/json`                                                                                                                                                                                                                                          |
| **Test Data**            | `TD-015` — Existing customer `CUST108`, created specifically for this deletion test.                                                                                                                                                                               |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the existing customer identifier `CUST108`.<br>3. Send the request.<br>4. Verify the response.<br>5. Send a `GET` request for the deleted customer.<br>6. Verify that the customer is no longer available. |
| **Expected Status Code** | `204 No Content`                                                                                                                                                                                                                                                               |
| **Expected Result**      | API accepts the delete request. Customer `CUST108` is removed from the Customer API table, and a subsequent `GET` request does not return the deleted customer.                                                                                                     |
| **Actual Status Code**   | `204 No Content`                                                                                                                                                                                                                                                    |
| **Actual Result**        | API returned `204 No Content` after the DELETE request for customer `CUST108` was submitted. The customer was successfully deleted, and a subsequent `GET` request confirmed that `CUST108` was no longer available.                                                            |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                                              |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
DELETE http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('CUST108')
```

**Response Status:**

``` text
204 No Content
```

**Response Validation:**

- DELETE request was processed successfully for customer CUST108.
- Response status was 204 No Content.
- Customer CUST108 was successfully deleted.
- A subsequent GET request was used to verify the deletion.
- Customer CUST108 was no longer available.
- The actual behavior matched the expected delete behavior.

**Evidence:**

<img width="1768" height="433" alt="image" src="https://github.com/user-attachments/assets/0e57db94-d34a-475b-96c5-038af3f01cc3" />
<img width="1445" height="831" alt="image" src="https://github.com/user-attachments/assets/060b3ce9-a483-48b5-b322-2d4d22d695e7" />
<img width="1732" height="364" alt="image" src="https://github.com/user-attachments/assets/564a9e11-7db7-448b-9e63-f6a30524a3e4" />

------------------------------------------------------------------------

## DELETE-002 — Delete Non-existing Customer

| Field                    | Details                                                                                                                                                                                                                               |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | DELETE-002                                                                                                                                                                                                                            |
| **Test Objective**       | Verify the API behavior when attempting to delete a customer that does not exist.                                                                                                                                                     |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                                                        |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                              |
| **Endpoint**             | `http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('C99999')`                                                                                                                                                                                                             |
| **Headers**              | `Accept: application/json`                                                                                                                                                                                                            |
| **Test Data**            | `TD-016`                                                                                                                                                                                                                              |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that existing customer records remain unchanged.    |
| **Expected Status Code** | `404 Not Found`                                                                                                                                                                                                                                 |
| **Expected Result**      | Request does not delete any record. An appropriate error response is returned, and existing customer records remain unchanged.                                                                                                        |
| **Actual Status Code**   | `404 Not Found`                                                                                                                                                                                                                       |
| **Actual Result**        | API returned `404 Not Found` when attempting to delete the non-existing customer `C99999`. No customer record was deleted, and existing customer records remained unchanged. The actual behavior matched the expected error handling. |
| **Test Status**          | `PASS`                                                                                                                                                                                                                                |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

``` http
DELETE http://localhost:7148/BC270/api/donut/qa/v1.0/companies(f2f066a8-f293-f011-9c69-00155ddaf077)/customers('C99999')
```

**Response Status:**

``` text
404 Not Found
```

**Response Validation:**

- DELETE request was sent for the non-existing customer C99999.
- Response status was 404 Not Found.
- The API correctly rejected the delete request.
- No customer record was deleted.
- Existing customer records remained unchanged.
- The actual behavior matched the expected error handling.

**Evidence:**

<img width="727" height="407" alt="image" src="https://github.com/user-attachments/assets/b0da4e30-c256-49d5-bd5c-e1781a484ebc" />

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