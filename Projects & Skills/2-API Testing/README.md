# Business Central REST API & Testing

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Test Coverage](#test-coverage)
- [API Test Collection](#api-test-collection)
- [Testing Workflow](#testing-workflow)
- [Skills Demonstrated](#skills-demonstrated)
- [Purpose](#purpose)

---

## Overview

This project demonstrates the development and testing of a REST API using **Microsoft Dynamics 365 Business Central**.

A custom **Customer API** was created in Business Central and exposed through an API Page. The API is then tested using a REST API client to verify request and response behavior.

The project demonstrates both:

* **API Development** — Creating a custom Table and API Page in Business Central
* **API Testing** — Testing REST API operations, recording results, and reporting defects found during testing

---

## Project Structure

```text
2-API Testing
│
├── README.md
│
├── 01-API Testing Fundamentals
│   └── Testing Fundamentals.md
│
├── 02-Business-Central-API
│   ├── Table
│   │   └── CustomerAPI.Table.al
│   │
│   ├── API-Page
│   │    └── CustomerAPI.Page.al
│   │
│   └── README.md
│
├── 03-API-Collection
│   └── Project Test Customers.Postman_collection.json
│
└── 04-Test-Cases
    ├── Customer API_Test Case.md
    ├── Customer API_Bug Report.md
    └── README.md

```

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

## API Test Collection

The API test collection contains the requests used during testing.

[`03-API-Collection/`](../2-API%20Testing/03-API-Collection)

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

## Testing Workflow

Test cases and bug reports are linked together so a failed test always leads to a tracked defect:

```
04-Test-Cases (run & record results)
        │
        ▼
   Fail found? ──No──▶ Done
        │
       Yes
        ▼
05-Bug-Reports (log defect, assign Bug ID)
        │
        ▼
   Dev fixes defect
        │
        ▼
   Regression Test 
```

* Full test cases: [`04-Test-Cases/Customer API_Test Case.md`](../2-API%20Testing/04-Test-Cases/Customer%20API_Test%20Case.md)
* Bugs found from failed test cases: [`05-Bug-Reports/Customer API_Bug Report.md`](../2-API%20Testing/04-Test-Cases/Customer%20API_Bug%20Report.md)

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
* Bug reporting and defect tracking
* API test organization
* Git / GitHub

---

## Purpose

This project was created as a practical demonstration of how a custom API can be developed in Business Central and subsequently tested through REST API requests.

The focus is on understanding the complete flow from **data structure and API development, through API testing and result verification, to defect reporting and tracking**.