create table Client
(Client_No varchar(6) primary key not null check (Client_No like 'C%'),
Name varchar(20) not null,
Address1 varchar(30),
Address2 varchar(30),
City varchar(15),
State varchar(15),
PinCode numeric(6),
Bal_Due decimal(10,2));
