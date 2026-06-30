-- CTEs (Common Table Expression)


with cte_example as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
     on dem.employee_id=sal.employee_id
group by gender
)
select *
from cte_example;


with cte_example as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
     on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example;


-- without CTE
select avg(avg_sal)
from(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
     on dem.employee_id=sal.employee_id
group by gender
) example_cte;


with cte_example1 as
(
select employee_id, first_name, gender,birth_date
from employee_demographics
where birth_date>'1985-01-01'
),
cte_example2 as
(
select employee_id, salary, occupation
from employee_salary
where salary>60000
)
select *
from cte_example1
join cte_example2
     on cte_example1.employee_id=cte_example2.employee_id;


