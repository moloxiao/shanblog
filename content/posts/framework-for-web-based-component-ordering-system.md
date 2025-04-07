+++
title = 'Framework for Web-Based Component Ordering System'
date = 2025-04-08T15:10:00+13:00
draft = false
tags = ["Joinery"] 
description = ""
+++  

I asked ChatGPT to help me design a web application that allows users to input structured window and door information, and I asked it to provide a thinking framework for the system.   

# 🧠 Framework for Web-Based Component Ordering System (For APL Window/Door Fabricators)

---

## 1. 📅 WHO & WHY

| Dimension     | Content                                                             |
|---------------|---------------------------------------------------------------------|
| 💼 You are     | APL authorized fabricator using Soft Tech V6                                     |
| 🌟 Goal         | Build a customer-facing web ordering form for window/door products            |
| 👥 Users        | Builders, sales reps, site managers, clients                                   |
| ⚖️ User Needs   | Fast quoting, error-proof selection, intuitive structured input                |

---

## 2. 🔄 System Architecture

### Layered Structure:

| Layer                    | Purpose                                              | Domain Knowledge Required |
|--------------------------|------------------------------------------------------|----------------------------|
| Web Frontend             | Structured form UI to collect order data            | ❌ No                   |
| Soft Tech V6 Backend     | Modeling, pricing, production logic                 | ✅ Yes                  |

---

## 3. 📁 Data Abstraction

### Core Inputs:

- **Frame Code** (V1, V12, A3...) as primary selector
- **Field Groups:**
  - Dimensions
  - Glass
  - Colour
  - Hardware
  - Accessories

### Logic Inclusions:

- Allowed fields per Frame Code
- Field dependencies (e.g. frame type determines opening direction)
- Field value limits and defaults

---

## 4. 🎭 UI/UX Principles

| Priority Level | Strategy                                                                 |
|----------------|--------------------------------------------------------------------------|
| 🥇 Highest     | Logical clarity: Group fields cleanly, label clearly              |
| 🥈 Medium      | Input validation and real-time error blocking                    |
| 🥉 Lowest      | Fancy animations or complex transitions                         |

### Recommended UI Style:

- Two-column form layout
- FrameCode-based field filtering
- Diagram image (static reference only)

---

## 5. 📂 Data Source Strategy

| Source                     | Use                                                           |
|---------------------------|----------------------------------------------------------------|
| V6 Interface (manual)     | Observe field structure, dependencies, default values          |
| V6 Admin Export (if any)  | Export Frame list, field types, options                        |
| APL Product Manuals       | Provide diagram/images per FrameCode                          |
| Soft Tech Web API         | (Advanced) Query model structure programmatically               |

---

## 6. 📊 Output Design

| Format       | Purpose                          |
|--------------|----------------------------------|
| JSON         | System input / future API usage  |
| Excel/CSV    | Factory-side V6 import           |
| Image        | Structure diagram (optional)     |

---

## 7. ✅ MVP to Full Product Roadmap

| Stage | Scope                                  | Complexity |
|-------|----------------------------------------|------------|
| MVP   | Form + JSON/Excel export               | ❌ Low     |
| V1    | Field validation + auto-template logic | ⚠️ Medium |
| V2    | Backend V6/ERP integration             | ✅ High    |
| V3    | Live modeling preview / BIM data sync  | 🚀 Very High |

---

## 📆 Summary:

> Build the frontend as a **mirror of V6 logic**, with strong structure, clarity, and field control. No domain knowledge is required if FrameCode-based structure is used as the foundation.


