1) Product_inventory.

create table inventory(Pno varchar2(6) primary key check (Pno like 'P%'),
Pname varchar2(20),
Rate number(10,2));

desc inventory;
select * from inventory;

set serveroutput on;
set verify off;
declare
Rate inventory.Rate%type;
begin
insert into inventory values(&Pno,Pname,&Rate); commit;
insert into inventory values(&Pno,Pname,&Rate); commit;
insert into inventory values(&Pno,Pname,&Rate); commit;
update inventory set Rate = Rate + (Rate * 0.2);
end;
/

select * from inventory;

set serveroutput on;
set verify off;
declare
begin
alter table inventory add(&no_of_items number);
update inventory set no_of_items = 10 where Pno = 'P01';
update inventory set no_of_items = 20 where Pno = 'P02';
update inventory set no_of_items = 30 where Pno = 'P03';
end;
/

desc inventory;
select * from inventory;


2) Student_details.

create table student(SRN varchar2(6) primary key check (SRN like 'R%'),
Name varchar2(20),
Marks number,
Div varchar2(6));

desc student;
select *from student;

set serveroutput on;
set verify off;
declare
begin
insert into student values(&SRN,&Name,&Marks,&Div); commit;
insert into student values(&SRN,&Name,&Marks,&Div); commit;
insert into student values(&SRN,&Name,&Marks,&Div); commit;
insert into student values(&SRN,&Name,&Marks,&Div); commit;
end;
/

set linesize 100;
select * from student;

set serveroutput on;
set verify off;

declare

v_SRN student.SRN%type;
v_Name student.Name%type;
v_Marks student.Marks%type;
v_Div student.Div%type;

cursor student_passcur is select * from student where Div = 'PASS';
cursor student_failcur is select * from student where Div = 'FAIL';

begin

open student_passcur;
dbms_output.put_line('Passed Student ! ');
loop
fetch student_passcur into v_SRN, v_Name, v_Marks, v_Div;
exit when student_passcur%notfound;
dbms_output.put_line(v_SRN || ' ' || v_Name || ' ' || v_Marks || ' ' || v_Div);
end loop;
close student_passcur;

if not student_failcur%isopen then open student_failcur;
end if;
dbms_output.put_line('Failed Student ! ');
loop
fetch student_failcur into v_SRN, v_Name, v_Marks, v_Div;
exit when student_failcur%notfound;
dbms_output.put_line(v_SRN || ' ' || v_Name || ' ' || v_Marks || ' ' || v_Div);
end loop;
close student_failcur;

end;
/

3) Bank exception.

create table emp(emp_no varchar2(6) primary key check (emp_no like 'E%'),
comm number(5,2));

set serveroutput on;
set verify off;
declare
begin
insert into emp values(&emp_no,&comm); commit;	// 'E01', 200
insert into emp values(&emp_no,&comm); commit;	// 'E02', -200
insert into emp values(&emp_no,&comm); commit;	// 'E03', NULL
end;
/

set serveroutput on;
set verify off;

declare

invalid_commision exception;
no_commision exception;
v_emp_no emp.emp_no%type;
v_comm emp.comm%type;

begin
select comm into v_comm from emp where emp_no = &emp_id;
	if v_comm < 0 then
		raise invalid_commision;
	elsif v_com is null then
		raise no_commision;
	else
		dbms_output.put_line(to_char(v_comm));
	end if;
exception
	when invalid_commision then
		dbms_output.put_line('Negative is Commision ! ');
	when no_commision then
		dbms_out.put_line('No Commision ! ');
	when others then
		dbms_output.put_line('Invalid Id ! ');
end;
/


