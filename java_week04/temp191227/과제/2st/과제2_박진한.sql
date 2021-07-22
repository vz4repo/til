select e.employee_id, e.first_name, department_name, m.first_name as "manager_first_name"
from employees e, employees m, departments d
where e.manager_id = m.employee_id(+) and e.department_id = d.department_id
order by e.employee_id;

select e.last_name, e.salary
from employees e, employees m
where e.manager_id = m.employee_id and e.salary >= m.salary;

select e.first_name, e.last_name, e.salary
from employees e, jobs j
where e.job_id = j.job_id and upper(j.job_title) = upper('sales representative') and e.salary between 9000 and 10000;

select e.employee_id, e.last_name, e.hire_date
from employees e, employees m
where e.manager_id = m.employee_id(+) and e.hire_date < m.hire_date
order by e.employee_id;

select e.first_name, e.hire_date, e.manager_id, m.first_name
from employees e, employees m
where e.manager_id = m.employee_id(+) and substr(e.hire_date,1,2) = '08';

select e.first_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id and upper(d.department_name) = upper('sales');

SELECT substr(e.hire_date, 4,2) as "월", count(substr(e.hire_date, 4, 2)) as "입사자수"
FROM employees e group by substr(e.hire_date, 4,2)
order by "월";