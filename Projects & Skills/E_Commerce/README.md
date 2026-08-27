# Project 1: E-commerce Web Application — Manual QA Portfolio Project

> **Note:** This is a practice QA project based on common E-Commerce application requirements. Test scenarios, test cases, and bug reports are created for portfolio demonstration purposes.
[Web AcademyBugs Test](https://academybugs.com/find-bugs/)
---

## Table of Contents

- [1. Test Plan](#1-test-plan)
- [2. Test Scenario](#2-test-scenario)
- [3. Test Case & Execution](#3-test-case--execution)
- [4. Bug Debug Report](#4-bug-debug-report)

---

## 1. Test Plan
[👉 Link to Google Drive with Test Plan](https://docs.google.com/spreadsheets/d/1RojIaz6c4SeByoN2H1-pBnl2uJURtQe8/edit?usp=sharing&ouid=106458769860966290112&rtpof=true&sd=true) 
### 1.1 Project Information

| Item | Details |
|---|---|
| Project Name | E-commerce Web Application – Manual QA Testing |
| Application Under Test | AcademyBugs |
| Testing Type | Manual Testing |
| Test Level | System Testing |
| Primary Testing | Functional Testing |
| Additional Testing | UI, Validation, Negative, Exploratory |
| Test Environment | Web Browser |
| Target | Desktop Web Application |
| Tester | QA Tester |

### 1.2 Test Objective

The objective of this testing effort is to verify that the E-commerce Web Application correctly supports the core user journeys — from searching and selecting products, adding and managing products in the shopping cart, proceeding through checkout, to managing the account and accessing pricing information that requires login.

### 1.3 Scope

**Out of Scope**
**Module 1 — Product Discovery & Selection**
Tests the functionality related to searching for and selecting products.

**Module 2 — Shopping Cart & Checkout**
Tests the shopping cart management and checkout process.

**Module 3 — Account & Pricing**
Tests account management and authentication.


**Out of Scope**
To keep the project scope manageable, the following are **not** tested:

- Real Payment Gateway
- Credit/Debit Card Processing
- PromptPay
- PayPal
- Refund
- Real Order Fulfillment
- Backend API
- Database Testing
- Performance / Load Testing
- Security Penetration Testing
- Mobile Application

For payment specifically, only the checkout flow provided by the system will be tested — no assumption is made that a real payment gateway exists.

### 1.4 Testing Approach

Several test design techniques will be used:

| Testing Technique | Applied To |
|---|---|
| Positive Testing | Valid user flow |
| Negative Testing | Invalid input / invalid flow |
| Boundary Value Analysis | Quantity / Input |
| Equivalence Partitioning | Input validation |
| UI Testing | Layout / Button / Image / Text |
| Exploratory Testing | Finding issues not covered by test cases |

### 1.5 Test Entry Criteria

Test execution can begin when:

- The application is accessible
- The browser can open the application
- Functionality within scope is usable
- Test scenarios have been reviewed
- Test cases are ready for execution
- Test data is available

### 1.6 Test Exit Criteria

Testing is considered complete when:

- All test cases within scope have been executed
- Critical / High severity defects have been identified and reported
- Failed test cases have an associated bug report
- Fixed bugs have been retested
- Regression testing has been performed as appropriate
- The Test Summary Report has been produced

### 1.7 Suspension & Resumption Criteria

**Suspension Criteria (when to pause testing)**
The AUT or test environment becomes inaccessible; a blocking (Critical) defect prevents further execution of the current module.

**Resumption Criteria (when to resume testing)**
The environment is restored and accessible again; the blocking defect has been fixed and verified as resolved.

### 1.8 Roles & Responsibilities

| Role | Responsibilities |
|---|---|
| QA Tester (Solo) | Owns the full QA process end-to-end: test planning, scenario & test case design, manual execution, bug reporting, regression testing, and the test summary report. |

*Note: this is a solo portfolio project — all QA roles above are performed by a single tester.*

### 1.9 Test Environment

| Item | Details |
|---|---|
| Browser(s) | Google Chrome (latest), Mozilla Firefox (latest) |
| Operating System | Windows 11 |
| Device / Target | Desktop Web Application |
| Test Data | Sample product data and self-created test accounts on the AcademyBugs demo site |
| URL / Environment | *(fill in)* |
| Access / Account | *(fill in)* |

### 1.10 Schedule / Milestones

| Activity | Duration | Owner |
|---|---|---|
| Test Planning & Test Scenario Design | Day 1 – 2 | QA Tester |
| Test Case Design | Day 3 – 5 | QA Tester |
| Test Execution — Round 1 | Day 6 – 9 | QA Tester |
| Bug Reporting & Fix Verification | Day 10 – 11 | QA Tester |
| Regression Testing | Day 12 | QA Tester |
| Test Summary Report | Day 13 | QA Tester |

*Note: illustrative timeline for a solo portfolio project — adjust dates/duration to your own schedule.*

### 1.11 Risks & Mitigation

| Risk | Mitigation |
|---|---|
| Limited time, since this is a solo/portfolio project run alongside other commitments | Prioritize Critical/High priority scenarios and modules first |
| The AUT is a public demo site — data may reset or its environment may be unstable | Re-verify results close to reporting time; take screenshots as evidence while testing |
| No dev/backend team available to confirm root cause | Document detailed reproduction steps and evidence in each bug report so it can be understood without direct code access |

### 1.12 Defect Severity

| Severity | Definition |
|---|---|
| Critical | The core system/flow is unusable or a severe crash occurs |
| High | An important function does not work, but another way to complete the task exists |
| Medium | A function works incorrectly, but a workaround exists |
| Low | A minor issue, e.g. UI or content |

### 1.13 Test Deliverables

This project will produce the following documents, in sequence:

```
Test Plan
   ↓
Test Scenario
   ↓
Test Case
   ↓
Test Execution
   ↓
Bug Report
   ↓
Test Summary Report
```

---

## 2. Test Scenario
[👉 Link to Google Drive with Test Scenario](https://docs.google.com/spreadsheets/d/1udPjWEhLeXDhH3ZWdJD9yg1SDVtQ1ygG/edit?usp=sharing&ouid=106458769860966290112&rtpof=true&sd=true) <br>
**ID convention:**
- `TS-PROD-xxx` — Product Discovery & Selection
- `TS-CART-xxx` — Shopping Cart & Checkout
- `TS-AUTH-xxx` — Account & Pricing

### Module 1: Product Discovery & Selection

**Goal:** the customer selects a product and adds it to the cart.

| ID | Test Scenario | Priority |
|---|---|---|
| TS-PROD-001 | Verify user can view the product listing | High |
| TS-PROD-002 | Verify user can search and find a product | High |
| TS-PROD-003 | Verify user can view product details and price | High |
| TS-PROD-004 | Verify user can select required product options | Medium |
| TS-PROD-005 | Verify user can add a product to the shopping cart | Critical |

**Flow:**
`Product Listing → Search Product → Product Detail → Select Options → Add to Cart`

### Module 2: Shopping Cart & Checkout

**Goal:** manage products in the cart and proceed to checkout.

| ID | Test Scenario | Priority |
|---|---|---|
| TS-CART-001 | Verify added product is displayed correctly in the shopping cart | Critical |
| TS-CART-002 | Verify user can modify product quantity | High |
| TS-CART-003 | Verify user can remove a product from the shopping cart | High |
| TS-CART-004 | Verify cart subtotal is calculated correctly | Critical |
| TS-CART-005 | Verify user can proceed from the shopping cart to checkout | Critical |

**Flow:**
`Add Product → Shopping Cart → Modify Quantity → Remove Product → Verify Subtotal → Checkout`

### Module 3: Account & Pricing

**Goal:** registration → login → accessing information that requires authentication.

| ID | Test Scenario | Priority |
|---|---|---|
| TS-AUTH-001 | Verify user can register a new account with valid information | High |
| TS-AUTH-002 | Verify registration validation works correctly for invalid input | High |
| TS-AUTH-003 | Verify user can login with valid credentials | Critical |
| TS-AUTH-004 | Verify login fails with invalid credentials | High |
| TS-AUTH-005 | Verify user can access pricing for a login-required product after authentication | High |

**Flow:**
`Login-required Product → Sign Up → Registration → Login → Access Pricing`

### Summary

| Module | Scenario Range | Count |
|---|---|---:|
| 🛍️ Product Selection | TS-PROD-001 → 005 | 5 |
| 🛒 Cart & Checkout | TS-CART-001 → 005 | 5 |
| 👤 Account & Pricing | TS-AUTH-001 → 005 | 5 |
| **Total** | | **15** |

---
## 3. Test Case & Execution

---
## 4. Bug Debug Report