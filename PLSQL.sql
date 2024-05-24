--Employee Table.

create table employee
(
	Id varchar(10) primary key,
	Name varchar(20) not null,
	PhoneNo number(10) not null,
	Email_id varchar(40) not null,
	Gender varchar(5) not null,
	Salary number(9,2) not null
);

Table created.

SQL> desc employee;
 Name                                      Null?   Type
-------------------------------------------------------------------------------------------------------------------

 ID                                        NOT NULL VARCHAR2(10)
 NAME                                 NOT NULL VARCHAR2(20)
 PHONENO                          NOT NULL NUMBER(10)
 EMAIL_ID                          NOT NULL VARCHAR2(40)
 GENDER                            NOT NULL VARCHAR2(5)
 SALARY                              NOT NULL NUMBER(9,2)

-------------------------------------------------------------------------------------------------------------------
--Insert Field(Data) in Employee Table by PL/SQL.

set verify off;
set serveroutput on;
declare
begin
insert into employee values('R179','Prince Kumar',9142382053,'princesinha2018@gmail.com','Male',20000.20);
insert into employee values('R180','Prashant patil',9065133278,'prashantnagopatil2022@gmail.com','Male',30000.20);
insert into employee values('R181','Tushar Das',7857925083,'tushardas2020@gmail.com','Male',40000.20);
end;
/

SQL> select * from employee;


ID         NAME                    PHONENO
-------------------------------------------------------------------------------------------------------------------
EMAIL_ID                                 GENDE     SALARY
-------------------------------------------------------------------------------------------------------------------
R179       Prince Kumar         9142382053
princesinha2018@gmail.com                Male     20000.2

R180       Prashant patil       9065133278
prashantnagopatil2022@gmail.com          Male     30000.2

R181       Tushar Das           7857925083
tushardas2020@gmail.com                  Male     40000.2

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
--Local Variable and Global Variable.

set verify off;
set serveroutput on;
declare
a number(10) := &a;
b number(10) := &b;
c number := a+b;
begin
dbms_output.put_line('Global Variable = ' ||c);
declare
x number(10) := &x;
y number(10) := &y;
z number:= x*y;
begin
dbms_output.put_line('Local Variable = ' ||z);
end;
end;
/

Global Variable = 30
Local Variable = 600

PL/SQL procedure successfully completed.

-------------------------------------------------------------------------------------------------------------------
--Area of Circle , radius , diameter , circumference.

set verify off;
set serveroutput on;
declare
pi constant number := 3.141592654;
radius number(9,2) := &radius;
dia number(9,2) := 2 * radius;
circumference number(9,2) := 2.0 * pi * radius;
area number(9,2) := pi * radius * radius;
begin
dbms_output.put_line('Radious of Circle = ' ||radius);
dbms_output.put_line('Diameter of Circle = ' ||dia);
dbms_output.put_line('Circumference of Circle = ' ||circumference);
dbms_output.put_line('Area of Circle = ' ||area);
end;
/

Enter value for radius: 10.5
Radious of Circle = 10.5
Diameter of Circle = 21
Circumference of Circle = 65.97
Area of Circle = 346.36

PL/SQL procedure successfully completed.

-------------------------------------------------------------------------------------------------------------------
--WAP to Greater Number. 

set verify off;
set serveroutput on;
declare
x int := &x;
y int := &y;
begin
if(y>x) then
dbms_output.put_line('Result = ' ||y || ' is greater than ' || x);
end if;
end;
/

Result = 35 is greater than 25

PL/SQL procedure successfully completed.

-------------------------------------------------------------------------------------------------------------------
--WAP to Odd And Even Number.

declare
x int := &x;
begin
if mod(x,2) = 0 then
dbms_output.put_line('Even Number');
else
dbms_output.put_line('Odd Number');
end if;
end;
/

Enter value for x: 20
Even Number

PL/SQL procedure successfully completed.
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

set verify off;
set serveroutput on;
declare
begin
dbms_output.put_line('Hello Prince');
end;
/

