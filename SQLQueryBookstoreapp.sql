
Create Database BookStore_Application
use BookStore_Application

create table BookStore(
Book_Id int Primary key identity(1,1),
Book_Name varchar(80),
Book_Image varchar(250),
Author_Name varchar(50),
Price int,
Rating float,
Quantity int,
Registered_Date datetime
)

select * from BookStore

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values
('Pursuit Of Happiness','https://images-eu.ssl-images-amazon.com/images/I/51-a5oIljlL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','Chris Gardner',475,4.9,25,'2022.4.5');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values
('Atomic Habits','https://images-eu.ssl-images-amazon.com/images/I/51S7KOWir7L._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','James Clear',500,4.8,20,'2022.4.5 10:34'); 

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('Psychology of Momey','https://images-eu.ssl-images-amazon.com/images/I/41r6F2LRf8L._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','Morgan Housel',321,4.5,18,'2022.4.5 10:34');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('The 5 AM Club','https://images-na.ssl-images-amazon.com/images/I/41MC15v6UIL._SX332_BO1,204,203,200_.jpg','Robin Sharma',297,4.5,18,'2022.4.5 10:34');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('Youth and Truth','https://images-na.ssl-images-amazon.com/images/I/51-jW9K79IL._SX324_BO1,204,203,200_.jpg','Sadhguru',145,4.5,18,'2022.4.5 10:34');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('Rich Dad Poor Dad','https://images-na.ssl-images-amazon.com/images/I/51u8ZRDCVoL._SX330_BO1,204,203,200_.jpg','Robert T. Kiyosaki ',372,4.8,15,'2022.4.5 10:34');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('Be a Triangle','https://images-na.ssl-images-amazon.com/images/I/41-Jq9RDQwL._SX340_BO1,204,203,200_.jpg',' Lilly Singh  ',459,4.8,15,'2022.4.5 10:34');

insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)
values('The Alchemist','https://images-na.ssl-images-amazon.com/images/I/410llGwMZGL._SX328_BO1,204,203,200_.jpg','Paulo Coelho',251,4.8,20,'2022.4.5 10:34');




create table Adress(
Adress_Id int identity(1,1) primary key,
City varchar(80),
State varchar(50),
);

insert into Adress (city,State)values('Pune','Maharashtra'),('Nagpur','Maharashtra'),('Mumbai','Maharshtra'),('Banglore','Karnataka'),('Jaipur','Rajasthan');


create table Payment(
Payment_Id int Primary key identity(101,1),
Account_Id int,
Order_Id int,
Order_Date date,
OrderDelivered_Date date
);

insert into Payment(Account_Id,Order_Id,Order_Date ,OrderDelivered_Date)values(301,501,'2022.4.6','2022.4.8'),(302,502,'2022.4.9','2022.4.12'),
(303,503,'2022.4.13','2022.4.15'),(304,504,'2022.4.6','2022.4.8'),(301,501,'2022.4.6','2022.4.8');

insert into Payment(Account_Id,Order_Id,Order_Date ,OrderDelivered_Date)values(306,506,'2022.4.10','2022.4.15'),(307,507,'2022.4.10','2022.4.15'),
(308,508,'2022.4.11','2022.4.17');

select * from Payment
create table Customer(
Customer_Id int identity(1,1) primary key,
First_Name varchar(50),
Last_Name varchar(50),
Email varchar(80),
Adress_Id int foreign key references Adress(Adress_Id),
--Payment_Id int foreign key references Payment(Payment_Id),
--Book_Id int foreign key references BookStore(Book_Id)
);

Select * from Customer

Insert into Customer (First_Name,Last_Name,Email,Adress_Id) values ('Tejas','Dandge','tejasdandge@gmail.com','1'),
('Sahil','Sharma','Sahil@gmail.com','2'),('Vansh','Mahalle','Vansh@gmail.com','3'),('Krishna','Deshmukh','Krish@gmail.com','4')
('Akshay','Bante','Akshay@gmail.com','5','105','5');

