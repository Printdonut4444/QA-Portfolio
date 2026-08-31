# What is Auto Test (Automated Testing)

## 1. What does it mean
Automated Testing means using a **script or tool** to test software, instead of a person testing by hand (Manual Testing). The script acts like a user — it clicks buttons, fills in forms, and checks the result on the screen. Then it compares the result with what we expect (Expected Result).

## 2. Why do we need Auto Test
- **Saves time** when we need to test the same thing many times (Regression Testing).
- **More accurate** — fewer mistakes than a human doing the same task again and again.
- **Can run anytime** — even at night, or automatically every time new code is released (CI/CD).
- **Saves money long-term** for big projects that need a lot of repeated testing.

## 3. Manual Test vs Auto Test
| Topic | Manual Testing | Automated Testing |
|---|---|---|
| Who tests | A person tests | A script tests |
| Speed | Slower when repeated | Fast when run many times |
| Starting cost | Low | Higher (need to write scripts) |
| Best for | Exploratory, Usability, Ad-hoc Testing | Regression, tasks done many times |
| Flexibility | High — can adjust anytime | Need to update the script if UI/Flow changes |

## 4. Common Types of Auto Test
- **Unit Test** — Tests small parts of the code (usually written by Developers).
- **API Test** — Tests the API directly (tools: Postman, RestAssured).
- **UI/E2E Test (End-to-End)** — Tests through the screen, like a real user (tools: Selenium, Playwright, Cypress).
- **Performance Test** — Tests speed and load of the system (tools: JMeter, k6).

## 5. Popular Tools
- **Selenium** — Works with many languages (Java, Python, C#). An old and very popular tool.
- **Playwright** — Newer and faster. Supports many browsers by default.
- **Cypress** — Uses JavaScript. Good for modern web apps.
- **Appium** — For testing mobile apps (iOS/Android).
- **Postman / RestAssured** — For testing APIs.

## 6. Basic Steps of Auto Test
1. Choose test cases that are good for automation (repeated often, don't change much).
2. Write a test script using the chosen tool.
3. Run the script (Execute).
4. Collect the results (Report) and compare with the expected result.
5. Alert the team or report a bug when something is wrong.
6. Connect it to a CI/CD Pipeline so it runs automatically every time the code is updated.

## 7. Things to Be Careful About
- Not every test case should be automated — tests that change often or run only once are not worth automating.
- Scripts need maintenance when the UI or Flow of the system changes.
- Getting started takes time and some coding skill.

## 8. Summary
Auto Test is best for tasks that need to be tested again and again, like Regression Testing. It saves time and reduces mistakes. But it does not fully replace Manual Testing — especially for tasks that need human judgment, like Usability or Exploratory Testing. In real teams, good QA usually uses both Manual and Automated Testing together, depending on what each test case needs.