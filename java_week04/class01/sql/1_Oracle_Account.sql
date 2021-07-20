


sqlplus system/1234

alter user hr identified by hr account unlock;

conn ht/ht
sqlplust hr/hr



select * from tab;
select * from employees;


create TABLESPACE mc
datafile 'C:\oraclexe\app\oracle\oradata\XE\mc..dbf'
size 10M
autoextend on next 1M maxsize UNLIMITED;

CREATE USER test01 IDENTIFIED BY 1234
DEFAULT TABLESPACE mc;


GRANT CONNECT,RESOURCE,DBA to test01;

REVOKE DBA FROM test01;

DROP USER test01 CASCADE


@c:\lib\scott.sql;


CREATE USER SCOTT IDENTIFIED BY tiger


set linesize 300;
set pagesize 20;



