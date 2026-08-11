# Bug Reports — E-Commerce

> Practice QA project based on common E-Commerce application requirements. These are sample bug reports for portfolio demonstration.

---

## Bug-EC-001: Cart total does not update after quantity change

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-001 |
| **Title** | Cart total does not update when changing item quantity |
| **Module** | Shopping Cart |
| **Severity** | Major |
| **Priority** | High |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-15 |

**Preconditions:**
- User is logged in
- Product "Wireless Headphones" (Price: $80) is in the cart with quantity 1

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Navigate to the cart page |
| 2 | Change the quantity of "Wireless Headphones" from 1 to 3 |
| 3 | Observe the cart total |

**Expected Result:** Cart total should update from $80 to $240 (3 x $80).

**Actual Result:** Cart total remains at $80. The subtotal for the item updates to $240, but the overall cart total does not change.

**Attachment:** *[Screenshot: cart-total-not-updating.png]*

**Notes:** The issue occurs consistently. A page refresh fixes the total temporarily, but the issue reappears when the quantity is changed again.

---

## Bug-EC-002: Search returns unrelated products

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-002 |
| **Title** | Search for "laptop" returns products unrelated to laptops |
| **Module** | Search & Filter |
| **Severity** | Minor |
| **Priority** | Medium |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-15 |

**Preconditions:**
- Products exist in the catalog with "laptop" in their name or description
- Other products unrelated to laptops also exist

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Navigate to the product listing page |
| 2 | Enter "laptop" in the search bar |
| 3 | Press Enter |
| 4 | Observe the search results |

**Expected Result:** Only products with "laptop" in the name or description should be displayed.

**Actual Result:** Search results include products that do not contain "laptop" in their name or description (e.g., "Coffee Mug", "Desk Lamp"). It appears the search may be matching against category names or other hidden fields.

**Attachment:** *[Screenshot: search-unrelated-results.png]*

---

## Bug-EC-003: Checkout allows empty phone number

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-003 |
| **Title** | Checkout form accepts empty phone number field |
| **Module** | Checkout |
| **Severity** | Major |
| **Priority** | High |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-16 |

**Preconditions:**
- At least one product is in the cart
- User is on the checkout page

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Fill in all required shipping fields with valid data |
| 2 | Leave the Phone Number field empty |
| 3 | Click "Place Order" |
| 4 | Observe the result |

**Expected Result:** Form should be rejected with an error message "Phone number is required."

**Actual Result:** The order is placed successfully without a phone number. The order confirmation page shows "Phone: N/A" for the shipping contact.

**Attachment:** *[Screenshot: checkout-empty-phone.png]*

**Notes:** This could cause delivery issues if the courier needs to contact the customer.

---

## Bug-EC-004: Product image missing on detail page

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-004 |
| **Title** | Product image not loading on product detail page for certain products |
| **Module** | Product Detail |
| **Severity** | Minor |
| **Priority** | Low |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-16 |

**Preconditions:**
- A product exists with an image URL that returns a 404 error

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Navigate to the product listing page |
| 2 | Click on a product with a broken image link |
| 3 | Observe the product detail page |

**Expected Result:** Product image should display correctly. If the image is unavailable, a placeholder image should be shown.

**Actual Result:** A broken image icon is displayed instead of the product image. No fallback placeholder is shown.

**Attachment:** *[Screenshot: product-image-broken.png]*

---

## Bug-EC-005: Error message unclear for invalid email during registration

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-005 |
| **Title** | Registration error message for invalid email is not user-friendly |
| **Module** | User Authentication |
| **Severity** | Minor |
| **Priority** | Low |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-17 |

**Preconditions:**
- No user is logged in
- User is on the registration page

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Fill in all registration fields with valid data |
| 2 | Enter Email: `test@` |
| 3 | Click "Register" |
| 4 | Observe the error message |

**Expected Result:** A clear, user-friendly error message should be displayed, e.g., "Please enter a valid email address (e.g., user@example.com)."

**Actual Result:** The error message displayed is "ValidationError: email.pattern.fail" which is a technical error message not suitable for end users.

**Attachment:** *[Screenshot: registration-error-technical.png]*

---

## Bug-EC-006: Sort by price (Low to High) not sorting correctly

| Field | Value |
|-------|-------|
| **Bug ID** | Bug-EC-006 |
| **Title** | "Price: Low to High" sort displays products in wrong order |
| **Module** | Product Listing |
| **Severity** | Major |
| **Priority** | Medium |
| **Status** | Open |
| **Environment** | Chrome 120, Windows 11 |
| **Reported By** | QA Tester |
| **Reported Date** | 2025-01-17 |

**Preconditions:**
- Products with various prices exist in the catalog
- User is on the product listing page

**Steps to Reproduce:**

| Step | Action |
|------|--------|
| 1 | Navigate to the product listing page |
| 2 | Click the "Sort by" dropdown |
| 3 | Select "Price: Low to High" |
| 4 | Observe the product order |

**Expected Result:** Products should be displayed in ascending order by price (cheapest first).

**Actual Result:** Products appear to be sorted as strings rather than numbers. For example, a product priced $1000 appears before a product priced $200 because "1000" < "200" in string comparison.

**Attachment:** *[Screenshot: sort-price-string-comparison.png]*

**Notes:** This is likely a backend sorting issue where prices are treated as strings instead of numeric values.
