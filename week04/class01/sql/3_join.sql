select * from dept;
select * from emp;


select ename, dname, loc
from emp, dept
where emp.deptno = dept.deptno;
-- where 조건을 이용해서 join 시키기

select ename, deptno, dname, loc
from emp, dept
where emp.deptno = dept.deptno;
--error; ORA-00918: column ambiguously defined
-- 어느 테이블의 deptno??
select ename, emp.deptno, dname, loc
from emp, dept
where emp.deptno = dept.deptno;

select ename, e.deptno, dname, loc
from emp e, dept d -- alias to e, d 
where e.deptno = d.deptno
order by deptno;


--sal > 2000 and deptno = 20
select ename, sal, loc
from emp e, dept d
where e.deptno = d.deptno and sal > 2000 and e.deptno = 20
order by d.deptno;

*********************************************************
--ANSI join ( Standard )
-- , -> join
-- where -> on
*********************************************************
--inner join
select ename, sal, loc
from emp e inner JOIN dept d
ON e.deptno = d.deptno 
WHERE sal > 2000 and e.deptno = 20
order by d.deptno;

--outer join
--null 쪽에 + 마킹
select ename, d.deptno, dname, loc
from emp e , dept d -- alias to e, d 
WHERE e.deptno = d.deptno(+)
order by deptno;

--ANSI ver.
--right 쪽의 테이블이 Master 테이블
--MASETER 쪽이 더 중요
select ename, d.deptno, dname, loc
FROM emp e RIGHT OUTER JOIN dept d -- alias to e, d 
ON e.deptno(+) = d.deptno
order by deptno;

*********************************************************
Non-Equi join
*********************************************************


select * from salgrade;

-- oracle ver.
select ename, sal, grade
from emp, salgrade
where sal between losal and hisal;


--ANSI ver.
select ename, sal, grade
from emp JOIN salgrade
ON sal between losal and hisal;




*********************************************************
-- n개의 테이블 join
*********************************************************
-- oracle ver.
select ename, sal, dname, grade
from emp e, dept d, salgrade
where e.deptno = d.deptno and sal between losal and hisal;

--ANSI ver.
select ename, sal, dname, grade
from emp e 
	JOIN dept d 
	ON e.deptno = d.deptno
	JOIN salgrade
	ON sal between losal and hisal
WHERE sal > 1500;


*********************************************************
--oracle self join
*********************************************************
-- 사원의 이름, 그 사원의 상사 이름 출력

select e.ename as 사원, m.ename as 선임
from emp e, emp m
where e.mgr = m.empno(+)


select e.ename as 사원, nvl(m.ename, 'KING GOD') as 선임
from emp e, emp m
where e.mgr = m.empno(+)


select e.ename as 사원, e.sal, nvl(m.ename, 'KING GOD') as 선임, m.sal
from emp e, emp m
where e.mgr = m.empno(+) and e.sal > m.sal;

-- ANSI ver.
select e.ename as 사원, e.sal, nvl(m.ename, 'KING GOD') as 선임, m.sal
from emp e LEFT JOIN emp m
ON e.mgr = m.empno
WHERE e.sal > m.sal;


-- 집계 함수
-- single-row fuction과 다른 함수

select ename, round(sal) from emp;
-- 단 한 줄의 값; ORA-00937: not a single-group group function
select round(avg(sal))||'원' as "평균급여" from emp;
-- group by 에 쓰인 필드명은 집계함수와 함계 select 에서 쓰일 수 있다.
select deptno, round(avg(sal)) from emp group by deptno; --deptno 부서 번호 별 평균급여


-- 19 12 26
-- 집게함수 모둠~
select avg(sal), count(*), Min(sal), max(sal), count(MGR)
from emp
group by deptno; -- where deptno = 10;20;30 한것과 같은 기능

select deptno as 부서번호, avg(sal), count(*), Min(sal), max(sal), count(MGR)
from emp
group by deptno; -- group by에 들어간건 select에 넣을수있다.

select dname, avg(sal), count(*), Min(sal), max(sal), count(MGR)
from emp e, dept d
where e.deptno = d.deptno
group by dname; -- join 걸고 group by 걸기

select dname, e.deptno, avg(sal), count(*), Min(sal), max(sal), count(MGR)
from emp e, dept d
where e.deptno = d.deptno
group by dname, e.deptno; --2개 넣어버리기. select에 2개 넣고 싶어서


*********************************************************
select
from
where
group by
having --"그룹 집계까지 끝난 후에 추가로 조건걸고 싶다."
order by
*********************************************************

select e.deptno, dname, round(avg(sal))
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, dname
having avg(sal)>2000;
