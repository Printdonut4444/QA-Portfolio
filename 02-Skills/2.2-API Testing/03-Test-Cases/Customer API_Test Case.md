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

### GET-001 — Get All Customers

| Field                | Details                                                                                                                                                                                                                                                                                                                           |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Case ID         | GET-001                                                                                                                                                                                                                                                                                                                           |
| Test Objective       | Verify that the API returns a list of all customers successfully.                                                                                                                                                                                                                                                                 |
| Preconditions        | API service is available and customer data exists in the system.                                                                                                                                                                                                                                                                  |
| HTTP Method          | `GET`                                                                                                                                                                                                                                                                                                                             |
| Endpoint             | `/api/v1/customers`                                                                                                                                                                                                                                                                                                               |
| Headers              | `Content-Type: application/json`                                                                                                                                                                                                                                                                                                  |
| Test Data            | N/A                                                                                                                                                                                                                                                                                                                               |
| Test Steps           | 1. Send a `GET` request to the customers endpoint.<br>2. Send the request without any query parameters.<br>3. Verify the response.                                                                                                                                                                                                |
| Expected Status Code | `200 OK`                                                                                                                                                                                                                                                                                                                          |
| Expected Result      | API returns a successful response containing a list of customers. Each customer object contains the expected fields and the response is valid JSON.                                                                                                                                                                               |
| Actual Status Code   | `200 OK`                                                                                                                                                                                                                                                                                                                          |
| Actual Result        | API returned `200 OK` and successfully returned a list of customer records in valid JSON format. The response contained the expected customer fields including `id`, `number`, `displayName`, `phoneNumber`, and `city`. The returned customer data matched the corresponding records in Microsoft Dynamics 365 Business Central. |
| Test Status          | `PASS`                                                                                                                                                                                                                                                                                                                            |

### Test Execution Evidence

**Execution Tool:** Postman

**Request:**

```http
GET /api/v1/customers
```

**Response Status:**

```text
200 OK
```

**Response Validation:**

* Response was returned successfully.
* Response contained the customer collection.
* Response was valid JSON.
* Customer records contained the expected fields.
* Returned customer data matched the corresponding records in Microsoft Dynamics 365 Business Central.

**Evidence:**

<img width="1074" height="902" alt="image" src="https://github.com/user-attachments/assets/43ad447c-565c-4f61-8f2b-898fea4cd5ee" />

The screenshot shows the Postman request, response status, and response body containing the customer collection.

---

## GET-002 — Get Customer by No.

| Field                    | Details                                                                                                                                                                           |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | GET-002                                                                                                                                                                           |
| **Test Objective**       | Verify that a specific customer can be retrieved using a valid customer identifier.                                                                                               |
| **Preconditions**        | API service is available and the specified customer exists in the system.                                                                                                         |
| **HTTP Method**          | `GET`                                                                                                                                                                             |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                  |
| **Test Data**            | `TD-001`                                                                                                                                                                          |
| **Test Steps**           | 1. Send a `GET` request to the customer endpoint.<br>2. Provide a valid customer identifier.<br>3. Send the request.<br>4. Verify the response.                                   |
| **Expected Status Code** | `200 OK`                                                                                                                                                                          |
| **Expected Result**      | API returns the requested customer successfully. The returned customer number matches the requested identifier and the customer data matches the data stored in Business Central. |
| **Actual Result**        | TBD                                                                                                                                                                               |
| **Test Status**          | `Not Executed`                                                                                                                                                                    |

**Expected Result**

- API returns a successful response.
- The response contains the requested customer.
- The returned customer number matches the requested record.
- Customer data matches Business Central.

---

## GET-003 — Get Non-existing Customer

