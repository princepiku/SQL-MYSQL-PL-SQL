create table Challan
(Challan_No varhcar(6) primary key not null check (Challan_No like 'CH%'),
S_Order_No varchar(6) references Sales_Order(S_Order_No),
Challan_Date date not null,
Billed_Yn char(1) check values ('Y', 'N'), default 'N');
