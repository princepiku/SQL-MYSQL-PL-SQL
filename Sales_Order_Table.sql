create table Sales_Order
(S_order_No varchar(6) primary key not null check (S_Order_No like 'O%'),
S_Order_Date date,
Client_No varchar(6) references Client(Client_No),
Delivery_Address varchar(40),
Salesman_No varchar(6) references Salesman(Salesman_No),
Delivery_Type char(1),
Billed_Yn char(1),
Delivery_Date date check (Delivery_Date > S_Order_No),
Order_Status varchar(10));
