--primary key, not null
create database Phase3Db
use Phase3Db
--uniqe:

create table Emps
(Id int primary key,
Fname nvarchar(50)not null,
lname nvarchar(50)not null,
mobile varchar(10) unique,
email nvarchar(100) unique)
insert into Emps values (1,'Viya','Gandhi','7397090543','kaviyagandhi@gmail.com')
select * from Emps
---------------------
drop table Emps
----------------------
create table Emps
(Id int primary key,
Fname nvarchar(50)not null,
lname nvarchar(50)not null,
mobile varchar(10) not null unique,
email nvarchar(100) not null unique
)

insert into Emps values (1,'Viya','Gandhi','7397090543','kaviyagandhi@gmail.com')
insert into Emps(Id,Fname,lname, email,mobile) values (2,'viya','elango','priya@yahoo.com',987456324)
insert into Emps(Id,Fname,lname, email,mobile) values (3,'ramya','elango','ramya568@yahoo.com',987456324)
select * from Emps
----------------------------------------------------------------------------------------------
--check
drop table Emps

create table Emps
(Id int primary key,
Fname nvarchar(50)not null,
lname nvarchar(50)not null,
Salary float check (Salary>=10000))

insert into Emps values (1,'shalini','prakash',60000)
insert into Emps values (2,'priya','prakash',30000)
insert into Emps values (3,'kaviya','sathish',5000)
select * from Emps

--pattern check using check
drop table Emps

create table Employee
(Id int primary key,
Fname nvarchar(50)not null,
lname nvarchar(50)not null,
mobile varchar(10) not null unique check(Mobile like'[0-9] [0-9] [0-9] [0-9] [0-9] [0-9][0-9] [0-9][0-9] [0-9]')
)

insert into Employee values (1,'kaviya','sathish','7397090543')
insert into Employee values (2,'kaviya','prakash','859526674')
select * from Employee
--The INSERT statement conflicted with the CHECK constraint "CK__Employee__mobile__440B1D61".
--The conflict occurred in database "Phase3Db", table "dbo.Employee", column 'mobile'.

drop table Employee
create table Employee
(Id int primary key,
Fname nvarchar(50)not null,
Lname nvarchar(50)not null,
Mobile varchar(10) not null unique check(Mobile like'[0-9] [0-9] [0-9] [0-9] [0-9] [0-9][0-9] [0-9][0-9] [0-9]'),
City nvarchar(50) default 'delhi'
)

insert into Employee(Id,Fname,Lname,Mobile) values (1,'kaviya','sathish','7397090543')
insert into Employee(Id,Fname,Lname,Mobile,City) values (2,'kaviya','prakash','859526674','Pondicherry')
select * from Employee

--identity
--identity(seed, increment)
--default seed=1, increment=1

create table Customer
(CId int identity,
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values('karthi','Pondicherry')
insert into Customer values('priya','chennai')
insert into Customer values('Gandhi','Pondicherry')
select * from Customer
-------------------------------------------------------------
drop table Customer

create table Customer
(CId int identity(6,3),
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values('karthi','Pondicherry')
insert into Customer values('priya','chennai')
insert into Customer values('Gandhi','Pondicherry')
select * from Customer
-------------------------------------------------------------
drop table Customer

create table Customer
(CId int identity(2000,1),
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values('karthi','Pondicherry')
insert into Customer values('priya','chennai')
insert into Customer values('Gandhi','Pondicherry')
select * from Customer

-------------------------------------------------------------
drop table Customer

create table Customer
(CId int identity(500,1),
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values('karthi','Pondicherry')
insert into Customer values('priya','chennai')
insert into Customer values('Gomathi','TamilNadu')
select * from Customer

-------------------------------------------------------------
--reference key

drop table Customer

create table Student
(SId int primary key,
SName nvarchar(50) not null,
SAge int)

insert into Student values(1,'karthi',12)
insert into Student values(2,'karthi',11)
insert into Student values(3,'karthi',10)

create table Exam
insert into Exam ()
select * from Student





----------------------------------------------------
drop table Student
create table Category
(CId int primary key,
CName nvarchar(50) unique)

insert into Category values (1,'Clothing')
insert into Category values (2,'Electronic')
insert into Category values (3,'Grooming')

create table Product
(PId int primary key identity,
Pname nvarchar(50) not null,
Category int foreign key references Category)

insert into Product values ('t-shirt',1)
insert into Product values ('Face wash',3)
insert into Product values ('Sunscreen Cream',3)

insert into Product values ('Bag',5)
select * from Category
select * from Product

select * from Product, Category where Category.CId=Product.Category

select Product.PId,Product.Pname,Category.CId,Category.CName from Product, Category where Category.CId=Product.Category
--or
select p.PId,p.Pname,c.CId,c.CName from Product as p,Category as c where c.CId=p.Category