Insert into Customer (First_Name,Last_Name,Email,Adress_Id,Payment_Id,Book_Id) values('Rushikesh','Thakare','Rushi@gmail.com','1','106','3'),
('Ritesh','Patel','Ritesh@gmail.com','3','107','4'),('Pushkar','Deshpande','Pushkar@gmail.com','4','108','2');


select * from BookStore
Select * from Adress
Select * from Payment
Select * from Customer


create procedure sp_GetAllBook
As 
Begin try
select * from BookStore
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec sp_GetAllBook

------------------------------------------------------------------

create procedure sp_Getbookin_Range
As 
Begin try
select * from BookStore where Price Between 350 and 500
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec sp_Getbookin_Range

---------------------------------------------------------------------------------

create procedure sp_AddBook
(
@Book_Name varchar(80),
@Book_Image varchar(250),
@Author_Name varchar(50),
@Price int,
@Rating float,
@Quantity int,
@Registered_Date datetime
)
As 
Begin try
insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)values(@Book_Name,@Book_Image,@Author_Name,@Price,@Rating,@Quantity,@Registered_Date)
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec sp_AddBook
'Ravan','https://images-na.ssl-images-amazon.com/images/I/41DIICzNDMS._SX332_BO1,204,203,200_.jpg','Sharad Tandale',270,4.9,30,'2022.4.5';



-----------------------------------------------------------------------------------------------------------------------------------------------

Alter procedure sp_UpdateBook_Name_Author
(
@Book_Name varchar(80),
@Author_Name varchar(50)
)
As 
Begin try
update BookStore set Book_Name=@Book_Name where Author_Name=@Author_Name
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec sp_UpdateBook_Name_Author
@Book_Name='Ravan King Of Devil',@Author_Name='Dr Sharad Tandale';


-------------------------------------------------------------------------------

create procedure Fetch_Book
As
Begin try
select Book_Name,Author_Name,Rating from BookStore where Price=475
end try
begin catch
SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage
END CATCH

exec Fetch_Book


---------------------------------------------------------------------------------
alter procedure sp_AddCustomer
(
@First_Name varchar(50),
@Last_Name varchar(50),
@Email varchar(80),
@Adress_Id int,
@Payment_Id int,
@Book_Id int 
)
As 
Begin try
insert into Customer(First_Name,Last_Name,Email,Adress_Id,Payment_Id,Book_Id)values(@First_Name,@Last_Name,@Email,@Adress_Id,@Payment_Id,@Book_Id)
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage
END CATCH

exec sp_AddCustomer 
'Abhishek','Gedam','abhi@gmail.com','2','107','5'

select * from Customer

-------------------------------------------------------
create procedure sp_DeleteCustomer
As 
Begin try
Delete from Customer where Customer_Id=12
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec sp_DeleteCustomer

-----------------------------------------------------------------INSERT,UPDATE,DELETE--------------------------------

alter procedure Crud_Operation
@Book_Id int,
@Book_Name varchar(80),
@Book_Image varchar(250),
@Author_Name varchar(50),
@Price int,
@Rating float,
@Quantity int,
@Registered_Date datetime,
@Choice varchar(50)

As 
Begin 

SET NOCOUNT ON

if @Choice='Insert'
begin
insert into BookStore(Book_Name,Book_Image,Author_Name,Price,Rating,Quantity,Registered_Date)values(@Book_Name,@Book_Image,@Author_Name,@Price,@Rating,@Quantity,@Registered_Date)
end 

if @Choice='Update'
begin
update BookStore set Book_Name=@Book_Name,Book_Image=@Book_Image,Author_Name=@Author_Name,Price=@Price,Rating=@Rating,Quantity=@Quantity
,Registered_Date=@Registered_Date Where Book_Name=@Book_Name
end

if @Choice='Delete'
begin
Delete From BookStore where Book_Id=@Book_Id
end
END 
GO

EXEC Crud_Operation @Book_Name='Immortals Of Meluha',@Book_Image='https://images-na.ssl-images-amazon.com/images/I/514gyGEdImL._SX329_BO1,204,203,200_.jpg',@Author_Name='Amish Tripathi',
@Price=274,@Rating=4.9,@Quantity=30,@Registered_Date='2022.4.5',@Choice='Insert';