| Field                    | Details                                                                                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Test Case ID**         | GET-003                                                                                                                                                |
| **Test Objective**       | Verify that the API handles a request for a customer that does not exist.                                                                              |
| **Preconditions**        | API service is available.                                                                                                                              |
| **HTTP Method**          | `GET`                                                                                                                                                  |
| **Endpoint**             | `/customers({id})`                                                                                                                                     |
| **Headers**              | `Content-Type: application/json`                                                                                                                       |
| **Test Data**            | `TD-002`                                                                                                                                               |
| **Test Steps**           | 1. Send a `GET` request to the customer endpoint.<br>2. Provide a non-existing customer identifier.<br>3. Send the request.<br>4. Verify the response. |
| **Expected Status Code** | `4xx`                                                                                                                                                  |
| **Expected Result**      | API returns an appropriate error response and does not return an existing customer record.                                                             |
| **Actual Result**        | TBD                                                                                                                                                    |
| **Test Status**          | `Not Executed`                                                                                                                                         |

**Expected Result**

- API does not return an existing customer.
- An appropriate error response is returned.
- No customer record is created or modified.

---

# POST Test Cases

## POST-001 — Create Customer with Valid Data

| Field                    | Details                                                                                                                                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-001                                                                                                                                                                                                            |
| **Test Objective**       | Verify that a customer can be successfully created using valid data.                                                                                                                                                |
| **Preconditions**        | API service is available and the customer number does not already exist.                                                                                                                                            |
| **HTTP Method**          | `POST`                                                                                                                                                                                                              |
| **Endpoint**             | `/customers`                                                                                                                                                                                                        |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                    |
| **Test Data**            | `TD-003`                                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide valid customer data in the request body.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify the created customer in Business Central. |
| **Expected Status Code** | `201 Created`*                                                                                                                                                                                                      |
| **Expected Result**      | API accepts the request and creates a new customer. The response contains the created customer and the stored data matches the submitted data.                                                                      |
| **Actual Result**        | TBD                                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                      |

**Expected Result**

- API accepts the request.
- A successful creation response is returned.
- The response contains the created customer.
- Customer `CUST101` exists in Business Central.
- Customer data matches the submitted request.

### Test Execution Evidence

A valid customer creation request was sent using Postman.
<img width="1664" height="692" alt="image" src="https://github.com/user-attachments/assets/5e89c8a1-0a4a-45b1-a02b-6539924f84f0" />
<img width="1117" height="895" alt="image" src="https://github.com/user-attachments/assets/aa3fec00-e4fb-4607-8af1-3b72e6a78fdf" />
<img width="1652" height="558" alt="image" src="https://github.com/user-attachments/assets/0b9ad3de-e028-49f1-ae53-09c62b96e2a8" />

---

## POST-002 — Create Customer with Minimum Data

| Field                    | Details                                                                                                                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-002                                                                                                                                                                                                |
| **Test Objective**       | Verify API behavior when only the minimum required customer data is provided.                                                                                                                           |
| **Preconditions**        | API service is available and the provided customer number does not already exist.                                                                                                                       |
| **HTTP Method**          | `POST`                                                                                                                                                                                                  |
| **Endpoint**             | `/customers`                                                                                                                                                                                            |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                        |
| **Test Data**            | `TD-002`                                                                                                                                                                                                |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide only the minimum required customer data.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify the created customer record.  |
| **Expected Status Code** | `2xx` if accepted; otherwise an appropriate validation error                                                                                                                                            |
| **Expected Result**      | Request is accepted if the provided fields satisfy the configured Business Central requirements. A customer record is created, and optional fields use their configured default values or remain empty. |
| **Actual Result**        | TBD                                                                                                                                                                                                     |
| **Test Status**          | `Not Executed`                                                                                                                                                                                          |

**Expected Result**

- Request is accepted if these fields satisfy the configured Business Central requirements.
- A customer record is created.
- Optional fields use their configured default values or remain empty.

> Note: The expected result depends on the validation rules implemented in the Business Central table.

---

## POST-003 — Missing Required Customer No.

| Field                    | Details                                                                                                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Test Case ID**         | POST-003                                                                                                                                                                                                                 |
| **Test Objective**       | Verify that the API handles a request without the customer number correctly.                                                                                                                                             |
| **Preconditions**        | API service is available and `No.` is configured as a required field.                                                                                                                                                    |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                   |
| **Endpoint**             | `/customers`                                                                                                                                                                                                             |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                         |
| **Test Data**            | `TD-003`                                                                                                                                                                                                                 |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Omit the customer number from the request body.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that no incomplete customer record was created. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                    |
| **Expected Result**      | Request is rejected if `No.` is required. No incomplete customer record is created, and an appropriate validation error is returned.                                                                                     |
| **Actual Result**        | TBD                                                                                                                                                                                                                      |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                           |

