# 🏥 Healthcare Patient Records Analysis

End-to-end data analytics project covering data cleaning, SQL analysis, and Power BI visualization on a simulated healthcare dataset.



## Project Overview

A healthcare facility managing patient records across multiple departments and doctors. This project analyzes 175 cleaned patient records to uncover department performance, financial gaps, doctor efficiency, patient demographics, and admission trends.

**Total Revenue Analyzed: $1.29M | Total Billed: $1.51M | Total Unpaid: $222.8K**



## Tools Used

| Tool | Purpose |
|------|---------|
| Microsoft Excel | Initial data review |
| PostgreSQL | Data cleaning & analysis |
| Power BI | Dashboard & visualization |



## Project Files

| File | Description |
|------|-------------|
| `patient_records_raw.sql` | Raw messy dataset (200 rows with intentional data quality issues) |
| `data_cleaning.sql` | Full data cleaning script |
| `analysis_queries.sql` | All 45 SQL analysis queries with results |
| `Healthcare_Dashboard.pbix` | Power BI dashboard (4 pages) |
| `data_cleaning_notes.md` | Full cleaning process walkthrough |
| `healthcare_presentation.html` | Client-facing project presentation |



## Data Cleaning



**Issues found and fixed:**

| Problem | Fix |
|---------|-----|
| Exact duplicate records | Removed using `ROW_NUMBER()` window function |
| Same patient different ID | Identified using name + DOB + address match |
| Ghost record (all nulls) | Deleted patient P1017 |
| Inconsistent gender (M, MALE, F, FEMALE) | Standardized using `ILIKE` and `CASE WHEN` |
| 3 different date formats (MM/DD/YYYY, DD/MM/YYYY, YYYY/DD/MM) | Fixed using `TO_DATE()` and `REGEXP_REPLACE()` |
| Future birth dates | Flagged as 'Invalid' |
| Messy phone formats ((777)456, 8889073456, 444/567) | Standardized to XXX-XXX-XXXX using `REGEXP_REPLACE()` |
| Invalid emails (@@, missing @, missing domain) | Fixed or flagged using `CASE WHEN` |
| Inconsistent Yes/No fields (Y, YES, N, No) | Standardized using `ILIKE` |
| Negative bill amounts | Fixed using `ABS()` |
| Out of range ratings (rating = 8) | Set to NULL |
| Missing doctor names | Replaced with 'Unknown' |
| Messy zip codes (spaces, letters) | Cleaned using `REGEXP_REPLACE()` |
| Inconsistent country values (america, us, U.S.A) | Standardized to 'USA' |
| Inconsistent state casing (tx, Ca, WA) | Standardized using `UPPER()` |
| Whitespace in all text fields | Cleaned using `TRIM()` |

###  Power BI
- Converted `date_of_birth`, `admission_date`, `discharge_date` from text to Date format
- Created `length_of_stay` calculated column using `DATEDIFF`
- Created `age_group` calculated column using nested `IF` statements
- Created `payment_category` measure using `IF` logic



## 📊 SQL Analysis 

### Department Analysis 
| # | Question | Answer |
|---|----------|--------|
| 1 | Department with most patients? | **Emergency** — 33 patients |
| 2 | Department generating most revenue? | **Cardiology** — $420,800 |
| 3 | Department with highest avg bill? | **Oncology** — $22,615.38 |
| 4 | Department with highest avg rating? | **Pediatrics** — 5.0 |
| 5 | Department with most unpaid balance? | **Oncology** — $147,000 |

### Doctor Analysis 
| # | Question | Answer |
|---|----------|--------|
| 6 | Doctor with most patients? | **Dr. Smith** — 37 patients |
| 7 | Doctor with highest total revenue? | **Dr. Brown** — $427,850 |
| 8 | Doctor with best avg rating? | **Dr. Brown** — 4.3 |
| 9 | Doctor with most unpaid balance? | **Dr. Johnson** — $62,150 |
| 10 | Doctor treating most unique diagnoses? | **Dr. Johnson** — 32 diagnoses |

