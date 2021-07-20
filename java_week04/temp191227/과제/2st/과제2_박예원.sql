-- 1
select e1.employee_id 사원번호, e1.first_name 사원이름 , department_name 부서명, e2.first_name 매니저이름
from employees e1 join employees e2
	on e1.manager_id = e2.employee_id
	join departments d
	on e1.department_id=d.department_id;

--2
select e1.last_name, e1.salary
from employees e1 join employees e2
	on e1.manager_id = e2.employee_id
where e1.salary>=e2.salary;

--3
select e.first_name, e.last_name, e.salary
from employees e join jobs j
on e.job_id=j.job_id
where salary between 9000 and 10000
and j.job_title='Sales Representative';

-- 4
select e1.employee_id, e1.last_name, e1.hire_date 
from employees e1 , employees e2
where e1.manager_id = e2.employee_id and
e1.hire_date >= e2.hire_date;

--5 where e1.mgr = e2.empno(+) 
select e1.first_name, e1.hire_date , e2.employee_id, e2.first_name
from employees e1 , employees e2
where e1.manager_id = e2.employee_id(+) and
to_char(e1.hire_date,'yyyy')='2008';


--6

select e.first_name, j.job_title,d.department_name, e.salary
from employees e join departments d
	on e.department_id= d.department_id
	join jobs j
	on j.job_title like '%Sales%';


--7

select to_char(hire_date,'mm') 월, count(employee_id) 입사자수
from employees 
group by to_char(hire_date,'mm')
order by 월;

