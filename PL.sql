// 1.) Creation a Table : 

// Employee Table : No Relation between any Table.


create table Employee
(
Emp_id varchar2(10) primary key,
Emp_name varchar2(30),
Department varchar2(20),
Contact_no number(10),
Email_id varchar2(40),
EmpHead_id varchar2(10)
);


// EmpDept Table : Relation between Employee Table with Foreign Key.


create table EmpDept
(
Dept_id varchar2(10) primary key,
Dept_name varchar2(30),
Dept_off varchar2(10),
Dept_head varchar2(20) references Employee(Emp_id)
);


// EmpSalary Table : Relation between Employee Table with Foreign Key.


create table EmpSalary
(
Emp_id references Employee(Emp_id),
Salary number(8,2),
Is_Permanent varchar2(5)
);


// Project Table : No Relation between any Table.


create table Project
(
Project_id varchar2(20) primary key,
Duration number(8,2)
);


// Country Table : No Relation between any Table.


create table Country
(
C_id varchar2(20) primary key,
C_name varchar2(30)
);


// Client Table : Relation between Counrty Table with Foreign Key.


create table ClientTable
(
Client_id varchar2(20) primary key,
Client_name varchar2(20),
C_id references Country(C_id)
);


// EmpProject Table : Relation bewtween Employee, Project, Client Table with Foreign Key.


create table EmpProject
(
Emp_id references Employee(Emp_id),
Project_id references Project(Project_id),
Client_id references ClientTable(Client_id),
Start_year number(8,2),
End_year number(8,2)
);

// Insertion the values into the Tables : 

insert into Employee values('101','Isha','E-101',1234567890,'isha@gmail.com','105');
insert into Employee values('102','Priya','E-104',1234567890,'priya@gmail.com','103');
insert into Employee values('103','Neha','E-101',1234567890,'neha@gmail.com','101');
insert into Employee values('104','Rahul','E-102',1234567890,'rahul@gmail.com','105');
insert into Employee values('105','Abhishek','E-101',1234567890,'abhishek@gmail.com','102');

insert into EmpDept values('E-101','HR','Monday','105');
insert into EmpDept values('E-102','Development','Tuesday','101');
insert into EmpDept values('E-103','House Keeping','Saturday','103');
insert into EmpDept values('E-104','Sales','Sunday','104');
insert into EmpDept values('E-105','Purchase','Tuesday','104');

insert into EmpSalary values('101',2000,'Yes');
insert into EmpSalary values('102',10000,'Yes');
insert into EmpSalary values('103',5000,'No');
insert into EmpSalary values('104',1900,'Yes');
insert into EmpSalary values('105',2300,'Yes');

insert into Project values('P-1',23);
insert into Project values('P-2',15);
insert into Project values('P-3',45);
insert into Project values('P-4',2);
insert into Project values('P-5',30);

insert into Country values('C-1','Indian');
insert into Country values('C-2','USA');
insert into Country values('C-3','China');
insert into Country values('C-4','Pakistan');
insert into Country values('C-5','Russia');

insert into ClientTable values('CI-1','ABC Group','C-1');
insert into ClientTable values('CI-2','PQR','C-1');
insert into ClientTable values('CI-3','XYZ','C-2');
insert into ClientTable values('CI-4','Tech Altum','C-3');
insert into ClientTable values('CI-5','MNP','C-5');

insert into EmpProject values('101','P-1','CI-1',2010,2010);
insert into EmpProject values('102','P-2','CI-2',2010,2012);
insert into EmpProject (Emp_id,Project_id,Client_id,Start_year)values('103','P-1','CI-3',2013);
insert into EmpProject values('104','P-4','CI-1',2014,2015);
insert into EmpProject (Emp_id,Project_id,Client_id,Start_year)values('105','P-4','CI-5',2015);


// Simple Queries : -

