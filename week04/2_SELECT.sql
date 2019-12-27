conn scott/tiger

SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;


DESC emp;

select ename, sal, deptno
from emp;



select job
from emp;

-- 중복제거; distinct
select distinct job
from emp;

select ename, sal, sal*12
from emp;

-- Oracle에서 "" 쓰는곳은 오로지 as 를 이용한 Alias 기능.
--  그 외 string은 모두 '' Single Quotation.
select ename, sal, sal*12 as "연봉"
from emp;



select ename, job, sal, comm
from emp;

select ename, job, sal, comm, sal+comm as "실제 수당"
from emp;
-- Null 값을 다른 값으로 바꾸는 nvl(comm, -1)
select ename, job, sal, comm, sal+nvl(comm, 0) as "총급여"
from emp;



select empno, ename, mgr
from emp;
-- type 안맞으면 nvl써도 에러 발생
-- nvl > null value logic
select empno, ename, nvl(mgr, 'KING+GOD')
from emp;

select empno, ename, nvl(to_char(mgr), 'KING+GOD') as "mgr"
from emp;



-- 문자열 연결 연산자 ||
select ename||' '||job as "NAME+JOB_TITLE"
from emp;


select 20*20*4
-- dept, emp, 등등 넣어서 확인해보기
from dept; 

-- 가상의 테이블
select 20*20*4
from dual;

select sysdate
from dual;

select user
from dual;


-- row에 제한. WHERE
-- In String/Char, case-sensitive
select ename, job, deptno
from emp
where job='MANAGER';

select ename, job, deptno
from emp
where upper(job)= upper('mANaGER');

select ename, job, deptno
from emp
where deptno=10;

select ename, hiredate
from emp
where hiredate > '82/01/01';

select ename, hiredate
from emp
where hiredate > '81/05/01';

select ename, hiredate
from emp
where hiredate =! '81/05/01';
--mySql에서 쓰이는 방법 <>
select ename, hiredate
from emp
where hiredate <> '81/05/01';



--between and in or 
select ename, sal
from emp
where sal >=2450 and sal <= 3000;

select ename, sal
from emp
where sal between 2450 and 3000;

select ename, job, deptno
from emp
where deptno=10 or deptno=20

select ename, job, deptno
from emp
where deptno in(10,20)

select *
from dept
where (deptno, upper(loc)) in ((20,upper('dalls')), (30,upper('chicago')))


-- like
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
where ename like '%A__';


--81년도 입사 목록
select ename, hiredate
from emp
where hiredate like '81/__/__';


--where null 처리
SELECT *
FROM emp
WHERE mgr  is null; --is not null;

SELECT ename, sal, comm, sal+comm
FROM emp; -- nvl 이용해서 null값을 0으로 치환하기

SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp;

SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp
WHERE "총급여" >= 2000; --"총급여" invalid. 

SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp
where sal+nvl(comm,0) >= 2000;


-- 정렬
SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp
ORDER BY sal; --DESC ; 내림차순 -- 기본값 asc ; 오름차순

SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp
WHERE comm is not null
ORDER BY sal asc, comm desc;
--
--SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
--FROM emp
--WHERE comm is not null
--ORDER BY "총급여"; -- where 에서만 Alias 처리된거 못읽는다.

SELECT ename, sal, comm, sal+nvl(comm,0) as "총급여"
FROM emp
WHERE comm is not null
ORDER BY 3; -- refers to '3rd' Column.

-- 단일행 함수; single-low function (lower upper trunc round)
conn scott/tiger

select dname, lower(dname), loc, lower(loc)
from dept;

select round(44.565), round(44.565,1), trunc(44.565) from dual;   

select sal, trunc(sal*0.03) as "TAX"
from emp;

select ename, hiredate, substr(hiredate,4 ,2) as "월별 입사일"
from emp;


-- 입사 월인 12월인 사원 목록 추출

select ename, hiredate, substr(hiredate,4 ,2) as "월별 입사일"
from emp
where substr(hiredate,4 ,2) = '12';


select sysdate, sysdate+30 from dual; --날짜 30일 추가

select sysdate, substr(sysdate+30, 4, 2) from dual;
select sysdate, substr(sysdate, 4, 2) from dual;
select sysdate, to_Char(sysdate, 'YYYY-mm-dd-hh24-mi-ss') from dual;
select sysdate, to_Char(sysdate, 'YYYY') from dual;
select sysdate, to_Char(sysdate, 'mmdd') from dual;
select sysdate, to_Char(sysdate, 'mmmdd') from dual; --invalid

select ename, to_Char(hiredate, 'mm') as "입사 월", to_Char(hiredate, 'day') as "입사 요일"
from emp
order by "입사 월", ename;

select sysdate, to_date('2109/12/24') from dual;
select sysdate, to_date('2109-12-24') from dual;
select sysdate, to_date('2109 12 24') from dual;

select sysdate, to_date('09/12/24') from dual;
select sysdate, to_date('09/12/24', 'mm-yy-dd') from dual;
select sysdate, to_date('09/12/24', 'dd-mm-yy') from dual;


-- decode 함수

select ename, sal, deptno, decode(	deptno,	10, sal*1.2,
											20, sal*0.7,
									 		30, sal*2.5,
									sal) as "보너스"
from emp
order by deptno;





