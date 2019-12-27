SET TERMOUT OFF
SET ECHO OFF
	
drop table users;
create table users(
	id number(8) primary key,
    pw varchar2(20) NOT NULL,
    name varchar2(10) NOT NULL,
    role varchar2(16) NOT NULL
);


	
drop table board;
create table board(
    seq number(20) primary key,
	title varchar2(20) NOT NULL,
    content varchar2(2000) NOT NULL,
    regdate DATE default (sysdate),
    cnt number(4),
    id number(8) NOT NULL,
    constraint FK_id FOREIGN key(id) REFERENCES users(id)
);

INSERT INTO users VALUES (10000001, 1234, 'name_0001', 'role 01');
INSERT INTO users VALUES (10000002, 1234, 'name_0002', 'role 02');
INSERT INTO users VALUES (10000003, 1234, 'name_0003', 'role 02');
INSERT INTO users VALUES (10000004, 1234, 'name_0004', 'role 02');
INSERT INTO users VALUES (10000005, 1234, 'name_0005', 'role 02');
INSERT INTO users VALUES (10000006, 1234, 'name_0006', 'role 03');
INSERT INTO users VALUES (10000007, 1234, 'name_0007', 'role 03');
INSERT INTO users VALUES (10000008, 1234, 'name_0008', 'role 03');
INSERT INTO users VALUES (10000009, 1234, 'name_0009', 'role 03');
INSERT INTO users VALUES (20000001, 1234, 'name_0010', 'role 03');
INSERT INTO users VALUES (20000002, 1234, 'name_0011', 'role 03');
INSERT INTO users VALUES (20000003, 1234, 'name_0012', 'role 04');
INSERT INTO users VALUES (20000004, 1234, 'name_0013', 'role 04');
commit;

insert into (select id, pw, name, role) values ();
update users 
    set pw='',
        name='',
        role=''
    where users IN
        (select id
        from users
        where id = );

UPDATE employees a 
    SET department_id = 
        (SELECT department_id 
            FROM departments 
            WHERE location_id = '2100'), 
        (salary, commission_pct) = 
        (SELECT 1.1*AVG(salary), 1.5*AVG(commission_pct) 
          FROM employees b 
          WHERE a.department_id = b.department_id) 
    WHERE department_id IN 
        (SELECT department_id 
          FROM departments
          WHERE location_id = 2900 
              OR location_id = 2700); 

SET TERMOUT ON
SET ECHO ON