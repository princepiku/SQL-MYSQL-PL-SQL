create table Sales_Order_Details
(S_Order_No varchar(6) primary key not null references Sales_Order(S_Order_No),
Product_No varchar(6) primary key not null references Product(Product_No),
Qty_Ordered numeric(8),
Qty_Dispatched numeric(8),
Product_Rate decimal(10,2));
