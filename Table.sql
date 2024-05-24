// LISTING : 1 & 2 - Creation of tables & Insertion of values : 

// Client_Master Table.

create table Client_Master
(Client_no varchar2(10) primary key check (Client_no like 'C%'),
Name varchar2(10) not null,
City varchar2(10),
State varchar2(10),
Pincode number(6),
Bal_due number(10));

// Insert Data in Client_Master Table.

insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00001','Prince','Bombay','Maharastra',400054,11000);
insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00002','Prashant','Madras','Tamil Nadu',780001,0);
insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00003','Raushan','Bombay','Maharastra',400057,5000);
insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00004','Tushar','Bangalore','Karnatka',560001,0);
insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00005','Satish','Delhi','Delhi',100005,2000);
insert into Client_Master(Client_no,Name,City,State,Pincode,Bal_due)values('C00006','MD Maanish','Bombay','Maharastra',400060,0);

// Product_Master Table.

create table Product_Master
(Product_no varchar2(12) primary key check (Product_no like 'P%'),
Description varchar2(15) not null,
Unit_measure varchar2(12) not null,
Reorder_lvl number(12) not null,
Sell_price number(12) not null check (Sell_price != 0),
Cost_price number(12) not null check (Cost_price != 0));

// Insert Data in Product_Master Table.

insert into Product_Master values('P00001','1.44 Floppies',5,10,525,500);
insert into Product_Master values('P00002','Monitor',10,3,12000,11280);
insert into Product_Master values('P00003','Mouse',20,5,1050,1000);
insert into Product_Master values('P00004','1.22 Floppies',10,20,525,500);
insert into Product_Master values('P00005','Keyboards',8,3,3150,3050);
insert into Product_Master values('P00006','540 HDD',15,3,5250,5100);
insert into Product_Master values('P00007','CD Drive',4,3,8400,8000);
insert into Product_Master values('P00008','1.44 Drive',1,3,1010,1000);
insert into Product_Master values('P00009','1.22 Drive',2,3,1010,1000);
insert into Product_Master values('P00010','SDD',8,4,5200,6200);


// Salesman_Master Table.

create table Salesman_Master
(Salesman_no varchar2(12) primary key check (Salesman_no like 'S%'),
Salesman_name varchar2(14) not null,
City varchar2(10),
State varchar2(10),
Pincode number(6),
Sal_amt number(10) not null check (Sal_amt != 0));

// Insert Data in Salesman_Master Table.

insert into Salesman_Master values('S00001','Prince','Maharastra','Bombay',400001,20000);
insert into Salesman_Master values('S00002','Prashant','Maharastra','Bombay',400002,30000);
insert into Salesman_Master values('S00003','Tushar','Maharastra','Bombay',400003,40000);
insert into Salesman_Master values('S00004','MD Maanish','Maharastra','Bombay',400004,50000);
insert into Salesman_Master values('S00005','Rahul','Maharastra','Bombay',400005,60000);
insert into Salesman_Master values('S00006','Manohar','Maharastra','Bombay',400006,70000);



// Sales_Order Table.

create table Sales_Order
(S_order_no varchar2(12) primary key check (S_order_no like 'O%'),
S_order_date date,
Client_no varchar2(10) references Client_Master(Client_no),
Salesman_no varchar2(12) references Salesman_Master(Salesman_no),
Order_status Varchar2(12) check (Order_status in ('Inprocess','Fullfilled','Backorder','Cancelled')));

// Insert Data in Sales_Order Table.

insert into Sales_Order values('O19001','15-Jun-96','C00001','S00001','Inprocess');
insert into Sales_Order values('O19002','21-Jan-96','C00002','S00002','Cancelled');
insert into Sales_Order values('O19003','18-Feb-96','C00003','S00003','Backorder');
insert into Sales_Order values('O19004','03-Apr-96','C00004','S00004','Fullfilled');
insert into Sales_Order values('O19005','20-May-96','C00005','S00005','Cancelled');
insert into Sales_Order values('O19006','24-May-96','C00006','S00006','Inprocess');

// Sales_Order_Details Table.

