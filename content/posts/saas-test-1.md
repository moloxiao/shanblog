+++
title = 'SaaS Test 1 : Phased Testing Strategy for a SaaS System'
date = 2024-11-07T15:10:00+13:00
draft = false
tags = ["Test", "SaaS"]
description = "This document outlines a practical, phased approach to testing login and registration features in a SaaS application. It balances manual testing and E2E automation based on development stage."
+++
# Phased Testing Strategy for a SaaS System



---

## 🧪 Phase 1: Demo Stage – Manual Testing

### 🎯 Goal
Quickly verify that basic user functions (e.g., registration and login) work as expected without investing time in automation.

### 🛠️ How
- Write and follow simple test cases manually.
- Use DevTools to debug UI or network errors.
- Focus on form validation, error messages, and navigation.

### 🧾 Example Test Cases

| Feature      | Test Case                                        | Expected Result                         |
|--------------|--------------------------------------------------|------------------------------------------|
| Register     | Valid email and password                         | Redirect to login or dashboard           |
| Register     | Weak password                                    | Show "password too weak" error           |
| Login        | Valid credentials                                | Redirect to dashboard                    |
| Login        | Wrong password                                   | Show "invalid credentials" error         |
| Logout       | Click logout                                     | Return to login page                     |

### ❌ Why Not Use Playwright Yet?
- Time-saving at early stages
- Frequent UI changes make scripts brittle

---

## 🚀 Phase 2: Core Flow Stability – Partial Automation with Playwright

### 🎯 Goal
Ensure that your critical workflows do not break as new features are added.

### 🛠️ How
- Use Playwright or Cypress to automate a few **core flows**
- Start with login, registration, and one post-login interaction
- Run tests manually or via CLI

### 🧩 Suggested Flows to Cover
- Register → Login → Dashboard Welcome
- Login → Create Item → Save → Logout

### 🧪 Example Playwright Snippet

```ts
import { test, expect } from '@playwright/test';

test('User can log in successfully', async ({ page }) => {
  await page.goto('https://example.com/login');
  await page.fill('input[name="email"]', 'test@example.com');
  await page.fill('input[name="password"]', 'Password123');
  await page.click('button[type="submit"]');
  await expect(page).toHaveURL('https://example.com/dashboard');
});
```

## Phase 3: Growth Stage – Full E2E Automation

### 🎯 Goal
Support team collaboration and CI/CD deployment confidence with complete test coverage.

🛠️ How
Write Playwright test suites for each functional module

Add data-testid attributes for stable element targeting

Integrate test runs with CI tools (GitHub Actions, GitLab CI)

### 🧰 Toolchain Suggestions
Playwright or Cypress for browser automation

GitHub Actions for CI/CD

Slack/Webhook alerts for failed test reports

## 📋 Summary Table

|Phase|	Automation	|Action Plan|
|--------------|--------------------------------------------------|------------------------------------------|
|Demo	|❌ No	|Manual testing + basic case checklist|
|Stable Dev|	✅ Partial|	Write Playwright tests for key user journeys|
|Growth Stage|	✅ Full|	Full E2E test suite + CI pipeline integration|
