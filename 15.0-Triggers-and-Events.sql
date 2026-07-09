-- Triggers and Events

select *
from employee_demographics;

select *
from employee_salary;

-- Triggers

DELIMITER $$
create trigger insert_employee
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id, first_name, last_name)
    values(new.employee_id, new.first_name, new.last_name);
end $$
DELIMITER ;


insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, "tezz", "zzz", "data scientist", 100000,null)



-- Events

DELIMITER $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age>=60;
end $$
DELIMITER ;