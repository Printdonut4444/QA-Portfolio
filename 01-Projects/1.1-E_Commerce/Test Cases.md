# Test Cases — E-Commerce

> Practice QA project based on common E-Commerce application requirements.

---

## TC-EC-001: Register a new account with valid data

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-001 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- The E-Commerce application is accessible via browser
- No user is currently logged in
- The email `testuser@example.com` is not yet registered

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the registration page | Registration form is displayed with fields: First Name, Last Name, Email, Password, Confirm Password |
| 2 | Enter First Name: `John` | First Name field accepts input |
| 3 | Enter Last Name: `Doe` | Last Name field accepts input |
| 4 | Enter Email: `testuser@example.com` | Email field accepts input |
| 5 | Enter Password: `SecurePass123!` | Password field accepts input (masked) |
| 6 | Enter Confirm Password: `SecurePass123!` | Confirm Password field accepts input (masked) |
| 7 | Click the "Register" button | Form is submitted successfully |
| 8 | Observe the result | User is redirected to the home page or dashboard with a success message "Registration successful" |

**Expected Result:** User is registered successfully and redirected to the home page with a success message.

---

## TC-EC-002: Register with an already registered email

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-002 |
| **Priority** | High |
| **Test Type** | Negative |

**Preconditions:**
- The email `testuser@example.com` is already registered

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the registration page | Registration form is displayed |
| 2 | Enter valid data in all fields, using Email: `testuser@example.com` | All fields accept input |
| 3 | Click the "Register" button | Form submission is rejected |
| 4 | Observe the error message | Error message "This email is already registered" is displayed near the Email field |

**Expected Result:** Registration is rejected with a clear error message indicating the email is already in use.

---

## TC-EC-003: Register with invalid email format

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-003 |
| **Priority** | Medium |
| **Test Type** | Validation |

**Preconditions:**
- No user is currently logged in

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the registration page | Registration form is displayed |
| 2 | Enter Email: `invalidemail` | Email field accepts input |
| 3 | Fill all other fields with valid data | All other fields accept input |
| 4 | Click the "Register" button | Form submission is rejected |
| 5 | Observe the error message | Error message "Please enter a valid email address" is displayed |

**Expected Result:** Registration is rejected with a validation error for the email format.

---

## TC-EC-004: Login with valid credentials

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-004 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- User account exists with Email: `testuser@example.com` and Password: `SecurePass123!`
- User is not currently logged in

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the login page | Login form is displayed with Email and Password fields |
| 2 | Enter Email: `testuser@example.com` | Email field accepts input |
| 3 | Enter Password: `SecurePass123!` | Password field accepts input (masked) |
| 4 | Click the "Login" button | Form is submitted successfully |
| 5 | Observe the result | User is redirected to the home page, username is displayed in the header |

**Expected Result:** User is logged in successfully and redirected to the home page.

---

## TC-EC-005: Login with incorrect password

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-005 |
| **Priority** | High |
| **Test Type** | Negative |

**Preconditions:**
- User account exists with Email: `testuser@example.com` and Password: `SecurePass123!`

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the login page | Login form is displayed |
| 2 | Enter Email: `testuser@example.com` | Email field accepts input |
| 3 | Enter Password: `WrongPassword123!` | Password field accepts input (masked) |
| 4 | Click the "Login" button | Form submission is rejected |
| 5 | Observe the error message | Error message "Invalid email or password" is displayed |

**Expected Result:** Login is rejected with an error message. The message should not reveal which field is incorrect (security best practice).

---

## TC-EC-006: Logout successfully

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-006 |
| **Priority** | Medium |
| **Test Type** | Functional |

**Preconditions:**
- User is logged in

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Click the user profile icon in the header | Dropdown menu is displayed |
| 2 | Click the "Logout" button | User is logged out |
| 3 | Observe the result | User is redirected to the login page or home page with a "You have been logged out" message |

**Expected Result:** User is logged out successfully and redirected to the login or home page.

---

## TC-EC-007: Product listing displays all products

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-007 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- At least 10 products exist in the database
- User is on the home page

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the "All Products" page | Product listing page is displayed |
| 2 | Observe the product cards | Product cards are displayed with product image, name, price, and "Add to Cart" button |
| 3 | Scroll down to view more products | More products are loaded (pagination or infinite scroll) |
| 4 | Verify product count | Number of products displayed matches the expected total |

**Expected Result:** All available products are displayed on the listing page with correct information.

---

## TC-EC-008: Sort products by price

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-008 |
| **Priority** | Medium |
| **Test Type** | Functional |

**Preconditions:**
- User is on the product listing page
- Products with various prices exist

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Click the "Sort by" dropdown | Sort options are displayed (Price: Low to High, Price: High to Low, Newest) |
| 2 | Select "Price: Low to High" | Product list is re-sorted |
| 3 | Verify product order | Products are displayed in ascending order by price |
| 4 | Select "Price: High to Low" | Product list is re-sorted |
| 5 | Verify product order | Products are displayed in descending order by price |

**Expected Result:** Products are sorted correctly by price in both ascending and descending order.

---