create table Sales_Order_Details
(S_order_no varchar2(12) references Sales_Order(S_order_no),
Product_no varchar2(12) references Product_Master(Product_no),
Qty_ordered number(12),
Qty_dispatch number(12),
Product_rate number(12));

// Insert Data in Sales_Order_Details Table.

insert into Sales_Order_Details values('O19001','P00001',4,4,525);
insert into Sales_Order_Details values('O19001','P00006',2,1,5250);
insert into Sales_Order_Details values('O19002','P00001,10,0,525);
insert into Sales_Order_Details values('O19003','P00005',3,3,3150);
insert into Sales_Order_Details values('O19003','P00006',3,1,5250);
insert into Sales_Order_Details values('O19003','P00001',10,10,525);
insert into Sales_Order_Details values('O19003','P00002',4,4,1050);
insert into Sales_Order_Details values('O19004','P00002,2,2,1050);
insert into Sales_Order_Details values('O19004','P00003',1,1,12000);
insert into Sales_Order_Details values('O19006','P00001',10,5,525);

// Challan_Header Table.

create table Challan_Header
(Challan_no varchar2(10) primary key check (Challan_no like 'CH%'),
S_order_no varchar2(10) references Sales_Order(S_order_no),
Challan_date date not null);


// Insert Data in Challan_Header Table.

insert into Challan_Header values('CH9001','O19001','12-Dec-96');
insert into Challan_Header values('CH9002','O19002','12-Nov-96');
insert into Challan_Header values('CH9003','O19003','12-Oct-96');
insert into Challan_Header values('CH9004','O19004','12-Sep-96');
insert into Challan_Header values('CH9005','O19005','12-May-96');
insert into Challan_Header values('CH9006','O19006','12-Jun-96');

// LISTING : 3 - SINGLE TABLE RETRIEVAL : 

// Client_Master : Select.

1) Find out / list / fetch / retrieve the names of all clients.
-> select Name from Client_Master;
-> select client_no from client_master;

2) Print the entire client_master table.
-> select * from Client_Master;

3) Retrieve the list of names,state and the cities of all the clients.
-> select Name,City,State from Client_Master;

// Product_Master : Select.

4) List the various products available from the product_master. 
-> select Description from Product_Master;
-> select product_no from product_master;

// Client_Master :

5) Find the name of all clients having 'a' as the second letter in their names.
-> select Name from Client_Master where Name like '_a%'; (For selecting 2nd letter of name starting with a.)
 
6) Find out the clients who stay in city whose second letter is 'a'.
-> select Name,City from Client_Master where City like '_a%';
-> select name, city from client_master where name like '_a%';

7) Find the list of all clients who stay in Bombay or delhi or city madras.
-> select Name from Client_Master where City in ('Bombay','Delhi','Madras');
		(Or)
-> select Name from Client_Master where City = 'Bombay' or City = 'Delhi' or City = 'Madras';

8) List all the clients who are located in 'Bombay'.
-> select Name from Client_Master where City = 'Bombay';
-> select Client_no from client_master where city = 'Bombay';

9) Print the list of clients whose bal_due are greater than value 10000.
-> select Name from Client_Master where Bal_due > 1000;
-> select client_no from client_master where bal_due > 10000;

// Sales_Order : 

10) Print the information from sales_order table of order placed in month of january.
-> select S_order_no from Sales_Order where S_order_date = '21-Jan-1996';

11) Display order information for client_no 'c00001' and 'c00002'.
-> select * from Sales_Order where Client_no = 'C00001' or Client_no = 'C00002';
		(Or)
-> select S_order_no from Sales_Order where Client_no in ('C00001','C00002');

// Product_Master : 

12) Find the products with description as '1.44 drive' and '1.22 drive'.
-> select Product_no,Description from Product_Master where Description = '1.44 Drive' or '1.22 Drive';
 
13) Find the product whose selling price is more than 1500 and also find the new selling price as original price * 15.
-> select Product_no,Description,Sell_price,Sell_price * 15 from Product_Master where Sell_price > 1500;