Select * From BookStore

EXEC Crud_Operation @Book_Name='Immortals Of Meluha',@Book_Image='https://images-na.ssl-images-amazon.com/images/I/514gyGEdImL._SX329_BO1,204,203,200_.jpg',@Author_Name='Amish Tripathi',
@Price=274,@Rating=4.9,@Quantity=30,@Registered_Date='2022.4.8',@Choice='Update';


EXEC Crud_Operation @Book_Id=11,@Book_Name='Immortals Of Meluha',@Book_Image='https://images-na.ssl-images-amazon.com/images/I/514gyGEdImL._SX329_BO1,204,203,200_.jpg',@Author_Name='Amish Tripathi',
@Price=274,@Rating=4.9,@Quantity=30,@Registered_Date='2022.4.8',@Choice='Delete';


--------------------------------------------------------------------------------------------------------------------------------------------
drop table Customer
drop table Payment
Select * from Adress 
drop table Ordertable

Create Table Ordertable(
Ordered_Id int PRIMARY KEY IDENTITY (101,1),
OrderPlaced_Date datetime default cast(GETDATE() as DATE),
OrderDelivered_Date datetime,
Book_Id int foreign key references BookStore(Book_Id),
Customer_Id int foreign key references Customer(Customer_Id)
);

SELECT * FROM Ordertable

insert into Ordertable(OrderPlaced_Date,OrderDelivered_Date)values(SYSDATETIME(),DATEADD(DAY,7,SYSDATETIME()));

insert into Ordertable(OrderPlaced_Date,OrderDelivered_Date)values(SYSDATETIME(),DATEADD(DAY,7,SYSDATETIME()));


create procedure sp_OrderPlaced(
@Book_Id int,
@Customer_Id int,
@OrderPlaced_Date datetime
)
As 
Begin try
insert into Ordertable(Book_Id,Customer_Id,OrderPlaced_Date,OrderDelivered_Date)
values(@Book_Id,@Customer_Id,@OrderPlaced_Date,DATEADD(DAY,7,@OrderPlaced_Date))
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec sp_OrderPlaced 
1,1,'2022-04-05';

-------------------------------------------------------------------------------

	Alter procedure CrudOperation_Adress
	(
	@City varchar (80),
	@State varchar(50),
	@Choice varchar(50)
	)
	As 
	Begin 

	SET NOCOUNT ON

	if @Choice='Insert'
	begin
	insert into Adress (city,State)values(@City,@State)
	end 

	if @Choice='Update'
	begin
	update Adress set City=@City,State=@State Where City=@City
	end

	if @Choice='Delete'
	begin
	Delete From Adress where City=@City
	end
	END 
	GO

exec CrudOperation_Adress @City='Nagpur',@State='Maharashtra',@Choice='Insert'

Select * From Adress

exec CrudOperation_Adress @City='N',@State='Maharashtra',@Choice='Delete'



-------------------------------------------------------------------------------------
create procedure sp_searchBook
	@Book_Name varchar(80) = NULL
AS 
BEGIN
 IF @Book_Name is not null
	select b.Book_Name,
			b.Author_Name,
			b.Price,
			c.First_Name,
			c.Last_Name

			from BookStore b join 
			Customer c
			on b.Book_Id=c.Customer_Id
			where b.Book_Name like '%' +@Book_Name + '%'
			else 
			begin
				select b.Book_Name,
					b.Author_Name,
					b.Price,
					c.First_Name,
					c.Last_Name
			from BookStore b join 
			Customer c
			on b.Book_Id=c.Customer_Id
			end
		end

	exec sp_searchBook 'P'



---------------------Function Returns Table--------------------------------

Alter FUNCTION SELECT_BookStore (@Book_Name as varchar(40))
	 RETURNS TABLE
	 AS
	 RETURN 
	 (
	 SELECT * FROM BookStore where Book_Name=@Book_Name
	 )

	 SELECT * FROM dbo.SELECT_BookStore('Pursuit Of Happiness')