**Expected Result**

- Request is rejected if `No.` is configured as required.
- No incomplete customer record is created.
- An appropriate validation error is returned.

> Note: Business Central's actual behavior should be verified during execution because `DelayedInsert` and table validation rules affect the result.

---

## POST-004 — Duplicate Customer No.

| Field                    | Details                                                                                                                                                                                                                 |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-004                                                                                                                                                                                                                |
| **Test Objective**       | Verify that the API prevents duplicate customer numbers.                                                                                                                                                                |
| **Preconditions**        | Customer `C00001` already exists in the system.                                                                                                                                                                         |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                  |
| **Endpoint**             | `/customers`                                                                                                                                                                                                            |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                        |
| **Test Data**            | `TD-004`                                                                                                                                                                                                                |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide the existing customer number `C00001`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that the existing customer was not overwritten. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                   |
| **Expected Result**      | Request is rejected. Existing customer `C00001` is not overwritten, and an appropriate duplicate-key or validation error is returned.                                                                                   |
| **Actual Result**        | TBD                                                                                                                                                                                                                     |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                          |

**Expected Result**

- Request is rejected.
- Existing customer `C00001` is not overwritten.
- An appropriate duplicate-key or validation error is returned.

---

## POST-005 — Invalid Customer Type

| Field                    | Details                                                                                                                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-005                                                                                                                                                                                                |
| **Test Objective**       | Verify that the API rejects a customer type that is not defined by the API.                                                                                                                             |
| **Preconditions**        | API service is available and the customer type field has defined valid values.                                                                                                                          |
| **HTTP Method**          | `POST`                                                                                                                                                                                                  |
| **Endpoint**             | `/customers`                                                                                                                                                                                            |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                        |
| **Test Data**            | `TD-005`                                                                                                                                                                                                |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported customer type, `Unknown`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that no customer was created. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                   |
| **Expected Result**      | Request is rejected, the customer is not created, and an appropriate validation error is returned.                                                                                                      |
| **Actual Result**        | TBD                                                                                                                                                                                                     |
| **Test Status**          | `Not Executed`                                                                                                                                                                                          |

**Expected Result**

- Request is rejected.
- Customer is not created.
- An appropriate validation error is returned.

---

## POST-006 — Invalid Status

| Field                    | Details                                                                                                                                                                                          |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Test Case ID**         | POST-006                                                                                                                                                                                         |
| **Test Objective**       | Verify that the API rejects an unsupported customer status.                                                                                                                                      |
| **Preconditions**        | API service is available and the status field has defined valid values.                                                                                                                          |
| **HTTP Method**          | `POST`                                                                                                                                                                                           |
| **Endpoint**             | `/customers`                                                                                                                                                                                     |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                 |
| **Test Data**            | `TD-006`                                                                                                                                                                                         |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide an unsupported status, `Pending`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that no customer was created. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                            |
| **Expected Result**      | Request is rejected, the customer is not created, and an appropriate validation error is returned.                                                                                               |
| **Actual Result**        | TBD                                                                                                                                                                                              |
| **Test Status**          | `Not Executed`                                                                                                                                                                                   |

**Expected Result**

- Request is rejected.
- Customer is not created.
- An appropriate validation error is returned.

---

## POST-007 — Invalid JSON Data Type

| Field                    | Details                                                                                                                                                                                                                                             |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-007                                                                                                                                                                                                                                            |
| **Test Objective**       | Verify that the API rejects values with an incorrect JSON data type.                                                                                                                                                                                |
| **Preconditions**        | API service is available and the API enforces the expected data types for each field.                                                                                                                                                               |
| **HTTP Method**          | `POST`                                                                                                                                                                                                                                              |
| **Endpoint**             | `/customers`                                                                                                                                                                                                                                        |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                                                    |
| **Test Data**            | `TD-007`                                                                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a string value for `creditLimit` instead of a number.<br>3. Provide a string value for `marketingConsent` instead of a Boolean.<br>4. Send the request.<br>5. Verify the response. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                                               |
| **Expected Result**      | Request is rejected. `creditLimit` does not accept a string when a numeric value is expected, and `marketingConsent` does not accept a string when a Boolean value is expected. No invalid customer record is created.                              |
| **Actual Result**        | TBD                                                                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                                      |

