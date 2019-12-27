conn SCOTT/TIGER

select * from emp;
select * from dept;
select * from salgrade;

desc emp;

select ename,sal,deptno
from emp;

select ename,hiredate
from emp;

select deptno,dname
from dept;

select job
from emp;

select distinct job
from emp;

select ename, sal,sal*12
from emp;

select ename, sal,sal*12 as "년봉"
from emp;

select ename,job ,sal , comm 
from emp;

select ename,job ,sal , comm ,sal+ nvl(comm,0) as "총 급 여" 
from emp;

select empno, ename,nvl(to_char(mgr),'<<CEO>>') as "메니저 코드"
from emp;

-- 문자열 연결 연산자 ||
select ename||'  '||job
from emp;

select 20*20*4
from dept;

select 20*20*4
from dual;

select sysdate
from dual;

select user
from dual;

-- row 제한을 걸때 where 절

select ename,job,deptno
from emp
where deptno = 10;

select ename,job,deptno
from emp
where job = 'manager';

select ename,job,deptno
from emp
where upper(job) = upper('manager');

select ename,job,deptno
from emp
where lower(job) = lower('manager');

select sysdate
from dual;

select ename,hiredate
from emp
where hiredate > '82/01/01';

select ename,hiredate
from emp
where hiredate = '81/05/01';

select ename,hiredate
from emp
where hiredate != '81/05/01';

select ename,hiredate
from emp
where hiredate <> '81/05/01';


-- between and
select ename,sal
from emp
where sal>= 2450 and sal<= 3000;

select ename,sal
from emp
where sal between 2450 and 3000;

-- X
select ename,sal
from emp
where sal between 5000 and 3000;

-- in 연산자 
select ename,job,deptno
from emp
where deptno = 10 or deptno = 20;

select ename,job,deptno
from emp
where deptno in(10,20);

select *
from dept
where (deptno,loc) in((20,'DALLAS'),(30,'CHICAGO'));

-- like 연산자

select *
from emp
where ename = 'A';

select *
from emp
where ename like 'A%';

select *
from emp
where ename like '%A';

select *
from emp
where ename like '%A%';

select *
from emp
where ename like '%A%';

select *
from emp
where upper(ename) like upper('%A%');

-- 81년도에 입사한 사원 목록 
select *
from emp
where hiredate like '81%';

-- where null

select *
from emp 
where mgr is null;

select *
from emp 
where mgr is not null;

-- where 절에서는 별칭 사용 X
select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp 
where sal+nvl(comm,0) >= 2000

-- 정렬 에서는 별칭 사용 가능 
**********************************
*select
*from
*where
*order by
**********************************

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp 
order by sal;

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp 
order by sal desc;

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp 
order by sal asc , comm desc;


select ename,sal,sal+nvl(comm,0) as "총급여"
from emp 
where comm is not null
order by sal asc , comm desc;

select ename,sal,sal+nvl(comm,0) as "총급여"
from emp 
where sal+nvl(comm,0) >= 2000
order by "총급여";

select ename,sal,sal+nvl(comm,0) as "총급여"
from emp 
where sal+nvl(comm,0) >= 2000
order by 3;

conn hr/hr
select * from employees;

conn SCOTT/TIGER

-- 단일행 함수
select dname,lower(dname) ,loc,lower(loc)
from dept;

select round(44.55),round(44.55,1),trunc(44.55) from dual

select sal , trunc(sal*0.03) as "TAX"
from emp;

-- 사원의 입사 월 정보 추출
select ename,hiredate,substr(hiredate,1,2)
from emp;

select ename,hiredate,substr(hiredate,4,2) as 입사월
from emp;


-- 사원의 입사 월이 12인 정보 추출
select ename,hiredate,substr(hiredate,4,2) as 입사월
from emp
where substr(hiredate,4,2) = '12';

select ename,hiredate 입사일
from emp
where substr(hiredate,4,2) = '12';

**********************************
*select
*from
*where
*order by
**********************************

select sysdate ,sysdate+30 from dual;

select sysdate ,substr(sysdate,4,2) from dual;
select sysdate ,to_char(sysdate,'YY') from dual;
select sysdate ,to_char(sysdate,'YYYY') from dual;
select sysdate ,to_char(sysdate,'day') from dual;
select sysdate ,to_char(sysdate,'mm') from dual;
select sysdate ,to_char(sysdate,'dd') from dual;

-- emp에서 사원 들의 사원명,입사월 ,요일 정보를 출력하세요,
select ename, to_char(hiredate,'mm') as "입사월",
              to_char(hiredate,'day') as "입사요일"
from emp
order by "입사월";


select sysdate,to_date('2019/12/24') from dual;
select sysdate,to_date('2019-12-24') from dual;
select sysdate,to_date('2019 12 24') from dual;

select sysdate,to_date('12/24/19','mm/dd/yy') from dual;

-- decode 함수

select ename,sal,deptno,decode(deptno, 10, sal*1.2,
                                       20, sal*0.7,
                                       sal) as "보너스"
from emp
order by deptno;






