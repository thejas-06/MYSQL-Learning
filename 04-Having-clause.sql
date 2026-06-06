-- Having vs Where

/* this give error, because when we are selecting gender and aggregate function 
this occur only after group by accually group those rows together */
select gender, avg(age)
from employee_demographics
where avg(age)>30
group by gender;


select gender, avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select occupation, avg(salary)
from employee_salary
group by occupation;


select occupation, avg(salary)
from employee_salary
where occupation like "%manager%"
group by occupation;

select occupation, avg(salary)
from employee_salary
where occupation like "%manager%"
group by occupation
having avg(salary)>75000;


