
insert [dbo].[Ref_Payment_Methods]
select 'CC','Credit Card'
union
select 'DC','Debit Card'
union
select 'CHQ','Cheque'
union
select 'EFT','Electronic Funds Transfer'
go

-----Customers..
Insert Customers
 ([Organisation_or_person],[Organisation_name],[Gender]
		,[First_Name],[Middle_Initial],[Last_Name],[Email_Address]
		,[Login_name],[Login_Password],[Phone_number]
		,[Address_Line1],[Address_Line2],[Address_Line3],[Address_Line4]
		,[Town_City],[County],[Country]
 )
 select 'O','Test Company',null,null,null,null,'contact@testcompany.com','testcomp','password','223-334-5454',
 '1 Main St',null,null,null,'Hyderabad','TG','India'
 union
 select 'P',null,'M','Srinivas',null,'Nair','sn@gnmail.com','sr.nair','spassword','344-123-2222',
 '22 Central Ct',null,null,'kondapur','Hyderabad','TG','India'
  union
 select 'P',null,'M','Arun',null,'kumar','ak@gnmail.com','ak11','akpassword','933-345-3333',
 '13 One road',null,null,'Tnagar','Chennai','TG','India'
 union
 select 'P',null,'M','rohit',null,'sharma','rsh@gnmail.com','rshdel','spassword','344-123-2222',
 '123-5  janta Marg',null,null,'Vikaspuri','New Delhi','DL','India'
  union
 select 'P',null,'M','ranjit',null,'singh','rsingh@gnmail.com','rsingh','spassword','344-123-4444',
 '99',null,null,'rkpuram','New Delhi','DL','India'
union
select 'O','New Tech',null,null,null,null,'contact@NewTech.com','NewTech','password','111-222-3333',
 '1 STP',null,null,null,'New Delhi','DL','India'
 GO

 -------------Product Type Codes
 Insert [dbo].[Ref_Product_Type_Codes] 
 select 'CLTH','Clothing'
 union
 select 'ASCR','Assessories'
union
 select 'FTWR','Footwear'
union
 select 'COMP','Computer and Electronics'

------------

Insert [dbo].[Products]
([product_type_code],[product_name],[product_price]
  ,[product_color],[product_size],[product_description],[other_product_details])
select 'CLTH','Levis',3444.99,'Blue','34-30','Denim Jeans',null
union
select 'CLTH','Arrow',1555.49,'White','42','Executive Shirt',null
union
select 'ASCR','Wilson',999,'Brown','34','Leather Belt',null
union
select 'FTWR','Nike',4999,'White','9.5','Sports Shoes',null
union
select 'FTWR','Reebok',2999,'Blue','10','Sports Shoes',null
union
select 'COMP','Dell',45000,'White',null,'laptop-Intel i7',null
union
select 'COMP','Apple',65000,'White',null,'iPad Tablet-Intel i7',null

go

-----------
Insert [dbo].[Ref_Invoice_Status_Codes]
 ([invoice_status_code],[invoice_status_description])
 select 'IS','Issued'
 union
 select 'PD','Paid'
GO

-------------

Insert [dbo].[Ref_Order_Status_Codes]
( [order_status_code],[order_status_description])
select 'CN','Cancelled'
union
select 'CP','Completed'
go

--------------

Insert [dbo].[Customer_Payment_Methods]
([customer_id],[payment_method_code],[credit_card_number],[payment_method_details])
select 1,'CC','1233555577777','Citi Bank Credit card'
union
select 2,'EFT','74554234344','Axis Bank Acct'
union
select 3,'CC','4456345564666','Visa credit card'
union
select 4,'CHQ',null,null
union
select 5,'DC','56657874547666','SBI Debit'
union
select 6,'CC','83242323232233','Master card'

go
------------Insert Order data
Insert [dbo].[Orders]  ([customer_id],[order_status_code],[date_order_placed],[order_details])
select 1,'CP','01/01/2016','Order placed for Dell laptops'
union
select 2,'CN','02/01/2016','Order cancelled for ipads'
union
select 2,'CP','03/01/2016','Order placed for ipads'
union
select 3,'CP','02/01/2016','Shoes Order'
union
select 4,'CP','01/01/2016','Clothing Order'
union
select 4,'CP','03/01/2016','Ascessories Order'
union
select 5,'CP','05/01/2016','Shoes Order'
union
select 6,'CP','06/01/2016','clothing Order'
go

--------------------
Insert [dbo].[Ref_Order_Item_Status_Codes] ([order_item_status_code],[order_item_status_description])
select 'A','Available'
GO

--------------------

Insert [dbo].[Order_Items] 
	([product_id],[order_id],[order_item_status_code],[order_item_quantity]
      ,[order_item_price],[other_order_item_details])
select 5,1,'A',4,45000,null
union
select 4,2,'A',3,65000,null
union
select 4,2,'A',3,65000,null
union
select 4,3,'A',4,65000,null
union
select 6,4,'A',1,4999,null
union
select 7,4,'A',2,2999,null
union
select 2,5,'A',2,1555.49,null
union
select 3,5,'A',1,3444.99,null
union
select 1,6,'A',3,999,null
union
select 6,7,'A',2,4999,null
union
select 3,8,'A',5,3444.99,null
go

-------------Invoices

Insert [dbo].[Invoices]
([order_id],[invoice_status_code],[invoice_date],[invoice_details])
select 1,'PD','01/01/2016',null
union
select 2,'IS','02/01/2016',null
union
select 3,'PD','03/01/2016',null
union
select 4,'PD','02/01/2016',null
union
select 5,'PD','01/01/2016',null
union
select 6,'PD','03/01/2016',null
union
select 7,'PD','05/01/2016',null
union
select 8,'PD','06/01/2016',null
go

----------Shipments

Insert [dbo].[Shipments]
([order_id],[invoice_number],[shipment_tracking_number],[shipment_date])
Select 1,1000,'1000-1','02/01/2016'
union
Select 3,1002,'1002-1','04/01/2016'
union
Select 4,1003,'1003-1','03/01/2016'
union
Select 5,1004,'1004-1','02/01/2016'
union
Select 6,1005,'1005-1','04/01/2016'
union
Select 7,1006,'1006-1','06/01/2016'
union
Select 8,1007,'1007-1','02/01/2016'
GO


-- PAYMENT TABLE DATA: 
INSERT INTO PAYMENTS VALUES (1000, '2016-02-01', 1000)
INSERT INTO PAYMENTS VALUES (1001, '2016-02-01', 1000)
INSERT INTO PAYMENTS VALUES (1002, '2016-02-01', 1000)
INSERT INTO PAYMENTS VALUES (1003, '2016-02-01', 1000)
INSERT INTO PAYMENTS VALUES (1004, '2016-01-01', 1000)
INSERT INTO PAYMENTS VALUES (1005, '2016-03-01', 1000)
INSERT INTO PAYMENTS VALUES (1006, '2016-05-01', 1000)


-- SHIPMENT TABLE DATA: 
INSERT INTO Shipment_Items VALUES (1, 1), (2,2), (2,3), (2, 4), (3,4), (4,5), (5, 6), (6,7), (6,8), (7,9), (7,10)
