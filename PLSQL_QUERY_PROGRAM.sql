	// LISTING : SINGLE TABLE RETRIEVAL


1) select name from Client_Master;
2) select * from Client_Master;
3) select name,City,State from Client_Master;
4) select Description from Product_Master;
5) select Name from Client_Master where Name like '_a%'; //For selecting 2nd letter of name starting with a.
6) select Name,City from Client_Master where City like '_a%';
7) select Name from Client_Master where City in ('Bombay','Delhi','Madras');
		(Or)
	select Name from Client_Master where City = 'Bombay' or City = 'Delhi' or City = 'Madras';
8) select Name from Client_Master where City = 'Bombay';
9) select Name from Client_Master where Bal_due > 1000;
10) select S_order_no from Sales_Order where S_order_date = '%Jan%';
11) select * from Sales_Order where Client_no = 'C00001' or Client_no = 'C00002';
		(Or)
	select S_order_no from Sales_Order where Client_no in ('C00001','C00002');
12) select Product_no,Description from Product_master where Description = '1.44 Drive' or '1.22 Drive';
13) select Product_no,Description,Sell_price,Sell_price * 15 from Product_Master where Sell_price > 1500;
		(Or)
	select Product_no,Description,Sell_price,Sell_price * 15 as new_Sell_price from Product_Master where Sell_price > 1500;
15) select Product_no,Description from product_Master where Cost_price < 15000;
16) select Product_no,Description from Product_Master order by Description asc;
		(Or)
	select Product_no, Description from Product_Master order by Product_no asc;
17) select Product,Description,Sqrt(Cost_price) as Sqrt(Cost_price) from Product_Master;
19) select name,City,State from Client_Master where State != 'Maharastra';
20) select Product_no,Description,Sell_price from Product_Master where Description  like 'M%';
21) select S_order_no from Sales_Order where month = %Mar% and Order_status = 'Cancelled';


	// LISTING : TABLE UPDATIONS


1) update Sales_Order set S_order_date = '24-JULY-1996' where Client_no = 'C00001';
2) update Product_Master set Sell_price = 1150.00 where Description = '1.44 Drive';
3) delete * from Sales_Order where S_order_no = 'O19001';
4) delete * from Sales_Order where Dely_date < '10-JULY-1996';
5) update Client_Master set City = 'Bombay' where Client_no = 'C00005';
6) update Sales_Order set Dely_date = '16-AUG-1996' where S_order_no = 'O10008';
7) update Client_Master set Bal_due = 1000 where Client_no = 'C00001';
8) update Product_Master set Cost_price = 950.00 where Description = '1.22 Floppy Drive';


	// LISTING - V : SET FUNCTIONS AND CONCATENATION


1) select count(*) from Sales_Order;
		(OR)
   select count(S_order_no) from Sales_Order;

2) select avg(Cost_price) from Product_Master;		

3) select min(Cost_price) from Product_Master;

4) select max(Cost_price) as max_price, min(Cost_price) as min_price from Product_Master;

5) select count(*) from Product_Master where Cost_price >= 1500;

6) select * from product_master where Qty_on_hand < Reorder_lvl;

7) select Client_Master.Name || " has placed order " ||  Sales_Order.S_order_no ||  "on" || Sales_Order.S_order_date from Client_Master,Sales_Order,Sales_Order;

	// LISTING - VIII : PL/SQL

1)

create table inventory(pno varchar2(8) primary key check (pno like 'P%'), pname varchar2(20), rate number);

set serveroutput on;
set verify off;
declare
rate1 inventory.rate%type;
begin
insert into inventory values(&pno, &pname, &rate);
insert into inventory values(&pno, &pname, &rate);
insert into inventory values(&pno, &pname, &rate);
select rate into rate1 from inventory;
update inventory set rate = rate1 + (rate1 * 0.2);
end;
/

commit;
select * from inventory;

alter table inventory add(no_of_items number);
update inventory set no_of_items = 10 where pno = 'P1';
update inventory set no_of_items = 35 where pno = 'P2';
update inventory set no_of_items = 05 where pno = 'P3';

insert into inventory values(&pno, &pname, &rate,&no_of_items);
select rate into rate1 from inventory;
update inventory set rate = rate1 + (rate1 * 0.2);
end;
/


commit;
select * from inventory;


SQL> insert into inventory values('P4','D',420,15);

1 row created.

SQL> select * from inventory;

PNO PNAME                      RATE NO_OF_ITEMS
--- -------------------- ---------- -----------
P1  A                           120          10
P2  B                           240          35
P3  C                           360           5
P4  D                           420          15

SQL> insert into inventory values('P5','E',540,20);

1 row created.

SQL> select * from inventory;

PNO PNAME                      RATE NO_OF_ITEMS
--- -------------------- ---------- -----------
P1  A                           120          10
P2  B                           240          35
P3  C                           360           5
P4  D                           420          15
P5  E                           540          20

SQL>

SQL> insert into inventory values(&pno, &pname, &rate,&no_of_items);
Enter value for pno: 'P6'
Enter value for pname: 'F'
Enter value for rate: 660
Enter value for no_of_items: 25

