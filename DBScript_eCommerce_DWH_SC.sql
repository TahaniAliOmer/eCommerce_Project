CREATE DATABASE eCommerce_DWH_SC
GO

USE [eCommerce_DWH_SC]
GO

CREATE TABLE [dbo].[DimCustomers](
	[Customer_Id] [int] NOT NULL,
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
	[customer_payment_id] [int] NOT NULL,
	[payment_method_code] [char](4) NULL,
	[payment_method_description] [varchar](50) NULL,
	[credit_card_number] [varchar](50) NULL,
	[payment_method_details] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)
) ON [PRIMARY]


CREATE TABLE [dbo].[DimInvoices](
	[invoice_number] [int] NOT NULL,
	[order_id] [int] NULL,
	[invoice_status_code] [char](2) NULL,
	[invoice_status_description] [varchar](50) NULL,
	[invoice_date] [datetime] NULL,
	[invoice_details] [varchar](50) NULL,
	[payment_id] [int] NOT NULL,
	[payment_date] [datetime] NULL,
	[payment_amount] [float] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[invoice_number] ASC
)
) ON [PRIMARY]



CREATE TABLE [dbo].[DimPayments](
	[payment_id] [int] NOT NULL,
	[invoice_number] [int] NULL,
	[payment_date] [datetime] NULL,
	[payment_amount] [float] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)
) ON [PRIMARY]



CREATE TABLE [dbo].[DimProducts](
	[product_id] [int] NOT NULL,
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

CREATE TABLE [dbo].[DimShipments](
	[shipment_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[order_item_id] [int] NOT NULL,
	[invoice_number] [int] NULL,
	[shipment_tracking_number] [varchar](50) NULL,
	[shipment_date] [datetime] NULL,
	[other_shipment_details] [varchar](50) NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC,
	[order_item_id] ASC
)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[eCommerce_Package_Errors]    Script Date: 08/01/2017 22:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eCommerce_Package_Errors](
	[PackageName] [nvarchar](100) NULL,
	[TaskName] [nvarchar](100) NULL,
	[ErrorCode] [int] NULL,
	[ErrorDesc] [nvarchar](100) NULL,
	[DBTimeStamp] [datetime] NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 08/01/2017 22:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactSales](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[order_status_code] [char](2) NULL,
	[date_order_placed] [datetime] NULL,
	[order_details] [varchar](100) NULL,
	[order_item_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[order_item_status_code] [char](2) NULL,
	[order_item_status_description] [varchar](50) NULL,
	[order_item_quantity] [int] NULL,
	[order_item_price] [decimal](10, 2) NULL,
	[other_order_item_details] [varchar](50) NULL,
	[invoice_number] [int] NULL,
	[shipment_id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactSales_Staging]    Script Date: 08/01/2017 22:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactSales_Staging](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[order_status_code] [char](2) NULL,
	[date_order_placed] [datetime] NULL,
	[order_details] [varchar](100) NULL,
	[order_item_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[order_item_status_code] [char](2) NULL,
	[order_item_status_description] [varchar](50) NULL,
	[order_item_quantity] [int] NULL,
	[order_item_price] [decimal](10, 2) NULL,
	[other_order_item_details] [varchar](50) NULL,
	[invoice_number] [int] NULL,
	[shipment_id] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [fk_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[DimCustomers] ([Customer_Id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [fk_customer_id]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [fk_invoice_number] FOREIGN KEY([invoice_number])
REFERENCES [dbo].[DimInvoices] ([invoice_number])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [fk_invoice_number]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [fk_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[DimProducts] ([product_id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [fk_product_id]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [fk_shipment_id] FOREIGN KEY([shipment_id])
REFERENCES [dbo].[DimShipments] ([shipment_id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [fk_shipment_id]
GO
