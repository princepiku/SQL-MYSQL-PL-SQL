----- Create Table 

Create Table Products(
ProductId INT UNSIGNED NOT NULL AUTO_INCREMENT,
ProductCode CHAR(3) NOT NULL DEFAULT '',
Name VARCHAR(30) NOT NULL DEFAULT '',
Quantity INT UNSIGNED NOT NULL DEFAULT 0,
Price Decimal(7, 2) NOT NULL DEFAULT 99999.99,
Primary Key(ProductId));

----- Insert Value 

Insert into Products Values ('1001', 'PEN', 'Pen Red', 5000, 1.23);
Insert into Products Values (NULL, 'PEN', 'Pen Blue', 8000, 1.25);
Insert into Products Values (NULL, 'PEN', 'Pen Black', 2000, 1.25);

Insert into Products (ProductCode, Name, Quantity, Price) 
Values('PEC', 'Pencil 2B', 10000, 0.48),
('PEC', 'Pencil 2H', 8000, 0.49);

Insert into Products (ProductCode, Name) Values ('PEC', 'Pencil HB');

----- Query 

Delete From Products Where ProductId = '1006';

Update Products SET ProductId = '1002' WHERE Price = '1.25';

Select * from Products;

Select Name, Price from Products;

Select 1 + 1;

Select sqrt(3);

Select Name, Price From Products WHERE Price <= 1.0;

Select Name, Quantity From Products WHERE Quantity <= 2000;

Select Name, Price From Products WHERE ProductCode = 'PEN';

Select Name, Price from Products WHERE Name Like 'Pencil%';

Select Name, Price From Products WHERE Name Like 'P__ %';

Select * from Products WHERE Quantity >= 5000 AND Name LIKE 'Pen %';

Select * from Products WHERE Quantity >= 5000 
AND Price < 1.24 AND Name LIKE 'Pen %';

Select * from Products WHERE NOT (Quantity >= 5000 AND Name LIKE 'Pen %');

Select * from Products WHERE Name IN ('Pen Red', 'Pen Black');

Select * from Products WHERE (Price Between 1.0 AND 2.0) 
AND (Quantity Between 1000 AND 2000);

Select * From Products WHERE ProductCode IS NULL;

Select * From Products WHERE ProductCode = NULL;

Select * From Products WHERE ProductCode != NULL;

Select * from Products WHERE Name Like 'Pen %' ORDER BY Price DESC;

Select * from Products WHERE Name Like 'Pen %' ORDER BY Price DESC, Quantity;

Select * From Products ORDER BY RAND();

Select * From Products ORDER BY Price LIMIT 2;

Select * From Products ORDER BY Price DESC LIMIT 2;

Select * From Products ORDER BY Price LIMIT 2, 1;

Select ProductId AS ID, ProductCode AS CODE, Name AS DESCRIPTION, 
Price AS UNIT_PRICE From Products ORDER BY ID;

Select CONCAT(ProductCode, ' - ', Name) AS `Product DESCRIPTION`, 
Price From Products;

Select Price From Products;

Select DISTINCT Price AS `DIS_PRICE` From Products;

Select DISTINCT Price From Products;

Select DISTINCT Price, Name From Products;

Select * From Products ORDER BY ProductCode, ProductId;

Select * From Products GROUP BY ProductCode;

Select Count(*) As C From Products;

Select ProductCode, Count(*) From Products GROUP BY ProductCode;

Select ProductCode, Count(*) AS `Items` From Products GROUP BY ProductCode;

Select ProductCode, Count(*) AS Items From Products GROUP BY ProductCode;

Select ProductCode, Count(*) AS Items From Products GROUP BY 
ProductCode ORDER BY Items DESC;

Select Max(Price), Min(Price), Avg(Price), STD(Price), Sum(Quantity) 
From Products;

Select ProductCode, Max(Price) AS `Hight Price`, Min(Price) 
AS `Lowest Price` From Products GROUP BY ProductCode;

Select ProductCode, Max(Price), Min(Price), Cast(Avg(Price) 
AS Decimal(7,2)) AS `Average`, Cast(STD(Price) AS Decimal(7,2)) AS `Std Dev`,
Sum(Quantity) From Products GROUP BY ProductCode;

Select ProductCode As `PC`, Count(*) As `ItemName`, Cast(Avg(Price) 
As Decimal(7,2)) As `Average` From Products GROUP BY ProductCode Having ItemName >= 3;

Select ProductCode, Max(Price), Min(Price), Cast(Avg(Price) AS Decimal(7,2)) 
AS `Average`, Sum(Quantity) From Products GROUP BY ProductCode With RollUp;

Update Products SET Price = Price * 1.0;

Select * From Products;

Update Products SET Price = Price + ((Price * 10) / 100);

Update Products SET Price = Price - ((Price * 5) / 100);