## TC-EC-009: Search products by keyword

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-009 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- Products containing the keyword "laptop" exist in the catalog
- User is on the product listing page

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Locate the search bar | Search bar is visible and enabled |
| 2 | Enter keyword: `laptop` | Search bar accepts input |
| 3 | Press Enter or click the search button | Search results are displayed |
| 4 | Verify search results | Only products with name or description containing "laptop" are displayed |

**Expected Result:** Search returns only products matching the keyword "laptop".

---

## TC-EC-010: Filter products by category

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-010 |
| **Priority** | Medium |
| **Test Type** | Functional |

**Preconditions:**
- Products in the "Electronics" category exist
- User is on the product listing page

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Locate the category filter sidebar | Category filter options are displayed |
| 2 | Select the "Electronics" category | Product list is filtered |
| 3 | Verify filtered results | Only products in the "Electronics" category are displayed |
| 4 | Uncheck the "Electronics" category | Filter is cleared, all products are displayed again |

**Expected Result:** Products are filtered correctly by the selected category.

---

## TC-EC-011: Filter products by price range

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-011 |
| **Priority** | Medium |
| **Test Type** | Functional |

**Preconditions:**
- Products with prices between $100 and $500 exist
- User is on the product listing page

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Locate the price range filter | Price range slider or input fields are displayed |
| 2 | Set minimum price to `$100` | Minimum price is accepted |
| 3 | Set maximum price to `$500` | Maximum price is accepted |
| 4 | Click "Apply" or wait for auto-filter | Product list is filtered |
| 5 | Verify filtered results | Only products priced between $100 and $500 are displayed |

**Expected Result:** Products are filtered correctly within the specified price range.

---

## TC-EC-012: Search with no matching results

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-012 |
| **Priority** | Low |
| **Test Type** | Negative |

**Preconditions:**
- No product contains the keyword "xyzabc123" in the catalog

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Enter keyword: `xyzabc123` in the search bar | Search bar accepts input |
| 2 | Press Enter or click the search button | Search is performed |
| 3 | Observe the result | "No products found" message is displayed |
| 4 | Verify a suggestion or alternative is shown | A message like "Try different keywords or browse all products" is displayed |

**Expected Result:** A clear "no results" message is displayed with helpful suggestions.

---

## TC-EC-013: Product detail page displays correct information

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-013 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- A product exists with known details (name, price, description, images)

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Click on a product card from the listing page | Product detail page is loaded |
| 2 | Verify product name | Product name matches the name shown on the listing page |
| 3 | Verify product price | Product price matches the price shown on the listing page |
| 4 | Verify product description | Product description is displayed and readable |
| 5 | Verify "Add to Cart" button | "Add to Cart" button is visible and enabled |

**Expected Result:** Product detail page displays all product information correctly and consistently with the listing page.

---

## TC-EC-014: Product images display correctly on detail page

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-014 |
| **Priority** | Medium |
| **Test Type** | UI |

**Preconditions:**
- A product with multiple images exists

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to a product detail page | Product detail page is loaded |
| 2 | Verify the main product image | Main product image is displayed clearly without distortion |
| 3 | Verify thumbnail gallery | Thumbnail images are displayed below the main image |
| 4 | Click on a thumbnail | Main image changes to the selected thumbnail |
| 5 | Verify image loading | All images load without broken image placeholders |

**Expected Result:** All product images display correctly, and thumbnail navigation works as expected.

---

## TC-EC-015: Add a product to the cart

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-015 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- User is on a product detail page
- The product is in stock
- Cart is currently empty

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Click the "Add to Cart" button | Button responds to click |
| 2 | Observe the cart icon | Cart badge count updates to 1 |
| 3 | Observe the notification | A success message "Product added to cart" is displayed |
| 4 | Click the cart icon | Cart page is displayed with the added product |

**Expected Result:** Product is successfully added to the cart, and the cart count is updated.

---

## TC-EC-016: Update item quantity in the cart

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-016 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- A product is already in the cart with quantity 1

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the cart page | Cart page is displayed with the product |
| 2 | Locate the quantity input or +/- buttons | Quantity control is visible |
| 3 | Increase quantity to 3 | Quantity value changes to 3 |
| 4 | Verify cart total | Cart subtotal and total update to reflect 3 items |

**Expected Result:** Cart quantity is updated, and the total price recalculates correctly.

---

## TC-EC-017: Remove an item from the cart

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-017 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- At least one product is in the cart

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the cart page | Cart page is displayed |
| 2 | Click the "Remove" button next to a product | Product is removed from the cart |
| 3 | Verify the cart | Product is no longer displayed in the cart |
| 4 | Verify cart total | Cart total updates to exclude the removed item |

**Expected Result:** Product is removed from the cart, and the total price recalculates correctly.

---

## TC-EC-018: Cart total updates correctly when quantity changes

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-018 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- Two products are in the cart:
  - Product A: Price $50, Quantity 2 (Subtotal: $100)
  - Product B: Price $30, Quantity 1 (Subtotal: $30)
