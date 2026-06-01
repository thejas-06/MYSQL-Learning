-- Select

select * from parks_and_recreation.employee_demographics;

select first_name,
age,
(age+5)*5
from parks_and_recreation.employee_demographics;
# any type of caculation any math in SQL follows the rule of PEMDAS


select concat(first_name,'  ', last_name) as name,
age+5
from parks_and_recreation.employee_demographics;


select distinct gender
from parks_and_recreation.employee_demographics;