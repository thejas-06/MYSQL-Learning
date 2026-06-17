-- Unions

select age, gender
from employee_demographics
union
select first_name, last_name
from employee_salary;


select first_name, last_name
from employee_demographics
union   -- by default this is a "union distinct"
select first_name, last_name
from employee_salary;


select first_name, last_name
from employee_demographics
union distinct -- same as previous one
select first_name, last_name
from employee_salary;


select first_name, last_name
from employee_demographics
union all -- it gives all
select first_name, last_name
from employee_salary;


select first_name, last_name, 'OLD'
from employee_demographics
where age > 50;


select first_name, last_name, 'OLD' as label
from employee_demographics
where age > 50;


select first_name, last_name, 'OLD' as label
from employee_demographics
where age > 50
union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary>70000;


select first_name, last_name, 'OLD men' as label
from employee_demographics
where age > 40 and gender='male'
union
select first_name, last_name, 'OLD lady' as label
from employee_demographics
where age > 40 and gender='female'
union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary>70000;




select first_name, last_name, 'OLD men' as label
from employee_demographics
where age > 40 and gender='male'
union
select first_name, last_name, 'OLD lady' as label
from employee_demographics
where age > 40 and gender='female'
union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary>70000
order by first_name, last_name;