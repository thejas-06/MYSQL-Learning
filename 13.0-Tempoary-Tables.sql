-- Temporary Tables

create temporary table temp_table
(
temp_id int,
first_name varchar(50),
favorite_movie varchar(100)
);

select *
from temp_table;

insert into temp_table
values(1,'teju','Lucy'),
(2,'tezz','Fight Club');


select *
from temp_table;


-- other way to create(this is what accually use in industries)

create temporary table salary_over_50K
select *
from employee_salary
where salary>50000;


select *
from salary_over_50k;