**Expected Result**

- Request is rejected.
- `creditLimit` should not accept a string when a numeric value is expected.
- `marketingConsent` should not accept a string when a Boolean value is expected.
- No invalid customer record is created.

---

## POST-008 — Negative Credit Limit

| Field                    | Details                                                                                                                                                                                                     |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | POST-008                                                                                                                                                                                                    |
| **Test Objective**       | Verify the API behavior when a negative credit limit is submitted.                                                                                                                                          |
| **Preconditions**        | API service is available.                                                                                                                                                                                   |
| **HTTP Method**          | `POST`                                                                                                                                                                                                      |
| **Endpoint**             | `/customers`                                                                                                                                                                                                |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                            |
| **Test Data**            | `TD-008`                                                                                                                                                                                                    |
| **Test Steps**           | 1. Send a `POST` request to the customer endpoint.<br>2. Provide a negative value for `creditLimit`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify whether a customer record was created. |
| **Expected Status Code** | `4xx` if the business rule requires `creditLimit >= 0`                                                                                                                                                      |
| **Expected Result**      | Request is rejected if the business rule requires `creditLimit >= 0`. No invalid customer record is created.                                                                                                |
| **Actual Result**        | TBD                                                                                                                                                                                                         |
| **Test Status**          | `Not Executed`                                                                                                                                                                                              |

**Expected Result**

- Request should be rejected if the business rule requires `creditLimit >= 0`.
- No invalid customer should be created.

> Note: A Decimal field does not automatically reject negative values. This test requires an explicit Business Central validation rule if a rejection is expected.

---

# PATCH Test Cases

## PATCH-001 — Update Customer Name

| Field                    | Details                                                                                                                                                                                            |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-001                                                                                                                                                                                          |
| **Test Objective**       | Verify that an existing customer's name can be updated.                                                                                                                                            |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                        |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                            |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                 |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                   |
| **Test Data**            | `TD-009`                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide a new customer name.<br>3. Send the request.<br>4. Verify the response.<br>5. Retrieve the customer and verify the updated name. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                              |
| **Expected Result**      | API accepts the request. Customer name is updated, other customer fields remain unchanged, and Business Central displays the updated value.                                                        |
| **Actual Result**        | TBD                                                                                                                                                                                                |
| **Test Status**          | `Not Executed`                                                                                                                                                                                     |

**Expected Result**

- API accepts the request.
- Customer name is updated.
- Other customer fields remain unchanged.
- Business Central displays the updated value.

---

## PATCH-002 — Update Multiple Customer Fields

| Field                    | Details                                                                                                                                                                                                   |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-002                                                                                                                                                                                                 |
| **Test Objective**       | Verify that multiple customer fields can be updated in a single request.                                                                                                                                  |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                               |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                   |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                        |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                          |
| **Test Data**            | `TD-010`                                                                                                                                                                                                  |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide new values for name, phone number, and city.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify the updated customer data. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                                     |
| **Expected Result**      | API accepts the request. All specified fields are updated, while fields not included in the request remain unchanged. Updated data matches Business Central.                                              |
| **Actual Result**        | TBD                                                                                                                                                                                                       |
| **Test Status**          | `Not Executed`                                                                                                                                                                                            |

**Expected Result**

- API accepts the request.
- All specified fields are updated.
- Fields not included in the request remain unchanged.
- Updated data matches Business Central.

---

## PATCH-003 — Update Non-existing Customer

| Field                    | Details                                                                                                                                                                                            |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-003                                                                                                                                                                                          |
| **Test Objective**       | Verify the API behavior when attempting to update a customer that does not exist.                                                                                                                  |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                     |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                            |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                 |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                   |
| **Test Data**            | `TD-011`                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Provide an update value.<br>4. Send the request.<br>5. Verify the response. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                              |
| **Expected Result**      | Request is rejected. No new customer is created, and an appropriate error response is returned.                                                                                                    |
| **Actual Result**        | TBD                                                                                                                                                                                                |
| **Test Status**          | `Not Executed`                                                                                                                                                                                     |

