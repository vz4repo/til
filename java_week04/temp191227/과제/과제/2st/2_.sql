/*	1. 
 *	각 사원(employee)에 대해서 
 *	사번(employee_id), 이름(first_name), 부서명(department_name), 
 *	매니저(manager)의 이름(first_name)을 조회하시오.
 */
select e1.employee_id 사원번호, 
       e1.first_name 사원이름 , 
       department_name 부서명, 
       e2.first_name 매니저이름
from employees e1 join employees e2
	on e1.manager_id = e2.employee_id
	join departments d
	on e1.department_id=d.department_id;

	
	
/*	2.
 * 	자신의 매니저보다 연봉(salary)을 많이 받는 직원들의 성(last_name)과 연봉(salary)을 출력하시오.
*/
select e.last_name, e.salary
from employees e join employees m
	on e.manager_id = m.employee_id
where e.salary>=m.salary;



/*	3.
 * 	업무명(job_title)이 ‘Sales Representative’인 직원 중에서 
 * 	연봉(salary)이 9,000 이상, 10,000 이하인 직원들의 
 * 	이름(first_name), 성(last_name)과 연봉(salary)을 출력하시오.
*/
select e.first_name, e.last_name, e.salary
from employees e join jobs j
on e.job_id=j.job_id
where salary between 9000 and 10000
and j.job_title='Sales Representative';



/*	4.
 * 	자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
 * 	사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하라.
*/
select e1.employee_id, e1.last_name, e1.hire_date 
from employees e1 , employees e2
where e1.manager_id = e2.employee_id and
e1.hire_date >= e2.hire_date;



/*	5.
 * 	08년도에 입사한 직원의 이름(first_name), 입사일(hire_date), 
 * 	관리자사번(employee_id), 관리자 이름(first_name)을 조회합니다. 
 * 	단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다.
*/
select e1.first_name, e1.hire_date ,
       e2.employee_id, e2.first_name
from employees e1 , employees e2
where e1.manager_id = e2.employee_id(+) and
to_char(e1.hire_date,'yy')='08';



/*	6.
 * 	‘Sales’부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오.
*/
select e.first_name, d.department_name, e.salary
from employees e join departments d
	on e.department_id= d.department_id
where d.department_name = 'Sales';



/*	7.
 * 	월 별 입사자 수를 조회하는 SQL 쿼리문을 작성하세요. 월 순으로 정렬하세요. 
 * 	출력: 월 | 입사자수
*/
select to_char(hire_date,'mm') 월, count(employee_id) 입사자수
from employees 
group by to_char(hire_date,'mm')
order by 월;











