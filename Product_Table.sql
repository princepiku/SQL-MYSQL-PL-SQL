create table Product
(Product_No varchar(6) primary key not null check (Product_No like 'P%'),
Description varchar(30) not null,
Profit_Percent decimal(10,2) not null,
Unit_Measure varchar(10) not null,
Qty_On_Hand numeric(8) not null check (Qty_On_Hand >= 0),
ReOrder_lvl numeric(8) not null check (ReOrder >= 0),
Sell_Price decimal(10,2) not null check (Sell_Price > 0),
Cost_Price decimal(10,2) not null check (Cost_Price > 0));
