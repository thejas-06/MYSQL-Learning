-- window fuction

select *
from employee_demographics;

select *
from employee_salary;

select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id
group by gender;


select gender, avg(salary) over()
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select dem.first_name, dem.last_name,gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
select dem.first_name, dem.last_name,gender, sum(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select dem.first_name, dem.last_name,gender,salary, 
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total  -- is called Rolling Total
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select dem.employee_id, dem.first_name, dem.last_name,gender,salary,
row_number() over()
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select dem.employee_id, dem.first_name, dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc)
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
     
select dem.employee_id, dem.first_name, dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as row_num  -- using rank if the salary is identical it give the same rank or number
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
select dem.employee_id, dem.first_name, dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as row_num,
dense_rank() over(partition by gender order by salary desc) as row_num -- same as rank() but it go by next number numerically not postionally
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;