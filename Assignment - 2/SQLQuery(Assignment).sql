create database Assignment
use ExerciseDb

create table Publishers
(PID int primary key,
 PublisherName nvarchar(50) Unique not null)

 create table Categorys
 (CID int primary key,
 CategoryName nvarchar(50) Unique not null)

 create table Authors
 (AID int primary key,
 AuthorName nvarchar(50) Unique not null)

create table Bookss
(BID int primary key,
BName nvarchar(50) not null,
BPrice decimal not null,
Authors int,
Publishers int,
Categorys int,
foreign key (Authors) references Authors(AID),
foreign key (Publishers) references Publishers(PID),
foreign key (Categorys) references Categorys(CID)
)

insert into Categorys values (1,'Crime')
insert into Categorys values (2,'Thriller')
insert into Categorys values (3,'Adventure')

insert into Authors(AID, AuthorName) values (1,'Agatha Christie')
insert into Authors(AID, AuthorName) values (2,'Louise Penny')
insert into Authors(AID, AuthorName) values (3,'David Baldacci')

insert into Bookss(BID, BName, BPrice, Authors, Publishers, Categorys) values
(1, 'Simply Lies', 200.30, 1, 1, 1),
(2, 'Long Shadows', 190.60, 2, 2, 2),
(3, 'The Murder wall', 80.40, 3, 3, 1),
(4, 'The Forest Adventures', 320.80, 1, 1, 3),
(5, 'The Darkness', 60.50, 2, 2, 2),
(6, 'Date with Evil', 490.20, 3, 3, 1)

SELECT * FROM Authors ORDER BY Authors.AID
SELECT * FROM Bookss
SELECT * FROM Publishers ORDER BY Publishers.PID
SELECT * FROM Categorys ORDER BY Categorys.CID

select  BID, BName, BPrice, AuthorName, PublisherName, CategoryName  from  Bookss
join Authors on Bookss.Authors = Authors.AID
join Publishers on Bookss.Publishers = Publishers.PID
join Categorys on Bookss.Categorys = Categorys.CID