Create Function GetTotalAmount(@Book_Id int)
	RETURNS int
	Begin
	Declare @Amount int 
	select @Amount=(Price*Quantity) From BookStore where Book_Id=@Book_Id
	return @Amount
	END

	Select *, dbo.GetTotalAmount(Book_Id) as Amount from BookStore



Create Function GetBook_Quantity (@VAL int)
	RETURNS TABLE
	AS
	return select * from BookStore where (Quantity) > @VAL;


	Select * FROM dbo.GetBook_Quantity(18) 



alter Function DELIVERY_bySTATE(@STATE as Varchar(250))
	returns varchar(100)
	as 
	begin 
	declare @str varchar(100)
	 if @STATE='Maharashtra'
	 --&& @STATE='Karnataka'
		--@STATE='Rajasthan'
		BEGIN
		Set @str='DELIVERY AVAILABLE IN YOUR STATE'
		END
		IF @STATE='Karnataka'
		BEGIN
		Set @str='DELIVERY AVAILABLE IN YOUR STATE'
		END
		 else
		 begin
		 set @str = 'DELIVERY ARE NOT AVAILABLE IN YOUR STATE'
		 end
		 return @str
		 end

 SELECT dbo.DELIVERY_bySTATE as State('Rajsthan')

 SELECT * from BookStore as A 
 inner join Adress as B on A.Book_Id = B.Adress_Id;

 SELECT * from Customer


 ------------------------------------Non Clustered Index--------------------------------------------------------

create Nonclustered index NON_CLID_Bookdetails
on [dbo].[BookStore](Book_Name ,Author_Name,Price,Quantity)

SELECT * FROM [dbo].[BookStore]
SELECT * FROM [dbo].[BookStore] where Book_Id=5


DECLARE @Amount INT;
SELECT @Amount = COUNT(Quantity * Price)
FROM [dbo].[BookStore];
IF @Amount > 10000
    SELECT *
    FROM [dbo].[Ordertable]
    ELSE
    SELECT *
    FROM [dbo].[BookStore]




 SELECT *
    FROM Ordertable


	CREATE PROCEDURE SP_FINDORDEREDBOOKS(
	@Book_Id int)
	as 
	begin 
	declare @counter=0
	 set @counter= Select COUNT(Book_Id) as No_Books 
FROM [dbo].[Ordertable] where Book_Id = @Book_Id;
IF @counter > 0
    SELECT *
    FROM [dbo].[BookStore] where Book_Id=@Book_Id
    ELSE
	--print'This Book Has Not Been Purchased'
    SELECT *
    FROM [dbo].[BookStore]
	end 

	Create Function GetBook_Quantity (@VAL int)
	RETURNS TABLE
	AS
	return select * from BookStore where (Quantity) > @VAL;


	Select * FROM dbo.GetBook_Quantity(18)


	alter function GetTotal(@Book_id int)
RETURNS int
As
BEGIN
Declare @result int
select @result=COUNT(Book_Id) from Ordertable as No_book where Book_Id=@Book_Id 
if @result > 0
begin
RETURN @result
end
else
begin
RETURN 0
end
return 0
END

select *,dbo.GetTotal(1) from Ordertable


  --PRINT 'Executed the statement as condition is TRUE';
   ---ELSE
   -- PRINT 'Executed the statement as condition is FALSE';

   create function bookcount(@Book_Id int)
   returns varchar(100)
   BEGIN
    DECLARE @Counter INT;

    SELECT 
        @Counter = COUNT(Book_Id)  from 
        dbo.OrderTable o
        INNER JOIN dbo.BookStore b ON b.Book_Id = o.Book_Id where Book_Id=@Book_Id
    --WHERE
        --YEAR(order_date) = 2018;

    SELECT @Counter as No_book;

    IF @Counter > 0
    BEGIN
        RETURN 'Great! The BOOK HAS BEEN SOLD';
    END

END

select * from Ordertable

create function get_Age()
returns int 
DECLARE @age INT;
--SET @age = 60;
--return
IF @age < 18
   PRINT 'underage';
ELSE
BEGIN
   IF @age < 50

      PRINT 'You are below 50';
   ELSE
      PRINT 'Senior';

END;