14) Rename the new in the above query as new_price.
-> select Product_no,Description,Sell_price,Sell_price * 15 as New_Sell_price from Product_Master where Sell_price > 1500;

15) Find the product whose cost price is less than 1500.
-> select Product_no,Description from product_Master where Cost_price < 1500;

16) List the product in sorted order of their description.(Unclear question)
-> select Product_no,Description from Product_Master order by Description/product_no asc/desc;
		(Or)
-> select Product_no,Description from Product_Master order by Product_no asc;

17) Calculate the square root of cost_price of each product.
-> select product_no, description, cost_price, sqrt(cost_price) from product_master;
-> select product_no, description, cost_price, sqrt(cost_price) as new_cost_price from product_master;

18) Divide the cost of product '540 HDD' by difference between its price and 100.
-> select Cost_price / (Sell_price - 100) as Divide_price from Product_Master where Description = '540 HDD';
-> select product_no, description, cost_price, sell_price, cost_price / (sell_price-100) as new_divide_price from product_master where description = '540 HDD';


// Client_Master : 

19) List the names,city,state of clients not in the state of 'Maharashtra'.
-> select name,City,State from Client_Master where State != 'Maharastra';
-> select client_no, name, city, state from client_master where state = 'Maharastra';

// Product_Master : 

20) List the product_no,description,sell_price of products whose description begin with letter 'M'.
->  select Product_no,Description,Sell_price from Product_Master where Description like 'M%';
->  select Product_no,Description,Sell_price from Product_Master where Description like '%M%';
-> select product_no, description, sell_price from product_master where description like '%F%';

// Sales_Order : 

21) List of all orders that were canceled in month of March.
-> select S_order_no from Sales_Order where s_order_date = '%May%' and Order_status = 'Cancelled';
-> select S_order_no from Sales_Order where Order_status = 'Cancelled';
-> select S_order_no from Sales_Order where Order_status = 'Inprocess';

// LISTING : 4 - TABLE UPDATIONS : 

// Sales_Order : 

1)Change the s_order_date of cllient_no'C00001' to 24/07/96 => 24/July/96.
-> update Sales_Order set S_order_date = '24-JULY-1996' where Client_no = 'C00001';
-> update sales_order set s_order_date = '15-Aug-1996' where order_status = 'Inprocess';
-> update sales_order set s_order_date = '04-Nov-1996' where client_no = 'C00001';

// Product_Master : 

2)Change the selling price of '1.44 Drive' to Rs. 1150.00;
-> update Product_Master set Sell_price = 1150.00 where Description = '1.44 Drive';
-> update product_master set sell_price = 425 where description = '1.22 Floppies';


// Sales_Order : 

3) Delete the record with order no 'O19001' from the order table.
-> delete from Sales_Order where S_order_no = 'O19001';

4) Delete all the records having delivery date before 10-jul-96.
-> delete from Sales_Order where Dely_date < '10-JULY-1996';

// Client_Master : 

5) Change the city of client_no 'C00005' to 'Bombay'.
-> update Client_Master set City = 'Bombay' where Client_no = 'C00005';

// Sales_Order : 

6) Change the delivery date of order no 'O10008' to 16-08-96
-> update Sales_Order set Dely_date = '16-AUG-1996' where S_order_no = 'O10008';

// Client_Master : 

7) Change the bal_due of client_no 'C00001' to 1000.
-> update Client_Master set Bal_due = 1000 where Client_no = 'C00001';

// Product Master : 

8) Change the cost price of '1.22 Floppy Drive' to Rs.950.00.
-> update Product_Master set Cost_price = 950.00 where Description = '1.22 Drive';

// LISTING : 5 - SET FUNCTIONS AND CONCATENATION : Client master ,Product master, Sales Order.

// Sales_Order : 

1) Count the total no. of orders.
-> select count(*) from Sales_Order;
		(OR)
-> select count(S_order_no) from Sales_Order;

// Product_Master : 

2) Calculate the average price of all the products.
-> select avg(Cost_price) from Product_Master;

3) Calculate the minimum price of product.
-> select min(Cost_price) from Product_Master;

