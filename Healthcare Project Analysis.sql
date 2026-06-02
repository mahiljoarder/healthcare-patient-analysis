
-- DEPARTMENT ANALYSIS

1. Which department has the most patients?
select * 
from public.patient_records_cleaning


select department, count(patient_id) as patient_count 
from public.patient_records_cleaning
group by department 
order by patient_count desc


2. Which department generates the most revenue?
select * 
from public.patient_records_cleaning

select department, sum(amount_paid) as revenue
from public.patient_records_cleaning
group by department
order by revenue desc
limit 1

3. Which department has the highest average bill?
select * 
from public.patient_records_cleaning

select department, round(avg(total_bill),2) as highest_avg_bill 
from public.patient_records_cleaning
group by department 
order by highest_avg_bill desc
limit 1


4. Which department has the highest average patient rating?
select * 
from public.patient_records_cleaning

select department, round(avg(rating),1) as avg_highest_rating
from public.patient_records_cleaning
group by department 
order by avg_highest_rating desc
limit 1




5. Which department has the most unpaid balances?
select * 
from public.patient_records_cleaning

select department, sum(balance) as unpaid_balance
from public.patient_records_cleaning
where balance > 0
group by department 
order by unpaid_balance desc 
limit 1

-- DOCTOR ANALYSIS
6. Which doctor has the most patients?
select * 
from public.patient_records_cleaning

select doctor_name, count(patient_id) as total_patient
from public.patient_records_cleaning
group by doctor_name 
order by total_patient desc
limit 1

7. Which doctor has the highest total revenue?
select * 
from public.patient_records_cleaning

select doctor_name, sum(total_bill) as Total_revenue 
from public.patient_records_cleaning
group by doctor_name 
order by Total_revenue desc
limit 1


8. Which doctor has the best average patient rating?
select * 
from public.patient_records_cleaning

select doctor_name, round(avg(rating),1) as avg_rating
from public.patient_records_cleaning
group by doctor_name 
order by avg_rating desc 
limit 1



9. Which doctor has the most unpaid balances?
select * 
from public.patient_records_cleaning

select doctor_name, sum(balance) as most_unpaid_balance 
from public.patient_records_cleaning
where balance > 0
group by doctor_name 
order by most_unpaid_balance desc 
limit 1




10. Which doctor treats the most unique diagnoses?
select * 
from public.patient_records_cleaning

select doctor_name, count(distinct(diagnosis)) as unique_diagnoses_count
from public.patient_records_cleaning
group by doctor_name 
order by unique_diagnoses_count desc
limit 1




-- FINANCIAL ANALYSIS
11. How many patients have an unpaid balance?
select * 
from public.patient_records_cleaning

select count(balance) as number_of_unpaid_balence
from public.patient_records_cleaning
where balance >0



12. What is the total unpaid balance across all patients?
select * 
from public.patient_records_cleaning

select sum(balance) as total_unpaid_balance
from public.patient_records_cleaning
where balance >0


13. Which insurance provider covers the most patients?
select * 
from public.patient_records_cleaning


select insurance_provider, count(insurance_provider) as insurance_count 
from public.patient_records_cleaning
group by insurance_provider 
order by insurance_count desc 
limit 1


14. What is the average bill by insurance provider?
select insurance_provider 
from public.patient_records_cleaning
where insurance_provider is null or insurance_provider = ''

update public.patient_records_cleaning
set insurance_provider = 'Unavailable'
where insurance_provider is null or insurance_provider = ''

select insurance_provider, round(avg(total_bill),2) as avg_bill
from public.patient_records_cleaning
group by insurance_provider
order by 2 desc 


15. How many uninsured patients do we have?

select * 
from public.patient_records_cleaning

select count(insurance_provider) as uninsured 
from public.patient_records_cleaning
where insurance_provider = 'Unavailable'



16. What is the total revenue collected vs total billed?
select * 
from public.patient_records_cleaning

select sum(total_bill) as total_billed, 
sum(amount_paid) as total_collected, 
(sum(total_bill) - sum(amount_paid)) as Total_gap
from public.patient_records_cleaning



17. Which insurance provider has the highest unpaid balance?
select * 
from public.patient_records_cleaning

select insurance_provider, sum(balance) as unpaid_balance
from public.patient_records_cleaning
where balance > 0
group by insurance_provider 
order by 2 desc 
limit 1