PL/SQL procedure successfully completed.

Hello Prince

----------------------------------------------------------------------------------------------------------------------
--Sum of two Number.
set verify off
set serveroutput on;
declare
a number := &a;
b number := &b;
suma number := a+b;
begin
dbms_output.put_line('Sum = ' ||suma);
end;
/

PL/SQL procedure successfully completed.

----------------------------------------------------------------------------------------------------------------------

SQL> update employee set id = 1 where name='Prince Kumar';

1 row updated.

SQL> update employee set id = 2 where name='Prashant patil';

1 row updated.

SQL> update employee set id = 3  where name='Tushar Das';

1 row updated.

SQL> select * from employee;

ID         NAME                    PHONENO
----------------------------------------------------------------------------------------------------------------------
EMAIL_ID                                 GENDE     SALARY
----------------------------------------------------------------------------------------------------------------------
1          Prince Kumar         9142382053
princesinha2018@gmail.com                Male     20000.2

R180       Prashant patil       9065133278
prashantnagopatil2022@gmail.com          Male     30000.2

3          Tushar Das           7857925083
tushardas2020@gmail.com                  Male     40000.2

----------------------------------------------------------------------------------------------------------------------

declare
E_Name employee.Name %type;
E_PhoneNo employee.PhoneNo %type;
E_Email_id employee.Email_id %type;
E_Gender employee.Gender %type;
E_Salary employee.Salary %type;
i number;
begin
for i in 1.. 3 loop
select Name, PhoneNo, Email_id, Gender, Salary into E_Name, E_PhoneNo, E_Email_id, E_Gender, E_Salary from employee where id = i;
dbms_output.put_line('Employee Details =' ||' '||E_Name ||' '||E_PhoneNo ||' '||E_Email_id||' '||E_Gender||' '||E_Salary);
end loop;
end;
/

----------------------------------------------------------------------------------------------------------------------

Employee Details = Prince Kumar 9142382053 princesinha2018@gmail.com Male
20000.2
Employee Details = Prashant patil 9065133278 prashantnagopatil2022@gmail.com
Male 30000.2
Employee Details = Tushar Das 7857925083 tushardas2020@gmail.com Male 40000.2

PL/SQL procedure successfully completed.

----------------------------------------------------------------------------------------------------------------------
--WAP to print a table to given number.

set verify off;
set serveroutput on;
declare
n number;
i number;
begin
n := &n;
for i in 1..10
loop
dbms_output.put_line(n||'x'||i||' = '||n*i);
end loop;
end;
/

----------------------------------------------------------------------------------------------------------------------
--WAP to print simple intrest.
--WAP to print compound intrest.

set verify off
set serveroutput on;
declare
p number(9,2);
r number(9,2);
t number(9,2);
ci number(9,2);
si number(9,2);
power number(20,2);
begin
p := &p;
r := &r;
t := &t;
power := &power;
ci := p * power * (1 + (r / 100)) * t;
si := (p * r * t) / 100;
dbms_output.put_line('Simple Intrest = '||si);
dbms_output.put_line('Compound Intrest = '||ci);
end;
/

----------------------------------------------------------------------------------------------------------------------
--WAP to demonstrate usage of else-if ladder.

set verify off
set serveroutput on;
declare
a int := &a;
b int := &b;
begin
if(a>b) then
dbms_output.put_line('a is greater than b');
elsif(b>a) then
dbms_output.put_line('b is greater than a');
else
dbms_output.put_line('Both a and b are equal');
end if;
end;
/

----------------------------------------------------------------------------------------------------------------------
--Case Selector.

set verify off
set serveroutput on;
declare
a int;
b int;
begin
a := &a;
b := mod(a,2);
case b
when 0 then dbms_output.put_line('Even Number');
when 1 then dbms_output.put_line('Odd Number');
-- this condition never be reached -> else dbms_output.put_line('User has not given any input value to check');
end case;
end;
/