4) Determine the maximum and minimum product price. Rename the title as max_price and min_price respectively.
-> select max(Cost_price) as max_price, min(Cost_price) as min_price from Product_Master;

5) Count the number of products having price greater than or equal to 1500.
-> select count(*) from Product_Master where Cost_price >= 1500;

6) Find all products whose qty_on_hand is less than recorder level.
-> select * from Product_Master where Qty_on_hand < Reorder_lvl;

// Client master, Product master, Sales Order : 

7) Print the information of client_master, product_master, sales_order table in the following format for all the record.{client_name} has placed order {product_no} on {s_order_date}.
-> select Client_Master.Name || " has placed order " || Sales_Order.S_order_no || " on " || Sales_Order.S_order_date from Client_Master,Sales_Order,Sales_Order;

// LISTING : 6 - JOINS AND CORRELATION : 

// Client master, Product master, Sales order, Sales order detail : 

1) Find out the product which has been sold to 'Prince'.
-> select d.Product_no,p.Description from Product_Master p, Client_Master c, Sales_Order s.,Sales_Order_Details d where p.Product_no = d.Product_no and c.Client_no = s.Client_no and s.S_order_no = d.S_order_no and c.Name = 'Prince';

// Product master, Sales order, Sales order details : 

2) Find out the product and their quantities that will have to delivered in the current month.
-> select d.Product_no,p.Description, sum(d.Qty_ordered) from Sales_Order_Details d, Sales_Order s, Product_Master p where p.Product_no = d.Prodcut_no and s.S_order_no = d.S_order_no and to_char(Dely_date,'Mon-YY') = to_char(sysdate,'Mon-YY') group by d.Product_no,p.Description;

// Product master, Sales order details : 

3) Find the product_no and description of moving products.
-> select distinct p.Product_no,p.Description from Product_Master p,Sales_Order_Details d where p.Product_no = d.Product_no;

// Client master, Product master, Sales order , Sales order details : 

4) Find the names of the clients who have purchased 'CD Drive'.
-> select c.Name,s.Client_no from Client_Master c,Product_Master p,Sales_Order s,Sales_Order_Details d where c.Client_no = s.Client_no and p.Product_no = d.Product_no and s.S_order_no = d.S_order_no and p.Description = 'CD Drive';

// Sales order details, sales order, product master : 

5) List the product_no and s_order_no of customers having qty_ordered less than 5 from the order detail Table for the product '1.44 Floppies'.
-> Select d.Product_no,d.S_order_no, from Sales_Order_Details d,Sales_Order s Product_Master p where s.S_order_no = d.S_order_no and p.Prodcut_no = d.Product_no and Qty_ordered < 5 and p.Description = '1.44 Floppies';

// Client master, Product master, Sales order, Sales order detail : 

6) Find the products and their quantities for the orders placed by 'Prashant' and 'Prince'.
-> Select d.Product_no,p.Description, sum(Qty_ordered) Qty_ordered from Sales_Order_Details d,Sales_Order s,Product_Master p,Client_Master c where s.S_Order_no = d.S_order_no and p.Product_no = d.Product_no and c.Client_no s.Client_no and (c.Name = 'Prince' or c.Name = 'Prashant') group by d.Product_no,p.Description;

// Client Master, Product Master, Sales Order, Sales Order Details : 

7) Find the products and their quantities for the orders placed by client_no'C00001' and 'C00002'.
-> select s.Client_no,d.Product_no,p.Descrption, sum(Qty_ordered) Qty_ordered from Sales_Order s,Sales_Order_Details d,Product_Master p,Client_Master c where s.S_order_no,d.S_order_no and d.Prodcut_no = p.Product_no and s.Client_no = c.Client_no group by s.Client_no = 'C00001' or s.Client_no = 'C00002';

// LISTING : 7 - NESTED SUBQUERIES : 

// Product master, Sales Order details : 

1) Find the product_no and description of non-moving products(eg.products not being sold).
-> select Product_no,Description, from Product_Master where Product_no not in (select Product_no from Sales_Order_Details);

// Client master, Sales Order : 

