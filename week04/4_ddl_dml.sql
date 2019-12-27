######################################################
Table 생성   DDL;data definition language  (auto commit; no roll-back)

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
	
	
drop table book;
create table book(
	bookno number(5),
	title varchar2(40),
	author varchar2(20),
	pubdate date
);

select * from book;

--DML; which is not AUTO-COMMIT, rollback-able.
-- 	intert, delete, update

insert into book (bookno, title, author, pubdate)
values(1,'java','Hong',sysdate);

commit;

insert into book (bookno, title, author, pubdate)
values(2,'sql',null, null);

rollback;

insert into book (bookno, title, author, pubdate)
values(2,'sql',null, '2019/02/03');

insert into book (bookno, title, author, pubdate)
values(3,'Vue','Go', '02/02/2019');
--ORA-01830: date format picture ends before converting entire input string; converting fail.
insert into book (bookno, title, author, pubdate)
values(3,'Vue','Go', to_date('02/02/2019', 'dd/mm/yyyy'));

insert into book (bookno, title)
values(4,'HTML/CSS');
--알아서 null

insert into book values(5,'JS','Kil', sysdate);
--가능한데 추천은x. 가독성 낮.

delete from book;
update book set title = '~~~~~~~~~~';
-- record 다 날아간다, 수정된다...
-- commit 만 안했다면 희망이 있다.

where bookno = 4  where bookno = 4;
update book set title = '~~~~~~~~~~' where bookno =3;
update book set title = 'HADOOP', author='Gim' where bookno =1;



desc book;
-- column 수정+추가하기
alter table book add(price number(7));
update book set price=0;

commit;

-- 정수자리에 99.99 넣기
update book set price=99.99;
commit;
-- 결과값은 100..오류는 안뜨고 자동으로 형변환.

update book set price=null;
commit;
-- 걍 null

-- column 수정+수정하기
alter table book modify(price number(7, 2));
update book set price=99.99;
commit;
-- 99.99

-- column 수정+삭제하기
alter table book drop column price;

-- table rename
rename book to Chaek;
rename chaek to book;

delete from book; -- rollback-able
truncate table book; -- auto-commit; Un-rollbackable

drop table book; -- auto-commit; 마지막 밥상뒤엎기




create table emp2 as select * from emp;
create table dept2 as select * from dept;

insert into dept (deptno, dname, loc) values (10,'EDU', 'SEOUL');
--ORA-00001: unique constraint (SCOTT.PK_DEPT) violated; 유니크값 제약조건

insert into dept2 (deptno, dname, loc) values (10,'EDU', 'SEOUL'); --제약조건없음

insert into dept (deptno, dname, loc) values (50,'EDU', 'BUSAN'); -- 한번은 가능. 50번은 없던거라서.
insert into dept2 (deptno, dname, loc) values (50,'EDU', 'BUSAN'); --제약조건없음

insert into dept (deptno, dname, loc) values (NULL,'EDU', 'BUSAN'); -- null error
insert into dept2 (deptno, dname, loc) values (NULL,'EDU', 'BUSAN'); --제약조건없음

insert into emp(empno, ename, sal, deptno) values(999, 'Hong', 2100, 90);
-- ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
-- FK는 누군가의 귀한 PK이다.

************************
-- 제약설정
************************


drop table book;
create table book(
	bookno number(5) Primary Key,
	title varchar2(40) unique,
	author varchar2(20),
	price number(7, 2) check(price>0),
	pubdate date default sysdate-7
);

select * from book;

insert into book (bookno, title, author, price)
values(1,'java','Hong', -9000);

insert into book (bookno, title, author, pubdate)
values(2,'sql',null, null);

insert into book (bookno, title, author, pubdate)
values(2,'sql',null, '2019/02/03');



************************
************************

drop table book;
create table book(
	bookno number(5),
	title varchar2(40) unique,
	author varchar2(20),
	price number(7, 2) check(price>0),
	pubdate date default sysdate-7
);

alter table book add constraint book_pk primary key(bookno); --제약조건에 이름을 {tableName_constraint} 이렇게 만들어 주었다.
insert into book (bookno, title, author, price) values(1,'SQL','Tong', 19000);
insert into book (bookno, title, author, price) values(1,'java','Hong', 2000);
--ORA-00001: unique constraint (SCOTT.BOOK_PK) violated


alter table book drop constraint book_pk; --제약조건의 이름으로 제약조건 drop하기.

************************
************************

drop table emp2;
drop table dept2;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

alter table emp2 add constraint emp2_pk primary key(empno);
alter table dept2 add constraint dept2_pk primary key(deptno);
alter table emp2 add constraint emp2_fk_deptno foreign key(deptno) references dept2;
alter table emp2 add constraint emp2_fk_mgr foreign key(mgr) references emp2;
--셀프 조인을 관계설정 해주는 이유????











