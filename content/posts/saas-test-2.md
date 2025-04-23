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



## 2 SaaS Example

### 2.1 Login


### 2.2 Register


### 2.3 Admin User Manager
