-- Group By

select gender
from employee_demographics
group by gender;

select gender, avg(age)
from employee_demographics
group by gender;

select occupation, salary
from employee_salary
group by occupation, salary;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;


-- Order By

select *
from employee_demographics
order by first_name desc;       #defualt ASC

select *
from employee_demographics
order by gender, age;

select *
from employee_demographics
order by age, gender;   # here gender is not going to be used at all, because there is no unique value in age

select *
from employee_demographics
order by gender, age desc;

-- we can also use column number instead of name

select *
from employee_demographics
order by 5,4;


