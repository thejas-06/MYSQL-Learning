-- Case Statement


select first_name, last_name,
case
	when age<=30 then 'Young'
end
from employee_demographics;



select first_name, last_name,
case
	when age<=30 then 'Young'
	when age>30 and age<=50 then 'middle age'
	when age>50 then 'Old'
end
from employee_demographics;


select first_name, last_name, age,
case
	when age<=30 then 'Young'
	when age between 31 and 45 then 'middle age'
	when age>45 then 'Old'
end as age_category
from employee_demographics;



-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

select first_name, last_name, salary,
case
	when salary<=50000 then salary+(salary*0.05)
    when salary>50000 then salary * 1.07
end as new_salary,
case
	when dept_id=6 then salary * .10
end as bonus
from employee_salary;



select *
from employee_demographics;
select *
from employee_salary;
select *
from parks_departments;