### Financial Analysis 
| # | Question | Answer |
|---|----------|--------|
| 11 | Patients with unpaid balance? | **51 patients** |
| 12 | Total unpaid balance? | **$222,800** |
| 13 | Insurance covering most patients? | **BlueCross** — 45 patients |
| 14 | Avg bill by insurance provider? | Aetna $12,100 · BlueCross $8,140 · United Health $7,633 |
| 15 | Uninsured patients? | **1 patient** |
| 16 | Total revenue vs total billed? | Billed $1,511,700 · Collected $1,289,700 · Gap $222,000 |
| 17 | Insurance with highest unpaid balance? | **BlueCross** — $71,300 |
| 18 | Avg bill vs avg amount paid? | Avg bill $8,638 · Avg paid $7,369 · Gap $1,269 |
| 19 | Top 5 most expensive diagnoses? | Heart Attack $55K · Bypass Surgery $48K · Valve Replacement $42K |
| 20 | Insurance paying least % of bills? | **BlueCross** — 81.4% |

###  Patient Analysis 
| # | Question | Answer |
|---|----------|--------|
| 21 | Smokers vs non-smokers? | Non-smokers 145 · Smokers 30 |
| 22 | Most common diagnosis? | **Appendicitis** — 5 cases |
| 23 | Average age of patients? | **47.6 years** |
| 24 | Male vs female patients? | Male 90 · Female 85 |
| 25 | State with most patients? | **VT** — 13 patients |
| 26 | Most common blood type? | **B+** — 27 patients |
| 27 | Patients with no emergency contact? | **1 patient** |
| 28 | Patients with missing phone? | **1 patient** |
| 29 | Avg bill smokers vs non-smokers? | Smokers $19,675 · Non-smokers $6,355 |
| 30 | Avg bill insured vs uninsured? | Insured $8,781 · Uninsured $2,538 |

### Admission Analysis 
| # | Question | Answer |
|---|----------|--------|
| 31 | Average length of stay? | **3.27 days** |
| 32 | Month with most admissions? | **March** — 16 admissions |
| 33 | Diagnosis with longest avg stay? | **Heart Attack** — 8 days |
| 34 | Same day discharges? | **1 patient** |
| 35 | Department with longest avg stay? | **Geriatrics** — 7.07 days |

### Risk & Business Insights 
| # | Question | Answer |
|---|----------|--------|
| 36 | Patients with unpaid balance + contact info | 51 patients listed by balance descending |
| 37 | Patients admitted more than once? | None found (duplicates removed in cleaning) |
| 38 | Smokers vs non-smokers total bills? | Non-smokers $921,450 · Smokers $590,250 |
| 39 | Do older patients stay longer? | Yes — Seniors avg 5.93 days · Young avg 1.00 day |
| 40 | Most profitable department (revenue per visit)? | **Cardiology** — $21,040 per visit |
| 41 | Payment status %? | Fully Paid 70.9% · Partially Paid 27.4% · Unpaid 1.7% |
| 42 | State with highest avg bill? | **LA** — $45,000 |
| 43 | Diagnosis with highest unpaid balance? | **Lymphoma** — $30,000 |
| 44 | Patients with invalid/missing emails? | **0** (all fixed in cleaning) |
| 45 | Doctor with longest avg patient stay? | **Dr. Brown** — 4.43 days |



## Power BI Dashboard

**4-page interactive dashboard with Department and Insurance Provider slicers:**

1. **Overview** — KPI cards, Revenue by Department, Patients by Department, Monthly Admissions
2. **Financial Overview** — Billed vs Collected vs Unpaid, Payment Status donut, Top 10 Diagnoses, Insurance breakdown
3. **Doctor & Patient** — Top doctors by revenue and patients, avg ratings, smoker/gender split, blood type distribution
4. **Admissions** — Avg length of stay by department, age group breakdown, patients by state, monthly trends



## Key Business Insights

- **Cardiology is the revenue engine** — $420,800 collected and $21,040 revenue per visit
- **Oncology carries the highest financial risk** — highest avg bill ($22,615) AND highest unpaid balance ($147,000)
- **BlueCross covers the most patients but pays the least** — only 81.4% of bills, leaving $71,300 unpaid
- **Smokers cost 3x more per visit** — avg bill $19,675 vs $6,355 for non-smokers
- **Seniors stay nearly 6x longer than young patients** — 5.93 days vs 1.00 day average
- **70.9% of patients are fully paid** — strong collection rate but $222,800 gap still needs attention
- **Emergency has the most patients but lowest revenue per visit** — high volume, low margin department



## 👤 Author

**Mahil Joarder**
Data Analyst | SQL • Excel • Power BI
**GitHub:** github.com/mahiljoarder
