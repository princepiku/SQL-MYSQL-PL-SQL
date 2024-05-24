create table Salesman
(Salesman_No number(10) primary key not null check (Salesman_No like 'S%'),
Salesman_Name varchar(20) not null,
Address1 varchar(30) not null,
Address2 varchar(30),
City varchar(15),
PinCode varchar(6), 
State varchar(15),
Sales_Amt decimal(8,2) not null check (Sales_Amt > 0),
Tgt_to_get decimal(8,2) not null check (Tgt_to_get > 0),
Ytd_Sales decimal(8,2) not null,
Remarks varchar(60));
