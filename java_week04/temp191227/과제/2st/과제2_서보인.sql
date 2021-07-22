--문제1. Query 문장을 작성하십시오. 
select e.employee_id, e.first_name, department_name, m.first_name
from employees e left join employees m
on e.manager_id = m.employee_id
left join departments d
on e.department_id = d.department_id;


--문제2. 자신의 매니저보다 연봉(salary)을
--많이 받는 직원들의 성(last_name)과 연봉(salary)을 출력하시오. 

select e.last_name, e.salary
from employees e left join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;


--문제3. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서
--연봉(salary)이 9,000 이상, 10,000 이하인 직원들의
--이름(first_name), 성(last_name)과 연봉(salary)을 출력하시오.

select e.first_name, e.last_name, e.salary
from EMPLOYEES e  join jobs j
on e.job_id = j.job_id
where salary between 9000 and 10000 and j.job_title ='Sales Representative';


---문제4. Query 문장을 작성하십시오. 
-- 자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id),
-- 성(last_name)과 채용일(hire_date)을 조회하라.

select e.employee_id, e.last_name, e.hire_date
from EMPLOYEES e join employees m
on e.manager_id = m.employee_id
where e.hire_date > m.hire_Date;


--문제5. 08년도에 입사한 직원의 이름(first_name), 입사일(hire_date),
--관리자사번(employee_id), 관리자 이름(first_name)을 조회합니다.
--단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다..  

select e.first_name, e.hire_date, e.manager_id, m.first_name
from EMPLOYEES e right join employees m
on e.manager_id = m.employee_id
where to_char(e.hire_date, 'yyyy') = 2008;


--문제6. ‘Sales’부서에 속한 직원의 이름(first_name),
--급여(salary), 부서이름(department_name)을 조회하시오. 

select e.first_name, e.salary, d.department_name
from EMPLOYEES e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
where j.job_title like 'Sales%';


--7. 월 별 입사자 수를 조회하는 SQL 쿼리문을 작성하세요
--월 순으로 정렬하세요. 

select to_char(hire_date, 'mm') as "월", count(*) as "입사자주"
from EMPLOYEES
group  by to_char(hire_date, 'mm')
order by "월";


















