CREATE DATABASE [eCommerceDB]
GO
USE [eCommerceDB]
GO
CREATE TABLE [dbo].[Customer_Payment_Methods](
	[customer_payment_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[payment_method_code] [char](4) NULL,
	[credit_card_number] [varchar](50) NULL,
	[payment_method_details] [varchar](50) NULL,
 CONSTRAINT [PK_Customer_Payment_Methods] PRIMARY KEY CLUSTERED 
(
	[customer_payment_id] ASC
)
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Customers](
	[Customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Organisation_or_person] [char](1) NULL,
	[Organisation_name] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[First_Name] [varchar](50) NULL,
	[Middle_Initial] [char](1) NULL,
	[Last_Name] [varchar](50) NULL,
	[Email_Address] [varchar](50) NULL,
	[Login_name] [varchar](50) NULL,
	[Login_Password] [varchar](20) NULL,
	[Phone_number] [varchar](50) NULL,
	[Address_Line1] [varchar](50) NULL,
	[Address_Line2] [varchar](50) NULL,
	[Address_Line3] [varchar](50) NULL,
	[Address_Line4] [varchar](50) NULL,
	[Town_City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Invoices](
	[invoice_number] [int] IDENTITY(1000,1) NOT NULL,
	[order_id] [int] NULL,
	[invoice_status_code] [char](2) NULL,
	[invoice_date] [datetime] NULL,
	[invoice_details] [varchar](50) NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[invoice_number] ASC
)
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Order_Items](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[order_item_status_code] [char](2) NULL,
	[order_item_quantity] [int] NULL,
	[order_item_price] [decimal](10, 2) NULL,
	[other_order_item_details] [varchar](50) NULL,
 CONSTRAINT [PK_Order_Items] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status_code] [char](2) NULL,
	[date_order_placed] [datetime] NULL,
	[order_details] [varchar](100) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_number] [int] NULL,
	[payment_date] [datetime] NULL,
	[payment_amount] [float] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_code] [varchar](10) NULL,
	[product_name] [varchar](100) NULL,
	[product_price] [decimal](15, 2) NULL,
	[product_color] [varchar](50) NULL,
	[product_size] [varchar](10) NULL,
	[product_description] [varchar](100) NULL,
	[other_product_details] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)
) ON [PRIMARY]





CREATE TABLE [dbo].[Ref_Invoice_Status_Codes](
	[invoice_status_code] [char](2) NOT NULL,
	[invoice_status_description] [varchar](50) NULL,
 CONSTRAINT [PK_Ref_Invoice_Status_Codes] PRIMARY KEY CLUSTERED 
(
	[invoice_status_code] ASC
)
) ON [PRIMARY]



CREATE TABLE [dbo].[Ref_Order_Item_Status_Codes](
	[order_item_status_code] [char](2) NOT NULL,
	[order_item_status_description] [varchar](50) NULL,
 CONSTRAINT [PK_Ref_Order_Item_Status_Codes] PRIMARY KEY CLUSTERED 
(
	[order_item_status_code] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Ref_Order_Status_Codes](
	[order_status_code] [char](2) NOT NULL,
	[order_status_description] [varchar](50) NULL,
 CONSTRAINT [PK_Ref_Order_Status_Codes] PRIMARY KEY CLUSTERED 
(
	[order_status_code] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Ref_Payment_Methods](
	[payment_method_code] [char](4) NOT NULL,
	[payment_method_description] [varchar](50) NULL,
 CONSTRAINT [PK_Ref_Payment_Methods] PRIMARY KEY CLUSTERED 
(
	[payment_method_code] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[Ref_Product_Type_Codes](
	[product_type_code] [varchar](10) NOT NULL,
	[product_type_description] [varchar](50) NULL,
 CONSTRAINT [PK_Ref_Product_Type_Codes] PRIMARY KEY CLUSTERED 
(
	[product_type_code] ASC
)
) ON [PRIMARY]





CREATE TABLE [dbo].[Shipment_Items](
	[shipment_id] [int] NULL,
	[order_item_id] [int] NULL
) ON [PRIMARY]





CREATE TABLE [dbo].[Shipments](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[invoice_number] [int] NULL,
	[shipment_tracking_number] [varchar](50) NULL,
	[shipment_date] [datetime] NULL,
	[other_shipment_details] [varchar](50) NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Customer_Payment_Methods]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Payment_Methods_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([Customer_Id])
GO
ALTER TABLE [dbo].[Customer_Payment_Methods] CHECK CONSTRAINT [FK_Customer_Payment_Methods_Customers]
GO
ALTER TABLE [dbo].[Customer_Payment_Methods]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Payment_Methods_Ref_Payment_Methods] FOREIGN KEY([payment_method_code])
REFERENCES [dbo].[Ref_Payment_Methods] ([payment_method_code])
GO
ALTER TABLE [dbo].[Customer_Payment_Methods] CHECK CONSTRAINT [FK_Customer_Payment_Methods_Ref_Payment_Methods]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Orders]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Ref_Invoice_Status_Codes] FOREIGN KEY([invoice_status_code])
REFERENCES [dbo].[Ref_Invoice_Status_Codes] ([invoice_status_code])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Ref_Invoice_Status_Codes]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Orders]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Products]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Ref_Order_Item_Status_Codes] FOREIGN KEY([order_item_status_code])
REFERENCES [dbo].[Ref_Order_Item_Status_Codes] ([order_item_status_code])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Ref_Order_Item_Status_Codes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([Customer_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Ref_Order_Status_Codes] FOREIGN KEY([order_status_code])
REFERENCES [dbo].[Ref_Order_Status_Codes] ([order_status_code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Ref_Order_Status_Codes]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Invoices] FOREIGN KEY([invoice_number])
REFERENCES [dbo].[Invoices] ([invoice_number])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Invoices]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Ref_Product_Type_Codes] FOREIGN KEY([product_type_code])
REFERENCES [dbo].[Ref_Product_Type_Codes] ([product_type_code])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Ref_Product_Type_Codes]
GO
ALTER TABLE [dbo].[Shipment_Items]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Items_Order_Items] FOREIGN KEY([order_item_id])
REFERENCES [dbo].[Order_Items] ([order_item_id])
GO
ALTER TABLE [dbo].[Shipment_Items] CHECK CONSTRAINT [FK_Shipment_Items_Order_Items]
GO
ALTER TABLE [dbo].[Shipment_Items]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Items_Shipments] FOREIGN KEY([shipment_id])
REFERENCES [dbo].[Shipments] ([shipment_id])
GO
ALTER TABLE [dbo].[Shipment_Items] CHECK CONSTRAINT [FK_Shipment_Items_Shipments]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Invoices] FOREIGN KEY([invoice_number])
REFERENCES [dbo].[Invoices] ([invoice_number])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Invoices]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Orders]
GO
