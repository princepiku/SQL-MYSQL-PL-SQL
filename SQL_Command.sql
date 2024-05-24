SQL> select sysdate, to_char(sysdate,'DD-MONTH-YYYY') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD-MONTH-YYYY')
--------- --------------------------------------------
10-MAR-22 10-MARCH    -2022

SQL> select sysdate, to_char(sysdate,'ww-MONTH-YYYY') from dual;

SYSDATE   TO_CHAR(SYSDATE,'WW-MONTH-YYYY')
--------- --------------------------------------------
10-MAR-22 10-MARCH    -2022

SQL> select sysdate, to_char(sysdate,'www-MONTH-YYYY') from dual;

SYSDATE   TO_CHAR(SYSDATE,'WWW-MONTH-YYYY')
--------- ---------------------------------------------
10-MAR-22 102-MARCH    -2022

SQL> select sysdate, to_char(sysdate,'w-MONTH-YYYY') from dual;

SYSDATE   TO_CHAR(SYSDATE,'W-MONTH-YYYY')
--------- -------------------------------------------
10-MAR-22 2-MARCH    -2022

SQL> select sysdate, to_date(sysdate,'D-MM-YY') from dual;
select sysdate, to_date(sysdate,'D-MM-YY') from dual
                        *
ERROR at line 1:
ORA-01861: literal does not match format string


SQL> select to_date('10-3-26') from dual;
select to_date('10-3-26') from dual
               *
ERROR at line 1:
ORA-01843: not a valid month


SQL> select to_date(10-3-26) from dual;
select to_date(10-3-26) from dual
                   *
ERROR at line 1:
ORA-01847: day of month must be between 1 and last day of month


SQL> select to_date(10-3-26,'dd-mon-yy') from dual;
select to_date(10-3-26,'dd-mon-yy') from dual
                   *
ERROR at line 1:
ORA-01847: day of month must be between 1 and last day of month


SQL> select to_date(10-march-26,'dd-mon-yy') from dual;
select to_date(10-march-26,'dd-mon-yy') from dual
                  *
ERROR at line 1:
ORA-00904: "MARCH": invalid identifier


SQL> select to_date(10-mar-26,'dd-mon-yy') from dual;
select to_date(10-mar-26,'dd-mon-yy') from dual
                  *
ERROR at line 1:
ORA-00904: "MAR": invalid identifier


SQL> select to_date(10'mar'26,'dd-mon-yy') from dual;
select to_date(10'mar'26,'dd-mon-yy') from dual
                 *
ERROR at line 1:
ORA-00907: missing right parenthesis


