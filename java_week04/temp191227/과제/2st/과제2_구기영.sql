--문제1

select e.employee_id,e.first_name,d.department_name,m.first_name 
from employees e, employees m, departments d
where e.manager_id = m.employee_id and e.department_id = d.department_id;

--문제2

select e.last_name,e.salary 
from employees e, employees m
where e.manager_id = m.employee_id and e.salary >= m.salary;

--문제3

select first_name,last_name,salary 
from employees e,jobs j
where salary >= 9000 and salary <= 10000 and e.job_id = j.job_id and j.job_title = 'Sales Representative';


--문제4

select e.employee_id,e.last_name,e.hire_date 
from employees e,employees m
where e.manager_id = m.employee_id and e.hire_date < m.hire_date;


--문제5

select e.first_name, e.hire_date, e.employee_id, m.first_name,m.employee_id
from employees e,employees m
where to_char(e.hire_date,'yy') = 08 and e.manager_id = m.employee_id;

--문제6

select e.first_name, e.salary, d.department_name
from employees e,departments d
where e.department_id = d.department_id 
      and d.department_name = 'Sales';

--문제7

select to_char(hire_date,'mm') 월, count(*) 입사자수
from employees group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');

      