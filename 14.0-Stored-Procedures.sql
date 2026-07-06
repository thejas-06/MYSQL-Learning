-- Stored Procedures

create procedure large_salaries()
select *
from employee_salary
where salary>=50000;

call large_salaries();


DELIMITER $$
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary>=50000;
	select *
	from employee_salary
	where salary>=10000;
end $$
DELIMITER ;


call large_salaries2();



DELIMITER $$
create procedure large_salaries3(p_id int)
begin
	select salary
	from employee_salary
	where employee_id = p_id;
end $$
DELIMITER ;


call large_salaries3(3);