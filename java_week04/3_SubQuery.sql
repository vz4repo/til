-- FORD보다 sal이 높은 사람 목록
select sal from emp where ename='FORD';
select * from emp where sal>3000;

select * from emp where sal>
(select sal from emp where ename='FORD');

-- sal 평균보다 낮게 sal 받는 사람 목록
select * from emp where sal<
(select avg(sal) from emp);

-- 최소 sal 받는 사람
select * from emp where sal=
(select min(sal) from emp);

-- 부서별, 최고 sal 받는 사람
select dname, ename  from emp e, dept d where e.deptno = d.deptno and sal=
(select max(sal) from emp)


select * from emp where sal=
(select max(sal), deptno from emp group by deptno); -- '=' 에는 하나의 값만 와야한다; single-row subquery returns more than one 
select * from emp where sal in
(select max(sal) from emp group by deptno); -- 운 좋게 결과가 나온 경우

select * from emp where (deptno, sal) in
(select deptno, max(sal) from emp group by deptno)
order by deptno; -- key:value 처럼 deptno를 명시해서 더 정확하게 표현


***************************
-- rownum; 가상의 column
***************************
select ename, job, sal
from emp;

select rownum, ename, job, sal
from emp; -- oracle의 키워드 rownum; row 숫번 출력

select rownum, ename, job, sal
from emp
order by sal;

-- rownum이 숫자 찍는  곳(from) 확인하기
select rownum, ename, job, sal
from (select * from emp order by sal);

-- sal top3; desc 쓰기
select rownum, ename, job, sal
from (select * from emp order by sal desc)
where rownum < 4;

select rownum, ename, job, sal
from (select * from emp order by sal desc)
where rownum between 1 and 20;

select rownum, ename, job, sal
from (select * from emp order by sal desc)
where rownum between 5 and 14; -- 1부터 시작을 안하면 안돌아간다. 5가 있을지 없을지 몰라.

***************************
--oracle page 처리
***************************
-- subquery가 FROM으로 갔을때의 의미
--?????????????????????????????!!!
select *
from (
	select rownum k, ename, job, sal
	from (select * from emp order by sal desc)
)
where k between 6 and 10;
