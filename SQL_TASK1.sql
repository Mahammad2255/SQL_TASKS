CREATE DATABASE DB

USE DB

CREATE TABLE Brands
(
	Id int primary key identity,
	Name nvarchar(25)

)

CREATE TABLE Notebooks
(
	Id int primary key identity,
	Name nvarchar(25),
	Price smallint,
	BrandId int foreign key references Brands(Id)
)
CREATE TABLE Phones 
(
	Id int primary key identity,
	Name nvarchar(25),
	Price smallint,
	BrandId int foreign key references Brands(Id)
)

SELECT Notebooks.Name, Brands.Name as 'BrandName', Notebooks.Price FROM Brands
INNER JOIN Notebooks 
ON Notebooks.BrandId = Brands.Id

SELECT Phones.Name, Brands.Name as 'BrandName', Phones.Price FROM Brands
INNER JOIN Phones 
ON Phones.BrandId = Brands.Id


SELECT Notebooks.Name, Brands.Name as 'BrandName', Notebooks.Price FROM Brands 
INNER JOIN Notebooks 
ON Notebooks.BrandId = Brands.Id
where Brands.Name like '%S%'

select * from Notebooks 
where  Price between 2000 and 5000 or Price > 5000

select * from Phones 
where  Price between 2000 and 5000 or Price > 5000

SELECT Brands.Name , Count(*) 'Saylari' FROM Brands
INNER JOIN Notebooks 
ON Notebooks.BrandId = Brands.Id
GROUP BY Brands.Name 

SELECT Brands.Name , Count(*) 'Saylari' FROM Brands
INNER JOIN Phones 
ON Phones.BrandId = Brands.Id
GROUP BY Brands.Name 


Select Phones.Name, Phones.BrandId from Phones
intersect 
Select Notebooks.Name, Notebooks.BrandId from Notebooks



Select Phones.Id, Phones.Name, Phones.Price, Phones.BrandId from Phones
Union All
Select Notebooks.Id, Notebooks.Name, Notebooks.Price, Notebooks.BrandId from Notebooks


Select Phones.Id, Phones.Name, Phones.Price, Phones.BrandId, Brands.Name 'Brand Name' from Phones
inner join Brands
on Phones.BrandId=Brands.Id
Union All
Select Notebooks.Id, Notebooks.Name, Notebooks.Price, Notebooks.BrandId, Brands.Name 'Brand Name' from Notebooks
inner join Brands
on Notebooks.BrandId=Brands.Id

Select Phones.Id, Phones.Name, Phones.Price, Phones.BrandId, Brands.Name 'BrandName' from Phones 
INNER JOIN Brands
ON Phones.BrandId=Brands.Id
where Phones.Price>1000
Union All
Select Notebooks.Id, Notebooks.Name, Notebooks.Price, Notebooks.BrandId, Brands.Name 'BrandName' from Notebooks 
INNER JOIN Brands
ON Notebooks.BrandId=Brands.Id
where Notebooks.Price>1000


SELECT Brands.Name, SUM(Price)  'TotalPrice',  COUNT(*) 'Saylari' FROM Phones
INNER JOIN Brands
ON Phones.BrandId = Brands.Id
Group by Brands.Name

Select * from Phones


SELECT Brands.Name, SUM(Price)  'TotalPrice',  COUNT(*) 'Saylari' FROM Notebooks
INNER JOIN Brands
ON Notebooks.BrandId = Brands.Id
Group by Brands.Name

Select * from Notebooks