18. What is the average amount paid vs average bill?
select * 
from public.patient_records_cleaning

select round(avg(total_bill),1) as avg_bill, 
round(avg(amount_paid),1) as avg_amount_paid, 
round((avg(total_bill)-avg(amount_paid)),1) as gap 
from public.patient_records_cleaning

19. Top 5 most expensive diagnoses by average bill?
select * 
from public.patient_records_cleaning


select diagnosis, round(avg(total_bill),1) as avg_bill 
from public.patient_records_cleaning
group by diagnosis 
order by avg_bill desc
limit 5 

20. Which insurance provider pays the least percentage of bills?
select * 
from public.patient_records_cleaning

select insurance_provider, 
round((sum(amount_paid) / sum(total_bill))*100,1) as payment_percentage 
from public.patient_records_cleaning
where amount_paid <> 0 and total_bill <>0
group by 1
order by 2 

-- PATIENT ANALYSIS
21. How many smokers vs non smokers do we have?
select * 
from public.patient_records_cleaning


select smoker, count(smoker)
from public.patient_records_cleaning
group by smoker 


22. What is the most common diagnosis?

select * 
from public.patient_records_cleaning

select diagnosis, count(diagnosis) as count
from public.patient_records_cleaning
group by diagnosis 
order by 2 desc
limit 1

23. What is the average age of patients?
select * 
from public.patient_records_cleaning

select round(avg(extract(year from age(date_of_birth ::date))),1) as avg_age
from public.patient_records_cleaning
where date_of_birth <> 'Invalid'
and date_of_birth is not null and date_of_birth <> ''

24. How many male vs female patients do we have?
select * 
from public.patient_records_cleaning

select gender, count(gender) 
from public.patient_records_cleaning
group by gender 


25. Which state has the most patients?
select * 
from public.patient_records_cleaning

select state, count(state)
from public.patient_records_cleaning
group by state 
order by 2 desc 
limit 1

26. Which blood type is most common?
select * 
from public.patient_records_cleaning


select blood_type, count(blood_type) as blood_type_count 
from public.patient_records_cleaning
group by blood_type 
order by 2 desc 
limit 1


27. How many patients have no emergency contact?
select * 
from public.patient_records_cleaning

select count(*) as no_emergency_contact_count 
from public.patient_records_cleaning
where emergency_phone is null or emergency_phone = ''



28. How many patients have missing phone numbers?


select count(*) as no_phone_count 
from public.patient_records_cleaning
where phone is null or phone = ''




29. What is the average bill for smokers vs non smokers?
select * 
from public.patient_records_cleaning

select smoker, round(avg(total_bill),2) as avg_bill
from public.patient_records_cleaning
group by smoker 

30. What is the average bill for insured vs uninsured patients?
select * 
from public.patient_records_cleaning

select is_insured, round(avg(total_bill),2) as avg_bill
from public.patient_records_cleaning
group by is_insured 


-- ADMISSION ANALYSIS
31. What is the average length of stay?
select * 
from public.patient_records_cleaning

select round(avg(discharge_date ::date - admission_date ::date),2)  as avg_stay
from public.patient_records_cleaning
where admission_date <> 'Invalid' and discharge_date <> 'Invalid'

32. Which month had the most admissions?

select * 
from public.patient_records_cleaning


select  
extract(month from(admission_date :: date)) as month, count(*) as admissions
from public.patient_records_cleaning
where admission_date is not null 
and admission_date <> 'Invalid'
group by month 
order by admissions desc
limit 1


33. Which diagnosis has the longest average stay?
select * 
from public.patient_records_cleaning

select diagnosis,
round(avg(discharge_date ::date - admission_date::date),2) as longest_stay
from public.patient_records_cleaning
where discharge_date is not null 
and admission_date is not null
and discharge_date <> ''
and admission_date <> ''
group by diagnosis
order by 2 desc 
limit 1

34. How many patients were admitted and discharged same day?
select * 
from public.patient_records_cleaning

select count(patient_id) as same_day_discharge
from public.patient_records_cleaning
where admission_date = discharge_date 


35. Which department has the longest average stay?

select * 
from public.patient_records_cleaning


select department, round(avg(discharge_date ::date - admission_date::date),2) as longest_stay
from public.patient_records_cleaning
where discharge_date is not null 
and admission_date is not null
and discharge_date <> ''
and admission_date <> ''
group by department
order by 2 desc
limit 1



