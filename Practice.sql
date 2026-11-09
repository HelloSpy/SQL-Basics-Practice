Create database abc;
Use abc;
Create table Employee(
Emp_id int Primary Key,
Name varchar (40),
Salary int);
insert into Employee
Values
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 40000);
Select * from Employee;
use college;
Create table Student(
Roll Int Primary key,
Name Varchar (60),
Marks Int not null,
Grade Varchar(1),
City Varchar(70)
);
INSERT INTO Student
(Roll, Name, Marks, Grade, City)
VALUES
(101, "Anil",78,"c", "Pune"),
(102, "Bhumika",93,"A", "Mumbai"), 
(103, "Chetan",85,"B", "Mumbai"),
(104, "Dhruv",96,"A", "Delhi"),
(105, "Emanuel",12,"F", "Delhi"),
(106, "Farhan",82,"B", "Delhi");
select Name, marks from student;
select * From student;
Select Distinct City from student;
select * from student
where city="Mumbai" AND marks>80;
select * from student
where marks+10>100;
select * from student
where marks>80 AND city="Mumbai";
select * from student
where marks>80 OR city="Mumbai";
select * from student limit 2;
Select Name, grade from student
Where marks>70 limit 3;
select * from student
order by marks desc
limit 2;

Select city, count(mcustomerarks)
from student
Group by city;
Select city, avg(marks)
from student
Group by city
order by city Asc;
create Database payment;
Create table (
customer_id int primary key,
Customer_Name Varchar (50),
Mode varchar(30),
City varchar(30)
);
insert into customer
(Customer_id, Customer_Name, Mode, City)
Values
(101,"Olivia","NetBanking","Portland"),
(102,"Ethan","Credit Card","Miami"),
(103,"Maya","Credit Card","Seattle"),
(104,"Liam","NetBanking","Denver"),
(105,"Sophia","Credit Card","New  orleans"),
(106,"Caleb","Debit Card","Minneapolis"),
(107,"Ava","Debit Card","Phoenix"),
(108,"Lucas","NetBanking","Boston"),
(109,"Isabella","NetBanking","Nashville"),
(110,"Jackson","Credit Card","Boston");
Select Mode , count(Customer_Name)
From Customer


SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET Grade="N"
WHERE Grade="A";
Select * From Student;
Create table Department(
ID int primary key,
Name Varchar (50));
Create table Teacher(
id int primary key,
Name Varchar (50),
 Department_ID INT,
Foreign Key ( Department_ID) Reference Department(ID));
Create table Teacher (
ID int primary Key,
Name Varchar(20),
Department_ID Int,
Foreign Key(Department_ID) references Department(ID)
on update cascade
on delete cascade
);
Alter table customer
Add column Age int Not null default(18);
select * From customer;
Alter table customer
drop column Age;
select * From customer;
Alter table customer
Modify column Age varchar (2);
use College;
Create table Stud(
Roll Int Primary key,
Name Varchar (60),
Marks Int not null,
Grade Varchar(1),
City Varchar(70)
);
INSERT INTO Student
(Roll, Name, Marks, Grade, City)
VALUES
(111, "Anil",78,"c", "Pune"),
(112, "Bhumika",93,"A", "Mumbai"), 
(113, "Chetan",85,"B", "Mumbai"),
(114, "Dhruv",96,"A", "Delhi"),
(115, "Emanuel",12,"F", "Delhi"),
(116, "Farhan",82,"B", "Delhi");
Alter table Stud
CHANGE Name Full_Name varchar(20);
select * from Stud;
INSERT INTO Stud
(Roll, Full_Name, Marks, Grade, City)
VALUES
(111, "Anil",78,"c", "Pune"),
(112, "Bhumika",93,"A", "Mumbai"), 
(113, "Chetan",85,"B", "Mumbai"),
(114, "Dhruv",96,"A", "Delhi"),
(115, "Emanuel",12,"F", "Delhi"),
(116, "Farhan",82,"B", "Delhi");
select * from Stud;

Delete from Stud
Where marks<80;
Select * from Stud;
Alter table Stud
Drop column Grade;
Select * from Stud;