----------------------------------------------------------------------------------------------------------------------
--WAP to swap the value using third variable as.

set verify off;
set serveroutput on;
create or replace procedure swap_test as
--declare
a number(10) := &a;
b number(10) := &b;
procedure my_swap(x in out number, y in out number) as
t number;
begin
t := x;
x := y;
y := t;
end my_swap;
--end;
begin
my_swap(a,b);
dbms_output.put_line('Swap the value of A = '||to_char(a));
dbms_output.put_line('Swap the value of B = '||to_char(b));
end;
/

SQL> exec swap_test;

----------------------------------------------------------------------------------------------------------------------

set verify on;
set serveroutput on;
create or replace function sum1(a in out number, b in out number)
return number is
c number;
begin
c := a+b;
return c;
end;
/


----------------------------------------------------------------------------------------------------------------------
--Addition of two Number(Using Function).

set verify off;
set serveroutput on;
declare
x number;
y number;
result number;
begin
x := &x;
y := &y;
result := sum1(x,y);
dbms_output.put_line('Addition = '||result);
end;
/

----------------------------------------------------------------------------------------------------------------------

--Procedure (is/as)

create table user(Id varchar2(10) primary key check (Id like 'U%'),
Name varchar2(20) not null);

set serveroutput on;
set verify off;

create or replace procedure "insertuser" (Id in varchar2, Name varchar2)
is
begin
insert into values(Id, Name);
end;
/

begin
insertuser('U1', 'Rahul');
dbms_output.put_line('Record Insert Sucessfully !');
end;
/

begin
insertuser('U2', 'Prince');
dbms_output.put_line('Record Insert Sucessfully !');
end;
/


set verify off;
set serveroutput on;
create table user1 (id number(10) primary key , name varchar(20));
create or replace procedure insert_user(id in number, name in varchar) is
begin
insert into user1 values(id, name);
end;
/

--To Invoke
SQL> exec insert_user1(1,'prince');

----------------------------------------------------------------------------------------------------------------------
--PL/SQL.
set verify off;
set serveroutput on;
begin
insert_user(2,'Maanish');
dbms_output.put_line('Record Insert Successfullly !');
end;
/

--SQL> desc user1
--SQL> select * from user1;

----------------------------------------------------------------------------------------------------------------------
set verify off;
set serveroutput on;
create or replace procedure welcome_print(s in char, m out char) as
site char(80) := 'www.google.com';
message char(80);
begin
m := 'Welcome to my World' || chr(10) ||s;
end;
/

----------------------------------------------------------------------------------------------------------------------
set verify off;
set serveroutput on;
declare
	message char(80);
begin 
welcome_print('MyPrince.com', message);
dbms_output.put_line(message);
end;
/

----------------------------------------------------------------------------------------------------------------------
--Menu Driven Operations conversing all data types.

set verify off;
set serveroutput on;
DECLARE
	choice char(1);
	radius number(9,2);
	area number(9,2);
	base number(20);
	height number(20);
	current_date date;
	
BEGIN
	dbms_output.put_line('A. Area of Circle');
	dbms_output.put_line('B. Area of Triangle');
	dbms_output.put_line('C. Area of Sphere');
	dbms_output.put_line('D. Display Current Date');
	choice := &choice;
	case choice
		when 'A' then
			radius := &radius;
			area := radius * radius * 3.14;
			dbms_output.put_line('Area of circle is : ' || area);
		when 'B' then
			base := &base;
			height := &height;
			area := 0.5 * base * height;
			dbms_output.put_line('Area of Triangle is : ' || area);
		when 'C' then
			area := 4 * 3.14 * radius * radius;
			dbms_output.put_line('Area of Sphere is : ' || area);
		when 'D' then
			newyear date := 'DD/MM/YYYY';
			current_date := SYSDATE;
			dbms_output.put_line('Today's Current Date is : ' || current_date);
        	else
            		dbms_output.put_line('Invalid Choice !');
    end case;
END; 
/
































