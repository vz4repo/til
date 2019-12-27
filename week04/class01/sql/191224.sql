SELECT e.employee_id, e.first_name, d.department_name, m.first_name
FROM EMPLOYEES e, EMployees m, DEPARTMENTS d
WHERE e.department_id = d.department_id and e.manager_id = m.employee_id;

SELECT e.last_name,  e.salary
FROM EMPLOYEES e, EMployees m
WHERE e.manager_id = m.employee_id and e.salary > m.salary;

select first_name, last_name, salary
from employees e, jobs j
where e.job_id = j.job_id and job_title='Sales Representative'  and salary between 9000 and 10000;

select e.employee_id, e.last_name, e.hire_date
from employees e, employees m
where e.manager_id = m.employee_id and e.hire_date > m.hire_date;

select e.first_name, e.hire_date, m.employee_id, m.first_name
from employees e, employees m
where e.manager_id = m.employee_id and substr(e.hire_date, 4, 2) = '08';

select e.first_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id and department_name = 'Sales';

select distinct substr(hire_date, 4, 2)  as 월, count(*) as 입사자수
from employees
group by substr(hire_date, 4, 2)
order by 월;