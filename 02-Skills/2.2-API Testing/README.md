# Business Central REST API & Testing

## Overview

This project demonstrates the development and testing of a REST API using **Microsoft Dynamics 365 Business Central**.

A custom **Customer API** was created in Business Central and exposed through an API Page. The API is then tested using a REST API client to verify request and response behavior.

The project demonstrates both:

* **API Development** — Creating a custom Table and API Page in Business Central
* **API Testing** — Testing REST API operations and validating the results

---

## API Architecture

The API follows this flow:

```text
Business Central
      │
      ▼
Customer API Table
      │
      │ SourceTable
      ▼
Customer API Page
      │
      │ REST API
      ▼
REST API Client
      │
      │ GET / POST / PATCH / DELETE
      ▼
Business Central
      │
      ▼
Customer Data
```

The API client sends HTTP requests to Business Central, while the resulting data changes can be verified directly in Business Central.

---

## Business Central Implementation

### 1. Customer API Table

The `Customer API` table stores customer information used by the API.

Main fields include:

| Field              | Description                 |
| ------------------ | --------------------------- |
| No.                | Unique customer identifier  |
| Name               | Customer name               |
| Email              | Customer email              |
| Phone No.          | Customer phone number       |
| Address            | Customer address            |
| City               | Customer city               |
| Country            | Customer country            |
| Postal Code        | Customer postal code        |
| Customer Type      | Individual / Company        |
| Status             | Active / Inactive / Blocked |
| Registration Date  | Customer registration date  |
| Last Modified Date | Last modification timestamp |
| Credit Limit       | Customer credit limit       |
| Currency Code      | Customer currency           |
| Marketing Consent  | Marketing consent flag      |

Source code:

`01-Business-Central-API/Table/CustomerAPI.Table.al`

---

### 2. Customer API Page

The `Customer API` table is exposed as a REST API through a Business Central API Page.

Key API properties:

```al
APIPublisher = 'donut';
APIGroup = 'qa';
APIVersion = 'v1.0';

EntityName = 'customer';
EntitySetName = 'customers';

SourceTable = "Customer API";
```

The API Page defines how the Business Central table is exposed through the REST API.

Source code:

`01-Business-Central-API/API-Page/CustomerAPI.Page.al`

---

## API Endpoint

The API follows the Business Central API URL structure:

```text
/api/{publisher}/{group}/{version}/companies({companyId})/{entitySet}
```

For this project:

```text
/api/donut/qa/v1.0/companies({companyId})/customers
```

Where:

| Component  | Value       | Purpose           |
| ---------- | ----------- | ----------------- |
| Publisher  | `donut`     | API publisher     |
| Group      | `qa`        | API group         |
| Version    | `v1.0`      | API version       |
| Entity Set | `customers` | Customer resource |

---

## API Operations

The following REST operations are tested:

| Method | Operation       | Purpose                      |
| ------ | --------------- | ---------------------------- |
| GET    | Get Customers   | Retrieve customer records    |
| GET    | Get Customer    | Retrieve a specific customer |
| POST   | Create Customer | Create a new customer        |
| PATCH  | Update Customer | Update customer information  |
| DELETE | Delete Customer | Delete a customer            |

---

## Test Coverage

The API testing covers different types of test scenarios.

### Positive Testing

* Retrieve existing customers
* Create a valid customer
* Update an existing customer
* Delete an existing customer

### Negative Testing

* Invalid customer data
* Invalid Enum values
* Duplicate customer number
* Missing required data
* Invalid data types
* Non-existing customer

### Boundary Testing

* Minimum / maximum text length
* Zero credit limit
* Negative credit limit
* Empty values
* Boolean values

---

## Example — Create Customer

### Request

```http
POST /customers
```

```json
{
  "no": "C00001",
  "name": "Donut Technology Co., Ltd.",
  "email": "contact@donut-tech.com",
  "phoneNo": "0812345678",
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

### Expected Result

The customer should be successfully created in Business Central.

The newly created record can then be verified in the **Customer API** table.

```text
REST API Client
      │
      │ POST
      ▼
Business Central API
      │
      ▼
Customer API Table
      │
      ▼
New Customer Record
```

### Evidence

![Create Customer](04-Screenshots/POST-Create-Customer.png)

---

## Example — Update Customer

A `PATCH` request is used to update an existing customer.

```http
PATCH /customers({id})
```

```json
{
  "name": "Donut Technology Updated",
  "phoneNo": "0899999999"
}
```

The updated values are then verified in Business Central.

![Update Customer](04-Screenshots/PATCH-Customer.png)

---

## Test Evidence

Screenshots are provided to demonstrate the relationship between the API request and the resulting data in Business Central.

Examples include:

* API request and response
* Created customer record
* Updated customer record
* Deleted customer record
* Negative test results

Screenshots:

`04-Screenshots/`

---

## API Test Collection

The API test collection contains the requests used during testing.

`02-API-Collection/`

The collection includes:

```text
GET
├── Get All Customers
└── Get Customer by No.

POST
├── Create Customer
├── Missing Required Field
├── Duplicate Customer
└── Invalid Data

PATCH
├── Update Customer
└── Invalid Data

DELETE
├── Delete Customer
└── Delete Non-existing Customer
```

---

## Skills Demonstrated

This project demonstrates practical knowledge of:

* Microsoft Dynamics 365 Business Central
* AL development
* Business Central Tables
* Business Central API Pages
* REST API
* HTTP Methods
* JSON
* CRUD operations
* API request / response validation
* Positive and negative testing
* Boundary testing
* Data validation
* API test organization
* Git / GitHub

---

## Project Structure

```text
03-API-Testing
│
├── README.md
│
├── 01-Business-Central-API
│   ├── Table
│   │   └── CustomerAPI.Table.al
│   │
│   └── API-Page
│       └── CustomerAPI.Page.al
│
├── 02-API-Collection
│   └── Customer-API.postman_collection.json
│
├── 03-Test-Cases
│   └── Customer-API-Test-Cases.md
│
└── 04-Screenshots
    ├── GET-Customers.png
    ├── POST-Create-Customer.png
    ├── PATCH-Customer.png
    └── DELETE-Customer.png
```

---

## Purpose

This project was created as a practical demonstration of how a custom API can be developed in Business Central and subsequently tested through REST API requests.

The focus is on understanding the complete flow from **data structure and API development to API testing and result verification**.
