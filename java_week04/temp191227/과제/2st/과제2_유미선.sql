
-- ����1. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), 
-- �μ���(department_name), �Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�Ͻÿ�.
select e1.employee_id, e1.first_name, d.department_name,
	   e2.first_name
from employees e1,employees e2, departments d
where e1.manager_id = e2.employee_id(+)
	  and e1.department_id = d.department_id
order by e1.employee_id;
	  
-- ����2. �ڽ��� �Ŵ������� 
-- ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� ����Ͻÿ�. 
select e1.last_name, e1.salary
from employees e1, employees e2
where e1.manager_id = e2.employee_id 
	  and e1.salary > e2.salary;
	  
-- ����3. ������(job_title)�� 
-- ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000 �̻�, 
-- 10,000 ������ �������� �̸�(first_name), 
-- ��(last_name)�� ����(salary)�� ����Ͻÿ�.
select e.first_name , e.last_name, e.salary
from employees e, jobs j
where e.job_id = j.job_id 
	and lower(j.job_title) = lower('Sales Representative')
	and (e.salary between 9000 and 10000) ;
	
-- ����4. Query ������ �ۼ��Ͻʽÿ�. 
-- �ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� ���(employee_id), 
-- ��(last_name)�� ä����(hire_date)�� ��ȸ�϶�.
select e1.employee_id, e1.last_name,
to_char(e1.hire_date,'yyyy-mm-dd') as hiredate
from employees e1, employees e2
where e1.manager_id = e2.employee_id and e1.hire_date<e2.hire_date;

-- ����5. 08�⵵�� �Ի��� ������ �̸�(first_name), 
-- �Ի���(hire_date), �����ڻ��(employee_id), 
-- ������ �̸�(first_name)�� ��ȸ�մϴ�. 
-- ��, �����ڰ� ���� ��������� ��°���� ���ԵǾ�� �մϴ�.
select e1.first_name, e1.hire_date, e1.employee_id, e2.first_name
from employees e1, employees e2
where e1.manager_id = e2.employee_id(+)
and to_char(e1.hire_date,'yy') = 8;

-- ����6. ��Sales���μ��� ���� ������ �̸�(first_name), 
-- �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
select e1.first_name, e1.salary, d.department_name
from employees e1, DEPARTMENTS d
where e1.department_id = d.department_id 
	and upper(d.department_name) = upper('Sales');

-- ����7. �� �� �Ի��� ���� ��ȸ�ϴ� SQL �������� �ۼ��ϼ���. �� ������ �����ϼ���. 
-- ���: �� | �Ի��ڼ�
select to_char(e1.hire_date,'mm') as month,count(*)
from employees e1
group by to_char(e1.hire_date,'mm')
order by month;