**Expected Result**

- Request is rejected.
- No new customer is created.
- An appropriate error response is returned.

---

## PATCH-004 — Update Customer with Invalid Status

| Field                    | Details                                                                                                                                                                                                                |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | PATCH-004                                                                                                                                                                                                              |
| **Test Objective**       | Verify that an existing customer cannot be updated with an unsupported status.                                                                                                                                         |
| **Preconditions**        | API service is available and the specified customer exists.                                                                                                                                                            |
| **HTTP Method**          | `PATCH`                                                                                                                                                                                                                |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                                     |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                       |
| **Test Data**            | `TD-012`                                                                                                                                                                                                               |
| **Test Steps**           | 1. Send a `PATCH` request to the customer endpoint.<br>2. Provide the unsupported status `Pending`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that the existing customer data remains unchanged. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                  |
| **Expected Result**      | Request is rejected. Existing customer data remains unchanged, and an appropriate validation error is returned.                                                                                                        |
| **Actual Result**        | TBD                                                                                                                                                                                                                    |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                         |

**Expected Result**

- Request is rejected.
- Existing customer data remains unchanged.
- An appropriate validation error is returned.

---

# DELETE Test Cases

## DELETE-001 — Delete Existing Customer

| Field                    | Details                                                                                                                                                                                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | DELETE-001                                                                                                                                                                                                                                                          |
| **Test Objective**       | Verify that an existing customer can be deleted.                                                                                                                                                                                                                    |
| **Preconditions**        | API service is available and the test customer exists.                                                                                                                                                                                                              |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                                                            |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                                                                                  |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                                                                    |
| **Test Data**            | `TD-013`                                                                                                                                                                                                                                                            |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the existing customer identifier.<br>3. Send the request.<br>4. Verify the response.<br>5. Send a `GET` request for the deleted customer.<br>6. Verify that the customer is no longer available. |
| **Expected Status Code** | `2xx`                                                                                                                                                                                                                                                               |
| **Expected Result**      | API accepts the delete request. Customer is removed from the Customer API table, and a subsequent `GET` request does not return the deleted customer.                                                                                                               |
| **Actual Result**        | TBD                                                                                                                                                                                                                                                                 |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                                                      |

**Expected Result**

- API accepts the delete request.
- Customer is removed from the `Customer API` table.
- A subsequent GET request should not return the deleted customer.

---

## DELETE-002 — Delete Non-existing Customer

| Field                    | Details                                                                                                                                                                                                                            |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Test Case ID**         | DELETE-002                                                                                                                                                                                                                         |
| **Test Objective**       | Verify the API behavior when attempting to delete a customer that does not exist.                                                                                                                                                  |
| **Preconditions**        | API service is available and customer `C99999` does not exist.                                                                                                                                                                     |
| **HTTP Method**          | `DELETE`                                                                                                                                                                                                                           |
| **Endpoint**             | `/customers({id})`                                                                                                                                                                                                                 |
| **Headers**              | `Content-Type: application/json`                                                                                                                                                                                                   |
| **Test Data**            | `TD-014`                                                                                                                                                                                                                           |
| **Test Steps**           | 1. Send a `DELETE` request to the customer endpoint.<br>2. Provide the non-existing customer identifier `C99999`.<br>3. Send the request.<br>4. Verify the response.<br>5. Verify that existing customer records remain unchanged. |
| **Expected Status Code** | `4xx`                                                                                                                                                                                                                              |
| **Expected Result**      | Request does not delete any record. An appropriate error response is returned, and existing customer records remain unchanged.                                                                                                     |
| **Actual Result**        | TBD                                                                                                                                                                                                                                |
| **Test Status**          | `Not Executed`                                                                                                                                                                                                                     |

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

## Notes

Expected HTTP status codes are intentionally not hard-coded for every test case before execution.

The actual status codes and error responses should be verified against the implemented Business Central API and recorded after test execution.

This prevents the test documentation from assuming behavior that has not yet been verified.