SQL> select to_date('10/march/26','dd-mon-yy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10/march/26','dd-month-yy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10-march-26','dd-month-yy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10-march-26','dd/month/yy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10 march 26','dd/month/yy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10 march 26','dd/month/yyyy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('10 march 26','ddd/month/yyyy') from dual;
select to_date('10 march 26','ddd/month/yyyy') from dual
               *
ERROR at line 1:
ORA-01833: month conflicts with Julian date


SQL> select to_date('69 march 26','ddd/month/yyyy') from dual;

TO_DATE('
---------
10-MAR-26

SQL> select to_date('68 march 26','ddd/month/yyyy') from dual;

TO_DATE('
---------
09-MAR-26

SQL> select sysdate, to_char(sysdate,'DD/MONTH/YYYY') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD/MONTH/YYYY')
--------- --------------------------------------------
10-MAR-22 10/MARCH    /2022

SQL> select sysdate, to_char(sysdate,'dd/month/yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD/MONTH/YYYY')
--------- --------------------------------------------
10-MAR-22 10/march    /2022

SQL> select sysdate, to_char(sysdate,'d/month/yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'D/MONTH/YYYY')
--------- -------------------------------------------
10-MAR-22 5/march    /2022

SQL> select sysdate, to_char(sysdate,'ddd/month/yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DDD/MONTH/YYYY')
--------- ---------------------------------------------
10-MAR-22 069/march    /2022

SQL> select sysdate, to_char(sysdate,'d') from dual;

SYSDATE   T
--------- -
10-MAR-22 5

SQL> select sysdate, to_char(sysdate,'day') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DAY')
--------- ------------------------------------
10-MAR-22 thursday

SQL> select sysdate, to_char(sysdate,'da') from dual;
select sysdate, to_char(sysdate,'da') from dual
                                *
ERROR at line 1:
ORA-01821: date format not recognized


SQL> select sysdate, to_char(sysdate,'d-m-y') from dual;
select sysdate, to_char(sysdate,'d-m-y') from dual
                                *
ERROR at line 1:
ORA-01821: date format not recognized


SQL> select sysdate, to_char(sysdate,'dd-mm-yy') from dual;

SYSDATE   TO_CHAR(
--------- --------
10-MAR-22 10-03-22

SQL> select sysdate, to_char(sysdate,'dd-mm-yyyy') from dual;

SYSDATE   TO_CHAR(SY
--------- ----------
10-MAR-22 10-03-2022

SQL> select sysdate, to_char(sysdate,'dd-mon-yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD-
--------- --------------------
10-MAR-22 10-mar-2022

SQL> select sysdate, to_char(sysdate,'dd-month-yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD-MONTH-YYYY')
--------- --------------------------------------------
10-MAR-22 10-march    -2022

SQL> select sysdate, to_char(sysdate,'dd/month-yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD/MONTH-YYYY')
--------- --------------------------------------------
10-MAR-22 10/march    -2022

SQL> select sysdate, to_char(sysdate,'dd-month/yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD-MONTH/YYYY')
--------- --------------------------------------------
10-MAR-22 10-march    /2022

SQL> select sysdate, to_char(sysdate,'dd_month/yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD_MONTH/YYYY')
--------- --------------------------------------------
10-MAR-22 10_march    /2022

SQL> select sysdate, to_char(sysdate,'dd_monthyyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD_MONTHYYYY')
--------- -------------------------------------------
10-MAR-22 10_march    2022

SQL> select sysdate, to_char(sysdate,'dd_montyyyy') from dual;
select sysdate, to_char(sysdate,'dd_montyyyy') from dual
                                *
ERROR at line 1:
ORA-01821: date format not recognized


SQL> select sysdate, to_char(sysdate,'dd_month>yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD_MONTH>YYYY')
--------- --------------------------------------------
10-MAR-22 10_march    >2022

SQL> select sysdate, to_char(sysdate,'dd<month>yyyy') from dual;

SYSDATE   TO_CHAR(SYSDATE,'DD<MONTH>YYYY')
--------- --------------------------------------------
10-MAR-22 10<march    >2022

SQL> select sysdate, to_char(sysdate,'[DD/MONTH/YYYY]') from dual;

SYSDATE   TO_CHAR(SYSDATE,'[DD/MONTH/YYYY]')
--------- ----------------------------------------------
10-MAR-22 [10/MARCH    /2022]

SQL> select sysdate, to_char(sysdate,'[DD_MONTH_YYYY]') from dual;

SYSDATE   TO_CHAR(SYSDATE,'[DD_MONTH_YYYY]')
--------- ----------------------------------------------
10-MAR-22 [10_MARCH    _2022




create table Student(
Std_Id varchar(8) primary key not null,
Std_Name varchar(20) not null,
Std_Birth date not null,
Std_phone_No number(10) not null,
Std_Email_Id varchar(40) not null,
Std_Address varchar(30) not null,
Std_Section varchar(10) not null);




























EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      121            50

        188 Kelly                Chung
KCHUNG                    650.505.1876         14-JUN-97 SH_CLERK         3800
                      122            50

        189 Jennifer             Dilly

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JDILLY                    650.505.2876         13-AUG-97 SH_CLERK         3600
                      122            50

        190 Timothy              Gates
TGATES                    650.505.3876         11-JUL-98 SH_CLERK         2900
                      122            50

































List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear command.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter. NOTE: Takes the rest of the line as new delimiter.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
notee     (\t) Don't write into outfile.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.




mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| client             |
| mysql              |
| test               |
+--------------------+
4 rows in set (0.00 sec)

mysql> use databases;
ERROR 1049 (42000): Unknown database 'databases'
mysql> use databases mysql;
ERROR 1049 (42000): Unknown database 'databases'
mysql> show user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'user' at line 1
mysql> show users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'users' at line 1
mysql> select user from mysql.user;
+--------+
| user   |
+--------+
| prince |
| root   |
| root   |
+--------+
3 rows in set (0.07 sec)

mysql> desc user;
ERROR 1046 (3D000): No database selected
mysql> use databases prince;
ERROR 1049 (42000): Unknown database 'databases'
mysql> select user(prince);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'prince)' at line 1
mysql> show users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'users' at line 1
mysql> show user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'user' at line 1
mysql> change user prince;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'user prince' at line 1
mysql> select user from mysql.prince;
ERROR 1146 (42S02): Table 'mysql.prince' doesn't exist
mysql> select * from hr.employees;
ERROR 1146 (42S02): Table 'hr.employees' doesn't exist
mysql> create table employee(
    -> Id varchar(10) primary key,
    -> Name varchar(20) not null,
    -> PhoneNo number(10) not null,
    -> Email_id varchar(40) not null,
    -> DOB date not null,
    -> Gender varchar(5) not null,
    -> Salary number(9,2) not null);
ERROR 1046 (3D000): No database selected
mysql> use databases mysql;
ERROR 1049 (42000): Unknown database 'databases'
mysql> create table employee(
    -> Id varchar(10) primary key,
    -> Name varchar(20) not null,
    -> PhoneNo number(10) not null,
    -> Email_id varchar(40) not null,
    -> DOB date not null,
    -> Gender varchar(5) not null,
    -> Salary number(9,2) not null);
ERROR 1046 (3D000): No database selected
mysql> use abc;
ERROR 1049 (42000): Unknown database 'abc'
mysql> use client;
Database changed
mysql> create table employee(
    -> Id varchar(10) primary key,
    -> Name varchar(20) not null,
    -> PhoneNo number(10) not null,
    -> Email_id varchar(40) not null,
    -> DOB date not null,
    -> Gender varchar(5) not null,
    -> Salary number(9,2) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'number(10) not null,
Email_id varchar(40) not null,
DOB date not null,
Gender va' at line 4
mysql> create table employee
    -> (
    -> id varchar2(8)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varchar2(8)
)' at line 3
mysql> create table employee(
    -> id varchar(8));
Query OK, 0 rows affected (0.07 sec)

mysql> create table abc(
    -> name varchar(10)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> create table bbb(
    -> age varchar2(10)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varchar2(10)
)' at line 2
mysql> drop table abc;
Query OK, 0 rows affected (0.04 sec)

mysql> drop table employee;
Query OK, 0 rows affected (0.05 sec)

mysql> create table employee(
    -> Id varchar(10) primary key,
    -> Name varchar(20) not null,
    -> PhoneNo number(10) not null,
    -> Email_id varchar(40) not null,
    -> DOB date not null,
    -> Gender varchar(5) not null,
    -> Salary number(9,2) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'number(10) not null,
Email_id varchar(40) not null,
DOB date not null,
Gender va' at line 4
mysql> create table employee(
    -> Id varchar(10) primary key,
    -> Name varchar(20) not null,
    -> PhoneNo number(10) not null,
    -> Email_id varchar(40) not null,
    -> Gender varchar(5) not null,
    -> Salary number(9,2) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'number(10) not null,
Email_id varchar(40) not null,
Gender varchar(5) not null,
' at line 4
mysql> create table abc(
    -> id number(10));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'number(10))' at line 2
mysql>




