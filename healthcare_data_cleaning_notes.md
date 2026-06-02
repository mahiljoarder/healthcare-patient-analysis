# Data Cleaning Notes — Healthcare Patient Records

## Overview

The raw dataset (`patient_records`) contained 200 rows of intentionally messy data with multiple data quality issues. Cleaning was done in two stages — SQL (PostgreSQL) and Power BI — before any analysis was performed.

---

## The Raw Data Problems

The dataset had the following issues:

- Exact duplicate records
- Same patient appearing with different patient IDs
- A completely empty ghost record
- Inconsistent gender values (M, Male, MALE, F, Female, FEMALE)
- Three different date formats across date columns
- Future birth dates (data entry errors)
- Multiple messy phone number formats
- Invalid email addresses (double @@, missing @, missing domain)
- Inconsistent Yes/No fields (Y, YES, N, No, yes)
- Negative bill amounts
- Out of range ratings (rating of 8 on a 1-5 scale)
- Missing doctor names
- Messy zip codes (spaces inside numbers)
- Inconsistent country values (america, us, U.S.A, united states of america)
- Inconsistent state casing (tx, Ca, mA, WA)
- Whitespace in text fields

---

## Stage 1 — SQL Cleaning (PostgreSQL)

All cleaning was done on a copy of the table called `patient_records_cleaning` to preserve the original raw data.

```sql
create table public.patient_records_cleaning as 
select * from public.patient_records
```

### Step 1 — Remove Exact Duplicates

Used `ROW_NUMBER()` to identify and delete exact duplicate rows:

```sql
delete from public.patient_records_cleaning
where patient_id in 
    (select patient_id
    from (select 
        patient_id, 
        row_number() over (partition by (patient_id) order by record_id) as rn 
        from public.patient_records_cleaning) as sub
where rn>1)
```

### Step 2 — Remove Ghost Record

Patient P1017 had no data in any field:

```sql
delete from public.patient_records_cleaning
where patient_id = 'P1017'
```

### Step 3 — Remove Same Patient Different ID

Same patient appearing with different IDs was identified by matching name + date of birth + address:

```sql
delete from public.patient_records_cleaning
where patient_id in (select patient_id from 
(select patient_id, 
row_number() over(partition by full_name, date_of_birth, address order by patient_id) as rn
from public.patient_records_cleaning) as dup
where rn>1)
```

### Step 4 — Standardize Gender

```sql
update public.patient_records_cleaning
set gender = case 
    when gender ilike 'm%' then 'Male'
    when gender ilike 'f%' then 'Female'
    else null
end
```

### Step 5 — Fix Date Columns (3 formats)

All three date columns (`date_of_birth`, `admission_date`, `discharge_date`) had the same three format problems:

**Format 1 — YYYY/DD/MM (year first, day and month swapped):**
```sql
update public.patient_records_cleaning
set date_of_birth = concat(
    substring(regexp_replace(date_of_birth, '[-/]', '-','g'),1,4), '-',
    substring(regexp_replace(date_of_birth, '[-/]', '-','g'),9,2), '-',
    substring(regexp_replace(date_of_birth, '[-/]', '-','g'),6,2)) 
where date_of_birth ilike '19%' or date_of_birth ilike '20%'
```

**Format 2 — DD/MM/YYYY (European style):**
```sql
update public.patient_records_cleaning
set date_of_birth = to_date(date_of_birth, 'DD/MM/YYYY') 
where date_of_birth not like '19%' and date_of_birth not like '20%'
and split_part(date_of_birth, '/', 1)::int > 12
and date_of_birth is not null and date_of_birth != ''
```

**Format 3 — MM/DD/YYYY (US style):**
```sql
update public.patient_records_cleaning
set date_of_birth = to_date(date_of_birth, 'mm/dd/yyyy') 
where date_of_birth not like '19%' and date_of_birth not like '20%'
and date_of_birth is not null and date_of_birth != ''
```

**Future dates flagged:**
```sql
update public.patient_records_cleaning
set date_of_birth = case 
    when date_of_birth::date > current_date then 'Invalid'
    else date_of_birth
end
```

### Step 6 — Standardize Phone Numbers

Removed all non-numeric characters then reformatted to XXX-XXX-XXXX:

```sql
update public.patient_records_cleaning
set phone = concat(
    substring(regexp_replace(phone, '[^0-9]','', 'g'), 1,3), '-', 
    substring(regexp_replace(phone, '[^0-9]','', 'g'), 4,3), '-', 
    substring(regexp_replace(phone, '[^0-9]','', 'g'), 7,4))
```

Same applied to `emergency_phone`.

### Step 7 — Fix Emails

```sql
update public.patient_records_cleaning
set email = case 
    when email is null or email = '' then 'Unknown'
    when email ilike '%@@%' then replace(email, '@@', '@')
    when email not like '%@%' then 'Invalid - Missing @'
    when email not like '%.%' then 'Invalid - Missing Domain'
    else email
end
```

### Step 8 — Standardize Boolean Fields

Applied to `is_active`, `is_insured`, and `smoker`:

```sql
update public.patient_records_cleaning
set smoker = case 
    when smoker ilike '%y%' then 'Yes'
    when smoker ilike '%n%' then 'No'
    else 'Contact Soon'
end
```

### Step 9 — Fix Financial Columns

```sql
update public.patient_records_cleaning
set balance = abs(balance)

update public.patient_records_cleaning
set amount_paid = abs(amount_paid)

update public.patient_records_cleaning
set total_bill = abs(total_bill)
```

### Step 10 — Fix Ratings

```sql
update public.patient_records_cleaning
set rating = case 
    when rating > 5 then null
    when rating < 1 then null
    else rating 
end
```

### Step 11 — Standardize Country, State, Zip Code

```sql
-- Country
update public.patient_records_cleaning
set country = case 
    when country ilike '%america%' then 'USA'
    when country ilike '%united%' then 'USA'
    when country ilike 'us%' then 'USA'
    when country ilike 'u.s%' then 'USA'
    else country
end

-- State (uppercase)
update public.patient_records_cleaning
set state = upper(state)

-- Zip code (remove non-numeric characters)
update public.patient_records_cleaning
set zip_code = regexp_replace(zip_code, '[^0-9]', '', 'g')
```

### Step 12 — Handle Missing Doctors

```sql
update public.patient_records_cleaning
set doctor_name = case 
    when doctor_name is null or doctor_name = '' then 'Unknown'
    else doctor_name
end
```

### Step 13 — Trim All Text Fields

```sql
update public.patient_records_cleaning
set
    first_name = trim(first_name),
    last_name = trim(last_name),
    full_name = trim(full_name),
    email = trim(email),
    phone = trim(phone),
    address = trim(address),
    city = trim(city),
    state = trim(state),
    country = trim(country),
    doctor_name = trim(doctor_name),
    insurance_provider = trim(insurance_provider),
    diagnosis = trim(diagnosis)
```

---

## Stage 2 — Power BI

After connecting the cleaned CSV to Power BI, additional data preparation was done:

**Date column conversion:**
All three date columns were stored as text after export from PostgreSQL. They were converted to proper Date format inside Power BI using the column type settings in Transform Data.

**Calculated column — Length of Stay:**
```
length_of_stay = DATEDIFF([admission_date], [discharge_date], DAY)
```

**Calculated column — Age Group:**
```
age_group = 
IF(DATEDIFF([date_of_birth], TODAY(), YEAR) >= 56, "Senior",
IF(DATEDIFF([date_of_birth], TODAY(), YEAR) <= 17, "Minor",
IF(DATEDIFF([date_of_birth], TODAY(), YEAR) <= 35, "Young",
"Middle Aged")))
```

**Calculated column — Payment Category:**
```
payment_category = 
IF([amount_paid] = 0, "Unpaid",
IF([balance] > 0, "Partially Paid",
"Fully Paid"))
```

**Measure — Same Day Discharges:**
```
Same Day Discharges = 
CALCULATE(
    COUNT('public patient_records_cleaning'[patient_id]),
    'public patient_records_cleaning'[admission_date] = 
    'public patient_records_cleaning'[discharge_date]
)
```

---

## Summary

| Stage | Tool | Problems Fixed |
|-------|------|----------------|
| 1 | SQL | Duplicates, ghost records, gender, dates (3 formats), phones, emails, booleans, financials, ratings, country, state, zip, doctor names, whitespace |
| 2 | Power BI | Date type conversion, length of stay, age groups, payment categories |

After cleaning: **175 clean records** ready for analysis from the original 200 messy rows.