- Cart total should be $130

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the cart page | Cart page is displayed with both products |
| 2 | Verify Product A subtotal | Subtotal for Product A is $100 (2 x $50) |
| 3 | Verify Product B subtotal | Subtotal for Product B is $30 (1 x $30) |
| 4 | Verify cart total | Cart total is $130 |
| 5 | Change Product A quantity to 3 | Subtotal for Product A updates to $150 |
| 6 | Verify cart total | Cart total updates to $180 ($150 + $30) |

**Expected Result:** Cart total recalculates correctly whenever quantity changes.

---

## TC-EC-019: Cannot add out-of-stock product to cart

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-019 |
| **Priority** | Medium |
| **Test Type** | Negative |

**Preconditions:**
- A product is marked as "Out of Stock"

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the out-of-stock product detail page | Product detail page is loaded |
| 2 | Verify the "Add to Cart" button | "Add to Cart" button is disabled or displays "Out of Stock" |
| 3 | Attempt to click the button | Button is not clickable or shows an "out of stock" message |

**Expected Result:** Out-of-stock products cannot be added to the cart, and the button is clearly disabled.

---

## TC-EC-020: Complete checkout with valid information

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-020 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- At least one product is in the cart
- User is logged in or guest checkout is available

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the cart page and click "Checkout" | Checkout page is displayed |
| 2 | Enter shipping information (Name, Address, City, Postal Code, Phone) | All fields accept valid input |
| 3 | Select a shipping method | Shipping method is selected |
| 4 | Enter payment information (Credit Card Number, Expiry, CVV) | Payment fields accept valid input |
| 5 | Click "Place Order" | Order is submitted successfully |
| 6 | Observe the result | Order confirmation page is displayed with order number and summary |

**Expected Result:** Order is placed successfully, and a confirmation page with order details is shown.

---

## TC-EC-021: Checkout validates required shipping fields

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-021 |
| **Priority** | High |
| **Test Type** | Validation |

**Preconditions:**
- At least one product is in the cart
- User is on the checkout page

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Leave all shipping fields empty | All fields are empty |
| 2 | Click "Place Order" | Form submission is rejected |
| 3 | Verify error messages | Error messages "This field is required" are displayed for each empty required field |
| 4 | Fill in all fields except Phone Number | All fields except Phone are filled |
| 5 | Click "Place Order" | Form submission is rejected |
| 6 | Verify error message for Phone | Error message "Phone number is required" is displayed |

**Expected Result:** Checkout form validates all required fields and displays clear error messages for missing data.

---

## TC-EC-022: Checkout validates credit card number format

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-022 |
| **Priority** | Medium |
| **Test Type** | Validation |

**Preconditions:**
- User is on the checkout page with valid shipping information

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Enter Credit Card Number: `1234` | Field accepts input |
| 2 | Fill all other fields with valid data | All other fields accept input |
| 3 | Click "Place Order" | Form submission is rejected |
| 4 | Verify error message | Error message "Please enter a valid credit card number" is displayed |
| 5 | Enter Credit Card Number: `4111111111111111` (valid test card) | Field accepts input |
| 6 | Click "Place Order" | Form is submitted successfully |

**Expected Result:** Invalid credit card numbers are rejected with a clear error message; valid numbers are accepted.

---

## TC-EC-023: Cannot checkout with empty cart

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-023 |
| **Priority** | Medium |
| **Test Type** | Negative |

**Preconditions:**
- Cart is empty

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Navigate to the cart page | Cart page is displayed with "Your cart is empty" message |
| 2 | Verify the "Checkout" button | "Checkout" button is not displayed or is disabled |
| 3 | Attempt to access checkout URL directly | User is redirected to the cart page with a message "Your cart is empty" |

**Expected Result:** Checkout is not accessible when the cart is empty.

---

## TC-EC-024: Order confirmation page displays correct details

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-024 |
| **Priority** | High |
| **Test Type** | Functional |

**Preconditions:**
- An order has been successfully placed

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Observe the order confirmation page | Confirmation page is displayed |
| 2 | Verify order number | A unique order number is displayed |
| 3 | Verify order items | All ordered products are listed with correct names, quantities, and prices |
| 4 | Verify shipping address | Shipping address matches the information entered during checkout |
| 5 | Verify order total | Order total matches the sum of item prices plus shipping cost |
| 6 | Verify payment method | Payment method is displayed correctly |

**Expected Result:** Order confirmation page displays all order details accurately.

---

## TC-EC-025: Order confirmation email is sent

| Field | Value |
|-------|-------|
| **Scenario ID** | TS-EC-025 |
| **Priority** | Low |
| **Test Type** | Functional |

**Preconditions:**
- An order has been successfully placed
- A valid email address was provided during registration or checkout

**Test Steps:**

| Step | Action | Expected Result |
|------|--------|----------------|
| 1 | Wait 1-5 minutes after placing the order | Wait for email delivery |
| 2 | Check the email inbox for the registered email address | Order confirmation email is received |
| 3 | Verify email subject | Subject contains the order number, e.g., "Order Confirmation #ORD-001234" |
| 4 | Verify email content | Email contains order details, shipping address, and order total |
| 5 | Verify a link to view order status | A link to track the order is included in the email |

**Expected Result:** A confirmation email with correct order details is sent to the registered email address.
