+++
title = 'SaaS Test 2 : Test Case'
date = 2025-04-20T16:10:00+13:00
draft = false
tags = ["Test", "SaaS"]
description = ""
+++

## 1 Principle

## ✅ What Each Testing Layer Should Do

| Testing Layer | What to Test | Example |
|---------------|--------------|---------|
| 🟩 Unit Test | Test **core logic** of individual functions or classes, without external dependencies | Validate password strength: `PasswordValidator::isStrong()` |
| 🟨 Integration Test | Test how modules/services **interact**, often with real DB or services | Check if user registration inserts into DB and sends email |
| 🟥 End-to-End (E2E) Test | Simulate **real user behavior** across the full stack | Fill out registration form in browser → submit → redirect to dashboard |

## ❌ What Each Testing Layer Should NOT Do

| Testing Layer | Don't Do This | Reason |
|---------------|----------------|--------|
| 🟩 Unit Test | Don't access DB, network, or real APIs | Unit tests should be fast, isolated, and logic-only |
| 🟨 Integration Test | Don’t test UI rendering or button positions | Integration tests focus on backend/data flow, not UI components |
| 🟥 End-to-End (E2E) Test | Don’t test detailed field validations (e.g., regex) | E2E tests should verify core flows, not internal validation rules |

## 🧠 Test Layer Summary

| Layer | DO | DON’T |
|-------|-----|--------|
| Unit | Test logic in isolation | No DB, no API calls |
| Integration | Test module cooperation | No UI component tests |
| E2E | Test full user flow | No detailed field logic or validation |



## 2 Minimum Viable Test Plan
based on the Test Pyramid model.  

## Login & Registration Feature Test Cases

| Feature Name       | Description                                             | Test Level    | Sample Test Data                                                  | Expected Result                                                  |
|--------------------|---------------------------------------------------------|---------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| Sign Up            | Register a new user with email and password             | End-to-End    | Email: test@abc.com<br>Password: Test@1234<br>Confirm: Test@1234  | Registration successful; system sends email verification         |
| Email Format Check | Validate email input format                             | Unit          | Email: test@abc / test@.com                                       | Error: "Invalid email format"                                   |
| Password Strength  | Enforce strong password policy                          | Unit          | Password: 12345 / abcde                                           | Error: "Password too weak"                                      |
| Password Match     | Ensure password and confirmation match                  | Unit          | Password: Test@1234<br>Confirm: Test@4321                         | Error: "Passwords do not match"                                 |
| Email Verification | Handle email token verification                         | Integration   | Link: `/verify?token=abc123`                                     | Success: "Email verified", user is activated                    |
| Token Expiry       | Handle expired or invalid email verification link       | Integration   | Link: `/verify?token=expired`                                    | Error: "Verification link is invalid or expired"                |
| Login              | Login with email and password                           | End-to-End    | Email: test@abc.com<br>Password: Test@1234                       | Login successful, redirect to dashboard                         |
| Login Rate Limit   | Limit login attempts to prevent brute-force attacks     | Integration   | 5 failed login attempts                                           | Error: "Too many login attempts" or account temporarily locked  |
| Forgot Password    | Request a password reset link via email                 | Integration   | Email: test@abc.com                                               | Message: "Password reset link sent to your email"              |
| Reset Password     | Set a new password using the reset link                 | End-to-End    | Link: `/reset?token=abc123`<br>New password: Test@5678           | Message: "Password successfully reset", user can login again    |
| Logout             | Log the user out and destroy session/token              | Integration   | Click "Logout"                                                    | JWT/session/cookie is cleared, user is redirected to login page |

---

## User Management Feature Test Cases


| Feature Name               | Description                                                                 | Test Level    | Sample Test Data                                                                                     | Expected Result                                                    |
|----------------------------|-----------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Personal Info Update       | Update user details: last name, mobile number, landline number (required), extension, address | End-to-End    | Last Name: Smith<br>Mobile: 0210000000<br>Landline: 0320000000<br>Ext: 123<br>Address: 123 Main St   | Success: "Profile updated"                                         |
| Landline Required Check    | Ensure landline number is mandatory when updating profile info              | Unit          | Landline: (empty)                                                                                      | Error: "Landline number is required"                               |
| Password Change            | Change password by providing current password and confirming new one twice  | End-to-End    | Current: OldPass@123<br>New: NewPass@456<br>Confirm: NewPass@456                                      | Success: "Password updated", user may need to log in again         |
| Password Mismatch Check    | Ensure new password and confirmation match                                  | Unit          | New Password: NewPass@456<br>Confirm: NewPass@654                                                     | Error: "Passwords do not match"                                    |
| Current Password Check     | Require correct current password to authorize password change               | Integration   | Current Password: (incorrect)                                                                         | Error: "Current password is incorrect"                             |
| Email Verification Check   | Ensure email is verified before allowing access to core features            | End-to-End    | User has not verified email, tries to create a project/order                                         | Error: "Please verify your email first", action is blocked         |


**Glossary**  :  The **Testing Pyramid** is a software testing strategy that emphasizes having **more low-level tests (fast and cheap)** and **fewer high-level tests (slower and costlier)**. This ensures test coverage is broad, efficient, and maintainable.

Three Layers of the Testing Pyramid :  

| Layer              | Definition                                                                                         | Characteristics                                                                 |
|--------------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| **1. Unit Test**    | Tests individual functions, methods, or components in isolation.                                   | - Fast and lightweight<br>- No external dependencies (e.g., database, API)<br>- Ideal for logic validation |
| **2. Integration Test** | Tests how different components or systems work together (e.g., database + backend API).             | - Slower than unit tests<br>- Checks service or module interaction<br>- Often test APIs, auth, DB logic     |
| **3. End-to-End Test (E2E)** | Simulates real user scenarios across the whole system (frontend + backend + DB).              | - Slowest and most resource-intensive<br>- High confidence<br>- Useful for testing critical user workflows |

Key Idea :  

- The **base** of the pyramid is **unit tests**—you should have **the most** of these.
- The **middle** layer has **integration tests**—fewer, but still essential.
- The **top** is **E2E tests**—only a **small number** to cover critical user journeys.


