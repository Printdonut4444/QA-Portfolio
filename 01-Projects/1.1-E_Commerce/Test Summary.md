# Test Summary — E-Commerce

> Practice QA project based on common E-Commerce application requirements.

---

## Test Execution Overview

| Metric | Value |
|--------|-------|
| **Total Test Scenarios** | 25 |
| **Total Test Cases** | 25 |
| **Passed** | 19 |
| **Failed** | 6 |
| **Blocked** | 0 |
| **Pass Rate** | 76% |
| **Test Execution Date** | 2025-01-15 to 2025-01-17 |

---

## Results by Module

| Module | Total | Passed | Failed | Pass Rate |
|--------|-------|--------|--------|----------|
| User Authentication | 6 | 5 | 1 | 83% |
| Product Listing | 2 | 1 | 1 | 50% |
| Search & Filter | 4 | 3 | 1 | 75% |
| Product Detail | 2 | 1 | 1 | 50% |
| Shopping Cart | 5 | 4 | 1 | 80% |
| Checkout | 6 | 5 | 1 | 83% |
| **Total** | **25** | **19** | **6** | **76%** |

---

## Failed Test Cases

| Test Case ID | Title | Bug ID | Severity |
|-------------|-------|--------|----------|
| TC-EC-018 | Cart total updates correctly when quantity changes | Bug-EC-001 | Major |
| TC-EC-009 | Search products by keyword | Bug-EC-002 | Minor |
| TC-EC-021 | Checkout validates required shipping fields | Bug-EC-003 | Major |
| TC-EC-014 | Product images display correctly on detail page | Bug-EC-004 | Minor |
| TC-EC-003 | Register with invalid email format | Bug-EC-005 | Minor |
| TC-EC-008 | Sort products by price | Bug-EC-006 | Major |

---

## Key Observations

1. **Cart total calculation issue (Bug-EC-001)** — The most critical bug. Cart total does not recalculate when item quantity is changed. This directly affects the checkout process and customer trust.

2. **Checkout validation gap (Bug-EC-003)** — The checkout form allows submission without a phone number, which could cause delivery issues. This should be addressed with high priority.

3. **Search relevance (Bug-EC-002)** — Search returns unrelated products, suggesting the search logic may be too broad or matching against hidden fields.

4. **Sort logic (Bug-EC-006)** — Price sorting uses string comparison instead of numeric comparison, causing incorrect ordering for prices with different digit counts.

5. **User-facing error messages (Bug-EC-005)** — Technical error messages are displayed to users, which is not user-friendly and may expose implementation details.

---

## Risks and Recommendations

| Risk | Recommendation |
|------|----------------|
| Cart total miscalculation could lead to incorrect charges | Fix Bug-EC-001 before any production release |
| Missing phone validation could cause delivery failures | Add phone number validation to checkout form |
| Broken product images affect user experience | Implement fallback placeholder images for missing product images |
| Technical error messages confuse users | Replace technical error messages with user-friendly messages |
| Search relevance issues reduce product discoverability | Review search algorithm to ensure it matches only relevant fields |

---

## Test Environment

| Item | Value |
|------|-------|
| **Browser** | Google Chrome 120 |
| **OS** | Windows 11 |
| **Screen Resolution** | 1920x1080 |
| **Application Version** | Demo v1.0 |

---

## Sign-off

| Role | Name | Date |
|------|------|------|
| **Tested By** | Phurich Wichitjomthong | 2025-01-17 |
| **Reviewed By** | — | — |