1 row created.

SQL> desc inventory;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PNO                                       NOT NULL VARCHAR2(3)
 PNAME                                              VARCHAR2(20)
 RATE                                               NUMBER
 NO_OF_ITEMS                                        NUMBER

SQL> select * from inventory;

PNO PNAME                      RATE NO_OF_ITEMS
--- -------------------- ---------- -----------
P1  A                           120          10
P2  B                           240          35
P3  C                           360           5
P6  F                           660          25

SQL> insert into inventory values('P4','D',420,15);

1 row created.

SQL> insert into inventory values('P5','E',540,20);

1 row created.

SQL> select * from inventory;

PNO PNAME                      RATE NO_OF_ITEMS
--- -------------------- ---------- -----------
P1  A                           120          10
P2  B                           240          35
P3  C                           360           5
P6  F                           660          25
P4  D                           420          15
P5  E                           540          20

6 rows selected.

SQL> commit;

Commit complete.

SQL>





2)

create table student1(SRN varchar2(10) primary key check(srn like 'R%'), S_name varchar2(20), marks number, div varchar2(5));

desc student1;

begin
insert into student1 (srn, s_name, marks, div) values (&srn, &s_name, &marks, &div); commit;
insert into student1 (srn, s_name, marks, div) values (&srn, &s_name, &marks, &div); commit;
insert into student1 (srn, s_name, marks, div) values (&srn, &s_name, &marks, &div); commit;
insert into student1 (srn, s_name, marks, div) values (&srn, &s_name, &marks, &div); commit;
end;
/

select * from student1;

set verify off;
set serveroutput on;
DECLARE

v_srn student1.srn%type;
v_s_name student1.s_name%type;
v_marks student1.marks%type;
v_div student1.div%type;
CURSOR student_Passcur IS select * from student1 where div = 'PASS';
CURSOR student_Failcur IS select * from student1 where div = 'FAIL';

BEGIN

OPEN Student_Passcur;
DBMS_OUTPUT.put_line('Passed Students');
LOOP
FETCH Student_Passcur INTO v_srn, v_s_name, v_marks, v_div;
Exit when Student_Passcur%NOTFOUND;
DBMS_OUTPUT.put_line(v_srn || ' ' || v_s_name || ' ' || v_marks || ' ' || v_div);
END LOOP;
CLOSE Student_passcur;

IF NOT Student_Failcur%ISOPEN THEN OPEN Student_Failcur;
END IF;
DBMS_OUTPUT.put_line('Failed Students');
LOOP
FETCH Student_Failcur INTO v_srn, v_s_name, v_marks, v_div;
Exit when Student_Failcur%NOTFOUND;
DBMS_OUTPUT.put_line(v_srn || ' ' || v_s_name || ' ' || v_marks || ' ' || v_div);
END LOOP;
CLOSE Student_Failcur;

END;
/




SQL> select * from student1;

SRN        S_NAME                    MARKS DIV
---------- -------------------- ---------- -----
R1         A                            80 PASS
R2         B                            20 FAIL
R3         C                            70 PASS
R4         D                            40 FAIL

SQL> insert into student1 (srn, s_name, marks, div) values (&srn, &s_name, &marks, &div);
Enter value for srn: 'R5'
Enter value for s_name: 'E'
Enter value for marks: 90
Enter value for div: 'Pass'

1 row created.

SQL> select * from student1;

SRN        S_NAME                    MARKS DIV
---------- -------------------- ---------- -----
R1         A                            80 PASS
R2         B                            20 FAIL
R3         C                            70 PASS
R4         D                            40 FAIL
R5         E                            90 Pass

SQL>










3)

create table emp(emp_no varchar2(5) primary key check (emp_no like 'E%') not null,
comm number(8,2));

SQL> insert into emp values('E1',200);

1 row created.

SQL> insert into emp values('E2',-200);

1 row created.

SQL> insert into emp values('E3',NULL);

1 row created.

SQL> desc emp;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                    NOT NULL VARCHAR2(5)
 COMM                                               NUMBER(8,2)

SQL> select * from emp;

EMP_N       COMM
----- ----------
E1           200
E2          -200
E3


set serveroutput on;
set verify off;

declare
invalid_commision exception ;
no_commision exception ;
v_comm emp.comm%type;

begin
	select comm into v_comm from emp where emp_no = &emp_id;
	if v_comm < 0 then
		raise inva	lid_commision;
	elsif v_comm is null then
		raise no_commision;
	else
		dbms_output.put_line(to_char(v_comm));
	end if;
exception
	when invalid_commision then
		dbms_output.put_line('Commision is negative.');
	when no_commision then
		dbms_output.put_line('No Commision.');
	when others then
		dbms_output.put_line('No Such Id.');
end;
/


Enter value for emp_id: 'E1'
200

PL/SQL procedure successfully completed.



Enter value for emp_id: 'E2'
Commision is negative.

PL/SQL procedure successfully completed.



Enter value for emp_id: 'E3'
No Commision.



Enter value for emp_id: 'E23'
No Such Id.