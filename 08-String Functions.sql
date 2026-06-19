-- String Functions

select first_name, length(first_name)
from employee_demographics
order by 2;

select upper('thejas');
select lower('THEJAS');


select first_name, upper(first_name)
from employee_demographics;


select ('          teju             ');

select trim('            teju             ');

select ltrim('            teju             ');

select rtrim('            teju             ');

select first_name, left(first_name,3)
from employee_demographics;


select first_name, 
left(first_name,3),
right(first_name,3)
from employee_demographics;


select first_name, 
left(first_name,3),
substring(first_name, 3,2),
right(first_name,3)
from employee_demographics;


select * from employee_demographics;


select *,
substring(birth_date, 6,2) as birth_month
from employee_demographics;

select first_name, replace(first_name, 'A','Z')
from employee_demographics;


select locate('s', 'thejas');


select first_name, locate('An',first_name)
from employee_demographics;

select first_name, last_name,
concat(first_name, '  ', last_name) as full_name
from employee_demographics;