1) select the deatil of the employee whose name start with P.
-> select * from Employee where Emp_name like 'P%';

2) how many permanent candidate take salary more than 5000.
-> select count(Salary) as count from EmpSalary where Is_Permanent = 'Yes' and Salary > 5000;

3) select the details of employee whose email_id is in gmail.
-> select * from Employee where Email_id like '%@gmail.%';

4) select the details of the employee who work either for department E-104 or E-102.
-> select * from Employee where Department in ('E-104','E-105');

5) what is the department name for Dept_id E-102.
-> select Dept_name from EmpDept where Dept_id = 'E-102';

6) what is total salary that is paid to permanent employees.
-> select sum(Salary) from EmpSalary where Is_Permanent = 'Yes';

7) list name of all employees whose name ends with a.
-> select * from Employee where Emp_name like 'A%';

8) list the number of department of employees in each project.
-> select count(Emp_id) as Employee, Project_id from EmpProject group by Project_id;

9) how many project started in year 2010.
-> select count(Project_id) as Project from EmpProject where Start_year = 2010;

10) how many project started and finished in the same year.
-> select count(Project_id) as Project from EmpProject where Start_year = End_year;

11) select the name of the employees whose name's 3rd character is 'h'.
-> select * from Employee where Emp_name like '__h%';


// Nested Queries : -

1) select the department name of the company which is assigned to the employee whose emp_id is greater than 103.
-> select Dept_name from EmpDept where Dept_id in (select Department from Employee where Emp_id > 103);

2) select the name of the employee who is working under abhishek.
-> select Emp_name from Employee where EmpHead_id = (select Emp_id from Employee where Emp_name = 'Abhishek');

3) select the name of the employee who is dept_head of HR.
-> select Emp_name from Employee where Emp_id = (select Dept_head from EmpDept where Dept_name ='HR');

4) select the name of the emp_head who is permanent.
-> select Emp_name from Employee where Emp_id in (select EmpHead_id from Employee) and Emp_id in (select Emp_id from EmpSalary where Is_Permanent = 'Yes');

5) select the name and email of the dept_head who is not permanent.
->  select Emp_name, Email_id from Employee where Emp_id in (select Dept_head from EmpDept) and Emp_id in (select Emp_id from EmpSalary where Is_Permanent = 'No');
 
6) select the employee whose department off in monday.
-> select * from Employee where Department in (select Dept_id from EmpDept where Dept_off = 'Monday');


// 2.) Creation a Table.

// Musician Table : No relation any table.

create table musician(Ssn varchar2(10) primary key,
Name varchar2(20) unique,
Address varchar2(30),
Phone number(10));

// Instrument Table : No relation any table.

create table instrument(I_id varchar(10) primary key,
I_name varchar2(20),
Musical_key varchar2(10));

// Playing Table : Relation between two table musician Table & instrument table.

create table playing(Ssn varchar2(10) references musician(Ssn),
I_id varchar2(10) references instrument(I_id));

// Album Table : Relation between musicain table.

create table album(Album_id varchar2(10) primary key,
Atitle varchar2(20),
Copyright_date date,
Format varchar2(10),
Ssn varchar2(10) references musician(Ssn));

// Song Table : Relation between album table.

create table song(Song_id varchar2(20) primary key,
Stitle varchar2(20),
Author varchar2(20),
Album_id varchar2(10) references album(Album_id));

// Author Table : Relation between two table song table and musician table.

create table author(Song_id varchar2(20) references song(Song_id),
Name varchar2(20) references musician(Name));

// Insertion the values into the table.

insert into musician values('1','Sandeep J','Bangalore',00024525);
insert into instrument values('101','Trumpet','B-Chord');
insert into playing values('1','101');
insert into album values('1001','album01','24-Oct-1990','mp3','1');
insert into song values('song1','Song Title','Rajshekher Naidu','1001');
insert into author values('song1','Sandeep J');

// Simple Queries :- 