-- RISK & BUSINESS INSIGHTS
36. Patients with unpaid balance — list them with contact info

select * 
from public.patient_records_cleaning

select patient_id, 
first_name, 
last_name,
address, 
city, 
state, 
phone, 
balance
from public.patient_records_cleaning
where balance > 0 
order by balance desc

37. Which patients have been admitted more than once? (readmissions)

select first_name, last_name, count(*) as visit_count
from public.patient_records_cleaning
group by first_name, last_name
having count(*) > 1
order by 3

-- Will not find any because we removed duplicates based on their id, first_name, last_name, address. 
-- next time for keep if they have different admison date and discharge date 


38. Are smokers generating higher bills than non smokers?

select * 
from public.patient_records_cleaning


select smoker, sum(total_bill)
from public.patient_records_cleaning
group by smoker 
order by 2 desc


39. Do older patients stay longer than younger ones?
select * 
from public.patient_records_cleaning

-- age 0-17 Minor, 18-35 Young, 36-55 Middle Aged, 56-70 Senior/ old, 71+ Elderly 

select patient_id, 
case 
	when extract(year from age(date_of_birth ::date)) >= 56 then 'Senior'
	when extract(year from age(date_of_birth ::date)) between 0 and 17 then 'Minor'
	when extract(year from age(date_of_birth ::date)) between 18 and 35 then 'Young'
	when extract(year from age(date_of_birth ::date)) between 36 and 55 then 'Middle Aged'
	else 'Set_Age_catagory'
end as age_catagory
from public.patient_records_cleaning
where date_of_birth is not null and date_of_birth <> '' and date_of_birth not in ('Invalid', 'Invalied')


select age_catagory, round(avg(stay_count),2) as avg_stay
from 
(select (discharge_date :: date- admission_date::date) as stay_count,
case 
	when extract(year from age(date_of_birth ::date)) >= 56 then 'Senior'
	when extract(year from age(date_of_birth ::date)) between 0 and 17 then 'Minor'
	when extract(year from age(date_of_birth ::date)) between 18 and 35 then 'Young'
	when extract(year from age(date_of_birth ::date)) between 36 and 55 then 'Middle Aged'
	else 'Set_Age_catagory'
end as age_catagory
from public.patient_records_cleaning
where date_of_birth is not null and date_of_birth <> '' and date_of_birth not in ('Invalid', 'Invalied')

) as sub

group by age_catagory
order by avg_stay

40. Which department is most profitable (revenue vs visits)?
select * 
from public.patient_records_cleaning



41. What percentage of patients are fully paid vs partially paid vs unpaid?

select patient_id, 
case 
	when amount_paid = 0 then 'Unpaid'
	when amount_paid > 0 and balance > 0 then 'Partially Paid'
	when balance = 0 then 'Fully Paid'
end as payment_catagory 
from public.patient_records_cleaning


select payment_catagory, round(count(*) *100/ sum(count(*)) over (), 1) as percentage

from (
select case 
	when amount_paid = 0 then 'Unpaid'
	when amount_paid > 0 and balance > 0 then 'Partially Paid'
	when balance = 0 then 'Fully Paid'
end as payment_catagory 
from public.patient_records_cleaning
) as sub
group by payment_catagory

42. Which state has the highest average bill?
select * 
from public.patient_records_cleaning

select state, Round(avg(total_bill),2) as avg_bill
from public.patient_records_cleaning
group by state 
order by avg_bill desc 
limit 1

43. Which diagnosis has the highest unpaid balance?


select * 
from public.patient_records_cleaning


select diagnosis, sum(balance) as max_unpaid_balance 
from public.patient_records_cleaning
where balance > 0 
group by diagnosis 
order by max_unpaid_balance  desc 
limit 1

44. How many patients have invalid or missing emails?

select count(*) as invalid_email
from public.patient_records_cleaning
where email = '' 
or email is null 
or email = 'Invalid'
or email = 'Invalied'


45. Which doctor has patients with the longest average stay?

select doctor_name, round(avg(discharge_date :: date - admission_date :: date),2) as avg_stay_per_doctor
from public.patient_records_cleaning
where discharge_date is not null and admission_date is not null 
group by doctor_name 
order by avg_stay_per_doctor desc 
limit 1