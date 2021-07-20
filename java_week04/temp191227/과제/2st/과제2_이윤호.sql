select * from employees;
select * from departments;

문제1. Query 문장을 작성하십시오. 

--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 
--매니저(manager)의 이름(first_name)을 조회하시오.

select e.employee_id, e.first_name, m.first_name, department_name
from employees e, employees m, departments d
where e.manager_id = m.employee_id
and e.depratment_id = d.depratment_id;

-- 문제2
select e.last_name "사원명", e.salary, m.last_name "상사이름", m.salary
from employees e, employees m
where e.employee_id = m.manager_id
and e.salary > m.salary;
	
--문제3. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000 이상, 
--10,000 이하인 직원들의 이름(first_name), 성(last_name)과 연봉(salary)을 출력하시오.

select job_title, first_name, last_name, salary
from jobs j, employees e
where e.job_id = j.job_id
and job_title = 'Sales Representative';

--문제5. 08년도에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번(employee_id), 
--관리자 이름(first_name)을 조회합니다. 단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다..  
select first_name, hire_date, employee_id, first_name
from employees
where hire_date >= '2008/01/01' and hire_date < '2019/01/01'; 

--문제4. Query 문장을 작성하십시오. 
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하라.
select e.employee_id "사번", e.last_name "이름", e.hire_date "채용일", m.hire_date "매니저 채용일"
from employees e, employees m
where e.employee_id = m.manager_id
and e.hire_date < m.hire_date;


--문제6. ‘Sales’부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 
select first_name, salary, last_name, department_name
from employees e, departments d
where e.department_id = d.department_id
and department_name = 'Sales';

--7. 월 별 입사자 수를 조회하는 SQL 쿼리문을 작성하세요. 월 순으로 정렬하세요. 
--   출력: 월 | 입사자수