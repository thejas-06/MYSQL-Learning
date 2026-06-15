-- Joins


-- Inner Join


select *
from employee_demographics
join employee_salary       -- By default join means inner join
on employee_demographics.employee_id=employee_salary.employee_id;


select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id=sal.employee_id;


select *
from employee_demographics;

select *
from employee_salary;


select dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id=sal.employee_id;
    
    
-- Outer Join


-- left outer join
select *
from employee_demographics as dem
left join employee_salary as sal   -- we can also use "left outer join" both are same
	on dem.employee_id=sal.employee_id;


-- right outer join
select *
from employee_demographics as dem
right join employee_salary as sal   -- we can also use "right outer join" both are same
	on dem.employee_id=sal.employee_id;
    
    
-- Self join

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa,
emp2.first_name as first_name_santa,
emp2.last_name as last_name_santa
from employee_salary emp1
join employee_salary emp2
    on emp1.employee_id + 1 = emp2.employee_id;
		
    
    
-- Joining multiple table together

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id=sal.employee_id
inner join parks_departments as par
	on sal.dept_id=par.department_id;
    
select *
from parks_departments;

select *
from employee_salary;