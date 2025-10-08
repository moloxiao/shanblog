5-Layer Accounting Reconciliation Model

# Universal 5-Layer Reconciliation Model (Concept & Purpose)

| Layer | Name | Purpose |
|:--|:--|:--|
| **A** | Regulatory Net Consistency | Check if two “official/submitted” reports for the same period match exactly (e.g., *Assessment ≡ Payment/Refund*). |
| **B** | Cashflow Matching | Verify that each *Payment / Refund / Transfer* after assessment matches bank and general ledger entries. |
| **C** | Transaction Basis Comparison | Confirm that the “taxable/deductible amounts” reported to regulators equal the transaction totals by tax code/rule in your books. |
| **D** | GL Closing Bridge | Bridge regulatory net amount to GL closing balance (+ components like AR/AP/accruals) to reach zero or explainable small residuals. |
| **E** | Rolling Consistency | Validate that *Opening + Changes − Cashflow = Closing*, ensuring period continuity and no omissions or duplicates. |

---

# Common Mapping Across Domains

| Domain | A: Regulatory Net | B: Cashflow | C: Transaction Basis | D: GL Bridge | E: Rolling Consistency |
|:--|:--|:--|:--|:--|:--|
| **GST / VAT** | Return Summary’s *Payment/Refund ≡ Assessment* | Payments/Refunds/Transfers ↔ Bank ↔ GL “GST Control” | IRD *Collected/Paid* ↔ Xero transactions by tax code | IRD Assessment − GST Account Balance + GST in AR/AP (+Expense claims) ≈ 0 | Opening GST Owing + Filed − Payments/Refunds = Closing GST Owing |
| **Income Tax** | IRD or self-assessed *Current tax payable ≡ Return net* | Provisional/Terminal tax ↔ Bank ↔ GL “Income Tax Payable/Receivable” | Tax comp (profit → adjustments → taxable income) ↔ reported taxable income | Current tax provision − GL tax liability + WHT, etc. ≈ 0; Deferred tax: balance differences × rate = DTL/DTA | Opening tax payable + Current tax expense − Payments = Closing payable |
| **Payroll / PAYE** | Filed reports (IR345/IR348) ≡ Employee totals (PAYE/ESCT/ACC) | Filed pay/direct debit/transfer ↔ Bank ↔ GL “Payroll/PAYE Control” | Payroll details (gross-to-net, tax code, KiwiSaver, ACC) ↔ reported boxes | GL wages/PAYE/KiwiSaver payable ≈ filed totals; explain accruals, adjustments | Opening liability + Accrued − Paid/Remitted = Closing liability |

---

# Why This 5-Layer Framework Works Everywhere

- **Isolates issue sources:**  
  A fixes regulatory data, B fixes cashflow, C fixes rules, D fixes GL timing, E fixes continuity.  
- **Short-circuit logic:**  
  Stop and fix the first failed layer instead of letting later noise pile up.  
- **Unified logic:**  
  Each layer uses fixed reports & fields — only the data source changes across domains.

---

# Implementation Tips (“One Measurement for All”)

1. **Template:** One workbook = 5 tabs (A–E), each with *Pass/Fail*, materiality limit, and owner.  
2. **Authoritative fields only:** e.g., for GST use IRD & transaction audit data, not partial subtotals unless finalized.  
3. **Layered thresholds:** Different *materiality* for C and D (e.g., per-period ≤ $X or ≤ Y%; bridge residual ≤ $Z).  
4. **Audit trail:** Keep variance list + action + evidence (filing receipt, bank statement, GL screenshot, etc.).

---

**In one sentence:**  
*Same method, different report names.*  
Whether GST, Income Tax, or Payroll — run A → B → C → D → E for a process that’s teachable, traceable, and low-risk.
