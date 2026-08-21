# Project 1: E-Commerce — QA Testing Project

> **Note:** This is a practice QA project based on common E-Commerce application requirements. Test scenarios, test cases, and bug reports are created for portfolio demonstration purposes.
[Web ที่ใช้สำหรับ Test](https://academybugs.com/find-bugs/)
---

## Project Overview

This project demonstrates QA testing activities for a typical E-Commerce web application. The testing covers core e-commerce functionalities including user authentication, product browsing, shopping cart management, checkout, and payment processes.

---

## Scope of Testing

### In Scope

| Module | Description |
|--------|-------------|
| User Authentication | Registration, Login, Logout |
| Product Listing | Product display, pagination, sorting |
| Search & Filter | Search by keyword, filter by category/price, sort results |
| Product Detail | Product information display, image gallery |
| Shopping Cart | Add to cart, update quantity, remove item |
| Checkout | Shipping information, payment form, order confirmation |
| Order Management | Order summary, order confirmation page |

### Out of Scope

- Backend API testing (covered in API Testing section)
- Performance testing
- Security testing
- Mobile app testing

---

## Test Types

| Test Type | Description |
|-----------|-------------|
| Functional Testing | Verify each feature works according to requirements |
| UI Testing | Verify visual elements display correctly |
| Input Validation | Verify form validation for user inputs |
| Negative Testing | Verify system handles invalid input gracefully |
| Boundary Testing | Verify system handles edge cases |
| Regression Testing | Verify existing features still work after changes |

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Browser (Chrome) | Manual testing |
| DevTools | Inspect elements, network, console |
| Markdown | Documentation |
| GitHub | Version control and project management |

---

## Project Structure

```text
1.1-E_Commerce/
│
├── README.md              — Project overview and scope
├── Test-Scenarios.md      — High-level test scenarios
├── Test-Cases.md          — Detailed test cases
├── Bug-Reports.md         — Sample bug reports
└── Test-Summary.md        — Test execution summary
```

---

## Assumptions

1. The E-Commerce application is a web-based application accessible via browser.
2. Users can register with email and password.
3. Products are organized by categories.
4. The cart supports multiple items with quantity management.
5. Checkout requires shipping address and payment information.
6. Payment methods include credit card and QR code payment.
