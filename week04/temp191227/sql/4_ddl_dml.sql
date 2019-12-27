######################################################
Table 생성   DDL  (auto commit)

테이블은 실제로 데이터들이 저장되는 곳 이라고 생각하면 쉽게 이해 할 수 있으며, 
CREATE TABLE 명령어를 이용해서 테이블을 생성 할 수 있다. 
######################################################

데이터타입설명
	VARCHAR2 타입
	- 가변길이 문자형 데이터 타입 
	- 최대 길이 : 2000 바이트(반드시 길이 지정) 
	- 다른 타입에 비해 제한이 적다 
	- 일부만 입력시 뒷부분은 NULL 
	- 입력한 값의 뒷부분에 있는 BLANK도 같이 입력 
	- 전혀 값을 주지 않으면 NULL 상태 입력 
	- 지정된 길이보다 길면 입력시 에러 발생 
	- 컬럼 길이의 편차가 심한 경우, NULL 로 입력되는 경우가 많은 경우 VARCHAR2 사용 

	NUMBER 타입
	- 숫자형 데이타 타입, 음수, ZERO, 양수 저장 
	- 전체 자리수는 38자리를 넘을 수 없다 
	- 소수점이 지정되지 않았을 때 소수점이 입력되거나, 지정된 소수점자리 이상 입력되면 반올림되어 저장 
	- 지정한 정수 자리수 이상 입력시 에러 발생 
	- 연산이 필요한 컬럼은 NUMBER타입으로 지정한다. 
	- NUMBER(p,s) 로 지정시 p는 s의 자리수를 포함한 길이므로 감안하여 P의 자리수를 결정 
	- NUMBER 타입은 항상 가변길이므로 충분하게 지정할 것 

	DATE 타입
	- 일자와 시간을 저장하는 날짜형 타입 
	- 일자나 시간의 연산이 빈번한 경우 사용 
	- 포함정보 : 세기, 년도, 월, 일, 시간, 분, 초 
	- NLS_DATE_FORMAT을 이용하여 국가별 특수성을 해결 
	- 특별히 시간을 지정하지 않으면 00:00:00로 입력 됨 
	- 특별히 일자를 지정하지 않았다면 현재월의 1일로 지정 됨 
	- SYSDATE는 현재일과 시간을 제공 
	

-- ddl    auto commit
drop table book;

create table book(
   bookno number(5),
   title  varchar2(40),
   author varchar2(20),
   pubdate date
);	
	
select * from book;	
	
-- dml	insert , delete, update    auto commit X
	
insert into book (bookno,title,author,pubdate)	
values(1,'java','홍길동',sysdate);

commit;

select * from book;		

insert into book (bookno,title,author,pubdate)	
values(2,'sql',null,null);

rollback;

insert into book (bookno,title,author,pubdate)	
values(2,'sql',null,'2019/01/01');


insert into book (bookno,title,author,pubdate)	
values(3,'spring','고길동',to_date('01/01/2019','mm/dd/yyyy'));

commit;

insert into book (bookno,title)	values(4,'html5');

insert into book values(1,'java','홍길동',sysdate);

commit;


delete from book;
rollback;

delete from book where bookno=4;
commit;

delete from book where bookno=1;
rollback;

update book set title='~~~~~~';
rollback;

update book set title='~~~~~~' where bookno=3;
rollback;

update book set title='hadoop',author='kim' where bookno=1;
commit;

update book set title='html5' where bookno=3;

-- 테이블 구조
desc book;

--column 추가
alter table book add(price number(7));

update book set price=0;
commit;

update book set price=99.99;
commit;

update book set price=null;
commit;

--column 수정
alter table book modify(price number(7,2));
update book set price=99.99;
commit;

--column 삭제
alter table book drop column price;

-- 테이블 이름 변경
rename book to book2;
rename book2 to book;
	
delete from book; -- rollback 가능 
rollback;

truncate table book;  -- auto commit 

drop table book;   -- auto commit 

select * from emp;
select * from dept;


create table emp2 as select * from emp;
create table dept2 as select * from dept;

select * from emp2;
select * from dept2;


insert into dept (deptno,dname,loc) values(10,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(10,'EDU','SEOUL');


insert into dept (deptno,dname,loc) values(50,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(50,'EDU','SEOUL');
commit;

insert into dept (deptno,dname,loc) values(50,'EDU','SEOUL'); X
insert into dept2 (deptno,dname,loc) values(50,'EDU','SEOUL'); O


insert into dept (deptno,dname,loc) values(null,'EDU','SEOUL');X 
insert into dept2 (deptno,dname,loc) values(null,'EDU','SEOUL'); O

insert into emp(empno,ename,sal,deptno)
values(999,'홍',2100,50);

insert into emp2(empno,ename,sal,deptno)
values(999,'홍',2100,90);

commit;

select ename,dname,loc
from emp e,dept d
where e.deptno = d.deptno and ename='홍';

select ename,dname,loc
from emp2 e,dept d
where e.deptno = d.deptno and ename='홍';

-- 제약 조건 설정 방법

drop table book;

create table book(
   bookno number(5) primary key,
   title  varchar2(40) unique,
   author varchar2(20),
   price number(7,2) check(price>0),
   pubdate date default sysdate
);	
	
select * from book;	
	
	
insert into book (bookno,title,author,price)	
values(1,'java','홍길동',900);
commit;

insert into book (bookno,title,author,price)	
values(2,'sql','홍길동',900);
commit;
select * from book;		


drop table book;
create table book(
   bookno number(5) ,
   title  varchar2(40) unique,
   author varchar2(20),
   price number(7,2) check(price>0),
   pubdate date default sysdate
);	

--제약조건 추가
alter table book 
add CONSTRAINT book_pk primary key(bookno); 

--제약조건 삭제
alter table book drop CONSTRAINT book_pk;


insert into book (bookno,title,author,price)	
values(1,'java','홍길동',900);
commit;

insert into book (bookno,title,author,price)	
values(2,'sql','고길동',2900);
commit;

insert into book (bookno,title,author,price)	
values(2,'db','고길동',2900);


****************************************
****************************************
drop table emp2;
drop table dept2;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

select * from emp2;
select * from dept2;


--제약조건 추가
alter table emp2 
add CONSTRAINT emp2_pk primary key(empno); 

alter table dept2 
add CONSTRAINT dept2_pk primary key(deptno); 

alter table emp2 
add CONSTRAINT emp2_fk_deptno 
foreign key(deptno) REFERENCES DEPT2; 

alter table emp2 
add CONSTRAINT emp2_fk_mgr 
foreign key(mgr) REFERENCES emp2; 


--제약조건 삭제
alter table dept2 drop CONSTRAINT dept2_pk;


************************************************
************************************************
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
	
	
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);





	
	