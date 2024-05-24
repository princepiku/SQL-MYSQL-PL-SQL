
CREATE TABLE Student(
Roll_No int(5) NOT NULL,
Name varchar(15) NOT NULL,
Address varchar(15) NOT NULL,
Phone int(10) NOT NULL,
Age int(5) NOT NULL);

INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('1','Harsh','Delhi','1234567890','18');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('2','Pratik','Bihar','1234567890','19');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('3','Riyanka','Siliguri','1234567890','20');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('4','Deep','Ramnagar','1234567890','18');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('5','Saptarhi','Kolkata','1234567890','19');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('6','Dhanraj','Barabajar','1234567890','20');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('7','Rohit','Balurghat','1234567890','18');
INSERT INTO Student(Roll_No,Name,Address,Phone,Age) VALUES('8','Niraj','Alipur','1234567890','19');

insert into student Values ('1', 'Ram', 'Delhi', '0123456789', '18');
insert into student Values ('2', 'Ramesh', 'Gurgaon', '0123456789', '18');
insert into student Values ('2', 'Sujit', 'Rohtak', '0123456789', '20');
insert into student Values ('4', 'Suresh', 'Delhi', '0123456789', '18');

Select * from Student;

CREATE TABLE StudentCourse(
Course_Id int(5) NOT NULL,
Roll_No int(5) NOT NULL);

INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('1','1');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('2','2');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('2','3');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('3','4');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('1','5');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('4','9');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('5','10');
INSERT INTO StudentCourse(Course_Id,Roll_No) VALUES('4','11');

Select * from StudentCourse;

Inner Join

SELECT Student.Roll_No, Student.Name, Student.Address, Student.Phone, Student.Age, StudentCourse.Course_Id FROM Student
INNER JOIN StudentCourse
ON Student.Roll_No = StudentCourse.Roll_No;

SELECT * FROM Student FULL JOIN StudentCourse;
SELECT * FROM Student FULL INNER JOIN StudentCourse;
SELECT * FROM Student INNER JOIN StudentCourse;

Left Join 

SELECT StudentCourse.Course_Id, Student.Roll_No, Student.Name, Student.Address, Student.Phone, Student.Age FROM Student
LEFT JOIN StudentCourse
ON Student.Roll_No = StudentCourse.Roll_No;

Right Join

SELECT Student.Name, StudentCourse.Course_Id, StudentCourse.Roll_No FROM Student
RIGHT JOIN StudentCourse
ON Student.Roll_No = StudentCourse.Roll_No;

Full Join

SELECT * FROM Student FULL JOIN StudentCourse;
SELECT * FROM Student INNER JOIN StudentCourse;
SELECT * FROM Student FULL INNER JOIN StudentCourse;

Full Outer Join Using Union Clause -

SELECT * FROM Student LEFT JOIN StudentCourse
ON Student.Roll_No = StudentCourse.Roll_No
UNION
SELECT * FROM Student RIGHT JOIN StudentCourse
ON Student.Roll_No = StudentCourse.Roll_No

insert into studentcourse Values ('1', '1');
insert into studentcourse Values ('2', '2');
insert into studentcourse Values ('2', '3');
insert into studentcourse Values ('3', '4');

Cartesian Join / Cross Join -> no. of rows in the result - set is the product of the number of rows of the two tables.

SELECT Student.Name, Student.Age, StudentCourse.Course_Id FROM Student
CROSS JOIN
StudentCourse;

Self Join - Joined to itselef - we can say join b/w two copies of the same table.

SELECT a.Roll_No, b.Name FROM Student a, Student b
WHERE a.Roll_No != b.Name;

CREATE TABLE StudentMCA(
Id int,
Name varchar(20),
Branch varchar(20),
Email varchar(20));

CREATE TABLE Library(
Book_Id int,
Book_Name varchar(20),
Issued_On date,
Due_on date);

insert into StudentMCA Values('1','Suryansh','CS','SK@gmail.com');
insert into StudentMCA Values('2','Aman Sharma','IT','AS@gmail.com');
insert into StudentMCA Values('3','Dev Verma','ME','DV@gmail.com');
insert into StudentMCA Values('4','Joy Smith','CE','JS@gmail.com');
insert into StudentMCA Values('5','Charles Gatto','EE','CG@gmail.com');

select * from studentmca;

SELECT * FROM StudentMCA
CROSS JOIN Library
WHERE Name = "Suryansh";

SELECT * FROM StudentMCA
CROSS JOIN Library
WHERE Id = 1;

insert into Library Values('121','RD Sharma','2023-01-01','2023-01-08');
insert into Library Values('236','GATE CRAKER','2023-02-02','2023-02-09');
insert into Library Values('352','Morris Mano','2023-03-03','2023-03-10');
insert into Library Values('970','NK Publications','2023-04-04','2023-04-11');
insert into Library Values('648','Big Bang Theory','2023-05-05','2023-05-12');

select * from library;
