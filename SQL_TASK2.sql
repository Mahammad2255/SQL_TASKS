CREATE DATABASE Kitabxana

USE Kitabxana
CREATE TABLE Authors 
(
	Id int primary key identity,
	Name nvarchar(25),
	Surname nvarchar(25),

)


CREATE TABLE Books
(
	Id int primary key identity,
	Name nvarchar(100) NOT NULL CHECK(LEN(Name) >=2 and LEN(Name)<=100 ),
	PageCount int Check(PageCount > 10),
	AuthorId int foreign key references Authors(Id)
)


CREATE VIEW usv_GetAllBooksByAuthor As 
Select Books.Id, Books.Name, Books.PageCount, (Authors.Name  + ' ' + Surname) 'AuthorFullName' From Books 
INNER JOIN Authors
ON Books.AuthorId = Authors.Id

Select * from usv_GetAllBooksByAuthor


CREATE PROCEDURE usp_GetBookinfo @axtarilan nvarchar(40)
as
Begin
Select Books.Id, Books.Name, Books.PageCount, (Authors.Name + ' ' + Authors.Surname) 'AuthorFullName' from Books 
INNER JOIN Authors 
ON Books.AuthorId = Authors.Id
WHERE
(
        (Books.Name = @axtarilan)
		OR
		(Authors.Surname = @axtarilan OR Authors.Name = @axtarilan)
   
)
End






exec usp_GetBookinfo 'Kitab1'
exec usp_GetBookinfo 'Yazici1'

Create Procedure usp_Insert @name nvarchar(25),@surname nvarchar(25)
as
Begin
Insert into Authors values
(@name,@surname)
End
exec usp_Insert 'Mehemmed','Ismayilov'

Create Procedure usp_Update @Column_Name nvarchar(25)
as
Begin
Update Authors set Name=@Column_Name
Where Authors.Id=1
End

exec usp_Update 'Mehemmed20'

Create Procedure usp_Delete @Column_Name nvarchar(25)
as
Begin
Delete from Authors  where @Column_Name=Authors.Name
End

exec usp_Delete 'Mehemmed20'

Create view usp_GetAllAuthorsInfo as
Select Authors.Id, (Authors.[Name] + ' ' + Authors.[Surname]) 'AuthorFullName', Count(*) 'BooksCount', MAX(Books.PageCount) 'MaxPageCount' from Authors inner join Books 
On Books.AuthorId = Authors.Id
group by Books.AuthorId, Authors.Id, Authors.Name, Authors.Surname

Select * from usp_GetAllAuthorsInfo