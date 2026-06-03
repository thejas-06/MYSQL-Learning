-- where clause

select *
from employee_salary
where salary >= 50000;

select *
from employee_salary
where salary < 50000;

select *
from employee_demographics
where gender !='female';

select * 
from employee_demographics
where birth_date >'1985-10-26';


-- AND OR NOT --Logical operators

select * 
from employee_demographics
where birth_date >'1985-10-26'
and gender='male';

select * 
from employee_demographics
where birth_date >'1985-10-26'
or gender='male';

select * 
from employee_demographics
where birth_date >'1985-10-26'
and not gender='male';

select * 
from employee_demographics
where (first_name='Leslie' and age=44) or age>60;


-- Like statement
-- '%' - means anything -- '_' - means specific value


select *
from employee_demographics
where first_name like 'don%';

select *
from employee_demographics
where first_name like '%on%';

select *
from employee_demographics
where first_name like 'a__';

select *
from employee_demographics
where first_name like 'a___';	

select *
from employee_demographics
where first_name like 'a___%';