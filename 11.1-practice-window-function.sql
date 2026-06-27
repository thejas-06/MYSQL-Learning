select * 
from employee_demographics;

select *
from employee_salary;

select *
from parks_departments;

/*
Question 1: Top Earners by Department
The HR team wants to identify the highest-paid employees within each department.
Write a query that returns all employees who earn the highest salary in their respective department.
*/

WITH salary_rank AS
(
    SELECT employee_id,
           first_name,
           last_name,
           dept_id,
           salary,
           RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employee_salary
)
SELECT employee_id,
       first_name,
       last_name,
       dept_id,
       salary
FROM salary_rank
WHERE rnk = 1;

/*
Question 2: Department Salary Position
Management wants to understand how employees compare against their peers within the same department.
For every employee, display their position when salaries are ordered from highest to lowest within their department.
*/

select first_name, last_name, dept_id,salary,
row_number() over(partition by dept_id order by salary desc) as position_when_salaries_are_ordered
from employee_salary;

/*
Second Highest Salary
The company plans to reward employees who are just below the highest earners in each department.
Return the employee(s) receiving the second-highest salary in every department.
*/

WITH salary_rank AS
(SELECT employee_id,
           first_name,
           last_name,
           dept_id,
           salary,
           DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
    FROM employee_salary
)
SELECT employee_id,
       first_name,
       last_name,
       dept_id,
       salary
FROM salary_rank
WHERE salary_rank = 2;


SELECT
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    sal.dept_id,
    sal.salary,
    AVG(sal.salary) OVER(PARTITION BY sal.dept_id) AS dept_avg_salary
FROM employee_salary sal
JOIN employee_demographics dem
    ON sal.employee_id = dem.employee_id;