2) Find the customer’s name,address1,address2,city and pincode for the client who has placed order no "O19001'.
-> select Name,Address1,Address2,City,Pincode from Client_Master where Client_no in(select Client_no from Sales_Order where S_order_no = '019002');

// Client master, Sales Order : 

3) Find the client name who have placed order before the month of may,96.
-> select Client_no,Name from Client_Master where Client_no in (select Client_no from Sales_Order where to_char(S_order_date,'Mon-YY') < 'May-96');

// Client master, Sales order, Sales order details, Product master : 

4) Find out if product "1.44 Drive" is ordered by any client and print client_no name to whom it was sold.
-> select Client_no,Name from Client_Master where Client_no in(select Client_no from Sales_Order where S_order_no in (select S_order_no from Sales_Order_Details where Product_no in(select Product_no from Product_Master where Description = '1.44 Drive'))); 

// Client master, Sales order, Sales order details : 

5) Find the name of clients who have placed ordered worth RS. 10000 or more.
-> select Name,from Client_Master where Client_no in (select Client_no from Sales_Order where S_order_no in (select S_order_no from Sales_Order_Details where (Qty_ordered * Product_rate) >= 10000));


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

insert into inventory values(&pno, &pname, &rate, &no_of_items);
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

create table student1(SRN varchar2(10) primary key check(srn like 'R%'), S_name varchar2(20), marks number(100), div varchar2(6));

desc student1;


set serveroutput on;
set verify off;

DECLARE
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

set serveroutput on;
set verify off;
declare
begin
insert into emp values(&emp_no,&comm); commit;
insert into emp values(&emp_no,&comm); commit;
insert into emp values(&emp_no,&comm); commit;
end;
/

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
invalid_commision exception;
no_commision exception;
v_emp_no emp.emp_no%type;
v_comm emp.comm%type;

begin
	select comm into v_comm from emp where emp_no = &emp_id;
	if v_comm < 0 then
		raise invalid_commision;
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





// CREATE STOCK TABLE : 

create table Stock(Item_no varchar2(6) primary key check (Item_no like 'I%'),
Name varchar2(20),
Price number(10,2),
Qty_on_hand number(10));

// CREATE SALES_RET TABLE : 

create table Sales_Ret(SR_item_no varchar2(6) references Stock(Item_no),
Qty_ret number(10));

// CREATE TRIGGER TO ADD Qty_on_hand WHEN Qty_ret IS INCREASED : 

create trigger m_t_trigger
after insert on Sales_Ret
for each row
begin
  update Stock set qty_on-hand = qty_on-hand + :new.Qty_ret where Item_no = :NEW.SR_item_no;
end;
/

-- INSERT VALUES INTO STOCK TABLE : 

insert into Stock values('I1','Mouse',200,50);
insert into Stock values('I2','Monitor',5000,20);
insert into Stock values('I3','Keyboards',500,30);

-- INSERT INTO SALES_RET AND CHECK IF TRIGGER WORKED : 

insert into Sales_Ret values('S01',50);
insert into Sales_Ret values('S02',60);
insert into Sales_Ret values('S03',70);



LISTING – VIII : PL/SQL 

Write a PL/SQL to update the rate field by 20% more than the current rate in inventory table which has the following fields:
 Prono, ProName and Rate.=> rate+ (rate * 0.2)
 After updating the table a new field (Alter) called for Number of item and place for values for the new field without using PL/SQL block.
1.	Create : Prono, productrname, rate
2.	Insert 
3.	Update
4.	Display

Alter table : 
Create table inventory (prono, varchar(6) check (prono like ‘P%’), pro_name varchar(25), rate number);
Insert into inventory (prono,pro_name,rate) values(‘&prono’,’&pro_name’,’&rate’);

2. Write a PL/SQL to split the student table into two tables based on result (One table for ―Pass‖ and another for ―Fail‖). Use cursor for handling records of student table. Assume necessary fields and create a student details table.  

LISTING – IX: PL/SQL 
1. Create a database trigger to implement on master and transaction tables which are based on inventory management system for checking data validity. Assume the necessary fields for both tables.
2. Write a PL/SQL to raise the following Exception in Bank Account Management table when deposit amount is zero.


