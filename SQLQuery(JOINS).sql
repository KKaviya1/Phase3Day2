create database joins
use joins

create table Depts
(DId int primary key,
DName nvarchar(50) not null unique)

insert into Depts values (1,'App-Development'),
(2,'Web-Development'),
(3,'HR'),
(4,'Account'),
(5,'Agile-Scrum')

select * from Depts order by DId

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Designation nvarchar(50),
Salary float,
DId int)

insert into Emps values (1,'Preethi','Shankar','Developer',63000.20,2)
insert into Emps values (2,'Sakthi','Priya','Developer',53000.20,1)
insert into Emps values (3,'Priya','Shankar','Developer',23000.20,2)

insert into Emps(Id,Fname,Lname,Salary) values (5,'Hari','Doss',53200.20)
insert into Emps values (12,'Keerthi','Vasan','Developer',36000.20,2)
insert into Emps(Id,Fname,Lname,Designation,Salary) values (5,'Hari','Doss','Manager',53200.20)
insert into Emps values (15,'Ganesh','Kumar','HR',69000.20,2)

select * from Emps
select * from Depts

-------------------------------------------------------------------
--join
--inner join
--outer join: left outer,right outer,full outer
--self join
--cross join
-- select tableName1.ColumnName, table2.column Name......... from table1 join table2 on table1.commonColumn= table2.commoncolumn

select * from Emps join Depts on Emps.DId=depts.DId
--or
select * from Emps e join Depts d on e.DId=d.DId

select e.Fname,d.DName from Emps e join Depts d on e.DId=d.DId

--Alter the title or topic of the  table name
select e.Id,e.Fname+'' +e.Lname 'full Name', d.DName 'Departments', d.DId,e.salary,e.Designation from emps e join Depts d on e.DId=d.Did

