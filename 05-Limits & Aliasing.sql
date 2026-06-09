-- Limits & Aliasing

-- Limits

select *
from employee_demographics
limit 3;

-- three oldest employee
select *
from employee_demographics
order by age desc
limit 3;


select *
from employee_demographics
order by age desc
limit 2, 1;   -- start at 2 position and select next one after that


-- Aliasing -- change the name of the column

select gender, avg(age) as avg_age
from employee_demographics
group by gender;



select gender, avg(age) as avg_age  -- this AS not 100%  needed
from employee_demographics
group by gender
having avg_age>40;


select gender, avg(age) avg_age  -- without AS
from employee_demographics
group by gender
having avg_age>40;