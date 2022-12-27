/****** Object:  Database [group9POS]    Script Date: 12/6/2022 1:52:25 PM ******/
CREATE DATABASE [group9POS]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [group9POS] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [group9POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [group9POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [group9POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [group9POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [group9POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [group9POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [group9POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [group9POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [group9POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [group9POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [group9POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [group9POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [group9POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [group9POS] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [group9POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [group9POS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [group9POS] SET  MULTI_USER 
GO
ALTER DATABASE [group9POS] SET ENCRYPTION ON
GO
ALTER DATABASE [group9POS] SET QUERY_STORE = ON
GO
ALTER DATABASE [group9POS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_order_item] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItems]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItems](
	[productID] [int] NOT NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[userID] [int] NULL,
	[streetname] [varchar](50) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[state] [varchar](25) NOT NULL,
	[zcode] [varchar](5) NULL,
	[country] [varchar](30) NOT NULL,
	[taxAmount] [decimal](6, 2) NOT NULL,
	[orderAmount] [decimal](10, 2) NOT NULL,
	[orderDate] [date] NULL,
	[orderStatus] [int] NULL,
	[expectedDelivery] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[paymentID] [int] IDENTITY(5,1) NOT NULL,
	[paymentType] [varchar](20) NOT NULL,
	[paymentName] [varchar](60) NOT NULL,
	[paymentExp] [date] NOT NULL,
	[paymentNum] [varchar](16) NOT NULL,
	[paymentCVV] [varchar](3) NOT NULL,
	[balance] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](60) NOT NULL,
	[productType] [varchar](25) NOT NULL,
	[prodDesc] [varchar](255) NOT NULL,
	[size] [varchar](10) NOT NULL,
	[color] [varchar](25) NOT NULL,
	[price] [decimal](5, 2) NOT NULL,
	[productQuantity] [int] NOT NULL,
	[discount] [decimal](5, 2) NULL,
	[supplierID] [int] NULL,
	[amountSale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shoppingCart]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shoppingCart](
	[numItems] [int] NOT NULL,
	[userID] [int] NULL,
	[productID] [int] NOT NULL,
	[customerID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplierID] [int] IDENTITY(1000,20) NOT NULL,
	[supplierName] [varchar](40) NOT NULL,
	[supplierStreetname] [varchar](40) NOT NULL,
	[supplierCity] [varchar](20) NOT NULL,
	[supplierState] [varchar](3) NOT NULL,
	[supplierZcode] [varchar](5) NOT NULL,
	[supplierCountry] [varchar](40) NOT NULL,
	[supplierProdType] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(10,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[pword] [varchar](20) NOT NULL,
	[streetname] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](3) NULL,
	[zcode] [varchar](5) NULL,
	[country] [varchar](20) NULL,
	[isAdmin] [bit] NOT NULL,
	[orderNotification] [int] NULL,
 CONSTRAINT [PK__users__CB9A1CDFDA225DB9] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitors]    Script Date: 12/6/2022 1:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitors](
	[customerID] [int] IDENTITY(15,1) NOT NULL,
	[fname] [varchar](30) NULL,
	[lname] [varchar](30) NULL,
	[address] [varchar](60) NULL,
	[email] [varchar](60) NULL,
	[userID] [int] NULL,
	[sessionID] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (225, 1, 4)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (229, 1, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (232, 1, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (237, 1, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 1, 8)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (225, 2, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (232, 3, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (234, 3, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 3, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 4, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (4, 5, 20)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (120, 5, 100)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 5, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 5, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (120, 6, 30)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 6, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 7, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 8, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (228, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (235, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (236, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (240, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (242, 9, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (230, 12, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (232, 14, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 14, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (232, 15, 10)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 15, 3)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (4, 16, 50)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (225, 16, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (226, 16, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 18, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (241, 25, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 31, 3)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (238, 32, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 32, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 33, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (232, 36, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (231, 49, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (242, 52, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 52, 2)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (233, 53, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (236, 59, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (227, 66, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (234, 71, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 71, 3)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (239, 72, 1)
INSERT [dbo].[order_item] ([orderID], [productID], [quantity]) VALUES (243, 72, 6)
GO
INSERT [dbo].[orderItems] ([productID], [quantity]) VALUES (1, 12)
INSERT [dbo].[orderItems] ([productID], [quantity]) VALUES (2, 34)
INSERT [dbo].[orderItems] ([productID], [quantity]) VALUES (12, 51)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (4, 87, NULL, N'6969 Street', N'Houston', N'Alabama', N'12345', N'USB', CAST(10.30 AS Decimal(6, 2)), CAST(100.10 AS Decimal(10, 2)), CAST(N'2020-11-16' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (5, NULL, 14, N'69691 Street', N'Alburquerque', N'Virginia', N'12345', N'USB', CAST(10.20 AS Decimal(6, 2)), CAST(100.10 AS Decimal(10, 2)), CAST(N'2021-11-16' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (13, NULL, 14, N'test run', N'houston', N'texas', N'77036', N'USA', CAST(0.08 AS Decimal(6, 2)), CAST(4.88 AS Decimal(10, 2)), CAST(N'2021-11-16' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (21, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2018-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (23, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (25, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (27, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (28, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (30, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (31, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (34, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (36, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (37, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (40, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 0, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (48, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2021-04-29' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (50, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (52, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (53, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (54, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (55, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (56, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (57, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (58, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (59, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (60, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (61, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (62, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (63, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (64, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (65, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (66, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (67, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (68, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (69, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2020-07-13' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (70, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (71, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (72, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (73, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (74, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (75, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (76, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (77, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (78, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (79, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (80, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (81, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (82, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (83, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (84, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (85, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (86, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (87, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (88, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (89, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (90, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (91, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (92, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (93, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (94, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (95, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (96, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (97, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (98, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (99, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (100, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (101, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (102, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (103, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (104, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (105, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (106, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (107, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (108, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (109, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (110, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (111, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (112, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (113, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 2, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (114, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (115, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (116, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (117, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (118, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (119, 14, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (120, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (121, 14, NULL, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (122, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (123, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (124, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (125, NULL, 14, N'1234 Sesame St', N'New York City', N'NY', N'11111', N'USA', CAST(10.72 AS Decimal(6, 2)), CAST(140.67 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (126, NULL, 14, N'1234 Sesame St', N'New York City', N'NY', N'11111', N'USA', CAST(1.65 AS Decimal(6, 2)), CAST(21.63 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (127, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(7.42 AS Decimal(6, 2)), CAST(97.40 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (128, NULL, 15, N'7920 Split Cypress Ln', N'Houston', N'TX', N'77041', N'United States', CAST(0.82 AS Decimal(6, 2)), CAST(10.81 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (129, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (130, NULL, 15, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (131, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (132, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(0.82 AS Decimal(6, 2)), CAST(10.81 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (133, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (134, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2020-09-11' AS Date), 1, NULL)
GO
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (135, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (136, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (137, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (138, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.01 AS Decimal(6, 2)), CAST(91.99 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (139, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.89 AS Decimal(6, 2)), CAST(37.87 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (140, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (141, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (142, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.77 AS Decimal(6, 2)), CAST(75.75 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (143, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.42 AS Decimal(6, 2)), CAST(97.39 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (144, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.42 AS Decimal(6, 2)), CAST(97.39 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (145, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(9.07 AS Decimal(6, 2)), CAST(119.04 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (146, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(4.12 AS Decimal(6, 2)), CAST(54.10 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (147, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (148, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(4.12 AS Decimal(6, 2)), CAST(54.10 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (149, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (150, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (151, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (152, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (153, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (154, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (155, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (156, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (157, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (158, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (159, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (160, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (161, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (162, NULL, 17, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (163, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (164, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2019-02-23' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (165, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (166, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (167, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (168, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (169, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (170, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (171, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (172, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (173, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (174, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (175, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (176, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.16 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (177, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.89 AS Decimal(6, 2)), CAST(37.87 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (178, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (179, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 3, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (180, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (181, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (182, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (183, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (184, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (185, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (186, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (187, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (188, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (189, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(5.36 AS Decimal(6, 2)), CAST(70.33 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (190, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (191, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(15.67 AS Decimal(6, 2)), CAST(205.62 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (192, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(15.67 AS Decimal(6, 2)), CAST(205.62 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (193, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(7.84 AS Decimal(6, 2)), CAST(102.81 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (194, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (195, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (196, 14, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (197, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (198, 14, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (199, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (200, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (201, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.54 AS Decimal(6, 2)), CAST(59.52 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (202, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (203, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (204, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (205, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (206, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(20.62 AS Decimal(6, 2)), CAST(270.56 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (207, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (208, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (209, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2018-02-22' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (210, 15, NULL, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (211, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (212, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (213, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (214, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'NY', N'77385', N'United States', CAST(0.82 AS Decimal(6, 2)), CAST(10.81 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (215, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(2.47 AS Decimal(6, 2)), CAST(32.46 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (216, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.93 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (217, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (219, NULL, 14, N'4310 Reynor Creek Ct', N'Sugar Land', N'TX', N'77479', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (220, NULL, 40, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(1.73 AS Decimal(6, 2)), CAST(22.72 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (221, NULL, 14, N'4310 Reynor Creek Ct', N'Sugar Land', N'TX', N'77479', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-17' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (222, NULL, 14, N'10440 Deerwood Rd', N'Houston', N'TX', N'77042', N'United States', CAST(0.82 AS Decimal(6, 2)), CAST(10.81 AS Decimal(10, 2)), CAST(N'2022-11-18' AS Date), 0, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (223, NULL, 14, N'4310 Reynor Creek Ct', N'Sugar Land', N'TX', N'77479', N'United States', CAST(1.73 AS Decimal(6, 2)), CAST(22.72 AS Decimal(10, 2)), CAST(N'2022-11-18' AS Date), 0, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (224, NULL, 40, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-19' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (225, NULL, 14, N'6566 Hi', N'Atlanta', N'AZ', N'99912', N'USB', CAST(10.10 AS Decimal(6, 2)), CAST(19.99 AS Decimal(10, 2)), CAST(N'2022-11-24' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (226, NULL, 43, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-24' AS Date), 2, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (227, NULL, 14, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(14.43 AS Decimal(6, 2)), CAST(189.37 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (228, NULL, 14, N'10440 Deerwood Rd, APT 326', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (229, NULL, 14, N'10440 Deerwood Rd, APT 326', N'Houston', N'TX', N'77042', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (230, NULL, 14, N'10440 Deerwood Rd, APT 326', N'Houston', N'TX', N'77042', N'United States', CAST(2.47 AS Decimal(6, 2)), CAST(32.46 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, NULL)
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (231, NULL, 14, N'10440 Deerwood Rd, APT 326', N'Houston', N'TX', N'77042', N'United States', CAST(4.12 AS Decimal(6, 2)), CAST(54.11 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, CAST(N'2022-12-03' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (232, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(14.92 AS Decimal(6, 2)), CAST(195.78 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 0, CAST(N'2022-12-03' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (233, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(4.12 AS Decimal(6, 2)), CAST(54.11 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 3, CAST(N'2022-12-03' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (234, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(3.71 AS Decimal(6, 2)), CAST(48.69 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 2, CAST(N'2022-12-03' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (235, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 1, CAST(N'2022-12-03' AS Date))
GO
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (236, NULL, 15, N'4800 Calhoun Rd', N'Houston', N'TX', N'77004', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.17 AS Decimal(10, 2)), CAST(N'2022-11-27' AS Date), 2, CAST(N'2022-12-03' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (237, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'NY', N'77385', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 0, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (238, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(1.73 AS Decimal(6, 2)), CAST(22.72 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 1, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (239, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(1.65 AS Decimal(6, 2)), CAST(21.64 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 1, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (240, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(2.06 AS Decimal(6, 2)), CAST(27.05 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 1, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (241, NULL, 14, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(4.95 AS Decimal(6, 2)), CAST(64.94 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 0, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (242, NULL, 14, N'10440 Deerwood Rd, APT 326', N'Houston', N'TX', N'77042', N'United States', CAST(6.19 AS Decimal(6, 2)), CAST(81.17 AS Decimal(10, 2)), CAST(N'2022-11-28' AS Date), 1, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (243, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(62.67 AS Decimal(6, 2)), CAST(822.35 AS Decimal(10, 2)), CAST(N'2022-12-06' AS Date), 1, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (244, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(62.67 AS Decimal(6, 2)), CAST(822.35 AS Decimal(10, 2)), CAST(N'2022-12-06' AS Date), 1, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (245, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(62.67 AS Decimal(6, 2)), CAST(822.35 AS Decimal(10, 2)), CAST(N'2022-12-06' AS Date), 1, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[orders] ([orderID], [customerID], [userID], [streetname], [city], [state], [zcode], [country], [taxAmount], [orderAmount], [orderDate], [orderStatus], [expectedDelivery]) VALUES (246, NULL, 15, N'9984 Knob Hollow way', N'Conroe', N'TX', N'77385', N'United States', CAST(62.67 AS Decimal(6, 2)), CAST(822.35 AS Decimal(10, 2)), CAST(N'2022-12-06' AS Date), 1, CAST(N'2022-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 

INSERT [dbo].[payments] ([paymentID], [paymentType], [paymentName], [paymentExp], [paymentNum], [paymentCVV], [balance]) VALUES (5, N'trcard', N'run', CAST(N'2022-11-05' AS Date), N'rt', N'347', NULL)
INSERT [dbo].[payments] ([paymentID], [paymentType], [paymentName], [paymentExp], [paymentNum], [paymentCVV], [balance]) VALUES (6, N'Mastercard', N'Robert Duque', CAST(N'2023-12-03' AS Date), N'1111222233334444', N'123', CAST(4332.16 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([paymentID], [paymentType], [paymentName], [paymentExp], [paymentNum], [paymentCVV], [balance]) VALUES (7, N'Visa', N'Robert Duque', CAST(N'2023-02-12' AS Date), N'1234567890123456', N'234', CAST(1003.51 AS Decimal(10, 2)))
INSERT [dbo].[payments] ([paymentID], [paymentType], [paymentName], [paymentExp], [paymentNum], [paymentCVV], [balance]) VALUES (8, N'Visa', N'Dave', CAST(N'2024-01-03' AS Date), N'1234123412341234', N'321', CAST(390.88 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (1, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'M', N'Gray', CAST(24.99 AS Decimal(5, 2)), 8, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (2, N'Running Shorts', N'Shorts', N'These shorts are very breathable and great for running!', N'M', N'Black', CAST(29.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1040, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (3, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'S', N'Gray', CAST(24.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (4, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'S', N'White', CAST(24.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (5, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'M', N'White', CAST(24.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (6, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'L', N'White', CAST(24.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (7, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'S', N'Black', CAST(24.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (8, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'M', N'Black', CAST(24.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (9, N'Compression Shirt', N'Shirts', N'This shirt allows a runner to endure long distance treks without breaking a sweat!', N'L', N'Black', CAST(24.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1020, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (12, N'Running Shorts', N'Shorts', N'These shorts are very breathable and great for running!', N'L', N'Black', CAST(29.99 AS Decimal(5, 2)), 11, CAST(0.00 AS Decimal(5, 2)), 1040, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (13, N'Running Shorts', N'Shorts', N'These shorts are very breathable and great for running!', N'S', N'Blue', CAST(29.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1040, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (14, N'Headband', N'Accessories', N'This product is fantastic for keeping sweat from your face while you are working out!', N'U', N'Black', CAST(9.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1060, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (15, N'Headband', N'Accessories', N'This product is fantastic for keeping sweat from your face while you are working out!', N'U', N'Black', CAST(9.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1060, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (16, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'6.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 8, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (17, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'5.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (18, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'6.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (19, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'7.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (20, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'7.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (21, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'8.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (22, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'8.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (23, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'9.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (24, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'9.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (25, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'10.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 6, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (26, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'10.5', N'Black', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (27, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'11.0', N'Black', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (28, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'6.0', N'White', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (29, N'Running Shoes', N'Shoes', N'These shoes are great for running in any environment!', N'6.5', N'White', CAST(59.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1000, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (30, N'Running Shorts', N'Shorts', N'These shorts are very breathable and great for running!', N'S', N'Black', CAST(29.99 AS Decimal(5, 2)), 15, CAST(0.00 AS Decimal(5, 2)), 1040, NULL)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (31, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'Black', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (32, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'Black', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (33, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'Black', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (34, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'White', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (35, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'White', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (36, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'White', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (37, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'Blue', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (38, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'Blue', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (39, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'Blue', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (40, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'Brown', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (41, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'Brown', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (42, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'Brown', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (43, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'Green', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (44, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'Green', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (45, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'Green', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (46, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'S', N'Yellow', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (47, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'M', N'Yellow', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (48, N'Dri-Fit T-Shirt', N'Shirts', N'This shirt is great to wear any day whether you are working out or not. Breathable fabric with a sleek look!', N'L', N'Yellow', CAST(20.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1020, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (49, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'5.0', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (50, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'5.5', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (51, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'6.0', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (52, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'6.5', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (53, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'7.0', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (54, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'7.5', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (55, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'8.0', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (56, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'8.5', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (57, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'9.0', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (58, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'9.5', N'Black', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (59, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'5.0', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (60, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'5.5', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (61, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'6.0', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (62, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'6.5', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (63, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'7.0', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (64, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'7.5', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (65, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'8.0', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (66, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'8.5', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (67, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'9.0', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (68, N'Lifestyle Shoes', N'Shoes', N'These shoes are fantastic for your daily tasks or even a quick jog!', N'9.5', N'White', CAST(49.99 AS Decimal(5, 2)), 20, CAST(0.00 AS Decimal(5, 2)), 1000, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (70, N'Compression Shorts', N'Shorts', N'These are shorts', N'S', N'Yellow', CAST(19.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1040, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (71, N'Compression Shorts', N'Shorts', N'These are shorts', N'S', N'Black', CAST(19.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1040, 0)
INSERT [dbo].[products] ([productID], [fullName], [productType], [prodDesc], [size], [color], [price], [productQuantity], [discount], [supplierID], [amountSale]) VALUES (72, N'Compression Shorts', N'Shorts', N'These are shorts', N'S', N'Orange', CAST(19.99 AS Decimal(5, 2)), 10, CAST(0.00 AS Decimal(5, 2)), 1040, 0)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, NULL, 1, 916)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, NULL, 15, 916)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 29, 17, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 29, 27, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 42, 49, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, NULL, 14, 1011)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 41, 32, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, 39, 9, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, 42, 1, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 14, 9, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 14, 33, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (6, 35, 14, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, NULL, 47, 1088)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (8, 29, 16, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 17, 1, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, 36, 1, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (6, 36, 16, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (6, 39, 14, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, NULL, 1, 1278)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, NULL, 1, 1280)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, NULL, 70, 1280)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, NULL, 32, 1280)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, NULL, 15, 1280)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, NULL, 71, 1280)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 44, 14, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 45, 7, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 45, 14, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (7, 29, 1, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (8, NULL, 16, 984)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (3, NULL, 1, 1165)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, NULL, 3, 1165)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (7, NULL, 1, 1279)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (6, NULL, 14, 1014)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, NULL, 71, 1279)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, 12, 1, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (1, 29, 30, NULL)
INSERT [dbo].[shoppingCart] ([numItems], [userID], [productID], [customerID]) VALUES (2, 29, 15, NULL)
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplierID], [supplierName], [supplierStreetname], [supplierCity], [supplierState], [supplierZcode], [supplierCountry], [supplierProdType]) VALUES (1000, N'Shoes Inc.', N'One Bowerman Dr', N'Beaverton', N'OR', N'97005', N'USA', N'Shoes')
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [supplierStreetname], [supplierCity], [supplierState], [supplierZcode], [supplierCountry], [supplierProdType]) VALUES (1020, N'Shirts Inc.', N'100 Brighton Landing', N'Boston', N'MA', N'02135', N'USA', N'Shirts')
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [supplierStreetname], [supplierCity], [supplierState], [supplierZcode], [supplierCountry], [supplierProdType]) VALUES (1040, N'Shorts Inc.', N'25 Drydock Avenue', N'Boston', N'MA', N'02210', N'USA', N'Shorts')
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [supplierStreetname], [supplierCity], [supplierState], [supplierZcode], [supplierCountry], [supplierProdType]) VALUES (1060, N'Accessories Inc.', N'2 Folsom St', N'San Francisco', N'CA', N'94105', N'USA', N'Accessories')
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (12, N'admin', N'raduque@uh.edu', N'COSC3380', N'4800 Calhoun Rd.', N'Houston', N'TX', NULL, N'United States', 1, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (14, N'rob', N'robert.duque1998@gmail.com', N'yes123', N'2926 Barker Cypress Rd.', N'Houston', N'TX', NULL, N'United States', 0, 0)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (15, N'Dave', N'Dave@email.com', N'asdf', NULL, NULL, NULL, NULL, NULL, 0, 2)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (17, N'Chad', N'Chad@email.com', N'asdfg', NULL, NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (18, N'Brad', N'Brad@email.com', N'123456', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (20, N'Chadicus', N'Chadicus@email.com', N'asdf1234', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (24, N'Bradicus', N'Bradicus@email.com', N'asdf', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (25, N'Dave', N'Dave@email.com', N'12345', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (26, N'asdf', N'asdf@asdf.com', N'asdf', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (27, N'dave2', N'dave2@email.com', N'asdff', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (28, N'dave3', N'dave3@email.com', N'asdff', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (29, N'Customer_001', N'customer_001@yahoo.com', N'cosc3380', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (30, N'Customer_003', N'gG234@hotmail.com', N'jiojio', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (31, N'Customer_003', N'gG234@hotmail.com', N'jiojio', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (32, N'Customer_00112', N'Customer_00112@yahoo.com', N'jajuo', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (33, N'Customer_00112', N'Customer_00112@yahoo.com', N'jajuo', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (34, N'woshicus', N'woshicus@hotmail.com', N'yughvb', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (35, N'watashiwa', N'watashiwa@uh.edu', N'njimko', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (36, N'newtrial', N'newtrial@workhard.com', N'sdfjkl', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (37, N'amazingT', N'AT90@yahoo.com', N'njimko', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (38, N'slime', N'saimali00@live.com', N'syedali', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (39, N'Trigger', N'trigger_test01@gmail.com', N'works', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (40, N'RandomJoe1', N'email@email.com', N'123456', NULL, NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (41, N'RandomJoe2', N'Random@email.com', N'123456', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (42, N'metwadi', N'metwadi410@gmail.com', N'metwadi', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (43, N'John Doe', N'JohnDoe18@gmail.com', N'asdzxc', NULL, NULL, NULL, NULL, NULL, 0, 2)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (44, N'slimerina', N'saim1ali00@live.com', N'asdff', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[users] ([userID], [username], [email], [pword], [streetname], [city], [state], [zcode], [country], [isAdmin], [orderNotification]) VALUES (45, N'steveaigbe', N'steveaigbe@gmail.com', N'Steve123', NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[visitors] ON 

INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (87, NULL, NULL, NULL, NULL, NULL, N'oRAE1xGd9ndOr3c4_QHwU1Wd-MooBd_N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (88, NULL, NULL, NULL, NULL, NULL, N'fSa-W-uvxw1HMEbLoTne3k_Fu5QPtvs9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (89, NULL, NULL, NULL, NULL, NULL, N'siq4MTvYf1KMmhXGuEauyqdpeaG3kSyE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (90, NULL, NULL, NULL, NULL, NULL, N'LjQ-ibhXB-WV5QveC4WcuIKT7VEEizdU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (91, NULL, NULL, NULL, NULL, NULL, N'Ca_POerKpO6dqxwx4tnLdibIUBhPhYJ3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (92, NULL, NULL, NULL, NULL, NULL, N'GiDDYv9Fr_FMoHedwdMd8IbOrIJ_eviS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (93, NULL, NULL, NULL, NULL, NULL, N'F0CWTVlCpZzV7Vm4V5WYszQ_CXYgQsVv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (94, NULL, NULL, NULL, NULL, NULL, N'nurItg1eHp26-JjkS_76j74_PT_on_G4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (95, NULL, NULL, NULL, NULL, NULL, N'zthCvrUOCXLxFfPLBFnmhAMH-nfkEEIr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (96, NULL, NULL, NULL, NULL, NULL, N'owzKDOJBmEHutHfLDTFIX48FrYooTWgY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (97, NULL, NULL, NULL, NULL, NULL, N'jFZGRK6dQh2OzYT4sBHmT89zQWBJuq20')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (98, NULL, NULL, NULL, NULL, NULL, N'R8GcOIc5TBDmujeMtHLEDUHs1nu2C2k2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (99, NULL, NULL, NULL, NULL, NULL, N'srjI5ktCmcvTHvsd57MpjbIEMwaZjtPF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (100, NULL, NULL, NULL, NULL, NULL, N'34SWn_kyEWSSjUtOCBfGSsf3TPXJXpei')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (101, NULL, NULL, NULL, NULL, NULL, N'rYJpNkwJ6Xr_pm5M67pNonAYMlSGXLc0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (102, NULL, NULL, NULL, NULL, NULL, N'eKQgppqES5SeNRVVuta9-45R8KSP6c5j')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (103, NULL, NULL, NULL, NULL, NULL, N'fV-RSqwrJiWfdyrI1mO6M7IYIbfyIhcT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (104, NULL, NULL, NULL, NULL, NULL, N'KkrixuHOOuW3xt-GpGlg4SYUvaG_bQgx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (105, NULL, NULL, NULL, NULL, NULL, N'5lM7BIeYH-sh5LH2Add86GjsqGBscUgD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (106, NULL, NULL, NULL, NULL, NULL, N'eTKSI10TaA-GVjVtKIoqC5M3Sh0Ed9pm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (107, NULL, NULL, NULL, NULL, NULL, N'rVJ7f9q5iWZcJ52IhsIfWna5gETsT-CD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (108, NULL, NULL, NULL, NULL, NULL, N'hG5As7-LKxhzoTaMOApxXbRMu8E_BLu2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (109, NULL, NULL, NULL, NULL, NULL, N'rrdhMN58lNd79VPF2FFlDtaMVKv2uWxs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (110, NULL, NULL, NULL, NULL, NULL, N'TlypNzMcIk5rwDt2QvvM9-SDgGJEDZE2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (111, NULL, NULL, NULL, NULL, NULL, N'nn-qW2rvAaaA0Zj_0bTGwmWx5_gMOpW2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (112, NULL, NULL, NULL, NULL, NULL, N'RpPhmRNFWiUKxryWHyAb-lNOns57KLVI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (113, NULL, NULL, NULL, NULL, NULL, N'gNRoei_lrTLgKtgez9OjbNPRKPdMIgvm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (114, NULL, NULL, NULL, NULL, NULL, N'3kpNIdxlzUrgOvM8JquypEOuBHGk4XWA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (115, NULL, NULL, NULL, NULL, NULL, N'6IIPBi0QfAVqPJ2ItQQ9PcObofpkk2Js')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (116, NULL, NULL, NULL, NULL, NULL, N'gk8Q8fRZUWdxNoESUFZsxnvyW4Y2m-F3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (117, NULL, NULL, NULL, NULL, NULL, N'oZFdtFH6I2d7IA4wS88qKiItA_YJ1Iwy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (118, NULL, NULL, NULL, NULL, NULL, N'xmzkfqXO0cevzmLDvZYTPSeD1kUddHA-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (119, NULL, NULL, NULL, NULL, NULL, N'v-WCEsLgt6nO0g_R3g0v_FtOku4BPFd7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (120, NULL, NULL, NULL, NULL, NULL, N'vxi-hXJcedkujeIeFJ1mq0vCFDgBRLev')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (121, NULL, NULL, NULL, NULL, NULL, N'pSkqCNMGA_40ERysZ2oAGj5G9OsS_p9Q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (122, NULL, NULL, NULL, NULL, NULL, N'HwUDzJWk3ZTyFMb8J2z7fRIpKjVMuLl7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (123, NULL, NULL, NULL, NULL, NULL, N'hh_NnIKFHeJkTDB3zQOf1cGmgoCjUaA3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (124, NULL, NULL, NULL, NULL, NULL, N'DIoaCAXkqnDcpy01kOnlH7KwObyOMdgT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (125, NULL, NULL, NULL, NULL, NULL, N'oGYfe98NaCa98j59rYyJ-8HeLHOubdZw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (126, NULL, NULL, NULL, NULL, NULL, N'W1Uq3JWzh2v4ghxvlyPbWZbIZijpuXuE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (127, NULL, NULL, NULL, NULL, NULL, N'2A1iRjlxnNccUsoTS1n1RwQSW_AcwKT8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (128, NULL, NULL, NULL, NULL, NULL, N'M1I_TXA1kXFQTJjSg5ye3tC5sml2oQyW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (129, NULL, NULL, NULL, NULL, NULL, N'PPiqR_8Gw1zpEQ-dyRGBeHXJKYSA5AhR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (130, NULL, NULL, NULL, NULL, NULL, N'fnjAEBln5pqvPyM5IZrNPlshJRoSQo65')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (131, NULL, NULL, NULL, NULL, NULL, N'ZfjQ13Nc9ohLLgPm4SIdjazpAhZUMEco')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (132, NULL, NULL, NULL, NULL, NULL, N'NVNbsy-IL7IkLyYHpHx1akIFB3pdXuNn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (133, NULL, NULL, NULL, NULL, NULL, N'ffb6PtRYxPd6eGYy7b2xpHfgRB70Fr-d')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (134, NULL, NULL, NULL, NULL, NULL, N'jbAhZUorKbHPd2bxmYGUSl4VCg3hdpta')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (135, NULL, NULL, NULL, NULL, NULL, N'G1mzHR06fl0AEBy5-nzXyGcmJkl0tuvL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (136, NULL, NULL, NULL, NULL, NULL, N'ka2IKPdLUqzF4z8lUJVeF5TVVeeWnm6W')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (137, NULL, NULL, NULL, NULL, NULL, N'sCX2olgFs61HT170hyucdBX5viiQN3ut')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (138, NULL, NULL, NULL, NULL, NULL, N'30yxuRcv5rd5P2rXae7DTKlTQ6ob_6U7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (139, NULL, NULL, NULL, NULL, NULL, N'0dAZaSg6dQhN6hFKLag0jD7Gow3Y4wAK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (140, NULL, NULL, NULL, NULL, NULL, N'tppRTwJBtXbI3SwKr4LkZgLwxFjgq3Ur')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (141, NULL, NULL, NULL, NULL, NULL, N'4JpTr5W3hHucP4CJobL7jlFCgxas6XOb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (142, NULL, NULL, NULL, NULL, NULL, N'biuQDxVSYm-0cJB4kk4nXhnyyxXDg9qz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (143, NULL, NULL, NULL, NULL, NULL, N'z3K7eeLT_Zk0i2N4NR7O1ApQPtnzLwkd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (144, NULL, NULL, NULL, NULL, NULL, N'PGr1rTlXRpeTjlZ5a7L_0p3AVU9nIMND')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (145, NULL, NULL, NULL, NULL, NULL, N'AZFU3x5BL2e0k7Ozn9JRRBkuWZf9ox4E')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (146, NULL, NULL, NULL, NULL, NULL, N'nRPoBGGFeImsjx1BtmEFrfLFINg00hF5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (147, NULL, NULL, NULL, NULL, NULL, N'Bx5dZvri8sc5ANdyr8_GrGyTN8k99xk7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (148, NULL, NULL, NULL, NULL, NULL, N'Qm4qQI8Mft4xfFvT63aO8eeok0QyVuEg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (149, NULL, NULL, NULL, NULL, NULL, N'FxEBJHAVcHX6DrXLrB_yuQVGj7eN2ueA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (150, NULL, NULL, NULL, NULL, NULL, N'56trbDHdAMgBNgvsiDOhcbO0PetMQjzv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (151, NULL, NULL, NULL, NULL, NULL, N'zMAiBIHqnT06jcb9rVEEAa3qyY4Y6fin')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (152, NULL, NULL, NULL, NULL, NULL, N'o_uUS4qufqiITuNSnjqiuTiWTmO2i9s2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (153, NULL, NULL, NULL, NULL, NULL, N'HkeyLV6aUdSwsqoPvH51Xe9jFmAZTFNt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (154, NULL, NULL, NULL, NULL, NULL, N'ZlpGCM74VrBxqljtTIH5b9u5JHtCNS7N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (155, NULL, NULL, NULL, NULL, NULL, N'bEio0Rf5pc3VhH9OylomeuGzU0Q51osq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (156, NULL, NULL, NULL, NULL, NULL, N'N0MziYvDqbvYS_PTXPJfJWlixFw8S_2q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (157, NULL, NULL, NULL, NULL, NULL, N'EM2_w5BAyXzU7x1YQBUptx7KBcNSkuU8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (158, NULL, NULL, NULL, NULL, NULL, N'8ZGSNjfL5vUnVcGMsBLXTsrXLNyR2STM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (159, NULL, NULL, NULL, NULL, NULL, N'pEVCAwf-hkXO6HBtGQjJxrL4PBxbLT3o')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (160, NULL, NULL, NULL, NULL, NULL, N'Od5HhmZLh2aGrwTHyN8bVuJKpe6o6_m0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (161, NULL, NULL, NULL, NULL, NULL, N'4aXat6JhmdVde0EOH1JwVJPMmN7uOq2M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (162, NULL, NULL, NULL, NULL, NULL, N'NrRlL10nYX4UAMQ7JV7fiev9-bdEkkpG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (163, NULL, NULL, NULL, NULL, NULL, N'LLE60N3wrpI-unm_OpjjwV8tGlMLKONj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (164, NULL, NULL, NULL, NULL, NULL, N'tZFdvPEi3IUkMT4SO7TsKjWOW0XCDydN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (165, NULL, NULL, NULL, NULL, NULL, N'O_sm5fn8VhVDZ6j7u5K8zgX-kwjNXoiz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (166, NULL, NULL, NULL, NULL, NULL, N'2MohF9JouMkdF4GoonM1d3E6CuM-LKPh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (167, NULL, NULL, NULL, NULL, NULL, N'55nUHpk3-lsFRBoojqizo3PoZrqBbwwr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (168, NULL, NULL, NULL, NULL, NULL, N'aRxBPC2Jx7-I-qIUEIHn8wSHfpL91jAb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (169, NULL, NULL, NULL, NULL, NULL, N'4QTdfI9CELC029-qjcnvaVDvdPvfqjVV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (170, NULL, NULL, NULL, NULL, NULL, N'undefined')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (171, NULL, NULL, NULL, NULL, NULL, N'8DdjewK8gNUSf4onwwkfPpCIgcezTpCW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (172, NULL, NULL, NULL, NULL, NULL, N'xpbyU8iVXv-XI0w6pVkAfFa2FS0XnOwR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (173, NULL, NULL, NULL, NULL, NULL, N't4n2uFTdMkXCUWx8eEC4otP-cYuKoYrT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (174, NULL, NULL, NULL, NULL, NULL, N'ccdjXVSmUU3AbIV2K-3S5kVQdXgbWVeu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (175, NULL, NULL, NULL, NULL, NULL, N'_Zw4GPB2HYyC8-VCx3ieJyOI4mXauHQi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (176, NULL, NULL, NULL, NULL, NULL, N'is7TFYX2qV1IwJKkGTl5A_bM18rQ3dRY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (177, NULL, NULL, NULL, NULL, NULL, N'92SXnEaHiyv6ZPDeDcm3JTe3AmH9gDDV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (178, NULL, NULL, NULL, NULL, NULL, N'F-a20wB6KwyKpWwoXMHblzusgCh7MX4x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (179, NULL, NULL, NULL, NULL, NULL, N'qZO70gmEpgnoR1sf-tMj_AHUq4p-xxv5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (180, NULL, NULL, NULL, NULL, NULL, N'XLEuX6FEPFWa8uEOFHrphyhsbwHGk90z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (181, NULL, NULL, NULL, NULL, NULL, N'_i6l6RC7BS79jRLQ7DMi6A4zTcJ-sp5J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (182, NULL, NULL, NULL, NULL, NULL, N'dTmFddBe8KXQUQBTFWx9kbX8w55B3Imo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (183, NULL, NULL, NULL, NULL, NULL, N'Ujwg4BVHu7lBqlWjCLBJr4evTet56eao')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (184, NULL, NULL, NULL, NULL, NULL, N's_zEam7skuzqJxR7RCKsfDnYBnLG3RDT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (185, NULL, NULL, NULL, NULL, NULL, N'lmRa2MHW4MjhNxnHT1i3-uFfWrAsGsBh')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (186, NULL, NULL, NULL, NULL, NULL, N'MHVYtjB79yF8zv6euoZqhZp8wrbwcnCx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (187, NULL, NULL, NULL, NULL, NULL, N'w1sPRRo_qQKzrFlkmq5-iCcVfiHv8L5_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (188, NULL, NULL, NULL, NULL, NULL, N'OMNkiaPIzbK6ecNuWnyjyd1fv0fr8dM-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (189, NULL, NULL, NULL, NULL, NULL, N'YZzrUFC50BNKLu-h_Tqqp-Q3-C7GgOH6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (190, NULL, NULL, NULL, NULL, NULL, N'h2HhotvgbP9v9dm1HmpffVMeq0HazPpR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (191, NULL, NULL, NULL, NULL, NULL, N'cb_-5kZe2NAjwbP9ZTCpTMRAUZsqXLgl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (192, NULL, NULL, NULL, NULL, NULL, N'2C-HERCUAcJNXsuNnEgxTy98IirUX55M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (193, NULL, NULL, NULL, NULL, NULL, N'CRh5MhE6rYKJahgcr4AMdd87AYLj1kea')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (194, NULL, NULL, NULL, NULL, NULL, N'JtJkeYW7YqNyLJe9VrmhjeQytec1FO02')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (195, NULL, NULL, NULL, NULL, NULL, N'KRo6CYQzEIQudKZLrdB4ZT6PTCo_19wi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (196, NULL, NULL, NULL, NULL, NULL, N'4mZfhoEIkUFQhE0GRtMoCuGsksQ9YuFO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (197, NULL, NULL, NULL, NULL, NULL, N'Ni9R-cPMZaPiJOKGJcuOvbPWCOQYP3c0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (198, NULL, NULL, NULL, NULL, NULL, N'1yzQymVQQDNLPAtdjxZeNeSKUfBDEIK9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (199, NULL, NULL, NULL, NULL, NULL, N'NdnpCblm__MtQZAUs1PF8AQ3yQfsBb_c')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (200, NULL, NULL, NULL, NULL, NULL, N'QpTidj44rQNpyfI8mfuUVNadG0FJYQ-2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (201, NULL, NULL, NULL, NULL, NULL, N'qOrxl1Hcx-CKQ9Y0_LRfdqF0jG8PTIkf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (202, NULL, NULL, NULL, NULL, NULL, N'IVIgGmkrY6z0AKSLGNZLharxspPiXCIw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (203, NULL, NULL, NULL, NULL, NULL, N'QmbEx89oVN_8yjcq4jDBcDN4gCQLR0dI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (204, NULL, NULL, NULL, NULL, NULL, N'jwi0zzSgyQ6b1dlRrN85TUgk-hXXamkJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (205, NULL, NULL, NULL, NULL, NULL, N'Nahp6FUbS4A-_9VstwMtO_vklhG7y2Zd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (206, NULL, NULL, NULL, NULL, NULL, N'ShPlIZUFAJ2q69_DlVnjkN2_Z2gcS0_z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (207, NULL, NULL, NULL, NULL, NULL, N'uiqS5siBjkvqYasMjnriOe5IfYgZcngx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (208, NULL, NULL, NULL, NULL, NULL, N'4TA4qCAln-n9-Co_zriuyOBNRTolOboT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (209, NULL, NULL, NULL, NULL, NULL, N'KaDD5LVABNnangKGwUBtgwqZpOQJnlUf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (210, NULL, NULL, NULL, NULL, NULL, N'NQOrivYLEbe14JLaSBSb3V9v6feVq_V4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (211, NULL, NULL, NULL, NULL, NULL, N'ZqwoLqUNF1CitaEoPsSRK5dLTlaFy9tW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (212, NULL, NULL, NULL, NULL, NULL, N'IBNmMB-Ic-E1SdlvI5JHoxvOndE9_zeD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (213, NULL, NULL, NULL, NULL, NULL, N'AYsPaVwQfsnPW-zRefw_GXAKQysstHUp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (214, NULL, NULL, NULL, NULL, NULL, N'ES73AVyzS6DdaYxOyzRbh0yo9M-2fDri')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (215, NULL, NULL, NULL, NULL, NULL, N'lyCsmUCRgbqVLZ_cG9CtEtpF_UkRJ0oD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (216, NULL, NULL, NULL, NULL, NULL, N'nb9i5NtLG0gjeQELE79ybNsU5OoR8iNI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (217, NULL, NULL, NULL, NULL, NULL, N'wdhu5QuxY_YWe_ND0Zwebcnc2ACH_Fj8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (218, NULL, NULL, NULL, NULL, NULL, N'VjuyHXX50lVhDJwSHUm1Qz5p5wvpO5B8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (219, NULL, NULL, NULL, NULL, NULL, N'Dj52Gi0Ay3eSgDRCemH2_m80ClaGAYMJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (220, NULL, NULL, NULL, NULL, NULL, N'bV72EHeIlboXJwN4M9MQ_-OK4MWYox8v')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (221, NULL, NULL, NULL, NULL, NULL, N'4iY9GwARdb57xpJ0ZvcrzBzX-_nAVoyd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (222, NULL, NULL, NULL, NULL, NULL, N'Auh-6eQ4Y4lqB4xKOemPeVdfGB0xGvCH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (223, NULL, NULL, NULL, NULL, NULL, N'aZL-xlvZAaeaZseKEl9_nlLq1jx6FJcc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (224, NULL, NULL, NULL, NULL, NULL, N'BHa9C__OF2pY7ieB9HGohPcUcN1s4SKF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (225, NULL, NULL, NULL, NULL, NULL, N'TT7Y8Bmp-rh63VmODMWijOTN6ugHSi60')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (226, NULL, NULL, NULL, NULL, NULL, N'abrINBvi3ydWjY5OM4eXixNyotyFKIhM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (227, NULL, NULL, NULL, NULL, NULL, N'WE8cM_2_Fv606fJat6eLDG98i5PoXhl2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (228, NULL, NULL, NULL, NULL, NULL, N'fwcduMVuUmSV628xX9uNoLrUJGdQoCC_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (229, NULL, NULL, NULL, NULL, NULL, N'8h1m7LNTF_CMiXr76oc85cqV2DMSz_SL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (230, NULL, NULL, NULL, NULL, NULL, N'TKopIxfTzYxlYmhWXKFIbCEjsatl32IM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (231, NULL, NULL, NULL, NULL, NULL, N'cCxakrVLSV4nTmtYUUKQcsLGlT6CpdNe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (232, NULL, NULL, NULL, NULL, NULL, N'9EvESjzswKBOS3SxXPdJ5CnP4e7suNw0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (233, NULL, NULL, NULL, NULL, NULL, N'b5GZmT5_6LZPu3nu2trDlnG9XDeXYmDo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (234, NULL, NULL, NULL, NULL, NULL, N'ceHFJsfTG0oYskMRj1NS3AJ5utapsgO7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (235, NULL, NULL, NULL, NULL, NULL, N'Kfbhyk7Jq1DbII7-oNCpvDRo-MSCzMI-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (236, NULL, NULL, NULL, NULL, NULL, N'zG0nRjXiSTEOl09P7j8higzeyMhvFAn2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (237, NULL, NULL, NULL, NULL, NULL, N'J0AAFl1zxs6AzKn7DZFs-IkAnZYv7Ev_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (238, NULL, NULL, NULL, NULL, NULL, N'ogW6eebydpbjGXU-D6hGEVofqdoEJHys')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (239, NULL, NULL, NULL, NULL, NULL, N'KUEf85j0e3bAvHxbydLg1EN-MZdsRQEE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (240, NULL, NULL, NULL, NULL, NULL, N'nf6LPnzA2hcK22qI4NQND12QOWVesZEe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (241, NULL, NULL, NULL, NULL, NULL, N'RCTlX-7x06bQShQg2LodUMk4IrEfvqXp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (242, NULL, NULL, NULL, NULL, NULL, N'4RDOIpAjkn_3FFzA1Mj5QJfadzHSv6Fk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (243, NULL, NULL, NULL, NULL, NULL, N'xxJCD53HxLsUr7v8_ec_qHuF3evtGBaP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (244, NULL, NULL, NULL, NULL, NULL, N'4YLBPmwirqew3oIgWp597yr6dZD6XGTM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (245, NULL, NULL, NULL, NULL, NULL, N'OvrvENwvDyztNaDFJHldo87WH_wX5PI8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (246, NULL, NULL, NULL, NULL, NULL, N'ouhZ1FQ7es4qN1NuOavrwCzB1Uk6jHz1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (247, NULL, NULL, NULL, NULL, NULL, N'BucAHqo6L88hSPUk3WoInDBeYTKQgl3g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (248, NULL, NULL, NULL, NULL, NULL, N'HSBtQFGfw72i_nmJBQhVAgBBqfOJmXdD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (249, NULL, NULL, NULL, NULL, NULL, N'kURfD_LagDhyIhlDZgYeZMdqvIj4m_6e')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (250, NULL, NULL, NULL, NULL, NULL, N'FmH015OWE0OuCCKV6Ljf7bxV989UA25-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (251, NULL, NULL, NULL, NULL, NULL, N'FTQgcbGg7WsATj0-C1bkpwZsbEIESOCy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (252, NULL, NULL, NULL, NULL, NULL, N'V4m3QEAITvX4LJo2wg9pMb9WzdwcxWEM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (253, NULL, NULL, NULL, NULL, NULL, N'zLVSLzSXvuPEAXVnNlK7R10Y-Wl5PBUE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (254, NULL, NULL, NULL, NULL, NULL, N'k7GGx__j8v_PaoLNnkNbuNpJjMlPt_sS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (255, NULL, NULL, NULL, NULL, NULL, N'EjgB1V4deip0ASBTeUvG3_QCRw6-kCNb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (256, NULL, NULL, NULL, NULL, NULL, N'E0qhkizEA6lsip0BbjkXudmHBxVK2nOm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (257, NULL, NULL, NULL, NULL, NULL, N'XXH7GEOkdmZcHrhFtkAsEdhhIYJLO6kQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (258, NULL, NULL, NULL, NULL, NULL, N'ProQCYqBLPm1w0Onq_iWV5aN46Ofd2BN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (259, NULL, NULL, NULL, NULL, NULL, N'nHtpcaYuKljAra2v2-MOhH9k56r4SAhR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (260, NULL, NULL, NULL, NULL, NULL, N'phcH8uA0M7Wr9Qeuun4KHHlue3Iaxfhc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (261, NULL, NULL, NULL, NULL, NULL, N'k9tkkPbpo5zUuibBcv4anx8kCC5CMb-e')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (262, NULL, NULL, NULL, NULL, NULL, N'mIMpXMW70UQ5mmBqUF0yuBDOpIfngUot')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (263, NULL, NULL, NULL, NULL, NULL, N'iA-u2eh-t7XG88TNXS6UtTc3TbDINZt4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (264, NULL, NULL, NULL, NULL, NULL, N'LASwafdXG9DrqfAau7INrtA-Ty-KLg6Y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (265, NULL, NULL, NULL, NULL, NULL, N'8_8R_L38ofiVJfWuOCpKJcdJP_9RZyFa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (266, NULL, NULL, NULL, NULL, NULL, N'NB_2SMO8-xSBk5U75qeSGXB3TBTmxsOZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (267, NULL, NULL, NULL, NULL, NULL, N'QdlnSkpS_ouq_vnisniyCVFzVnzlqhMX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (268, NULL, NULL, NULL, NULL, NULL, N'Tsj7YxYXscgktLAO4xRGUfAznIWPo-oT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (269, NULL, NULL, NULL, NULL, NULL, N'M1akOiczsROQYEdXgTmRLrlEAVwNssmz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (270, NULL, NULL, NULL, NULL, NULL, N'EOJVGhuO8vJ-fMFXdRNd30HO7luewqNI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (271, NULL, NULL, NULL, NULL, NULL, N'qQRVRon2lD4TZC-xADXktYJjJ3EK6GQh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (272, NULL, NULL, NULL, NULL, NULL, N'XqJHwSo-fJWEsjpHV8RLQeO86dR1jmQ7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (273, NULL, NULL, NULL, NULL, NULL, N'TMb1qS9-cI3GfDx_g6xpApyQupysD21K')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (274, NULL, NULL, NULL, NULL, NULL, N'jv-S_PGFENZ_CfZuBsQBd9Ez7LHHi6as')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (275, NULL, NULL, NULL, NULL, NULL, N'sB1LS8HlRq0J879zyEm11SpJTX-VBzkh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (276, NULL, NULL, NULL, NULL, NULL, N'q86HsoTXt91dOkstU5nFW2PEzeJcJJE3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (277, NULL, NULL, NULL, NULL, NULL, N'5BCl3iegz-Y2trka0pgxnBu1TfS9bL14')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (278, NULL, NULL, NULL, NULL, NULL, N'yJJ-RvAiHZd4LV4aY6TbDAirpqQGOl8D')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (279, NULL, NULL, NULL, NULL, NULL, N'B8nZjwPfMj0LRjHUdU1B5wWNmyNBUjrt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (280, NULL, NULL, NULL, NULL, NULL, N'm2RLWCaaFPC56pB4glW7Pyp8xoiCPMru')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (281, NULL, NULL, NULL, NULL, NULL, N'a7DycpaxleYwIYO7vGL6yWktoPMpdCaq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (282, NULL, NULL, NULL, NULL, NULL, N'NDmqWpzmUeAqWtoJhkXCW1L7k0n9YG0x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (283, NULL, NULL, NULL, NULL, NULL, N'D_0HbooYZZ3A-W2KRQ66jTs6iiYmTxnx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (284, NULL, NULL, NULL, NULL, NULL, N'V_n7Xz6QvSSPKhYTBDJg8EJxgPZ1BoHe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (285, NULL, NULL, NULL, NULL, NULL, N'ZiZ4foK-7Lse7gBCtBBMtHVxE3Hhwm_S')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (286, NULL, NULL, NULL, NULL, NULL, N'Eb57d0b5Qj78KwOhb6Z5QbiotVyh67Jx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (287, NULL, NULL, NULL, NULL, NULL, N'rRNajlRUmCsDCc8aokvpSljF6J2D8af_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (288, NULL, NULL, NULL, NULL, NULL, N'H1aW7uHdZIVAc5BY_zGQuALPXDhObF9j')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (289, NULL, NULL, NULL, NULL, NULL, N'dTc31v8VRy6kNfHftXW8cHsVisV90HJk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (290, NULL, NULL, NULL, NULL, NULL, N'GyVs9r6plTGkI52_gdcaMcfu2kuD9Yyc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (291, NULL, NULL, NULL, NULL, NULL, N'ZurlnIify4Odv6MRbkwHXGvfJPVL4Kri')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (292, NULL, NULL, NULL, NULL, NULL, N'JYolRTncRt8ZX5lFrY4WMl12VxUjaLEo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (293, NULL, NULL, NULL, NULL, NULL, N'rlnR7S61A8D0Rl1Za4FIiD7su-PMFE7x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (294, NULL, NULL, NULL, NULL, NULL, N'IKLbyMfE3tGuojOsAaARuWR1HdgNEnah')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (295, NULL, NULL, NULL, NULL, NULL, N'EARfIGRErpGZ8Ry4_cIT2xuV89xSkPCU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (296, NULL, NULL, NULL, NULL, NULL, N'7BRh1qs2nwESTHurP22XKKhm25_h8PIM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (297, NULL, NULL, NULL, NULL, NULL, N'bsNwOJMgKBUpNAtv2Gt0_1BpGaCjT0pm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (298, NULL, NULL, NULL, NULL, NULL, N'goYNQEJRrWchuMqw_l1zFxtUHCHX_1r7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (299, NULL, NULL, NULL, NULL, NULL, N'HAmTf3J8k8NbcvedTnav9IvA4179HBCJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (300, NULL, NULL, NULL, NULL, NULL, N'y_pM2qgt8lQCuySTXjoL1eT2cGd8jwYf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (301, NULL, NULL, NULL, NULL, NULL, N'cfZ1uheyxxUivJmcO9VLDGlkZ5eVZLku')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (302, NULL, NULL, NULL, NULL, NULL, N'ZW-WcQ8OCgTv59rFbrcL8xPkT8ThLnKX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (303, NULL, NULL, NULL, NULL, NULL, N'0vy09XSvPGfxXDhrRk0yah16ZmxxIbsd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (304, NULL, NULL, NULL, NULL, NULL, N'ir-fZ7X3A7Og07TStdB9QGouUUoqnLbP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (305, NULL, NULL, NULL, NULL, NULL, N'PmturMqI8L8hD4VnuERkJd04QCgjGxsW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (306, NULL, NULL, NULL, NULL, NULL, N'_f_fn1QUSULvxIWm3yM7sNsDrTkkqAca')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (307, NULL, NULL, NULL, NULL, NULL, N'BcK-utdcvDEWC7V3UNaNBNBn6YmNSLuK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (308, NULL, NULL, NULL, NULL, NULL, N'gAyaWqlq8TUmn9MbS25CG_VuNEJBzObc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (309, NULL, NULL, NULL, NULL, NULL, N'cZMZdSnDvtnl1PUJW9zGw13zxJjh7pDQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (310, NULL, NULL, NULL, NULL, NULL, N'i6EVjYDUlyVlc_Z5yAZ9efstcZMZSztq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (311, NULL, NULL, NULL, NULL, NULL, N'8QjHqzV0l6eWEe4Dxjs1u_hjE-xJI-ga')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (312, NULL, NULL, NULL, NULL, NULL, N'5o2xrAXWgC-965Mn1Sp_QHuJten3mrjg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (313, NULL, NULL, NULL, NULL, NULL, N'upSaSVxXVL32XJiteZPOBIbB4nmV6bAV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (314, NULL, NULL, NULL, NULL, NULL, N'ifwLyjjAn9Ol5CLMk5lE4USHkhY_hNsu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (315, NULL, NULL, NULL, NULL, NULL, N'RxAdRMNvCQub6TOQmLgian84J1W4yInn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (316, NULL, NULL, NULL, NULL, NULL, N'8UmdJomXJLC2rx0N9mOJM_gagcC3MMza')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (317, NULL, NULL, NULL, NULL, NULL, N'5Av0y85HV7eno9qvqZUHx6Q9A1BU5QX6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (318, NULL, NULL, NULL, NULL, NULL, N'8uoMY1yML9mxeOVER8BD51vUKjECCE-u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (319, NULL, NULL, NULL, NULL, NULL, N'jRw39EJoqc2ky-WzCGjFzDXaF6ri7Ca2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (320, NULL, NULL, NULL, NULL, NULL, N'UAu2gr_tYwGbUtjTuFurs2nA2IANOD9O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (321, NULL, NULL, NULL, NULL, NULL, N'nguN4Nrv-nopeVhbzFxeCP2fR6A5xCY4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (322, NULL, NULL, NULL, NULL, NULL, N'FB9w8oq6H3FQaiPvHk-inxbEBZd-UmY_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (323, NULL, NULL, NULL, NULL, NULL, N'I0TpPyuk4O0EvIZcFiKiAirpgos5CKsI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (324, NULL, NULL, NULL, NULL, NULL, N'QOpNBHz3m57EhDk5aFWKRf3B7LlywqXQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (325, NULL, NULL, NULL, NULL, NULL, N'835ciWpWI1S1kJip4l4ju1-lUucH39Aw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (326, NULL, NULL, NULL, NULL, NULL, N'boV_tiCwNRfuOb7n8Hy-Qh3DDw_8lX0b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (327, NULL, NULL, NULL, NULL, NULL, N'M_Tx2jfALPpdLPhduF_EPa7nFc0lcsar')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (328, NULL, NULL, NULL, NULL, NULL, N'w4kvm4lbWT779w7lu-fOK_y5TkBURE_z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (329, NULL, NULL, NULL, NULL, NULL, N'fkxZYu36eU6QYsdc8UFnjDE_78HCd9c8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (330, NULL, NULL, NULL, NULL, NULL, N'-miv37jnY5RoknWOcQ5F3sTlp1EZHtCS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (331, NULL, NULL, NULL, NULL, NULL, N'MDq1TAR9fnDu41gdOyDp4zt0AbFezTTP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (332, NULL, NULL, NULL, NULL, NULL, N'g7GNKW3LZDV102zC77snqLqRwuCBwQjW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (333, NULL, NULL, NULL, NULL, NULL, N'muj6fr36VxF_pYF6GES_bwSM-tkmRVdx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (334, NULL, NULL, NULL, NULL, NULL, N'Iq4-iAWCLB5GPtwEg6Zbggt9zKkFZHZz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (335, NULL, NULL, NULL, NULL, NULL, N'isndIGINUUKQrTJ52CjN5G1XS715hyT2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (336, NULL, NULL, NULL, NULL, NULL, N'Bwprw5_h7HrDK8OcJT1zZ2aeL95xcbE1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (337, NULL, NULL, NULL, NULL, NULL, N'ehhD_jEo6rgmwxzcw-711PifP9iv_uE1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (338, NULL, NULL, NULL, NULL, NULL, N'z2M49kiZnGkUqKkmSD1g9qI-qczqUcnE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (339, NULL, NULL, NULL, NULL, NULL, N'22gpQXhpyd7zrKXIoEcriJcUFVsDbQfc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (340, NULL, NULL, NULL, NULL, NULL, N'cq8C3Hpw-BtL9If7D_aP_V4Bw9QsQC4O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (341, NULL, NULL, NULL, NULL, NULL, N'aArTytpjuzVN9PA_i4codtLkwBiTjWfe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (342, NULL, NULL, NULL, NULL, NULL, N'RdKyGEFbAbamP-LZ3kNeZ0XSfuYsLE2M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (343, NULL, NULL, NULL, NULL, NULL, N'gT3vT2tphpEWM888pEMVnQvivKzUjFhb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (344, NULL, NULL, NULL, NULL, NULL, N'ovjycmYOYqo0_2WjEkjCaQzo0x1pClNm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (345, NULL, NULL, NULL, NULL, NULL, N'tFYHlkM0iFqpJocD0DbO4eb1j1TjkJuU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (346, NULL, NULL, NULL, NULL, NULL, N'62hh_krYgjT7XNq_1-j3a0NhnSaTfMII')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (347, NULL, NULL, NULL, NULL, NULL, N'VrdX1BCVmidrE_HQHkJS0ftNbH-HXffh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (348, NULL, NULL, NULL, NULL, NULL, N'TLfutH6ZV2aSrkshBzqkeNi8jH2z357u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (349, NULL, NULL, NULL, NULL, NULL, N'WaXGCvP5okpkTG7oEpDpTWU54m-VGhpI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (350, NULL, NULL, NULL, NULL, NULL, N'Ib_T2TYrEDphW08jr1Go5mxZ4oC0Bbem')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (351, NULL, NULL, NULL, NULL, NULL, N'KNqZGa9zE6cgMUM_fL4AuBPccQRNEx5N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (352, NULL, NULL, NULL, NULL, NULL, N'RPDvUWuLHx3IIxnbJ_4lNAjs4raY3C7b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (353, NULL, NULL, NULL, NULL, NULL, N'WQOosipXkt2WjA0ydewNUwBAifwf9bbK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (354, NULL, NULL, NULL, NULL, NULL, N'JQTmDRUekh4InexsKtXSyBQVQCWNtXN3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (355, NULL, NULL, NULL, NULL, NULL, N'oSWngpTzw3kjACEaf3G1e6C0m99RiHwz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (356, NULL, NULL, NULL, NULL, NULL, N'VgX8nclq0iDfZU2goy5I94FB0VTBmu8U')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (357, NULL, NULL, NULL, NULL, NULL, N'pXApCr1r-xC1eX72xNioVleEILsEH4Sm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (358, NULL, NULL, NULL, NULL, NULL, N'f6bm0_B_Kitfyn8mQAdKdhYhmc_Sy2lQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (359, NULL, NULL, NULL, NULL, NULL, N'Rc21lz-Bj4Hw9wU76j9n3f2EbNTcwT2_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (360, NULL, NULL, NULL, NULL, NULL, N'3XotVDewHzj-j9yivlUbt2n7TrpfwNpi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (361, NULL, NULL, NULL, NULL, NULL, N'W3FFu-JJDthyJ3CjYotP4SekfC2e61PC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (362, NULL, NULL, NULL, NULL, NULL, N'sVdDyokazxbawJVVnw0dnhfv1fbelEQa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (363, NULL, NULL, NULL, NULL, NULL, N'iPLVLdG_qQUn8dSG8CXNvztkk-rZTp7-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (364, NULL, NULL, NULL, NULL, NULL, N'xvMJmKVVinyaFYyepbnm4Po4Y1OZFAVY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (365, NULL, NULL, NULL, NULL, NULL, N'sUstXiV9nq7GHAeA4fHS7BhYxou2fKb7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (366, NULL, NULL, NULL, NULL, NULL, N'JRN_HM_o3uNC9lZ0ALy8aBDbpMFsE4Qm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (367, NULL, NULL, NULL, NULL, NULL, N'GNdZ7Y_LS6is8FvAWP5Z_BynfMNg7HJB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (368, NULL, NULL, NULL, NULL, NULL, N'JxQaBDUv53eE967EQ3hMtYgWWOOeMiAr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (369, NULL, NULL, NULL, NULL, NULL, N'5AK7UI1U4PzwL31wBXWgn9sx5uHhcgTa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (370, NULL, NULL, NULL, NULL, NULL, N'RPo1szE16rAphImE7fne8mODp5oCF3jw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (371, NULL, NULL, NULL, NULL, NULL, N'XGQ9rVi_OZg5hn2at5Srei2Qfg8hcrlF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (372, NULL, NULL, NULL, NULL, NULL, N'5qT1REOAvOUgxiCH_k_DtdME16CXUJMZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (373, NULL, NULL, NULL, NULL, NULL, N'ok5zoqNFleaG5z6BYM7mSLxVWeV6qAQE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (374, NULL, NULL, NULL, NULL, NULL, N'gcbCKFBCdiRc1MIK9EKqjHrBEKLasOWk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (375, NULL, NULL, NULL, NULL, NULL, N'oXRc8aoWWjmL7f_N8u8U5V4UbG-aP0Ug')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (376, NULL, NULL, NULL, NULL, NULL, N'7KdhmsUBUL2LeKnhU1P_4CAwDx6u13Fc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (377, NULL, NULL, NULL, NULL, NULL, N'CR8WvZ4dkomTKLheAUpSN4Jw7ZagqhV_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (378, NULL, NULL, NULL, NULL, NULL, N'ow_daEhgG0g_WdLItDpZ9lC00_ZaKrXE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (379, NULL, NULL, NULL, NULL, NULL, N'yhl1N-MXtVOmwV3BX2TR1Lxn--0dGk_3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (380, NULL, NULL, NULL, NULL, NULL, N'8LxV3r7jnUsRPwl-hvlR4OnCpYuIBl8W')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (381, NULL, NULL, NULL, NULL, NULL, N'vGB97wMZXi82oXSHAiSgDQs-4Xo6fNZN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (382, NULL, NULL, NULL, NULL, NULL, N'ENUTx1VKqsn6KL7NccqdyfhK_pH4VpPs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (383, NULL, NULL, NULL, NULL, NULL, N'e4to1WuxilPtu181NaBASCuO6pH-9F8D')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (384, NULL, NULL, NULL, NULL, NULL, N'Q7gU8MrhK_ModzmVkHn1IRNuTXsp_q5Y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (385, NULL, NULL, NULL, NULL, NULL, N'c3QG3Q0ma2HAhC2ybmwsszgPD-R50uBb')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (386, NULL, NULL, NULL, NULL, NULL, N'ndFREtr46bKx5AmYsuGJPClpqYqdGVl7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (387, NULL, NULL, NULL, NULL, NULL, N'wIc_-cwsA4uqXpKAi0oFtByY2SgFa4Ks')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (388, NULL, NULL, NULL, NULL, NULL, N'NOwNfcMUPizbGdSpbohrG6smUq_xGG1M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (389, NULL, NULL, NULL, NULL, NULL, N'wIloDcruDbk_XWZYnmqewK-UPr-lCE9D')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (390, NULL, NULL, NULL, NULL, NULL, N'7lYKDx14gliSv_WT4ZHK52c22VIxyGr3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (391, NULL, NULL, NULL, NULL, NULL, N'V62cFh1KNyCA8eOG2CTHCX3xjKg2lRlO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (392, NULL, NULL, NULL, NULL, NULL, N'cAsEhArXSDlf4SNWzpZIH6RylbBaUTIV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (393, NULL, NULL, NULL, NULL, NULL, N'uOf27cYpPcwWbhqqPQ53sAbsM1YEG65J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (394, NULL, NULL, NULL, NULL, NULL, N'ubCr9DVc2Za6G9fncu7ZFlw--kJT5Fm_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (395, NULL, NULL, NULL, NULL, NULL, N'TLCXryDRv-afMG5rXIcE-bm5URACVsiw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (396, NULL, NULL, NULL, NULL, NULL, N'AUqIeg86rHWvBN1QL1NSXztI56hVzhPP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (397, NULL, NULL, NULL, NULL, NULL, N'CJGRYJ9jgJOOl_Iz9f_YfO_kCNm0hgvc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (398, NULL, NULL, NULL, NULL, NULL, N'znm9GddrjN2QadK6JOdn6OsTKKX0P_fP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (399, NULL, NULL, NULL, NULL, NULL, N'RJLWaAoOlOwzyFQQQS2Oknh7A5NwvZCG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (400, NULL, NULL, NULL, NULL, NULL, N'8cUvWsbAwZA-W2-P-x9cuLhMAKTWafTD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (401, NULL, NULL, NULL, NULL, NULL, N'8ipVhLuDgIn4yC9DhW_XXeKN9YFfR8SP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (402, NULL, NULL, NULL, NULL, NULL, N'gKJBDBFCoxmxs872kGXZZ9aLDfbj_BYU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (403, NULL, NULL, NULL, NULL, NULL, N'I-b6xo3KYXr--EBIss8A0J7xjCylFqJj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (404, NULL, NULL, NULL, NULL, NULL, N'KFisUdMeUqqxyLzVyHWgunu5qo8YWvqY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (405, NULL, NULL, NULL, NULL, NULL, N'sFGAqditgLathLGqHPSbkhrHnR_wonr6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (406, NULL, NULL, NULL, NULL, NULL, N'QyAXMN0PSOR22vqEs0pRZfnX25O6d6vu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (407, NULL, NULL, NULL, NULL, NULL, N'v8ISC6kTrKOr4MG0ZdiS9xd8fl-gTe5g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (408, NULL, NULL, NULL, NULL, NULL, N'R0lqWhPxTC9wOJfFxwDX97zje05VIIPL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (409, NULL, NULL, NULL, NULL, NULL, N'nwW_NSUzgs3SUUk9Mr000GSIVn6h_Jfv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (410, NULL, NULL, NULL, NULL, NULL, N'hB1qP7YwCzMb5rnFlvZi4zWmGqU245i_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (411, NULL, NULL, NULL, NULL, NULL, N'M9lAb7XUPObfUI3fgASVDUM-7xAvAJzv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (412, NULL, NULL, NULL, NULL, NULL, N'uBoOjb2gZFo0Ts0pHdtV7bXFj7WgFyA8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (413, NULL, NULL, NULL, NULL, NULL, N'hxrRIifAelTRmu1wkRwzqaZHQGoGYnyj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (414, NULL, NULL, NULL, NULL, NULL, N'2KIv_DFi1iCRoIMJpX79t-vbAINniNAo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (415, NULL, NULL, NULL, NULL, NULL, N'2xNNJhhNX25-GRsZHlY_2Fl-ssEKJdd5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (416, NULL, NULL, NULL, NULL, NULL, N'5Ur74BMu4cEXHjuJezARFD2SwgdKYU5A')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (417, NULL, NULL, NULL, NULL, NULL, N'u4MHEgftOABOpgbpmsJ2dq-wJ7IO-MpJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (418, NULL, NULL, NULL, NULL, NULL, N'5ezXPJiha0StZ4Oiq9p-hM5QclnUT4Fw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (419, NULL, NULL, NULL, NULL, NULL, N'tPkYGx1LiyJZgxoY0q2JJaje4F1Lxymv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (420, NULL, NULL, NULL, NULL, NULL, N'TEBta1RFLzvIpZwCXUEEh7FsfDczvTCn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (421, NULL, NULL, NULL, NULL, NULL, N'D_4D678Y74LHjMoCKeCD3ET2FySNdmaT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (422, NULL, NULL, NULL, NULL, NULL, N'XL4BVp7Kb3sC-J8uyJcB50IGcXsAXXYT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (423, NULL, NULL, NULL, NULL, NULL, N'tJg_Nmi2YvW8cSLrT7yz8zPQgMvsj3ip')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (424, NULL, NULL, NULL, NULL, NULL, N'QMYexdBxMZFk_udbBWW-VZZXNqZvi1ri')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (425, NULL, NULL, NULL, NULL, NULL, N'Y1nENpfLYyMqzFxz-wsUdqW4eQTx004b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (426, NULL, NULL, NULL, NULL, NULL, N'tuf9pXYlQxUPyQT1hDTlC8yFOF8KY_yQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (427, NULL, NULL, NULL, NULL, NULL, N'8n2RH_LKW5lGjdhN_2nBX6osEATBYfIa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (428, NULL, NULL, NULL, NULL, NULL, N'cYQcn0ay9Ywv-DGQy9q1S9TbuBOcnp9M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (429, NULL, NULL, NULL, NULL, NULL, N'InCZ7CeuPpiv4XpNNXE0QgJCZpa-qqBi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (430, NULL, NULL, NULL, NULL, NULL, N'Gwzf3Axm7La9HzbeXbEJoFr4ulT5NJB4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (431, NULL, NULL, NULL, NULL, NULL, N'JdACe3gzSphz6ubAYWsVXSKhDYzAhvQg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (432, NULL, NULL, NULL, NULL, NULL, N'gFDxLz_fMdARDK--oPtywmaogkLnIxDa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (433, NULL, NULL, NULL, NULL, NULL, N'IRyJRpQ-Gaqbzo9-LiIF59r6jy7U1lUG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (434, NULL, NULL, NULL, NULL, NULL, N'-XOkgD2UHiZou7LHGjhmocyU9IsHN80I')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (435, NULL, NULL, NULL, NULL, NULL, N'GCq3txuY2yPc8V6sf0c2dWEuEIjQnLuh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (436, NULL, NULL, NULL, NULL, NULL, N'JZG9SvcFwo3oNYIJezETco4neERJXAQO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (437, NULL, NULL, NULL, NULL, NULL, N'Scz3UIOo7xHwlRGL8co5o0C8KkBter4R')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (438, NULL, NULL, NULL, NULL, NULL, N'TpkVHzWRjkv8dvUIQLQjniV22dXZ4Nm-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (439, NULL, NULL, NULL, NULL, NULL, N'tqp8p6nQgFjw9M0w-qoElEdRVWYbY4ZE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (440, NULL, NULL, NULL, NULL, NULL, N'NpLuLSV_jSsd6fhAO_N4vazpdnVCHIho')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (441, NULL, NULL, NULL, NULL, NULL, N'J-hiPAgMoklbMXfV8p-AAybZla1wNffr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (442, NULL, NULL, NULL, NULL, NULL, N'7Vmeo1ADfLYSsuG7dw1Bv8xlyNj34kdG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (443, NULL, NULL, NULL, NULL, NULL, N'5yVCwzsG42PGbAJF6oQiEcM5QPc4gxsn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (444, NULL, NULL, NULL, NULL, NULL, N'B01pjS1kSEZcg5AGqkTjFiHjYeq6A30S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (445, NULL, NULL, NULL, NULL, NULL, N'c4YYWgEw4g6jIH5JSftD8ndVw-H-fbGD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (446, NULL, NULL, NULL, NULL, NULL, N'utHJha8swlM7clrwLmWzWoAEt1SSfa-x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (447, NULL, NULL, NULL, NULL, NULL, N'855P55gJIFwxW0csEoiUlwasMMBsgBNQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (448, NULL, NULL, NULL, NULL, NULL, N'XCAwMHFrb1Dq3b-7Gefo_duySxXwVFB2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (449, NULL, NULL, NULL, NULL, NULL, N'Sj4r4B9gAJrgNOSYoPNcLsMbVqoZlNFk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (450, NULL, NULL, NULL, NULL, NULL, N'FGuoFbFzkR_UFwiCi7lTl-CPO1wqQwYL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (451, NULL, NULL, NULL, NULL, NULL, N'8TAHT3HORmMB7gyv8FzM4iMOOLk9HTeg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (452, NULL, NULL, NULL, NULL, NULL, N'qocIjPDTwWtWaz0E6AzWWvhMYy5ihevr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (453, NULL, NULL, NULL, NULL, NULL, N'zztfZiPbECryNp8T2qhTNi8CsMyQbSZh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (454, NULL, NULL, NULL, NULL, NULL, N'TdAdGwiVEgisFuxjRKwrUgeFOVQTMZxN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (455, NULL, NULL, NULL, NULL, NULL, N'DkefwBEfaG0a42Bq2KJBJB5ftyziSvYZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (456, NULL, NULL, NULL, NULL, NULL, N'OpR1jNIR0-OHyiTA6hdleuIl5qRqocgm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (457, NULL, NULL, NULL, NULL, NULL, N'WfbuppapkMPmWSE2Gyuw-IG9k72nDO1c')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (458, NULL, NULL, NULL, NULL, NULL, N'sPECd97vF4_i_R5eETWYS7X-sdyNWbUw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (459, NULL, NULL, NULL, NULL, NULL, N'6GFZOs9XSdPMOo_NX4p8xkxCJOWPvbDh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (460, NULL, NULL, NULL, NULL, NULL, N'2NZc7x2poHbHhzKqb1e-MiBLAkKU-093')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (461, NULL, NULL, NULL, NULL, NULL, N'sfAnDyMDaCDk5INWxffYDzaPVaB2Kdoy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (462, NULL, NULL, NULL, NULL, NULL, N'wyX-r1xTxp0mT_BNsW0vYAXwwYavgCTR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (463, NULL, NULL, NULL, NULL, NULL, N'yKPSjheu-uTRvOxooV0IsSftRHLtRLcH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (464, NULL, NULL, NULL, NULL, NULL, N'QjiUo-FbeMrE2PNPLnGqK3iS0OL_NksK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (465, NULL, NULL, NULL, NULL, NULL, N'-abH8Lw0jMD00rKN3GyJegN9n__bNNKL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (466, NULL, NULL, NULL, NULL, NULL, N'YK4OwPMsDPd4-ZT5fYoi6gmRPlpF1X1s')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (467, NULL, NULL, NULL, NULL, NULL, N'kTWMALNyYWyFXMcRIMMZ5FcFTmQ8riXR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (468, NULL, NULL, NULL, NULL, NULL, N'djwqjbujkN2O5R6itgdGVwnSuV3AQtuQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (469, NULL, NULL, NULL, NULL, NULL, N'TWTLS5MuPhDQrIzQkk8Q2iz4E8yWvy8p')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (470, NULL, NULL, NULL, NULL, NULL, N'HgLHIKDHWWa-ZIzofPpzkCaK0DN_NfcH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (471, NULL, NULL, NULL, NULL, NULL, N'kgEAseb7ExJrQCJT4btTC2RSymn381Yv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (472, NULL, NULL, NULL, NULL, NULL, N'bH3QbxRTghO5lUqHWn7Lotl4j4fbYQoI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (473, NULL, NULL, NULL, NULL, NULL, N'kXYnDsqFIF9rOWi0Nycu8QmkSa_8waqv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (474, NULL, NULL, NULL, NULL, NULL, N'5sZa7VbqPrFCv9K2-6KO_DCye7uOxt1f')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (475, NULL, NULL, NULL, NULL, NULL, N'x6PSYnmwVhBb4kQDUkyoh1tsHp46oru0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (476, NULL, NULL, NULL, NULL, NULL, N'ed1ous7y87zYXfVPi7WokbVthBxrh4JH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (477, NULL, NULL, NULL, NULL, NULL, N'tDB1JpCWDEOYeCoVXmc9cJzYWxld8tvY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (478, NULL, NULL, NULL, NULL, NULL, N'4qRCrn4TTR2BYFcQCXA7drfQLWrFYQ2T')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (479, NULL, NULL, NULL, NULL, NULL, N'6JpOuwtXoj_nXJ4JaQsJLvAtDwWHeS64')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (480, NULL, NULL, NULL, NULL, NULL, N'h2bTKm6o5fgiyZrvO1ogQLpmEyW6VfI1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (481, NULL, NULL, NULL, NULL, NULL, N'QW219vuRa45P5YO-ilXhsqw0Nrrp2vam')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (482, NULL, NULL, NULL, NULL, NULL, N'SajacCzoUuQS__gBdrKMp8nYXZTO-iah')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (483, NULL, NULL, NULL, NULL, NULL, N'1hinYceAzeteVr0gh--MoB-1HP8drz7E')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (484, NULL, NULL, NULL, NULL, NULL, N'ohKfTSFux5dKToOSfbvBc3C4gvQWnoxT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (485, NULL, NULL, NULL, NULL, NULL, N'IZdlOeZR8OJ3GFuQ4Rg6RH9OW97Aj33I')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (486, NULL, NULL, NULL, NULL, NULL, N'rfZwROv3glEWTt3sc0I2OHwVU77M7JX9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (487, NULL, NULL, NULL, NULL, NULL, N'c4aXiCzdUt0TFXVRJCNUgk9yNe1qP52K')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (488, NULL, NULL, NULL, NULL, NULL, N'NbeIOoKtXNoQorgs9LMLwLzfx38RIv8p')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (489, NULL, NULL, NULL, NULL, NULL, N'T46xfLw8a9QdtU1H6ETAXadjlf6e3UCI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (490, NULL, NULL, NULL, NULL, NULL, N'Pf2AHDoeIyytwPQpU4_TCH95y5ikLKko')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (491, NULL, NULL, NULL, NULL, NULL, N'8T7vkMmSCr9dVXqu5JvwH20Ynr0TYAD5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (492, NULL, NULL, NULL, NULL, NULL, N'LjBxD0a5e8z2k_xMqZ6n7hL-vttnig4S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (493, NULL, NULL, NULL, NULL, NULL, N'4Ys9u00E_5LKResV5YQCVIBMSCHHlRR_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (494, NULL, NULL, NULL, NULL, NULL, N'Az0GX7uLAalgNyZnn0-HqrsY1bQiaHWj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (495, NULL, NULL, NULL, NULL, NULL, N'DyPwl4dxEXSLBTvPsjaKyu5VQab6baD-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (496, NULL, NULL, NULL, NULL, NULL, N'MoNQfiiMf_DQ9WC1jH1xtMN9BDlY18_8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (497, NULL, NULL, NULL, NULL, NULL, N'Eq3d1qTJev0aXdOznucqKeqGDbi0__zc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (498, NULL, NULL, NULL, NULL, NULL, N'0Z85svOa5XcPqYcUKk3m-ddBk6zMjbYJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (499, NULL, NULL, NULL, NULL, NULL, N'KVW4oiG6AQzTyqij6q69DTHPHUjJmEtc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (500, NULL, NULL, NULL, NULL, NULL, N'7AdVMSVYQM6nPcg2VmAqa58KCvU6d5TU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (501, NULL, NULL, NULL, NULL, NULL, N'fzaHPWSPEDMSGJL_NI-B7XolWOf-eatr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (502, NULL, NULL, NULL, NULL, NULL, N'QDv4IaJlZj4HHRbptPvWiHpi5cRkVuC8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (503, NULL, NULL, NULL, NULL, NULL, N'sFez_wyaLqJXSH3ry8z9MnnIyZkz6H7Q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (504, NULL, NULL, NULL, NULL, NULL, N'JL9OTSpD11EnUPVha2FhIrLpHf-9Wm9K')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (505, NULL, NULL, NULL, NULL, NULL, N'wt3OBpnpqPfdDEgDhFdjuzLQnPJ4wgtj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (506, NULL, NULL, NULL, NULL, NULL, N'AeY9pInYr0J5TmHLHFoUhyUyYhh-X17I')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (507, NULL, NULL, NULL, NULL, NULL, N'dlR9o9XYyPQMHApSvmHCi00jj4xrC-9z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (508, NULL, NULL, NULL, NULL, NULL, N'qstVGYIkdFyU5LHIaEea-yyLsOTJ9aOi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (509, NULL, NULL, NULL, NULL, NULL, N'-s5_OlEGH-rIHPM0libetULPaJo6Du1C')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (510, NULL, NULL, NULL, NULL, NULL, N'_gEzDuzNVZjJQt0nFBWQbYCx9DyuegpZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (511, NULL, NULL, NULL, NULL, NULL, N'ncFk25dzz6P5QFMdoCtE47GzRMtcWNt1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (512, NULL, NULL, NULL, NULL, NULL, N'z72lzTipVRA8DjTWEUwxWhBACqBElfwP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (513, NULL, NULL, NULL, NULL, NULL, N'MQN4tEuE7nJfpNguccDdD3mCWFF9pI2I')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (514, NULL, NULL, NULL, NULL, NULL, N'CYZm5vRT6jG6h0XobzlFYzZa6xK7Uccf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (515, NULL, NULL, NULL, NULL, NULL, N'en9LrGv1AZzpNXhwurs2KEfBh-igYWVU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (516, NULL, NULL, NULL, NULL, NULL, N'y7dT_HiHWmjKyx9TugP2nfwKFbbaVxOv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (517, NULL, NULL, NULL, NULL, NULL, N'Cqp-D5_sI5BQZ7DfLbD1MOcc0MesX7hG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (518, NULL, NULL, NULL, NULL, NULL, N'isb2DYiBy0rKkuSpALqMH2MriWSVcgHe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (519, NULL, NULL, NULL, NULL, NULL, N'BI43W0Pjk6RytsH6OTSIV2pTo6sFTN9U')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (520, NULL, NULL, NULL, NULL, NULL, N'dLTuOSGaRW9K0Nz0CRIQwRhLPcVOKf1H')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (521, NULL, NULL, NULL, NULL, NULL, N'm4qM3RdaGfF-l128mtUQzwKYJQBWnYPN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (522, NULL, NULL, NULL, NULL, NULL, N'XnujKhMj9vm9TXw-wg1uGyd8r7hWS6hF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (523, NULL, NULL, NULL, NULL, NULL, N'KYPgs13ILzIMcDpT_E8fLPFTcudeSbaL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (524, NULL, NULL, NULL, NULL, NULL, N'E-JyKBMs2G-IXB2SbkPJa19wmpPiBo0w')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (525, NULL, NULL, NULL, NULL, NULL, N'G54VMvUcIF5epFbRAZOKv4p4jVQuTkfp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (526, NULL, NULL, NULL, NULL, NULL, N'baIjRJnIIlJMMXqZtXE8dFUyXqbc0hT7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (527, NULL, NULL, NULL, NULL, NULL, N'm4BZW_1C6ugEu-49hp1240wSvi17oQfh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (528, NULL, NULL, NULL, NULL, NULL, N'gfa6aa0rGsh2zP3IJcCZwEht_HCEsdxp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (529, NULL, NULL, NULL, NULL, NULL, N'aGwUH4Xl1fHaLxQpNgGStgb9OpDi1k7Y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (530, NULL, NULL, NULL, NULL, NULL, N'XDtrRrbWYBDdLk1C5trtx_sxCyPonq1j')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (531, NULL, NULL, NULL, NULL, NULL, N'r2JQRs03q2NO6yBqX9UPwc5mhWd1pfpb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (532, NULL, NULL, NULL, NULL, NULL, N'kUTiRtp88-XfHz07kiNr_5VgTYI3tg3q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (533, NULL, NULL, NULL, NULL, NULL, N'524p3mDwAvgN2vnQEsyUsvQGo4bytRLQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (534, NULL, NULL, NULL, NULL, NULL, N'xVx-vZ5scGTuVrzPTV1q4NQkzf0x4bXT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (535, NULL, NULL, NULL, NULL, NULL, N'lU6fqd1K62nGJiuHj8jofu1Hd0t17nWq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (536, NULL, NULL, NULL, NULL, NULL, N'EKFCdVnBL6S8mqlZ7heWyrhnY_UtUutF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (537, NULL, NULL, NULL, NULL, NULL, N'Q8u207sjs-vRuzlA_w9k0jTBkJZ3Jy__')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (538, NULL, NULL, NULL, NULL, NULL, N'iOs8DDRnd0RpspCVYLxJeNWbM0GxnKyQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (539, NULL, NULL, NULL, NULL, NULL, N'kUIjzsR81z0Q5YJ9J1JiPAOkPUf10BJe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (540, NULL, NULL, NULL, NULL, NULL, N'YIelcDIUlVw37hv_9alTY-p1ejd0A8mS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (541, NULL, NULL, NULL, NULL, NULL, N'NxdFYHtROCa57NugaZJgxwqyj_f-d0Wb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (542, NULL, NULL, NULL, NULL, NULL, N'DB6n5Wpyq0QmrI2Fmds7FLD5oK0R0XNc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (543, NULL, NULL, NULL, NULL, NULL, N'PcnhBBKLx57nwWNtR87Uo4L5kKBYu5di')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (544, NULL, NULL, NULL, NULL, NULL, N'd-9luIgWNAnf6oT6_4oeis3qs4c3U23u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (545, NULL, NULL, NULL, NULL, NULL, N'zJD7TppT_cJEXHq_Mq_-QjL7q08J6zm7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (546, NULL, NULL, NULL, NULL, NULL, N'obifRJPi1zJ2e1JIZPvd1hVwYBLOz3KE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (547, NULL, NULL, NULL, NULL, NULL, N'MZY_5QWhbIISOFyuUGeuY2L3_vWziJE2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (548, NULL, NULL, NULL, NULL, NULL, N'oxKWEwNFz3OwX5nvI4AxZB-MtPnwi6Na')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (549, NULL, NULL, NULL, NULL, NULL, N'0LWgN0eVXvfhFxjgkrV8lwZrz2K-q1rg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (550, NULL, NULL, NULL, NULL, NULL, N'fpCbEuvVxab0gFDJp51CqGlr1uiknJMR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (551, NULL, NULL, NULL, NULL, NULL, N'dpDsS_QVzfyeW6kSfwCWiJXtWP1wS7GL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (552, NULL, NULL, NULL, NULL, NULL, N'PmnL-V6n510om5EyMiQDJfvkbgVazH3J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (553, NULL, NULL, NULL, NULL, NULL, N'BWq4eToexA-TIA1CE9rSa2GuMZNBjBS1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (554, NULL, NULL, NULL, NULL, NULL, N'ROofc2aE5Npc6KHxyBtOCxRkq-dod1oW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (555, NULL, NULL, NULL, NULL, NULL, N'VWH2S7Xh3F8fHdP3tsr1yNQevESJ7Qxa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (556, NULL, NULL, NULL, NULL, NULL, N'7jmK52ov4BeuWHfTImZVh1JOJEHDE-pH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (557, NULL, NULL, NULL, NULL, NULL, N'y6ds-YcC29RPrLZZ0y5Y7YX89KM7inrN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (558, NULL, NULL, NULL, NULL, NULL, N'LbYFi9q9zNteQXSVsgr8OXew9DMyWN2p')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (559, NULL, NULL, NULL, NULL, NULL, N'jKRW_8CqNJXuRFm1xJN-nXZQ4eD-TS6B')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (560, NULL, NULL, NULL, NULL, NULL, N'1ZI86h94OnFmqWx0QyVJGUzBrSQsVarn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (561, NULL, NULL, NULL, NULL, NULL, N'x7UophJSlU2bWNzW1gwpdZkYT_WsuIhs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (562, NULL, NULL, NULL, NULL, NULL, N'-gTPRyK_QU4_yEDmJboMbuO4pnCXaRVT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (563, NULL, NULL, NULL, NULL, NULL, N'u_XIK7a07MF5Oh12MSNymYmO6LvQz6Te')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (564, NULL, NULL, NULL, NULL, NULL, N'Pnr-9B_lpLe7TOCmbYzX9p8bVU8DK0yo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (565, NULL, NULL, NULL, NULL, NULL, N'YiOuq5ItHSbFGYeZuQpz_ZqgAmzOII0V')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (566, NULL, NULL, NULL, NULL, NULL, N'e0tZkzJy7-4Eae15xr43wgfK5UCurMwe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (567, NULL, NULL, NULL, NULL, NULL, N'ZkPXbTn9DxnphOBDmZ-1JQ5jn4jf3tnt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (568, NULL, NULL, NULL, NULL, NULL, N'n8LSVWOUMJ2goARjwHkRq1qdp1FhJU2u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (569, NULL, NULL, NULL, NULL, NULL, N'ws5rHJX3ueFw_CwiRFe4lh2vblUOF4vI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (570, NULL, NULL, NULL, NULL, NULL, N'ENdgGKENgCNlQ5u9LFnfe1tSreWaBz6R')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (571, NULL, NULL, NULL, NULL, NULL, N'jNZKM7R-9cLzp0XWfMNEMebPIU8c1n3L')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (572, NULL, NULL, NULL, NULL, NULL, N'jX-jPwfEUXM5Sfu_H54bHNp6qhq0qThB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (573, NULL, NULL, NULL, NULL, NULL, N'YRn7WNLDffKI9DeB9KiDBclwpBF2Gd9Q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (574, NULL, NULL, NULL, NULL, NULL, N'Ao77Mje6C9byYiuFj3UeZec7S0GFEBMO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (575, NULL, NULL, NULL, NULL, NULL, N'2Y-eOB20ZqnsxLxoiDuogXd7r3ECbKY2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (576, NULL, NULL, NULL, NULL, NULL, N'TKmFuaD0v9YfdrBHP4hEqklUXEsahDHE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (577, NULL, NULL, NULL, NULL, NULL, N'7vucpIHfL1o7mLkeZ9cWzDOJqEz8Jx9O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (578, NULL, NULL, NULL, NULL, NULL, N'xzPj0bfiCJQzg3gvtFkw29g4KPdUby6g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (579, NULL, NULL, NULL, NULL, NULL, N'0Mfaoh8RGMiszOXnZ1JSqjPm5_LtA7Yp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (580, NULL, NULL, NULL, NULL, NULL, N'zMJ0xbKvEfUWhbvImXml-4og0gVvOSXE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (581, NULL, NULL, NULL, NULL, NULL, N'Hm1OsGQRs0XyhuysvL-WaL1tKxYHwmue')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (582, NULL, NULL, NULL, NULL, NULL, N'ctbxglvk0ZWAeuUf1ydIGZlOqq6i7fhS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (583, NULL, NULL, NULL, NULL, NULL, N'cs_rJLCIcECCwIIQ1Qt0hBaloH1xzaLK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (584, NULL, NULL, NULL, NULL, NULL, N'MrinDPKJXeSx4ZKXkNpwYs811CjH_87w')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (585, NULL, NULL, NULL, NULL, NULL, N'TIXT1CkF_9fPHdlJbDayeAeK-Uo4KvPW')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (586, NULL, NULL, NULL, NULL, NULL, N'XDYT-Sz0W8OBX3wcnkBf8VXxrH3ko_4M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (587, NULL, NULL, NULL, NULL, NULL, N'PAB6sODZb9zXWobFXq83mPEg0X8l5nbO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (588, NULL, NULL, NULL, NULL, NULL, N'GzosNBd1Ggvav6Y97vrGndSJpU94lHdC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (589, NULL, NULL, NULL, NULL, NULL, N'grObK8uT6zz8ZedLY7njAmLCkDkJgOYs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (590, NULL, NULL, NULL, NULL, NULL, N'BENjW0P811Bs2GmCvASG63iJm1mfJtoK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (591, NULL, NULL, NULL, NULL, NULL, N'gAkB52Iv3zCLxzVWyxrUE3OmtLojp8Q_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (592, NULL, NULL, NULL, NULL, NULL, N'CtsIayfUSXLc0nb0tzeICWCaYWpTj1AE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (593, NULL, NULL, NULL, NULL, NULL, N'JXln9zfaItvdz4v-vjZggHAIKYEUopY6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (594, NULL, NULL, NULL, NULL, NULL, N'LvMeg5AdER5FV0PJNPrdv2hp-9QyLotf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (595, NULL, NULL, NULL, NULL, NULL, N'XwPkYIOHWI0yv19gVETkMk3xG9nIIDCf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (596, NULL, NULL, NULL, NULL, NULL, N'grCpwX-BcZpslyURkyZjEIlVUnFw5n3J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (597, NULL, NULL, NULL, NULL, NULL, N'Z9VcRvx4W4QQq3kzvmnqYqb8AmgMy3Yf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (598, NULL, NULL, NULL, NULL, NULL, N'vbxXJq3smIS6NfLFr1xh-jrMF3Kct_Mv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (599, NULL, NULL, NULL, NULL, NULL, N'NedH1PGDUrx6gQfAn1Tp8UoAv58jhL69')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (600, NULL, NULL, NULL, NULL, NULL, N'JswO9OfsIkoSANX7Fb6dzcogt1LhEeoG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (601, NULL, NULL, NULL, NULL, NULL, N'vEYe5IdLLz_32oyervrx8TvrcaL-hxXX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (602, NULL, NULL, NULL, NULL, NULL, N'tFOO3jvWTKP_m7DbZdLXvEYGKD84mtho')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (603, NULL, NULL, NULL, NULL, NULL, N'QLrRyJMTAtCY5NJefBLefCf1oG4ZdhkP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (604, NULL, NULL, NULL, NULL, NULL, N'gJ1jMxaM1Il_i6h7MqcnTLnVYMdi0ffo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (605, NULL, NULL, NULL, NULL, NULL, N'Ff-82rQU9uQicml6gx4lj-zal1jdxfsH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (606, NULL, NULL, NULL, NULL, NULL, N'Y1nnl_JF6A6JJsbYYyq2VSVhpy_3-jI0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (607, NULL, NULL, NULL, NULL, NULL, N'CJ98bw7MmvAXchwjw3JNknfDZTw0wpb0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (608, NULL, NULL, NULL, NULL, NULL, N'P8exOXYMg7p58aadvO-1ENmacRycbS3L')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (609, NULL, NULL, NULL, NULL, NULL, N'pLzWgSRdFgeEAPFJrxYQ8l6VuYMKw7OG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (610, NULL, NULL, NULL, NULL, NULL, N'xHJV5l-3_NOlMxgrKztsAhlMY366lgER')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (611, NULL, NULL, NULL, NULL, NULL, N'7BQXoMdSukO05T2cmDrrLHJ-FD2wAKgY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (612, NULL, NULL, NULL, NULL, NULL, N'-ezPCSXW0SNGNv6KHsZlBfP7jhCQDVYb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (613, NULL, NULL, NULL, NULL, NULL, N'BYOW1MS4V30Q2e4yGT8KMnZmUmITVywd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (614, NULL, NULL, NULL, NULL, NULL, N'MhDvxXSIv1XQcZpqUiQfxjfBIf3WSFoN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (615, NULL, NULL, NULL, NULL, NULL, N'kmCPPvieGzMDAqP5BA4G5K__DlYWs5Uq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (616, NULL, NULL, NULL, NULL, NULL, N'1bLTjA7IE57WtdZv0iuw3ZugMNChZ5wZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (617, NULL, NULL, NULL, NULL, NULL, N'j1PddJwJQcxX2IJHlS8cyMvoWRuP59uM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (618, NULL, NULL, NULL, NULL, NULL, N'-pFOisnB4JMhQodol65pAN8oTTbexy2R')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (619, NULL, NULL, NULL, NULL, NULL, N'5rlctmIcn_59MHpPiuol1ptxE4XVdJ9S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (620, NULL, NULL, NULL, NULL, NULL, N'S5alpgG0P2Xqo3lhfyR-SkrqgyUeJ71R')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (621, NULL, NULL, NULL, NULL, NULL, N'Q53fV0yRV1x1KGBTjeW0g7bdE4q5lWAe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (622, NULL, NULL, NULL, NULL, NULL, N'_lRelMqqOfmPGcfaLoPK3yhkw5NRc2Pl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (623, NULL, NULL, NULL, NULL, NULL, N'PPoDGy17EczJgr3Tv9gMS5k0HwavXOMU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (624, NULL, NULL, NULL, NULL, NULL, N'-tPJvR6H1apbL_uo9HIyvoG3P_ZhQuvU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (625, NULL, NULL, NULL, NULL, NULL, N'2XDHFSnMY_9DF8I-UVQVIbrX9V2Bf5o-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (626, NULL, NULL, NULL, NULL, NULL, N'Q-VSwOBNByMhDopL9josqwc02oh0VAD1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (627, NULL, NULL, NULL, NULL, NULL, N'MKtlSLi9pkYfqTIJhb5tNZmBkP1tGtWI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (628, NULL, NULL, NULL, NULL, NULL, N'DUu0kzyJ1_xps40AMiMf6gwP5EX8R16U')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (629, NULL, NULL, NULL, NULL, NULL, N'HMno3UrKyEwWT2duf10KkjZ59BLthOEW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (630, NULL, NULL, NULL, NULL, NULL, N'9MBlTBotOLu1d_fJlxjsRnEZiFvbiOQK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (631, NULL, NULL, NULL, NULL, NULL, N'LOrKSieb0hRZ95e7pr3qeSadNVwhlxni')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (632, NULL, NULL, NULL, NULL, NULL, N'80M2ekSbXLI7NFMPcIsD2dJXlOX03HzA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (633, NULL, NULL, NULL, NULL, NULL, N'4uHJaFAX0Qipy7zrkLGRTGO_Ds1qD4y9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (634, NULL, NULL, NULL, NULL, NULL, N'ZzEU8G-WGjzFtONxIrAPgFMm5bjSbVAD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (635, NULL, NULL, NULL, NULL, NULL, N'NNldeP-z71ef8lS12FbWsxc79a9vjgoH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (636, NULL, NULL, NULL, NULL, NULL, N'SCcTtRaXofWNwN1akAGnvmfI89hrc2a_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (637, NULL, NULL, NULL, NULL, NULL, N'qJ41Yhle00v3SRkjrDFK_QBn6seYwOpc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (638, NULL, NULL, NULL, NULL, NULL, N'QZKKVX8dYFZgpYKU4xoeS1RiQZLbfEz9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (639, NULL, NULL, NULL, NULL, NULL, N'ccoJYLEsUfnmly9E2l0GJ9vYNU0AmxTt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (640, NULL, NULL, NULL, NULL, NULL, N'pbe84uud5IR3-is-me6hzK2SuoP6aViM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (641, NULL, NULL, NULL, NULL, NULL, N'clePUy1bbqF7PldsVzOY6rSLaXGihyPM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (642, NULL, NULL, NULL, NULL, NULL, N'nu34gWKSWHhNqpD7RTBvKopnYMwrTTeN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (643, NULL, NULL, NULL, NULL, NULL, N'ewdQ2NcsUEV2u2UhmN40s-hqyjgUNwG-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (644, NULL, NULL, NULL, NULL, NULL, N'8uxhU6YJ7R2KcVl_8H2Hy7dSkoKqoK9x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (645, NULL, NULL, NULL, NULL, NULL, N'xgBKXq5P_5SXZY3kybOgC8EdjVRDCeX8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (646, NULL, NULL, NULL, NULL, NULL, N'uvTIgEJuaixBXuvQszjj4LGuwPI4iShn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (647, NULL, NULL, NULL, NULL, NULL, N'DSduB_z6yNyo83AkrYL8dOkq8Exaz9NH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (648, NULL, NULL, NULL, NULL, NULL, N'PlbIpXj042JG904hQu_gsS508I1jqFy9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (649, NULL, NULL, NULL, NULL, NULL, N'2F-bx9sKEKdmH3cwDYjtglU77aTbwRIT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (650, NULL, NULL, NULL, NULL, NULL, N'83jlHG-fLKq-HEaARsAhmOS0QtG9OyJk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (651, NULL, NULL, NULL, NULL, NULL, N'fJx3CZhdOvHEaB-zAnGWXXz2vKRNsak3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (652, NULL, NULL, NULL, NULL, NULL, N'LunQt0K6jl7Y1IGcCF_jehY4nqGf0aLd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (653, NULL, NULL, NULL, NULL, NULL, N'EGV_bKA4ZjwuP_r5XIvCsJbf9rgXbDsT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (654, NULL, NULL, NULL, NULL, NULL, N'40E0-LxwUTgzCGTcrKt9tQIEDfYwxgcU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (655, NULL, NULL, NULL, NULL, NULL, N'nTJRthgkBYOVUcNYE-A_8wfEzPOQFi7Y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (656, NULL, NULL, NULL, NULL, NULL, N'QN_MMOklv4cjNZUHqm1G_fdtyLRcJjQa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (657, NULL, NULL, NULL, NULL, NULL, N'2QcIbgzy7kime83KK4gjiiDXoCdOfDSc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (658, NULL, NULL, NULL, NULL, NULL, N'G4QmM0m3bFvK5t4uM7vd_5wXtLatl9xe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (659, NULL, NULL, NULL, NULL, NULL, N'Kur3IGgGRktOgmo0mxBFKD2m0MqAZh7G')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (660, NULL, NULL, NULL, NULL, NULL, N'Em64uRwvSgQ8-OeHieI7-2UnLmM0eY3u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (661, NULL, NULL, NULL, NULL, NULL, N'axANgk37QuwKlYaMjcsM7y-W39jFdKqo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (662, NULL, NULL, NULL, NULL, NULL, N'N1VWrJWCB8qal0VXUYa8mbnFc0RWCoeF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (663, NULL, NULL, NULL, NULL, NULL, N'oshFHMUzAaBbVdet5a9rCVGDJvk4ipXs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (664, NULL, NULL, NULL, NULL, NULL, N'DckBQCOgAi_6h1k-py7YlF1zcSWnzT7l')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (665, NULL, NULL, NULL, NULL, NULL, N'DzJ_VXoSUb-m_nKaH_zVwBfeCZ7ES1iC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (666, NULL, NULL, NULL, NULL, NULL, N'OQave2xpukrkiHRqOcZuH8joPYlHW8Uy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (667, NULL, NULL, NULL, NULL, NULL, N'YtpmgTOXBm-e3wkkDgK-u2qnXkqgRNzV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (668, NULL, NULL, NULL, NULL, NULL, N'lkIXQrTPM-eGLSn_QVCWzneBMXAQ44HG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (669, NULL, NULL, NULL, NULL, NULL, N'9Q3aJkTyx5lG-1Q2YNV89_9VhCb28pfT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (670, NULL, NULL, NULL, NULL, NULL, N'_uKaNqSHlToStGIrGl67oswwfsG9gb2A')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (671, NULL, NULL, NULL, NULL, NULL, N'sL0Jn-PZr3Htin_fJq7C7ao89lIOULyl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (672, NULL, NULL, NULL, NULL, NULL, N'fSIbOtbzH-ppUp6xohAKOft2rSAFpv-4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (673, NULL, NULL, NULL, NULL, NULL, N'C08uG7BcsZxzvg5fdqtY1IY8tm35z4Hg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (674, NULL, NULL, NULL, NULL, NULL, N'8Zg6jH5GIF-FpyUAmDU0JvfcLG3PFlu2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (675, NULL, NULL, NULL, NULL, NULL, N'SfvXTR5B9slgALqeUQ5k4HaOObj10tSH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (676, NULL, NULL, NULL, NULL, NULL, N'dz0y59Qaj-0nVM5BuF5oxP8YuVHB9Ty3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (677, NULL, NULL, NULL, NULL, NULL, N'mcyWvgj5Xd5kNr0cqYY-ITiFP-RzqeQX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (678, NULL, NULL, NULL, NULL, NULL, N'AnBR2tLM42Qo5lcSJREqElgwn_5cPUOD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (679, NULL, NULL, NULL, NULL, NULL, N'8Bwy-xJQZzctYj2SNTqZEm99cEZJU6Uo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (680, NULL, NULL, NULL, NULL, NULL, N'l_rtJubyCx98_GY6By-n6Np1hTqNmil4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (681, NULL, NULL, NULL, NULL, NULL, N'Mla37NRHs_KyUAkNjDdr93iJImIXUCVL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (682, NULL, NULL, NULL, NULL, NULL, N'1kbpSEV2fN44ma7GkSY5KgQU6jInSmg1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (683, NULL, NULL, NULL, NULL, NULL, N'mfGqaqNaC9lbGZdKbS4_jSRiIiMQDmi2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (684, NULL, NULL, NULL, NULL, NULL, N'Mm_pUNQUlipeFcSFhcKLbS6pA7E5Hgpy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (685, NULL, NULL, NULL, NULL, NULL, N'vom7tCEHdlilBSvMeS4e-9R86qP58ybh')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (686, NULL, NULL, NULL, NULL, NULL, N'q8xrRWsgOQdjDsC92SVkR5mNBwj1fIEl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (687, NULL, NULL, NULL, NULL, NULL, N'wywQy0XvJRHp6TjYzAyNOfDLSIZ2Ve18')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (688, NULL, NULL, NULL, NULL, NULL, N'RxYRwv7cVmsacUdpZ2pELoT4d-nbrUS3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (689, NULL, NULL, NULL, NULL, NULL, N'31ILGSgp7KSlvFld6zpK6x9W65_1bvrW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (690, NULL, NULL, NULL, NULL, NULL, N'0X5uoISJoDMMvVaoZjGkCJZ5hwB8xtV5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (691, NULL, NULL, NULL, NULL, NULL, N'OYhFySusqV3boXKCBRHwGX0WJ_ivIbCp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (692, NULL, NULL, NULL, NULL, NULL, N'5OQCKK70Z8aqGwAnnBSEWTY9zVHXehFp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (693, NULL, NULL, NULL, NULL, NULL, N'u8XOiQDUMrELGdo2HlpTsg1LPtpA2qwH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (694, NULL, NULL, NULL, NULL, NULL, N'7RMOzfkEwoOD3z8ML0B7Ks3O7Cn04XJ7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (695, NULL, NULL, NULL, NULL, NULL, N'tZlES8oU5Rj4OXX97jHp_1VEoR8A8JwB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (696, NULL, NULL, NULL, NULL, NULL, N'J50vieKsCs7pUI18soWiNbMo7QuhhdlD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (697, NULL, NULL, NULL, NULL, NULL, N'nhrCLKVYmXhxt58AuMKOPfu6_34GHt6h')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (698, NULL, NULL, NULL, NULL, NULL, N'hAwdefBxWjh_IOjFaN9xd1N_8ndZBLxQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (699, NULL, NULL, NULL, NULL, NULL, N'olN7WtIuF5m8swXRz7HcA86RekVXUocI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (700, NULL, NULL, NULL, NULL, NULL, N'oit-Ts4wcuKho0jxRqOxk-xbWI4Ysltn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (701, NULL, NULL, NULL, NULL, NULL, N'ynQSh_TYOzBHdH0NTmfGt3dq2PiObE9B')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (702, NULL, NULL, NULL, NULL, NULL, N'bThqkgqr7RLs3kzfdgUYdPlroKNb3V0e')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (703, NULL, NULL, NULL, NULL, NULL, N'j2qmsWUmoeoAyyPVEQ6iY7UhAAizj96u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (704, NULL, NULL, NULL, NULL, NULL, N'PC2jrs_tqo-ydOJkUfv5S3C2cdFuGGqG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (705, NULL, NULL, NULL, NULL, NULL, N'p0d4oQ99xDX-C9ue2TuKcRALY8N7VKS1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (706, NULL, NULL, NULL, NULL, NULL, N'O1shK9gieKc9TWheB2CbS8GXbWfKuzL-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (707, NULL, NULL, NULL, NULL, NULL, N'ISz7mdxj2w-r45G_VKzNmK8uF16vywQ5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (708, NULL, NULL, NULL, NULL, NULL, N'ZrfVblNPnqT_LFoRT0Bjdyw41l2c1y0g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (709, NULL, NULL, NULL, NULL, NULL, N'UKr24Pmx-i8nADW6Lcj6n4u3f99_cqPG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (710, NULL, NULL, NULL, NULL, NULL, N'HREdLqBtlRG4IE8Oopn5g1IBKDVOQP7u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (711, NULL, NULL, NULL, NULL, NULL, N'pIjSwqa--QJeT0LNS5aIbB7D9ROXyEpj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (712, NULL, NULL, NULL, NULL, NULL, N'gasKCpERMUcmYbF87HWlpNJHIwKHb6Oo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (713, NULL, NULL, NULL, NULL, NULL, N'QQDAhpCJo_FjMU5vIVWxIz8ITcMuSnOj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (714, NULL, NULL, NULL, NULL, NULL, N'nswvFnlyqmoHCyrCzsn8MVON4D6Bbhws')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (715, NULL, NULL, NULL, NULL, NULL, N'3ViLu52GvOhF8K_ORnxcuZHVFVbqwu_q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (716, NULL, NULL, NULL, NULL, NULL, N'tT8-Pfuz5BPE1ryXLO0RRhm2sagz12Sa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (717, NULL, NULL, NULL, NULL, NULL, N'D4SvUsIjFlL1w3vm8hJX9-b7D9ufU7r-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (718, NULL, NULL, NULL, NULL, NULL, N'x1990XGPKcpzTt3Rpxgp7--0rnxmu3LU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (719, NULL, NULL, NULL, NULL, NULL, N'_5Pr8vxjW_Xadj9uvrwGHAC5xEiwwWdw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (720, NULL, NULL, NULL, NULL, NULL, N'geez5Rv6C-EGruQIIieZ-t1tf0fq0dWB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (721, NULL, NULL, NULL, NULL, NULL, N'iPgq_0NeIuiFjTGiaQ5_k6ezar0qUn13')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (722, NULL, NULL, NULL, NULL, NULL, N'TM1_MHZ8_Moa8QWasQmavE3BI-Q1vgYS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (723, NULL, NULL, NULL, NULL, NULL, N'Z9VVDvgB2UqS6jgS86J5NvoNYHvzB0kB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (724, NULL, NULL, NULL, NULL, NULL, N'uY5RYeG-XoYU3IyKaCXxf6ze_2JasdKY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (725, NULL, NULL, NULL, NULL, NULL, N'_XdxDrXPLXB8lJkwB3e9UePT2UxkvbAG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (726, NULL, NULL, NULL, NULL, NULL, N'Ia1agsDxYExgr9mLGIkN6aStO8VPN-eL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (727, NULL, NULL, NULL, NULL, NULL, N'7OuyWeGf-b0aL4XOSuG5XMA8oOyGpvr4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (728, NULL, NULL, NULL, NULL, NULL, N'zcS3Ap6ipItT6zOTzvWtie_RcswYmgWW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (729, NULL, NULL, NULL, NULL, NULL, N'TfQdpWpw08U9tQHsJAxcZpScFrSgQaEz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (730, NULL, NULL, NULL, NULL, NULL, N'vt_ljg0FJ7jysXzjjbybQ2ot-Ix156if')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (731, NULL, NULL, NULL, NULL, NULL, N'UmH3HyTdXF3zD6uF5-96MOKGNGr9Oui4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (732, NULL, NULL, NULL, NULL, NULL, N'8Czy2h_7OWm2aTRW9GGAHBq5GK14q1-g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (733, NULL, NULL, NULL, NULL, NULL, N'IWeRlFg6zMWurRjofxg34G41Z1HmO5cQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (734, NULL, NULL, NULL, NULL, NULL, N'krUGIL2bsSlBAZhWsALZffoCiCathE1H')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (735, NULL, NULL, NULL, NULL, NULL, N'fQiuf1uTrKrPpeRNvx726pX_UCCg38QO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (736, NULL, NULL, NULL, NULL, NULL, N'ciYcwdQW0XZb7XeG3qky565eAu6Hziyz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (737, NULL, NULL, NULL, NULL, NULL, N'4z_S41OQiKQ0ybj2Zt3mVz-f1XlHCG5P')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (738, NULL, NULL, NULL, NULL, NULL, N'jVOF6enD5YYLQXlZwrcE5iZAR5YXFfAa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (739, NULL, NULL, NULL, NULL, NULL, N'Vi2buQEhjYk63M236HxWTjCoRDHaH0MV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (740, NULL, NULL, NULL, NULL, NULL, N'l_sB3HNl5CZV0-p90u-r2P1L1o9b2pUC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (741, NULL, NULL, NULL, NULL, NULL, N'K3ATw-5hBDp1-rxYEp8aN9YYCpRaP9yX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (742, NULL, NULL, NULL, NULL, NULL, N'xA2gbRVo7ALM30XhQI46YtXcwLTtuxNF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (743, NULL, NULL, NULL, NULL, NULL, N'Uc85b85pW-dnu4zkz81wZGL2ImjpLJDA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (744, NULL, NULL, NULL, NULL, NULL, N'XTuTmJCg6-WmGik3KD3lhMf6-WuXpmc_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (745, NULL, NULL, NULL, NULL, NULL, N'mDT-531AFZAeEbCJtC06AIibrW6-HpRs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (746, NULL, NULL, NULL, NULL, NULL, N'JCi1ZunZqIYfkeJyrpLLfTt37j9Lw4BV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (747, NULL, NULL, NULL, NULL, NULL, N'OpC_pVHgEf5m5jDrDivVUNHPcPfQms93')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (748, NULL, NULL, NULL, NULL, NULL, N'T9Je1bf6qr_mRjhL4fJGp18IEN3Nj9oP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (749, NULL, NULL, NULL, NULL, NULL, N'X9oieTQeLVvaZ5RMPS_ISJ-Jrho1UDJi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (750, NULL, NULL, NULL, NULL, NULL, N'INZr9WzxkCxbGPruujZG5A1O9aKCta_l')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (751, NULL, NULL, NULL, NULL, NULL, N'D-f2VB1d9ap5eIm-08749m8FfBVGVxEL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (752, NULL, NULL, NULL, NULL, NULL, N'm8UECzdaCTTuYTFsUqjrna1cRYoy8qgT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (753, NULL, NULL, NULL, NULL, NULL, N'EmE9d6ZEbPThdRIPxdyGZeL3LRujAeKp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (754, NULL, NULL, NULL, NULL, NULL, N'BMveploKaDnNeJposMDmrJQICaP9mnHE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (755, NULL, NULL, NULL, NULL, NULL, N'Thjs5KOFhmPMgDWCWpMUsew1POX-L3ds')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (756, NULL, NULL, NULL, NULL, NULL, N'0AeUZ1-ckyYk5HWHHuWeewjA11RK7a2S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (757, NULL, NULL, NULL, NULL, NULL, N'lGojDWQaWGxZHc6m4REtZwfKwdYVew_s')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (758, NULL, NULL, NULL, NULL, NULL, N'qVqmUmyFdFYJZlYovcd1YgZ1OXhatjHj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (759, NULL, NULL, NULL, NULL, NULL, N'foLiE1GHhP7PTSmAdjGWaI5i-AOVCK0b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (760, NULL, NULL, NULL, NULL, NULL, N'UI3GZJlTXeUZRFe-GzkQdAqo2d7vc5J9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (761, NULL, NULL, NULL, NULL, NULL, N'nj7srlcdVK91w4QSXTka3v_UcB-qIyjB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (762, NULL, NULL, NULL, NULL, NULL, N'4shGtsWuP_5uLsazfaFsnlS0HId8GkYG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (763, NULL, NULL, NULL, NULL, NULL, N'9UUGO-R6HPfqKkVvFgpabxjXsHrLebhp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (764, NULL, NULL, NULL, NULL, NULL, N'3TrnmGXrOGNGNMfMKChItUvOU4ydwICR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (765, NULL, NULL, NULL, NULL, NULL, N'unRs2gkShJxbIYE5a6E90RLybQmvZeot')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (766, NULL, NULL, NULL, NULL, NULL, N'7gVoT8DUMsGkXuQtZHSuMORu8yUe3HSv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (767, NULL, NULL, NULL, NULL, NULL, N'Xw-6iGCw1hrgCdZVNPAtkpmmR4o3WjNm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (768, NULL, NULL, NULL, NULL, NULL, N'dqGxA5g9ZpUI45zGEZRCRuNYQKl4hB2G')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (769, NULL, NULL, NULL, NULL, NULL, N'2SnxjxlfY06XmHDQXig7rLdBYQu7NTHR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (770, NULL, NULL, NULL, NULL, NULL, N'1cR4alRrDe3TiO_EhAn7Y5uyoYUEpgeK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (771, NULL, NULL, NULL, NULL, NULL, N'XswrQcYjdX2Z77wasUbYOUxfvo5FUjoG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (772, NULL, NULL, NULL, NULL, NULL, N'p9TRh4bTI26p4O8rBUNL5Ti1eZ1yryO2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (773, NULL, NULL, NULL, NULL, NULL, N'R9bRQvnWIqEKXAt8-ahRxz3yOzcGLjRg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (774, NULL, NULL, NULL, NULL, NULL, N'wV8DB7xkM6aP_ScSWiljQLT4VKjM-2nc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (775, NULL, NULL, NULL, NULL, NULL, N'cHvmA5RA7Gb6EPVT34jvhJN22YeuNWI1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (776, NULL, NULL, NULL, NULL, NULL, N'GnspJZUh8MHS27-VP_qwMR4Mt0fYWJQh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (777, NULL, NULL, NULL, NULL, NULL, N'CfO3iEWzUtK65EToHq1siaxu0daydJnD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (778, NULL, NULL, NULL, NULL, NULL, N'ByJld56R5TeW3GlxIqzY8goDqiLqTTsy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (779, NULL, NULL, NULL, NULL, NULL, N'4K6gldymRjtZwi6kVH6A3EZyS98KzURN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (780, NULL, NULL, NULL, NULL, NULL, N'HLdG2J8Q_9sVrEsNphlYPZjpnDnvkY2J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (781, NULL, NULL, NULL, NULL, NULL, N'wSGPlHHCKNrHXYxCFJxU541zYNyC_Uje')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (782, NULL, NULL, NULL, NULL, NULL, N'fdBKq_d6jylfiShasRh4wnF3jMN3-Uf6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (783, NULL, NULL, NULL, NULL, NULL, N'RaVk_y240AifKhWMBO4fvWun0LjUimOR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (784, NULL, NULL, NULL, NULL, NULL, N'b7ItkHggwLvApJDC_THSBcwNYN2zaBLt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (785, NULL, NULL, NULL, NULL, NULL, N'IkyR0YmWW5JXysjZRaa_JtkGiwEqwzsc')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (786, NULL, NULL, NULL, NULL, NULL, N'0AEGTrG8fD1S_yl59-EcaVO-_gMsUyZY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (787, NULL, NULL, NULL, NULL, NULL, N'0rwm2QeThZHaXDR9eUZadWBRiQDqVGfA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (788, NULL, NULL, NULL, NULL, NULL, N'hYjpqcS_sD0qbO6K0sD5wt15tcNn05Hu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (789, NULL, NULL, NULL, NULL, NULL, N'iIvTCwrzggSQOK-kdpYDk8xMyQ7E9E2w')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (790, NULL, NULL, NULL, NULL, NULL, N'pxtbPPRCuoHdm4VLu6cmJlqbVIMadhUh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (791, NULL, NULL, NULL, NULL, NULL, N'BcBFBesKFD3SZ3vi7j6jaTz1yp6_KEgW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (792, NULL, NULL, NULL, NULL, NULL, N'DPaS2L92nLEuBiusBpeY6rUbfubhhUQF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (793, NULL, NULL, NULL, NULL, NULL, N'utT1zGUa37If102EGvn1atot8AUjy8Iu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (794, NULL, NULL, NULL, NULL, NULL, N'VJTPRLJ_5X6tII0ZzBa1PkFFTeER4Ww3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (795, NULL, NULL, NULL, NULL, NULL, N'7AgsspA0xzBLpO_TSm6oFnPhEH2HgiuS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (796, NULL, NULL, NULL, NULL, NULL, N'U2WC6zDIS03YxXUkOzjb2vUO6SxiKiGx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (797, NULL, NULL, NULL, NULL, NULL, N'roaXVy20U7ema9DhKhb9vtwbiePsf9nc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (798, NULL, NULL, NULL, NULL, NULL, N'm6-8jzTJMqLR3H4FrR8SH5_S769JT6x4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (799, NULL, NULL, NULL, NULL, NULL, N'kayOnwAUrlmzg7Xb6WAcj40l3xaKwJHx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (800, NULL, NULL, NULL, NULL, NULL, N'fHSci5lf2Jcv5wA8sdJHFZjty_YIzxwR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (801, NULL, NULL, NULL, NULL, NULL, N'YVe_g21vY7WHWKza43G4qoz_3WyQgvjx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (802, NULL, NULL, NULL, NULL, NULL, N'5X8pt3EHhSPR01kuuAfmb-RGLk2itN1t')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (803, NULL, NULL, NULL, NULL, NULL, N'NYICJvRD-uUoWTACva4UCBM3PxmjKbpT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (804, NULL, NULL, NULL, NULL, NULL, N'aPb0m8IIFjkNE592lqaECgWrcihyngCE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (805, NULL, NULL, NULL, NULL, NULL, N'0HNAujPP6wBH96dO-T59m95JX9URViUh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (806, NULL, NULL, NULL, NULL, NULL, N'IesaIb0yYOhs3x6aPFEoCnXTEilVV1jB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (807, NULL, NULL, NULL, NULL, NULL, N'YRCmuydXueRmZWCaILNKd86dpipPNASk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (808, NULL, NULL, NULL, NULL, NULL, N'ozDAk3Ge9TDBLv-nHPrfuMt_2uYxvusR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (809, NULL, NULL, NULL, NULL, NULL, N'KqCiR_bP8qsTR0kqHNvhKnlLH9vEShmT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (810, NULL, NULL, NULL, NULL, NULL, N'2sNVwEc4WcojOmoJKBE7WI-pGubazZd9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (811, NULL, NULL, NULL, NULL, NULL, N'b04w0aEeoi6Rrtz95f34KcC3vLrF8KEK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (812, NULL, NULL, NULL, NULL, NULL, N'iLeniof3Jry16Sy_cp7lBlNvK_pqJM1m')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (813, NULL, NULL, NULL, NULL, NULL, N'0TS3DopF772w5NSlrSaLc-BS0UhqV1Dp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (814, NULL, NULL, NULL, NULL, NULL, N'RuwDe7HDwJV6Tzm3CIkgatuVv6ROgl77')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (815, NULL, NULL, NULL, NULL, NULL, N'3tMmHORbW6nG-bnoUOhYQOdB_xNVwbjs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (816, NULL, NULL, NULL, NULL, NULL, N'G8352_LM_Xetpny6zPcLKoE1WMfBnaX3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (817, NULL, NULL, NULL, NULL, NULL, N'yP5bhkaxLbArN0To9kcIxqXGGBKQ1An8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (818, NULL, NULL, NULL, NULL, NULL, N'u86ID4STbQhuTewjCeKNUiYagqA8jcxo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (819, NULL, NULL, NULL, NULL, NULL, N'k_56lVDqJBiF_ZdM1yDNEj0iFSpcm_OT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (820, NULL, NULL, NULL, NULL, NULL, N'D7XOVWwaXPqb_MEVfRDF2w_UkFRXEcM4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (821, NULL, NULL, NULL, NULL, NULL, N'4tfgif2m2Wl-qzwQi-VYlZ-0kjWfJrhe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (822, NULL, NULL, NULL, NULL, NULL, N'gaPrrA0vOg79p99KO_7slQ05FvDdblDD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (823, NULL, NULL, NULL, NULL, NULL, N'4ykLPiEjwmTmbCgARvVKXy_AMll90P30')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (824, NULL, NULL, NULL, NULL, NULL, N'laGyV6zaXkic_aB1a7s-URxR7kmwSZ2n')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (825, NULL, NULL, NULL, NULL, NULL, N'Xbx63DFPCV3qAdEM9NSd6zS6MXET4JC2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (826, NULL, NULL, NULL, NULL, NULL, N'iaiPwpRZoSq6FJshORdZFHJrHZNAKjh_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (827, NULL, NULL, NULL, NULL, NULL, N'5e6m0m37uBec-5NDF8TQ-FzTD0dlzCF_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (828, NULL, NULL, NULL, NULL, NULL, N'ec2ebRXa8SWAGPAomkhSimtKSeuDLcs3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (829, NULL, NULL, NULL, NULL, NULL, N'Qyo-ixIYwd2r8A4I_KLEpj_84zEARdxe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (830, NULL, NULL, NULL, NULL, NULL, N'QJFxyA0ieFKA4k7a4ePpolwX1raQcmDq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (831, NULL, NULL, NULL, NULL, NULL, N'PnlL7RaKdS-_cAF_yrqyZ06Y_ljC2MW0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (832, NULL, NULL, NULL, NULL, NULL, N'4VjMgeJl89pcQ5Vs6NXTY_dxTklSHRN2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (833, NULL, NULL, NULL, NULL, NULL, N'kdfG11ZlZH4DZbfbv1JZRfKnuRUrLXXE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (834, NULL, NULL, NULL, NULL, NULL, N'vgkVcXztYaBPoPisIz_VhI0uOzrmlzpn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (835, NULL, NULL, NULL, NULL, NULL, N'qUXBO8bJJbdg3B6dzwOHVaVEil7uIKGK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (836, NULL, NULL, NULL, NULL, NULL, N'1LnWjMYwuLsgczKbOxC-k4viS3jSxypP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (837, NULL, NULL, NULL, NULL, NULL, N'BifZkYXs-nc_A709xNeboLKSYpUCQEaV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (838, NULL, NULL, NULL, NULL, NULL, N'x_2PQYsyiF1k-m9mKTCeRxHSQD7RtaiZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (839, NULL, NULL, NULL, NULL, NULL, N'8qknw8UikJWNaDG_03xQ4B9d1lcGN0eo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (840, NULL, NULL, NULL, NULL, NULL, N'oxP5_B1cgH3HMLFLd6xZsEIzRBXZEbPk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (841, NULL, NULL, NULL, NULL, NULL, N'RiHIUp2fyQNx0XUnrdE-lcvb7a4MIwSZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (842, NULL, NULL, NULL, NULL, NULL, N'CZH99uWccGfSQ0tTjHK94C39K_cZbF44')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (843, NULL, NULL, NULL, NULL, NULL, N'noXI-xM-_arrITa6obL2WadmOrKDcCHl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (844, NULL, NULL, NULL, NULL, NULL, N'b2sYuUz-0SCA-pb9cgd61qk8dgG1g7AF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (845, NULL, NULL, NULL, NULL, NULL, N'EsypRTANLw8L86ehWbvpGOli7oyCnfqZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (846, NULL, NULL, NULL, NULL, NULL, N'9BmbRrs47fEGNGvaXh4-C88dl78Xbt-5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (847, NULL, NULL, NULL, NULL, NULL, N'5xvYst5ToE8l3k1vBS-3S99VvrF8Xw0o')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (848, NULL, NULL, NULL, NULL, NULL, N'-JPk8CPXt8nP2JEaj3AGgS4b5oOZH64h')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (849, NULL, NULL, NULL, NULL, NULL, N'dn3GlhajthQpnlSTg83BJ4sMGEoS-T0M')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (850, NULL, NULL, NULL, NULL, NULL, N'vMaCioDembiKf3Om8B2DJxcxhvgdn7N-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (851, NULL, NULL, NULL, NULL, NULL, N'lcADJ0hm3-7izftAkDKFG1AqHpiHvLGo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (852, NULL, NULL, NULL, NULL, NULL, N'ZvBR3xVBsIuUrqs942OpmsfG_m3zZ8CZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (853, NULL, NULL, NULL, NULL, NULL, N'dIthPdQXIRoC5-2c13hUaYMCmEwbU_lm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (854, NULL, NULL, NULL, NULL, NULL, N'LAqN5hO0xWm--EdfDCCwqGxh1RrQNEjh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (855, NULL, NULL, NULL, NULL, NULL, N'gNNiBAerL6YVRkHO6zNEO932wUpZEhPF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (856, NULL, NULL, NULL, NULL, NULL, N'Yqt8AsHYUb6yj71yxS1IFTESZ5JjzMBR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (857, NULL, NULL, NULL, NULL, NULL, N'f-4EhuA6_mkJaEZCOXcE0ok7ZoUqdszz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (858, NULL, NULL, NULL, NULL, NULL, N'GgpHRxS34XjmmCilyrzohpT8VvK7RlwP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (859, NULL, NULL, NULL, NULL, NULL, N'YeWkKMxqFC_8K_PNMYJKKzayUzRdZLbz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (860, NULL, NULL, NULL, NULL, NULL, N'HVx1ILXhT5C0ZqlC5ajTddZeFW0fW4ZF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (861, NULL, NULL, NULL, NULL, NULL, N'eT2-3pM0X0TbILqIyMGY0gDXwIWKZRwv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (862, NULL, NULL, NULL, NULL, NULL, N'ByuodO9NJBk2_L4g0BdMGIN474y7GRlS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (863, NULL, NULL, NULL, NULL, NULL, N'tqW2rL3G-jLY38QaMZz98c5m4hhpjRQ5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (864, NULL, NULL, NULL, NULL, NULL, N'3EJsMwTkuuI9DS4LKUGhybOQhxVY5a2G')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (865, NULL, NULL, NULL, NULL, NULL, N'MsbyjFKXpfdo86wkndWneRyWOs-F9tSh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (866, NULL, NULL, NULL, NULL, NULL, N'fHfzchvucB8IWfqRuSJz-dRV5yTkWLS6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (867, NULL, NULL, NULL, NULL, NULL, N'UijdJ-xthAcW1xHZOPDvAgFfjDREMb0J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (868, NULL, NULL, NULL, NULL, NULL, N'3dtcUZFcTWEP3YPWUC_fMdDcYZ5-tVfx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (869, NULL, NULL, NULL, NULL, NULL, N'oWxIEiS4QrUCJCKEeTBzGlIl7M0VzZbJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (870, NULL, NULL, NULL, NULL, NULL, N'gRoyczqFP5JgJ2AM6CY-_quuhd7oSdLr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (871, NULL, NULL, NULL, NULL, NULL, N'UbCGDWodvE4fqyUQTR6Z5IuSibg20DIJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (872, NULL, NULL, NULL, NULL, NULL, N'6Hx1Oxx7jcUKvqVdExCkWSR8aj1ferEZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (873, NULL, NULL, NULL, NULL, NULL, N'pDzv5qu7g-o_BvrDWJywE-VsN_3EzpUe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (874, NULL, NULL, NULL, NULL, NULL, N'ZgBfFgTtkm277LymxDcuf_u6tqFx5ZqR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (875, NULL, NULL, NULL, NULL, NULL, N'QDK7Ssqf95jIWEc5MKTGH4NDkQDb_zAK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (876, NULL, NULL, NULL, NULL, NULL, N'dhCxmqZ3lcU2gU0dumBVtrgny4lvRJqA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (877, NULL, NULL, NULL, NULL, NULL, N'O5ah4j81NsW1uiim3p7KFbibWHu7pgyZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (878, NULL, NULL, NULL, NULL, NULL, N'ygraAa6yUbx6RMkp8FHV_cdwSEiIb63c')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (879, NULL, NULL, NULL, NULL, NULL, N'pbInZg1iXw9Wl8MIvNic88W5hGldTpMP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (880, NULL, NULL, NULL, NULL, NULL, N'VHtNuMPf5w2Boqgu50o_TTIDIx97khEc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (881, NULL, NULL, NULL, NULL, NULL, N'8P_nJX9pYlLSRD_YhtGow4cn6bYyxPSo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (882, NULL, NULL, NULL, NULL, NULL, N'8Idkfn6e8bl43lK_CHJgytYhwMvd3zBc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (883, NULL, NULL, NULL, NULL, NULL, N'c-_z1BN76LpYPMQF1xSJdokn9FlAnAV9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (884, NULL, NULL, NULL, NULL, NULL, N'8c0w-CDOOqR-AUfZPi0PZXxaaXMVgWxw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (885, NULL, NULL, NULL, NULL, NULL, N'd27fmpDxYXlMSRlWPhCZfwYqDxoRxiJW')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (886, NULL, NULL, NULL, NULL, NULL, N'a5ag8iGf0axNahG-tKBlVkUpcrSOT2ao')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (887, NULL, NULL, NULL, NULL, NULL, N'9iNJa8UinzkmUevnP36iD7_PEJROzQgu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (888, NULL, NULL, NULL, NULL, NULL, N'yA36pcdbZ_uBEprApFPgOGyJADbPzm9u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (889, NULL, NULL, NULL, NULL, NULL, N'eLDVOBroIwrzH9LqGJIe1M0p4HrQ_54h')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (890, NULL, NULL, NULL, NULL, NULL, N'1IAhXCrv7V6tgxoh1onhl1Hv-E4PQ2ch')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (891, NULL, NULL, NULL, NULL, NULL, N'o-Gm0F1Eb4u63cSuIOw_630HBnLv8Utm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (892, NULL, NULL, NULL, NULL, NULL, N'C-3y4W1DXIynrfTE-fT6NeKUNB3agZRM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (893, NULL, NULL, NULL, NULL, NULL, N'Hs-6lsGRPA2MpjuuN7ApVEltnngLwRyT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (894, NULL, NULL, NULL, NULL, NULL, N'N3bIgEF7HcIAiP5xi8-MyfmDjnAlXhY1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (895, NULL, NULL, NULL, NULL, NULL, N'c21dpp6mACZ9xh84uY7wetIYzUAAccXn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (896, NULL, NULL, NULL, NULL, NULL, N'xKHxC4OMkIxAKetgRquPXHxt9LooHqCF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (897, NULL, NULL, NULL, NULL, NULL, N'F1aqUtcuDd2ZgV52SwA17xnoaSmnDeYA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (898, NULL, NULL, NULL, NULL, NULL, N'x3pWr2pO9-yybZGs3qbcUdhfxx4q-yWW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (899, NULL, NULL, NULL, NULL, NULL, N'elDO1-ODCYhb12LtTdzpOQlxp1L1z89U')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (900, NULL, NULL, NULL, NULL, NULL, N'lsNOVS00Y-NgamfE0IO79YyPFNCnfOhB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (901, NULL, NULL, NULL, NULL, NULL, N'MlLznFaoqHFM4fp5zaD8wqjLRJh_7MzI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (902, NULL, NULL, NULL, NULL, NULL, N'htZzRxq7Pg4vPQqL3aTGe-MGk8qkL02P')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (903, NULL, NULL, NULL, NULL, NULL, N'HWcR7cDmDYd8iPlFyNTyvGtzYtWasSWY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (904, NULL, NULL, NULL, NULL, NULL, N'E2OLDidDjcLyYl0S6hU_2FdLk8ITQQcu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (905, NULL, NULL, NULL, NULL, NULL, N'Yq3F4NOjdpZMsE-BmbqPxSLIamFWK3z-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (906, NULL, NULL, NULL, NULL, NULL, N'eMCnr6s4AFhaMXexs6QNi3lvVkUBRFhU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (907, NULL, NULL, NULL, NULL, NULL, N'gtnwGI4n01tnYC7IIJ2mcb08KtNJRNui')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (908, NULL, NULL, NULL, NULL, NULL, N'529g5MpdFt5uUQGdK4VD49zjMflc2Wg4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (909, NULL, NULL, NULL, NULL, NULL, N'EMh4CL3wgJcWr-zCRpU5QH5C3bSg2OKD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (910, NULL, NULL, NULL, NULL, NULL, N'aODynYmD0udyAIkVL5GSEJuu3GWcev6k')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (911, NULL, NULL, NULL, NULL, NULL, N'9hTT5u-usRZOqUJNMlEgyFHSuCTovNl_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (912, NULL, NULL, NULL, NULL, NULL, N'RB_MBHy9y6c2cfsTXve7HghHvY-GeaEB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (913, NULL, NULL, NULL, NULL, NULL, N'JGmOlu_6hJa9WzlLzqGpjA_vxVDyw2iT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (914, NULL, NULL, NULL, NULL, NULL, N'ir-UhSecoG_gF6rrdCv-lT9pIzneJKJN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (915, NULL, NULL, NULL, NULL, NULL, N'mz0M9U54g8reuloHMhRaL0vGE7nlarsy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (916, NULL, NULL, NULL, NULL, NULL, N'bxVXAguSqNYVaVCpFK9QPl83i3oFiIMF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (917, NULL, NULL, NULL, NULL, NULL, N'uqEdEKI6GvrSkGRbR0Gm78qoM_ZYMhq3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (918, NULL, NULL, NULL, NULL, NULL, N'VbICb2lvpe_E6R06Z0a9EHMgT_TU-dsh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (919, NULL, NULL, NULL, NULL, NULL, N'MhSezVFrrOMDWeI3BjO4EWVwwjaGIngy')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (920, NULL, NULL, NULL, NULL, NULL, N'H2oME4wLv9klJS-2t5fSsO-R6-bh8aKl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (921, NULL, NULL, NULL, NULL, NULL, N'5geK_0bHv6qVCpkbE2uB8MPAnIQYCzJw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (922, NULL, NULL, NULL, NULL, NULL, N'GBiA-EJPuIx6XBWVS4EQuFkGHbgTjgbr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (923, NULL, NULL, NULL, NULL, NULL, N'Jus739-5fFRzUx3etzwHdkrnav7nO_5p')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (924, NULL, NULL, NULL, NULL, NULL, N'Gn5RvNHLlc1eMqbanC5MtLjytXeaEg2h')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (925, NULL, NULL, NULL, NULL, NULL, N'_MiJxml64WXheafdqgOQeb8yC_7iQhso')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (926, NULL, NULL, NULL, NULL, NULL, N'BOIqCr2_KlC1h2XgRC-t0FZJTfFXfbju')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (927, NULL, NULL, NULL, NULL, NULL, N'9Sf9ZwOy9Q5uUBN43mlS1qFt9rbOw8xA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (928, NULL, NULL, NULL, NULL, NULL, N'g_IXw9oiu9m8G5c5RnJDZ5hlXgHNOHdJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (929, NULL, NULL, NULL, NULL, NULL, N'WTTbOQiJ-8t8536fm1HrP0Kwy79ClABn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (930, NULL, NULL, NULL, NULL, NULL, N'VQ-uJti8CYGWrONYQi85oLNyQEm-WTki')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (931, NULL, NULL, NULL, NULL, NULL, N'o2kQUlTLgO0FekDDGgc3EriYbCGCLgrQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (932, NULL, NULL, NULL, NULL, NULL, N'ledVRzI0EHsdMMhYHJe8p_ERRASheUfG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (933, NULL, NULL, NULL, NULL, NULL, N'QBAhRgQnZX6ToPfGtJPXQASxCSV8bwPL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (934, NULL, NULL, NULL, NULL, NULL, N'1fNgPLv9bTwZYduZ1K30Qw29fK3giof8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (935, NULL, NULL, NULL, NULL, NULL, N'o9ACvVyH1Sg8nUOiMtYX7mBTXjP6_FO1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (936, NULL, NULL, NULL, NULL, NULL, N'11RDzsXjSO5r6rjqlIiFzXNSiRjlA4Vi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (937, NULL, NULL, NULL, NULL, NULL, N'Yw6Xerlg5K_tF7FhcLsiKuFmqZsdG-Fu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (938, NULL, NULL, NULL, NULL, NULL, N'4Yekj0J2Zgmr-0XYFWFWBd7t9B1h9ymG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (939, NULL, NULL, NULL, NULL, NULL, N'gNGqRXIhZ5QKxHkiNGiCpoVbLdo5YoQs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (940, NULL, NULL, NULL, NULL, NULL, N'K2MWmzP8lHmbWHSe7qIUo0QrT5CVc25u')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (941, NULL, NULL, NULL, NULL, NULL, N'9m3m_rmQCznMFDC-sa2r4u_SOLVHDSHD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (942, NULL, NULL, NULL, NULL, NULL, N'fzOKBCmUeuvDYkESIRLJNNiXsRRS8Pyg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (943, NULL, NULL, NULL, NULL, NULL, N'HywchY6jcSUsD-5ot9srObDYrDjhy87C')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (944, NULL, NULL, NULL, NULL, NULL, N'u7N8rm1EEqHg0Mc_mGCQwSbreSnBL4JB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (945, NULL, NULL, NULL, NULL, NULL, N'UQC_IMJeojnIg_zc8Pno1tILLV6lM8LM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (946, NULL, NULL, NULL, NULL, NULL, N'Alp2D6QOb5vkiXtt3_2i0yi1XBq5BfHM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (947, NULL, NULL, NULL, NULL, NULL, N'Pf91IJIBeKCUuoE8EbazQkqePvnqsWvd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (948, NULL, NULL, NULL, NULL, NULL, N'T4DWQPVJIP1VcoJK4B_NSnfxD1mSMMxg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (949, NULL, NULL, NULL, NULL, NULL, N'jAoJ77_wTDs6HVzrLyfLLXn_JQGo2qp9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (950, NULL, NULL, NULL, NULL, NULL, N'-W_tXvCiilAWjCUyy-Zu6XOey_ZYeXN1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (951, NULL, NULL, NULL, NULL, NULL, N'JM6OeFnUUpzbQ2DXPyQdMgm1ngMfd7X-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (952, NULL, NULL, NULL, NULL, NULL, N'ZTXS-sMZ5ou3DJ1jeDQl8z_XL-eCBTWV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (953, NULL, NULL, NULL, NULL, NULL, N'ZlkS_VbpyGzPv9ZVSVeLGM7OwJ3jCMuE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (954, NULL, NULL, NULL, NULL, NULL, N'vqGz2blWmRngwaqdC_wH1obA2oZiCxpq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (955, NULL, NULL, NULL, NULL, NULL, N'6-IpnAbvFZBGZv0kV3cz8CDHeZ7AJgyT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (956, NULL, NULL, NULL, NULL, NULL, N'VkGOeyAub_aXILCmePEpERkQarOnwjX_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (957, NULL, NULL, NULL, NULL, NULL, N'wU-4rbx-oIJlSs3fBbjWSk4NEOJ4edsZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (958, NULL, NULL, NULL, NULL, NULL, N'p1l5L-dNw5yh0WsBuJ2FR6sujgWeyaMz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (959, NULL, NULL, NULL, NULL, NULL, N'nh8VNtmdwDJ8v1K546qypa0jnm0GymTo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (960, NULL, NULL, NULL, NULL, NULL, N'x9hawVXxpksKkRMOw_SSbyuNV3i59Q2b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (961, NULL, NULL, NULL, NULL, NULL, N'QE5PAkS0paJ2V0q2kBqSCjdhBSilJ11N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (962, NULL, NULL, NULL, NULL, NULL, N'wA5WvWIDHMOajDc3SLnLd1AV9zoMxwNP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (963, NULL, NULL, NULL, NULL, NULL, N'qwUlgBhzxCk06H5f6ltwEyQrI566wSsC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (964, NULL, NULL, NULL, NULL, NULL, N'7U0fFO1Cby5903BmWj-5E7bVsz9CePl8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (965, NULL, NULL, NULL, NULL, NULL, N'pUK66JiHBsEaNvBU9Vey_p5JbskV-hY6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (966, NULL, NULL, NULL, NULL, NULL, N'c2q9UEwnyeenlOiuL4faksIghzPLTVhM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (967, NULL, NULL, NULL, NULL, NULL, N'EH5VmTjow-1GyTxHJyUrCpv5l36imMdM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (968, NULL, NULL, NULL, NULL, NULL, N'zweJtH0bqM_nIZOkSH_KmecUv-UNbR-n')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (969, NULL, NULL, NULL, NULL, NULL, N'p8dfDeSYDQ2ZRuFp9ILThp3uLi5DhGCb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (970, NULL, NULL, NULL, NULL, NULL, N'2zE7HaT-bHF0OUi6xh_WN15l0d7jMSua')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (971, NULL, NULL, NULL, NULL, NULL, N'Uc4rEG8tEG5BjPuMFsnlLMFTn-QeSQQr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (972, NULL, NULL, NULL, NULL, NULL, N'IMbAlFGRPkUXYkr2A4mIrG3LvAbwxVI1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (973, NULL, NULL, NULL, NULL, NULL, N'Zs-fcIEuH2Fg5sE3BB-zazY2zRAtVj-9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (974, NULL, NULL, NULL, NULL, NULL, N'D3MlpVOw9hsKP1xk945XspgNcYwpmCdU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (975, NULL, NULL, NULL, NULL, NULL, N'XnXQQY7rm1RN9wWueIov5v09cdMGg0C9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (976, NULL, NULL, NULL, NULL, NULL, N'veWD-OKgS-rC8B8Cd1kyujBWMxy9X7oI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (977, NULL, NULL, NULL, NULL, NULL, N'It0RpgEOtCAS6GTo0LaIPDuz6jriBYqc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (978, NULL, NULL, NULL, NULL, NULL, N'-asfp_DGThf_AYLZEe2OkZo-iX1IkbfZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (979, NULL, NULL, NULL, NULL, NULL, N'byt5XVghiMIcrtyOK-wnBFt5W0dsgyIA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (980, NULL, NULL, NULL, NULL, NULL, N'ZQf46g7uDs7yhUtqjclFgXZvdX0hMiqr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (981, NULL, NULL, NULL, NULL, NULL, N'vdV_CyhI42fo-dWJOljDrZsdVURCEqBD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (982, NULL, NULL, NULL, NULL, NULL, N'3-puNZDncwI8-eixErI2SHEMJS76llQs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (983, NULL, NULL, NULL, NULL, NULL, N'bxjE0P5FrpZJuczP0Y4pCCbMSTugmreX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (984, NULL, NULL, NULL, NULL, NULL, N'lhHDjP1-JmH_8Q2fyy9EvIBIvdr2knUg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (985, NULL, NULL, NULL, NULL, NULL, N'wYiiP2S-tF1__w0FgKi5LaybHB2LsWkF')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (986, NULL, NULL, NULL, NULL, NULL, N'QylG_S9pRcLpIWKxInaXl1glyKS5qrLK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (987, NULL, NULL, NULL, NULL, NULL, N'LBwzsRD-DAU0OFdxTtwkCqqHc8xyQ2Xz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (988, NULL, NULL, NULL, NULL, NULL, N'ZacT0X0_toakaEND9b73M2qk9OZ05Z72')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (989, NULL, NULL, NULL, NULL, NULL, N'hHM9d9mgpdmeiX5CrGhc9cxqE9FWfzPl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (990, NULL, NULL, NULL, NULL, NULL, N'SPXwZyrdSrGBdk3teymHfb4jC9lp67r3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (991, NULL, NULL, NULL, NULL, NULL, N'A15BVnCeA6KJ3M7dozg6SYvNWtTN6fni')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (992, NULL, NULL, NULL, NULL, NULL, N'OvG6cPcd8LfLfamVPuaH92G46F1rYIee')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (993, NULL, NULL, NULL, NULL, NULL, N'HbhW4aVvRlfeu2-dzNRkXSmKjhTQcDRN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (994, NULL, NULL, NULL, NULL, NULL, N'0dsCaU0KSossWjxV9DLbNvYsJHZLnq5v')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (995, NULL, NULL, NULL, NULL, NULL, N'L_5ESuAUppcdiUOfvCbKkRqEk1pNSYoO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (996, NULL, NULL, NULL, NULL, NULL, N'aPxvThNskbVRbByiv5ONgHft-S5Uwl2J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (997, NULL, NULL, NULL, NULL, NULL, N'4knxBCrldgnHPgIbbg_y_XlISigHfroz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (998, NULL, NULL, NULL, NULL, NULL, N'i6sjeQnl0FjVH8BvBt-Mld26MlPMrfwv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (999, NULL, NULL, NULL, NULL, NULL, N'_xnv1O13iM2iMO3zr9ZyLp5rlayE742w')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1000, NULL, NULL, NULL, NULL, NULL, N'MeE0OtXKn4q_V0A4Fs2umXDVMcr_a6DA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1001, NULL, NULL, NULL, NULL, NULL, N'_qFnHFhPWbhvT4vj0IVhdqCyMp03Jkmx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1002, NULL, NULL, NULL, NULL, NULL, N'zRDVGORy9-FmBWsEr-pGRqY4zy-x155z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1003, NULL, NULL, NULL, NULL, NULL, N'IoBOdAfViBzYQqoBzc8vnwMvIwaWowBU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1004, NULL, NULL, NULL, NULL, NULL, N'1aBb0t-0hlRWrzgH7pZ6WnP1C8YhoWH_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1005, NULL, NULL, NULL, NULL, NULL, N'Ku3RNeaw4iMk8fxi0PWar30l8Ti8sXNf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1006, NULL, NULL, NULL, NULL, NULL, N'vlDR6a57StB9j25ylHMoEZjZQ0w5KFmi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1007, NULL, NULL, NULL, NULL, NULL, N'fmzx-zoUXpjZM81RfeSIR2l8yMrSk5jr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1008, NULL, NULL, NULL, NULL, NULL, N'5vzgY3qeDP6OV6rQ03aKN5E3ywPRsWAd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1009, NULL, NULL, NULL, NULL, NULL, N'gOyLKcnG_32Mlg1bUua3jb5uMySe3ZlC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1010, NULL, NULL, NULL, NULL, NULL, N'QoHniwR_IS0WEZ_roaLbX-19En5V4a9k')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1011, NULL, NULL, NULL, NULL, NULL, N'QUValbKHmoOqnazxxggFh0c4iKCa4tTW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1012, NULL, NULL, NULL, NULL, NULL, N'wtvjqMgz6D9u6XBNz5_mGbELw0I82cJP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1013, NULL, NULL, NULL, NULL, NULL, N'LdNq1niY_p0JB7gK74OfYqjShDuiWjeN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1014, NULL, NULL, NULL, NULL, NULL, N'8K_e7NdYYyjg6tgctPtDy6QepCBNJDOj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1015, NULL, NULL, NULL, NULL, NULL, N'hKRPRJVag1hllgHaCZeSC4_1k1dWge2y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1016, NULL, NULL, NULL, NULL, NULL, N'FzPOQZD7drKUYSJw-QIlUHZFi05g-flX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1017, NULL, NULL, NULL, NULL, NULL, N'nFpx5VCnjfEHkaVMVZ_99AvoiXWX4eci')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1018, NULL, NULL, NULL, NULL, NULL, N'vHwC9vbkFV7QXhWYI_-yet89_c0NsNOR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1019, NULL, NULL, NULL, NULL, NULL, N'TV0p8UaeWz5dr6HnPlvz8YArU_-f95u5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1020, NULL, NULL, NULL, NULL, NULL, N'c13CTD0ird8JQO6TM-ho-FyJpULrnlVw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1021, NULL, NULL, NULL, NULL, NULL, N'8wQRX5FEMg8JXFPiKkkQvoKmNZlHinFX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1022, NULL, NULL, NULL, NULL, NULL, N'9W66DXgRjhPRU1K_WcyCuWnX9tYj_pQB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1023, NULL, NULL, NULL, NULL, NULL, N'Yx9oYwU0yz1gwvUCyAIc2AFP1CV4KXGi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1024, NULL, NULL, NULL, NULL, NULL, N'zURxugPz4XHqgLekHwgOY5AyHrlRzMTY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1025, NULL, NULL, NULL, NULL, NULL, N'mGVTG4uTHFk8-a6J60YSKgNnxieVyTGK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1026, NULL, NULL, NULL, NULL, NULL, N'BqukxEb4fExE5ebrZIihSVu0gieO4GZS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1027, NULL, NULL, NULL, NULL, NULL, N'QuP6fKbzmbLBi12vaL4NhH2yFkWPtLlT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1028, NULL, NULL, NULL, NULL, NULL, N'VvzAoYT_lSxvfRglpjXsTQSkduxDlA5Z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1029, NULL, NULL, NULL, NULL, NULL, N'mCuIs8RYih4WRdQ1WQ0-F8p7Bjt7H2kq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1030, NULL, NULL, NULL, NULL, NULL, N'HyX1uPisZnutvJfnMXxcAeSmyYkPPLKI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1031, NULL, NULL, NULL, NULL, NULL, N'DWQ5Ql4EiEKoGgfjMB00yA_AosB-eafp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1032, NULL, NULL, NULL, NULL, NULL, N'X8yBtQ18Atw4tAqPffZ07zr73wAiutrB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1033, NULL, NULL, NULL, NULL, NULL, N'F0qzzwRBM30_vW1GWTmyzRLlqCme30Z5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1034, NULL, NULL, NULL, NULL, NULL, N'32zEiVlvP-0NXA9P7eyPi7d5cJBq2Hme')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1035, NULL, NULL, NULL, NULL, NULL, N'HZ_M46cpULBQ1Avwdydrc3sWb_mZENql')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1036, NULL, NULL, NULL, NULL, NULL, N'OglCvZGsvrWQPrFFMp6A-jigQeSMcSsn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1037, NULL, NULL, NULL, NULL, NULL, N'fy_IlY4Ik0QSklc0mSD4oifKwGrAhB3o')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1038, NULL, NULL, NULL, NULL, NULL, N'uICv9m2t3IaPItb9Sh7U2Hbek8hIDfUv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1039, NULL, NULL, NULL, NULL, NULL, N'1aVibKnekFelOcOUgSEn2P82LkxrQj0o')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1040, NULL, NULL, NULL, NULL, NULL, N'sV5btsyuYWn_QpH-n39wNonqAEb2gnxT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1041, NULL, NULL, NULL, NULL, NULL, N'VUpLnC1XmGvSr_GneSU2HK1dNKNERsbC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1042, NULL, NULL, NULL, NULL, NULL, N'ddshEZTxVS6_FWwt86v-DRkidVq4TfmB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1043, NULL, NULL, NULL, NULL, NULL, N'rFD0Dgh_hiRBRYkAoa1uZrD-aqkfI41Z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1044, NULL, NULL, NULL, NULL, NULL, N'tHkEWXc4EwuIblNU2TuAtE8xJgwpEVIU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1045, NULL, NULL, NULL, NULL, NULL, N'I9ULVqlwZVvQ4TXBapv-lKoLmv_sV64I')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1046, NULL, NULL, NULL, NULL, NULL, N'18DyW3zGm_xkOODyArdD3a0MJHNBY97L')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1047, NULL, NULL, NULL, NULL, NULL, N'J4VxVvWpL5svKN127_WSvNn2NVtyfWi3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1048, NULL, NULL, NULL, NULL, NULL, N'KO7HmR_jwcYmTsvpPhoreYQXDZArPYda')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1049, NULL, NULL, NULL, NULL, NULL, N'dxLqVxsJtx1eolo76Cl3yJMPtADZAjgn')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1050, NULL, NULL, NULL, NULL, NULL, N'5SHuC_NhnuLy7Ie7yRUqiReyNSycqqZ6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1051, NULL, NULL, NULL, NULL, NULL, N'5fQlzEZBUg_AxM1ztYuQkrEJlMUX73nl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1052, NULL, NULL, NULL, NULL, NULL, N'TtI3OkM8BM7tzJMle6k_rIwomSooovAm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1053, NULL, NULL, NULL, NULL, NULL, N'x8x_girPcO6Ukh4sK_zenuRFMScMlcic')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1054, NULL, NULL, NULL, NULL, NULL, N'xGIQC-vfb1hJlrwvRqMLhaH_oM6hWoIU')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1055, NULL, NULL, NULL, NULL, NULL, N'RP1BcOnANgLj713gAavbVlD_BRmNTUem')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1056, NULL, NULL, NULL, NULL, NULL, N'FmB-tndfwziOxF0d51SOOjdEupr1GEtX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1057, NULL, NULL, NULL, NULL, NULL, N'qtW-W4aJQhcTYCJk3TpFsBOqOMfFtU-6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1058, NULL, NULL, NULL, NULL, NULL, N'mohOX_kz2x5WdBvYHupVp8SZIA2pHXW2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1059, NULL, NULL, NULL, NULL, NULL, N'Thk1vejXTwnbd7dcuoEZ0INRS403rLDz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1060, NULL, NULL, NULL, NULL, NULL, N'onV9ZGFMftdjr2jD2g9BKwrl52YyWC3y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1061, NULL, NULL, NULL, NULL, NULL, N'rGrYXzIuUfCaAQ4VUkHxTp78CQsaod9K')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1062, NULL, NULL, NULL, NULL, NULL, N'CmPVRcYXGv1P8rT8BEVgb_Tuo89UpNzP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1063, NULL, NULL, NULL, NULL, NULL, N'htYCSq0h8SKf8a4uSmI9iwz3OleVMiQN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1064, NULL, NULL, NULL, NULL, NULL, N'TihpOBfZOn57eNs5eM65GvKr09kD6z6b')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1065, NULL, NULL, NULL, NULL, NULL, N'nxWr37Aram4OeTq8v2QIBZgI5UGazLAY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1066, NULL, NULL, NULL, NULL, NULL, N'mGF3DsWllPgHCmw-yechzxaC_YzsoRZs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1067, NULL, NULL, NULL, NULL, NULL, N'aLDIsZ0q7F-R_b-54gXSGWDaYA_pbxuo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1068, NULL, NULL, NULL, NULL, NULL, N'jAFbyuRtFpPZ2pdY1TggrlQAm9xJUnE3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1069, NULL, NULL, NULL, NULL, NULL, N'fJRtcdeKq8MPAGC02S-gl7K3J8dwQNFw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1070, NULL, NULL, NULL, NULL, NULL, N'q9FKMxqKpKhiJZ7wtijDQpcQgA0MxtL3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1071, NULL, NULL, NULL, NULL, NULL, N'bx00ELX1JhJ6Mq0-VWNIRQsCnsNuZ2yF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1072, NULL, NULL, NULL, NULL, NULL, N'l00HhH1bMY0mmBuoJRQGsKtkAnFFoUZl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1073, NULL, NULL, NULL, NULL, NULL, N'23HhuVCIorhkib2YdFkLdrKCvtAv33xT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1074, NULL, NULL, NULL, NULL, NULL, N'mJaK72EfVb92GrTc0oQbxEo6PUS_aXuD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1075, NULL, NULL, NULL, NULL, NULL, N'ksPa4TcfjoS8PPAYa6ltF7SI_jv7SZS1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1076, NULL, NULL, NULL, NULL, NULL, N'G228f8Pz8KU7iL1B-Qh-4MYQrci2xl33')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1077, NULL, NULL, NULL, NULL, NULL, N'47BveJhPL85zL-T-qJnpsHBgnlLxIoZQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1078, NULL, NULL, NULL, NULL, NULL, N'dy_d3hksellGOC73F0f_egDXKMe2HNBJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1079, NULL, NULL, NULL, NULL, NULL, N'HpmkzsSYeCNISuo5QIOJt8NN_uwnhwuJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1080, NULL, NULL, NULL, NULL, NULL, N'U7-tCW1t6aU91WLtzvX-isVQWyrWpm8V')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1081, NULL, NULL, NULL, NULL, NULL, N'O66o2XubVhPlu4lUnKCqtlvxTEN_oJTi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1082, NULL, NULL, NULL, NULL, NULL, N'pbqIK_J2wkTeuXI53iHj_v7Tubtwude7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1083, NULL, NULL, NULL, NULL, NULL, N'5wwiEHP69g0Xmk9c6vTCSj2jj4iKpqkO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1084, NULL, NULL, NULL, NULL, NULL, N'RM9QcMfd1-c0M3qdI3KmK205sYzSBaPX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1085, NULL, NULL, NULL, NULL, NULL, N'o__TNFneOdhxdIbFe6KeYut26lxLVgYl')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1086, NULL, NULL, NULL, NULL, NULL, N'H9nXf8OnhlWXYFgMXPZemD3v9mKNPGe1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1087, NULL, NULL, NULL, NULL, NULL, N'XxcIjv4IJlQEZw-0DRA1M-upIrKFvjfk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1088, NULL, NULL, NULL, NULL, NULL, N'Qexs4Y1IARB5U4-DK79To1S1g20jAaeO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1089, NULL, NULL, NULL, NULL, NULL, N'z3TlMzmE071gz7qFKSTY68GQhIBwmEou')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1090, NULL, NULL, NULL, NULL, NULL, N'hZGdw1UZRu5Qa1_rFEIwrB4hHIOvSehw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1091, NULL, NULL, NULL, NULL, NULL, N'vI1N-uTm2HpkfeDOxwvd2gSqRNjgPkYG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1092, NULL, NULL, NULL, NULL, NULL, N'S0Aeg-xY2AfLLvJGk-UVaZ4xsqOlTotN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1093, NULL, NULL, NULL, NULL, NULL, N'g5FOZ4OTBIhhY7D5NaMtfsM_9TeN4mHM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1094, NULL, NULL, NULL, NULL, NULL, N'3OaXpnuc579HtUCVmfAMqZplhlITwbaF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1095, NULL, NULL, NULL, NULL, NULL, N'UkzEnPJVvF45Wiixfoznin956SeueaCx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1096, NULL, NULL, NULL, NULL, NULL, N'W5FQHmxkV0msJc_OBk0yS9IdImGyVsaH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1097, NULL, NULL, NULL, NULL, NULL, N'9mZGvoLYBSaivMwQfWTJqy5Ngtd-KFiS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1098, NULL, NULL, NULL, NULL, NULL, N'koHQObbiWG3gO8IfeOngPEnw8Ko9BkRg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1099, NULL, NULL, NULL, NULL, NULL, N'e2Du8Kv-M8KD4v-R2ZcqPuUsfg4YiODL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1100, NULL, NULL, NULL, NULL, NULL, N'h9wGOHDRMKN1Ej4KD4gSewW7KEy7cdQ9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1101, NULL, NULL, NULL, NULL, NULL, N'iJxSjZL89dZ61eJ_-4W41RVI9ald_pov')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1102, NULL, NULL, NULL, NULL, NULL, N'SFUpVsoOxHw1J07j-zTCXl3swD6LQcr4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1103, NULL, NULL, NULL, NULL, NULL, N'NjeeDNrDcS8Xbm3hjPN7vh-xyNvHEjBD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1104, NULL, NULL, NULL, NULL, NULL, N'afOzVH7ImJAqHwCuiESDayrOE3txoxmQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1105, NULL, NULL, NULL, NULL, NULL, N'AQBlf_priN7PSH0yJeTSjXU-gNA3Kezz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1106, NULL, NULL, NULL, NULL, NULL, N'uXPYWgoQus2vQ401z5LFYPwLHny40FcN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1107, NULL, NULL, NULL, NULL, NULL, N'1ssF00SsDkQd3Hghw7PhcQBZPehIfv6J')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1108, NULL, NULL, NULL, NULL, NULL, N'P7IwpxhdT3D1d7bc_3bW04CxGSCwLitI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1109, NULL, NULL, NULL, NULL, NULL, N'OqUDOW6Mx5PkWswQ-79B-ILBO4oHIMIM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1110, NULL, NULL, NULL, NULL, NULL, N'qPkZn6iwcMVws-Cfv2Ehk8EBOGsCmBQw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1111, NULL, NULL, NULL, NULL, NULL, N'r7EZX1a2OsTlll5pzlNQS_jimKKbBqwk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1112, NULL, NULL, NULL, NULL, NULL, N'q3VJNeUOUiYpz5NkVMava9miXiZ_LSU9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1113, NULL, NULL, NULL, NULL, NULL, N'ax8T3NWsXFV92L9qTPPKyaUHdQPtlnhc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1114, NULL, NULL, NULL, NULL, NULL, N'7KAQmKr2BAA7_QYVPCmB2vX-nI1q5F8t')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1115, NULL, NULL, NULL, NULL, NULL, N'gtyqzq-5UhjTfmNt_8Rma774xjTeL55h')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1116, NULL, NULL, NULL, NULL, NULL, N'KjPK9LP8T_RSLL4yd1iZs-ymuvUmLRx9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1117, NULL, NULL, NULL, NULL, NULL, N'8RgSxmWw8zuTYYQJ5tmkHOQTqtaFlM-P')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1118, NULL, NULL, NULL, NULL, NULL, N'9EuqJbIcNfOV4dd2vNNhRiTVwd1y4bI9')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1119, NULL, NULL, NULL, NULL, NULL, N'AXhAYftLNIThT_4ud1UbHVwofkSvl--p')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1120, NULL, NULL, NULL, NULL, NULL, N'N74iifrAKys4_tPgTci8C-Y4PhoR-56O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1121, NULL, NULL, NULL, NULL, NULL, N'0JdTCb2XT6b36BrYI0YINBsJlyY7S7wW')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1122, NULL, NULL, NULL, NULL, NULL, N'LOnKl8uyeoOsT4Ij68b3L5zZVOz1RKXk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1123, NULL, NULL, NULL, NULL, NULL, N'51WK8KPfl__UvBWDN9YTBz3v7N9mLUWJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1124, NULL, NULL, NULL, NULL, NULL, N'qQLI3OP85lt0UrGik12pZDgtAmVV-KQi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1125, NULL, NULL, NULL, NULL, NULL, N'8S43a4tGEyaN9kZiFF2ijWgJxtpVisct')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1126, NULL, NULL, NULL, NULL, NULL, N'0HFbvyTy1G9cZYML1ib6FG_9p7QKC-1a')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1127, NULL, NULL, NULL, NULL, NULL, N'zq-dHHKOoN0bOgRaMlr4eSssocA4XxpK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1128, NULL, NULL, NULL, NULL, NULL, N'EeoofQfki5HsKDpn5iRbQpcKxfrVds-I')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1129, NULL, NULL, NULL, NULL, NULL, N'zP989Oy6ELcpS1dKLCtV1hT7Ssx02Hlc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1130, NULL, NULL, NULL, NULL, NULL, N'KUoDUyeRrLArKOVLJhljVlJJ4FFqxaIq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1131, NULL, NULL, NULL, NULL, NULL, N'UNfSZ2dGqR2t49ekZP-bmn0GVprbLYwt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1132, NULL, NULL, NULL, NULL, NULL, N'9eEf6dIxO36dzTK6mWjptiXwck8PdyhG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1133, NULL, NULL, NULL, NULL, NULL, N'ssCWI6LVUzcuYFIrZ1039dQpMNF_0ij-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1134, NULL, NULL, NULL, NULL, NULL, N'pnw5hyqxdrAUSoEMZb2wUyeP6snk2v0C')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1135, NULL, NULL, NULL, NULL, NULL, N'1YmGfsJev29x3zeNOafdBK_zLKZP0-bE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1136, NULL, NULL, NULL, NULL, NULL, N'7mWvE2oAF_AkxokJWUMsUaLZG2WT1Z_S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1137, NULL, NULL, NULL, NULL, NULL, N'PGNdTCU9YHA0khR2UG6FBnjTVIDY1yIx')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1138, NULL, NULL, NULL, NULL, NULL, N'm0JGnYroOxREeL4ueJvyeWR9IPN8RlKr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1139, NULL, NULL, NULL, NULL, NULL, N'vcySDkU49fzBefBdJkHJYHEgCGbnQ1eR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1140, NULL, NULL, NULL, NULL, NULL, N'jOfUyLA-S-ysPo3HVLOBkQe_E35k2y9d')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1141, NULL, NULL, NULL, NULL, NULL, N'fLPojwfGF2lyoKeVjcZceocxHBEo2M_3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1142, NULL, NULL, NULL, NULL, NULL, N'8O585HSn51kMUJO5pPmj0vmF8NAtNHVh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1143, NULL, NULL, NULL, NULL, NULL, N'PdX_0x7D4paSiYivMkiLVZmK75ZdqaQD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1144, NULL, NULL, NULL, NULL, NULL, N'u0euX9NCB563x6-C-FRvyrtH71zEcv55')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1145, NULL, NULL, NULL, NULL, NULL, N'hPsmxVUox8u6tP3v96QP1u1JZ0AKOrPI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1146, NULL, NULL, NULL, NULL, NULL, N'IoeSNskhF-xJWVya7_Htk-ByChdtwPSZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1147, NULL, NULL, NULL, NULL, NULL, N'QdI6TH7yF91R4VEUsJyxkmRJDTkrcgbu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1148, NULL, NULL, NULL, NULL, NULL, N'9VH0pG6eZMu55zbtU8mryq8y2uXKfpDO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1149, NULL, NULL, NULL, NULL, NULL, N'v7KGA1Rtup6YdrJ-vI4CmNY6C20XfI9s')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1150, NULL, NULL, NULL, NULL, NULL, N'MS7rTv8Tz-FFxH1awUiip2Gzmtja698T')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1151, NULL, NULL, NULL, NULL, NULL, N'Fl7mBYeg-MfW0L7dBg5_ugIC8xswdcg6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1152, NULL, NULL, NULL, NULL, NULL, N'WFhIvZ3lUst9i0CM8Q_mJMG9D78OWvgQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1153, NULL, NULL, NULL, NULL, NULL, N'7sD5uNu08cUFaDVEjeKG0z9mida_45kj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1154, NULL, NULL, NULL, NULL, NULL, N'lrG2m-OGMI_ucM9ZW61pk3-86F9Q1zgD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1155, NULL, NULL, NULL, NULL, NULL, N'FuMWRxT--RTYuV9C7nCW-65v6tEKOL8f')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1156, NULL, NULL, NULL, NULL, NULL, N'KfJOz9VsvOWroN5c4xANOccihSOKWWFN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1157, NULL, NULL, NULL, NULL, NULL, N'cHqQk8F9fIK1VhyqknNpKGRzeSuSRpXm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1158, NULL, NULL, NULL, NULL, NULL, N'VTocnn7EkiUVone7uP_j1MPJlCN24445')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1159, NULL, NULL, NULL, NULL, NULL, N'cbqQNIkV4gOTkhbzPX6IHPzTUOukj012')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1160, NULL, NULL, NULL, NULL, NULL, N'9RrwSbFyY0yS28-RitE3aMWID-ISwIz6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1161, NULL, NULL, NULL, NULL, NULL, N'wtVhjMNzplL60n1neaYlWGMYEkdZaPtz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1162, NULL, NULL, NULL, NULL, NULL, N'U6xdNek29W6utvMaUWU-hJTcaPvtnz95')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1163, NULL, NULL, NULL, NULL, NULL, N'NHbq2hH--L_1_SbDWZU9HlPbIs3_JBkb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1164, NULL, NULL, NULL, NULL, NULL, N'TGbA4ZQrh_bHXgMccNZQmqSCP2R3S_xc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1165, NULL, NULL, NULL, NULL, NULL, N'mTv_jCgIL1oXZr0-_f_QQpHYaMqGA1Ls')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1166, NULL, NULL, NULL, NULL, NULL, N'JdDXqKq7Gg1qr8mJ1LISJmlK8ze440CD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1167, NULL, NULL, NULL, NULL, NULL, N'ERPrD--ymFfLzHl_-0QqPabwNiYoyoTq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1168, NULL, NULL, NULL, NULL, NULL, N'j_LLQMK_SkUX-holinsrx-BdJw7eRdau')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1169, NULL, NULL, NULL, NULL, NULL, N'Sa3Ym1AFrKb7PFIEPtQRCo2IXUaUSBMm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1170, NULL, NULL, NULL, NULL, NULL, N'ZZTt3lS8Plf9mTmps0Ji4ZAIqwPjSir7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1171, NULL, NULL, NULL, NULL, NULL, N'sRbGQdiIJY8zEC_qdwK6a1TcKvjyl9RP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1172, NULL, NULL, NULL, NULL, NULL, N'H4KoDyQZ9uX5HAPzf5GK_RsF1xmDo_wC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1173, NULL, NULL, NULL, NULL, NULL, N'r-8MfgE8cguTSf1GPBZI1XBFLKTk9edr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1174, NULL, NULL, NULL, NULL, NULL, N'sy6ISJtbEUlOEUEqeYLTpqDQ-VtDOzW1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1175, NULL, NULL, NULL, NULL, NULL, N'k5F89tqpe6LRCxn58DZJUQ8gyypxgc6k')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1176, NULL, NULL, NULL, NULL, NULL, N'gi8kFOqbEM9zefAz77yZ_ccSof0RVw-D')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1177, NULL, NULL, NULL, NULL, NULL, N'x9uTybHLnTmHkDUJnHcX3zXvx9LK3EJZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1178, NULL, NULL, NULL, NULL, NULL, N'6_G_s-FbSjsHpWdwvQLgvugbPK5TkqEz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1179, NULL, NULL, NULL, NULL, NULL, N'd78iIjy1n7cj5cxOO1FH1glJHW6mmvpO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1180, NULL, NULL, NULL, NULL, NULL, N'yqKHz-ML7Nm6Kkkv15aXRkkdt43WgcIX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1181, NULL, NULL, NULL, NULL, NULL, N'RhVwMRzYuCE46inl_iuA6x1LoBftUBoo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1182, NULL, NULL, NULL, NULL, NULL, N'T9ngu6K501AgworYdhCvCUrM32B2BgWO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1183, NULL, NULL, NULL, NULL, NULL, N'LL4OIGK_c2Rf0Kk1FlnrdPFO5X6_jZ0m')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1184, NULL, NULL, NULL, NULL, NULL, N'BTAtkVPDr9uO5CeoSTjvWJ4mcQeCvnHu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1185, NULL, NULL, NULL, NULL, NULL, N'gHCTj18q-swdFCMOykDynzYVuV8DG1Gp')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1186, NULL, NULL, NULL, NULL, NULL, N'Am2SdGe4il3uq4U5eoVvdnsVOcuspuaB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1187, NULL, NULL, NULL, NULL, NULL, N'2vQprlsDXfJYqy1PWyUNdiAK1K6cAAv3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1188, NULL, NULL, NULL, NULL, NULL, N'iJrP1Hbi31P-CJZHHrgSELh-IypIz8k-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1189, NULL, NULL, NULL, NULL, NULL, N'6ZanDAwhtpD6EZ47wLIPXnLm89s3nRdb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1190, NULL, NULL, NULL, NULL, NULL, N'QgP6LwsveR9drHuTn4mWyd2I_Cnb3xre')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1191, NULL, NULL, NULL, NULL, NULL, N'UETPfsMVttZHKrmJJZyD9-bPD8C6bGrC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1192, NULL, NULL, NULL, NULL, NULL, N'PaDoQYntx5DVnVO-FLwQtJvmH79QD1ou')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1193, NULL, NULL, NULL, NULL, NULL, N'RFwA0UQ7aDEhRlwJkWp_INMFG1rLYhO_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1194, NULL, NULL, NULL, NULL, NULL, N'lPZFniWHLgVJ0xdOS_CYrShA4HLATAnE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1195, NULL, NULL, NULL, NULL, NULL, N'5SDaU4Xn0xj99Ftjhx-ZS86XCRJbxMHz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1196, NULL, NULL, NULL, NULL, NULL, N'VB8LKZ0KpvBjAkTw8ae7W7cqlW5-kxAE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1197, NULL, NULL, NULL, NULL, NULL, N'KKD-6fG920g3M7LvkJtshTf8DC0n3o4y')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1198, NULL, NULL, NULL, NULL, NULL, N'sytxQqqfYhoIwPVt5L2whrndegyWdku_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1199, NULL, NULL, NULL, NULL, NULL, N'w64eCXaKrEMw06bmHGN1T8-Q4WgINhJR')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1200, NULL, NULL, NULL, NULL, NULL, N'e88s8z68DX5Y7IV5e9hdbb1WxSb9Mh7-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1201, NULL, NULL, NULL, NULL, NULL, N'TAXY4YI5bgITNyr4bpWy8SVupN_vQMMJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1202, NULL, NULL, NULL, NULL, NULL, N'bt6_8dHRSl5wXxoJwolWdPai6aRXF1XF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1203, NULL, NULL, NULL, NULL, NULL, N'7Fi6pOYO8OnBLpaeJ-EsfUYS8gLMWDZ7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1204, NULL, NULL, NULL, NULL, NULL, N'2FAmt0SIe64MIzHlFh6MCK8FeN2TkncN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1205, NULL, NULL, NULL, NULL, NULL, N'sjFGLARjfQUp1PDiBN6G2WC1JOi7DsLs')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1206, NULL, NULL, NULL, NULL, NULL, N'ihCFORGteBs7nhvRpBwXlW33aGta93U1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1207, NULL, NULL, NULL, NULL, NULL, N'iGsS7vSvOfiP9nt1kJg8ROYHbaUab0Ht')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1208, NULL, NULL, NULL, NULL, NULL, N'dWhPZDmbEQ8bT6985zEchfjbrefGDV82')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1209, NULL, NULL, NULL, NULL, NULL, N'ZxnLnsmHdigjXFEsnezIrC1Q7gnsK_tC')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1210, NULL, NULL, NULL, NULL, NULL, N'gpsXuTAy5a7CK-4JLaXyIb1zRR4Em6sP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1211, NULL, NULL, NULL, NULL, NULL, N'LzIA8HJZ3fld8bTqIDo_r-ofSjArl0K4')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1212, NULL, NULL, NULL, NULL, NULL, N'KibzARa0ldd_lAhQbJMmIWJhp0ilpZQf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1213, NULL, NULL, NULL, NULL, NULL, N'Ig8wjD08ZPnp5f8Dlta--2NPOmTXqmMJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1214, NULL, NULL, NULL, NULL, NULL, N'MgvChHePX5JkKo78asidIljr5U5jpzeT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1215, NULL, NULL, NULL, NULL, NULL, N'9dnuOdaUabaO1NSujQGBpEkx4UT1iCk0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1216, NULL, NULL, NULL, NULL, NULL, N'mkCemUOUe4AjBbQNN-MLwMUgpWD7lAdY')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1217, NULL, NULL, NULL, NULL, NULL, N'IyoVlliVsAfaicH3bKpntpCjJPLG-gFE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1218, NULL, NULL, NULL, NULL, NULL, N'tkAZNfr6aDrsn8HvLx6d5xbUA0Yq_jK8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1219, NULL, NULL, NULL, NULL, NULL, N's1TAio8ERJOOcw3yRX9k37rdPBQyXjFV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1220, NULL, NULL, NULL, NULL, NULL, N'i0i-TP-zt-PWgsbla8DYpfo8eSs1J3C1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1221, NULL, NULL, NULL, NULL, NULL, N'm545K7spuEeVmrJPJxGiIESRfRf9HaOp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1222, NULL, NULL, NULL, NULL, NULL, N'vGjD04B3_OcdtBBiDiysPUmZpLCP8QPa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1223, NULL, NULL, NULL, NULL, NULL, N'GjT9gVgXFqft-92EV-Jb9G44w1H7Xq7A')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1224, NULL, NULL, NULL, NULL, NULL, N'02QCgljIRseF_jrqS_SWtsW2m0_Yf78N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1225, NULL, NULL, NULL, NULL, NULL, N'i1dITbJtfntEwEHRwYRn2lTFaEKMF52k')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1226, NULL, NULL, NULL, NULL, NULL, N'gRVs49Xp4WB2Ud43zvhRsFOodWmxofy1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1227, NULL, NULL, NULL, NULL, NULL, N'x31VhTUfpepwN_MyYOxoEJVQ6pQD5L6x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1228, NULL, NULL, NULL, NULL, NULL, N'vh-GSZWMssh45bKXcsGzz-NAKhoncNlF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1229, NULL, NULL, NULL, NULL, NULL, N'2iTgq3Ac7wsf58l5ZokCDy2xbJgQj_0P')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1230, NULL, NULL, NULL, NULL, NULL, N'a8-x2n_tqXbXiJxnsw7E4vo50XTLA7Zj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1231, NULL, NULL, NULL, NULL, NULL, N'EcqeUtvP7GRCTDmuj4h1PtVscFRxCUO0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1232, NULL, NULL, NULL, NULL, NULL, N'Mwge5a1JRHCLyHemVUajPTosOEAosjWv')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1233, NULL, NULL, NULL, NULL, NULL, N'T4fKLsWqbqVVg6HIlSGZY9tXp_WgYVsc')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1234, NULL, NULL, NULL, NULL, NULL, N'7gvilOKZdBmzLBIac9GC9unazYWs9sTr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1235, NULL, NULL, NULL, NULL, NULL, N'SmV8ewFPkZrMQTnHfdHrCebu6rMfex3Z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1236, NULL, NULL, NULL, NULL, NULL, N'Sg946PPEn5uE9WYXn7OnFYpUdVgNhUn7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1237, NULL, NULL, NULL, NULL, NULL, N'0Qsfug_j04leMmLMs4XGJuivU0cqA438')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1238, NULL, NULL, NULL, NULL, NULL, N'fOSh6eaN7vTLdH1inPQtFW0k7gMqWCxQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1239, NULL, NULL, NULL, NULL, NULL, N'on4QqFe0kb8_Fceaw2xjfmZcvc9il9M1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1240, NULL, NULL, NULL, NULL, NULL, N'JyExoIVLTG_toiJvgXObW74DnxRUYu4n')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1241, NULL, NULL, NULL, NULL, NULL, N'INSYpkWv-GPTSY-b5ppZHjFv4QKIlld-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1242, NULL, NULL, NULL, NULL, NULL, N'fpfW411Jbymmede8d_w1aCRTWNYNc0PG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1243, NULL, NULL, NULL, NULL, NULL, N'-KU9s-N9oBIVZmyFGeRVBK4hSYBDEN_3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1244, NULL, NULL, NULL, NULL, NULL, N'uRhgbYjNMVGUmoIZ7ErA4WX1WqxvZAsd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1245, NULL, NULL, NULL, NULL, NULL, N'GHVaW5x_STp3lf8I0bUvbytffAiSowmK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1246, NULL, NULL, NULL, NULL, NULL, N'cy7iNJNSh5cWqU9yAVlmh4Q6nxkUSmh2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1247, NULL, NULL, NULL, NULL, NULL, N'HFr-6aSvt76exjOoDoadHEDh28Sm2qwF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1248, NULL, NULL, NULL, NULL, NULL, N'KVNrBrCI7-plZ7OhW1ybbd0DYOam2xov')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1249, NULL, NULL, NULL, NULL, NULL, N'4vEslMeQMctvIElHsrgq-wQkxC27i0Ii')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1250, NULL, NULL, NULL, NULL, NULL, N'Jg0HC6WriP-2QhvXhQf9bAh_MBh55V_T')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1251, NULL, NULL, NULL, NULL, NULL, N'cwcTGNR0YjJKB4MzaxfcvdCIeCdJ7ona')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1252, NULL, NULL, NULL, NULL, NULL, N'nhMnYkEAd_6AEZjFjWawsDXt40DRNDJh')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1253, NULL, NULL, NULL, NULL, NULL, N'P-PyegJKPGuNe0i4SHA5RPbbPTa-DWKj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1254, NULL, NULL, NULL, NULL, NULL, N'HeZaQOi1ERPUS5NHJNmgMwmx07pO89Qb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1255, NULL, NULL, NULL, NULL, NULL, N'pwAnt1Ea4vWEy7Mf_a12PkLLJql3Bkx3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1256, NULL, NULL, NULL, NULL, NULL, N'gmJLz9ewnRKR9Jf3eoHAtV0xc2S5FP9s')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1257, NULL, NULL, NULL, NULL, NULL, N'xGAimec8jZ7H3vc3agwEX9lHRwFYNQ00')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1258, NULL, NULL, NULL, NULL, NULL, N'a5JUzfV2rscbmN88QX0v1JQ7qz8xLEFH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1259, NULL, NULL, NULL, NULL, NULL, N'G4xOxkAIIUNia0f9aF_vfLaeGQUt9kDe')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1260, NULL, NULL, NULL, NULL, NULL, N'YQuJ-2xtcvbik0GSnpFZB56igPB7jkUX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1261, NULL, NULL, NULL, NULL, NULL, N'JcqTX9J5UE-oBGtmMP7SE1UMoFQgt6-S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1262, NULL, NULL, NULL, NULL, NULL, N'm4NpbSlNYdmEjraTGjinKmKFbra-9bT1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1263, NULL, NULL, NULL, NULL, NULL, N'6STaQIJ_hmVTjgl2jrHvKzVyNsNPPP_k')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1264, NULL, NULL, NULL, NULL, NULL, N'PSZ-QigUPfsKQKdrXxCDxCeCjMmPVyWG')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1265, NULL, NULL, NULL, NULL, NULL, N'dWom-meg6tcwJXO15ksey1FuUVwEv1Xa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1266, NULL, NULL, NULL, NULL, NULL, N'GaMAqX-p1L2bb-spwo5t7GUzFghGg4hk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1267, NULL, NULL, NULL, NULL, NULL, N'WuPRKBsh_xpp1qaUnx4zvfWH2zjhAp7f')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1268, NULL, NULL, NULL, NULL, NULL, N'e9qYX0sZCyfc22M2w69jJaSXRiczCCDB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1269, NULL, NULL, NULL, NULL, NULL, N'gYNNaAhZ7NN_7k3F-t5c8x1PuJ-bup0m')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1270, NULL, NULL, NULL, NULL, NULL, N'uNziom5Oos1riBYRZUiWfQhr1q6yzfuP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1271, NULL, NULL, NULL, NULL, NULL, N'rW4ET9Gv17PaaF44zRprSUxd6jYuU0ew')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1272, NULL, NULL, NULL, NULL, NULL, N'I3NEunasxNcSHr8DbYDVs21sQd7IijHN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1273, NULL, NULL, NULL, NULL, NULL, N'_gl3FmgkgP0TBM0bFhFdj6QMq7uFDB3r')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1274, NULL, NULL, NULL, NULL, NULL, N'33vwLGhQ7y_6B3Cb-92vGO_8jFg9xTUb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1275, NULL, NULL, NULL, NULL, NULL, N'KFInzz0lgEv9JjwjxSxDTYU5OLTahEJ_')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1276, NULL, NULL, NULL, NULL, NULL, N'h2JHD0OB6cLmI86qIqpxQSLgUdakjGGH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1277, NULL, NULL, NULL, NULL, NULL, N'HWXdkEx3WImB9e97myFyQ0904prc_dn2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1278, NULL, NULL, NULL, NULL, NULL, N'C8Dg-ifncqdPXtstcRo7X7APHCHi52ch')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1279, NULL, NULL, NULL, NULL, NULL, N'FN6tgqbZvXovCB-nBzzDHk0vlhrjfXqK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1280, NULL, NULL, NULL, NULL, NULL, N'Cq8SKIBU9q5bOHSjoj10e6J9hG-sLKa7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1281, NULL, NULL, NULL, NULL, NULL, N'uvTS2gSZcgb5Rud2TYe4nGwiqkxFWFaB')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1282, NULL, NULL, NULL, NULL, NULL, N'3lLgpgeY2JbtnY7MIuIR8BstkMA5a1h0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1283, NULL, NULL, NULL, NULL, NULL, N'2SPeGPuYmcdNyXKW2XBXJseBmGaqclop')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1284, NULL, NULL, NULL, NULL, NULL, N'KHhQTZ5Phitx-cvOxyUuGBaSl7aGC_VA')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1285, NULL, NULL, NULL, NULL, NULL, N'kyIoRnsTGoIUjIQDeosdZfqRNzKwf4Aa')
GO
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1286, NULL, NULL, NULL, NULL, NULL, N'EhlKpEk8TCCFU9bmCXUIl2bU3IJDUh1g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1287, NULL, NULL, NULL, NULL, NULL, N'JzyPMlUoTqjkab0kuTEV_OGw2VPo-SD0')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1288, NULL, NULL, NULL, NULL, NULL, N'1MiwmQl8fw0NIB75jj7C-I6LlzDhq0yt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1289, NULL, NULL, NULL, NULL, NULL, N'yP4im0iNAg-9TIijWz1uNRTqffD9sGgo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1290, NULL, NULL, NULL, NULL, NULL, N'i54yvnTtgR0Ce0cilCY2gh6rEzS9aDTr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1291, NULL, NULL, NULL, NULL, NULL, N'A5SgD1hh-as0ADDx92NvrpyGG3ncTBp2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1292, NULL, NULL, NULL, NULL, NULL, N'fu7BNEfgxG957w2Wxuz68OwvbH-JhM8C')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1293, NULL, NULL, NULL, NULL, NULL, N'OVX0DgkGDAxMd-VhNhiL6ywjCLLdhSEw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1294, NULL, NULL, NULL, NULL, NULL, N'sD8_5bq6JQU_1yj5eKShoan0X8ZORk2z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1295, NULL, NULL, NULL, NULL, NULL, N'Oa8jUChtTZu-nHmsf-oHOzu4J6VwKBqP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1296, NULL, NULL, NULL, NULL, NULL, N'vvhDAXd43fp5DN7lsVe59xv5laYAkYgm')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1297, NULL, NULL, NULL, NULL, NULL, N'spwUZtDIRRIBtCivVvKdsQ4BffO4w5b1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1298, NULL, NULL, NULL, NULL, NULL, N'-xGXZ1gyGbyKivfG1pzPpPVOpHPhxdVI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1299, NULL, NULL, NULL, NULL, NULL, N'xB7Y2vRMZX0OTM-yhv0aczRR5BaFCeAJ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1300, NULL, NULL, NULL, NULL, NULL, N'0pX3OliE00FIc9v-3vZ0XMQQVmVLy4Dq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1301, NULL, NULL, NULL, NULL, NULL, N'wXCPnhCZY5FZBqIxlMQHzTYWY0jUvkxM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1302, NULL, NULL, NULL, NULL, NULL, N'S3P-gxzY--qPJrzWR1ODig5HZKjUCqte')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1303, NULL, NULL, NULL, NULL, NULL, N'EbFmo9jQZMKFLWU37WA8cL0waMJsqGSN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1304, NULL, NULL, NULL, NULL, NULL, N'XJTAlvfm_wNz3tzsyTLpHAd-ucKO1b0O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1305, NULL, NULL, NULL, NULL, NULL, N'R6d6smlrjrbMgKJjsJvmn8tDD7QsFQFi')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1306, NULL, NULL, NULL, NULL, NULL, N'Yfk6jtwzKAu-GtD0bLKZusXQu8b1OVoO')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1307, NULL, NULL, NULL, NULL, NULL, N'IWuayOh-5_wP9cF5X29mP8eAgtW9-7hu')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1308, NULL, NULL, NULL, NULL, NULL, N'An7OMtzXl2DXf_H7_iXkgEDugeb4n4EV')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1309, NULL, NULL, NULL, NULL, NULL, N'OJK0Gvk-0yLi_O_aosuq5Vs5emdRSZWQ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1310, NULL, NULL, NULL, NULL, NULL, N'VaQl-BqoZQQ8MWS4ZfX-3aHsSz0TGByl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1311, NULL, NULL, NULL, NULL, NULL, N'0CtsSge5YXotQuZL1htnpJwDpV6p4QW8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1312, NULL, NULL, NULL, NULL, NULL, N'tpcFxY2NW8gqK8h0dSxPxz7Cufb3e1_g')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1313, NULL, NULL, NULL, NULL, NULL, N'Udl2MBQis1oVXErm4yQo1kRECFveuufE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1314, NULL, NULL, NULL, NULL, NULL, N'-ED8C60K3_VVlOYUoqWNhWt_IPpdaKp5')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1315, NULL, NULL, NULL, NULL, NULL, N'LvxavnsOjQxdGZNckCX6PZrL0KYwVAVb')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1316, NULL, NULL, NULL, NULL, NULL, N'G-XpQcVWmDC-SLrRRI1jFngUlxjNCsXk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1317, NULL, NULL, NULL, NULL, NULL, N'oQYHVX35ozn8IWc6u67kSOdl6PI11DRr')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1318, NULL, NULL, NULL, NULL, NULL, N'i4P1_sbiO_4mWuG7OgZ6q3irnPchuauT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1319, NULL, NULL, NULL, NULL, NULL, N'H1yGFrc1OQI4qjcfa38DS1EjfMzznvfd')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1320, NULL, NULL, NULL, NULL, NULL, N'oraEbdAc2sA216EDCPsJTQGEwDHjrrcH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1321, NULL, NULL, NULL, NULL, NULL, N'a3-j9w7baoroKAn3TpGZRhE2BNRZM9Yw')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1322, NULL, NULL, NULL, NULL, NULL, N'KJ98FsVDjLj0_AlRmx0PNUmsRuGYcHDl')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1323, NULL, NULL, NULL, NULL, NULL, N'nuGJcCe2MEotQ-M_quR1F0RpC_OahSet')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1324, NULL, NULL, NULL, NULL, NULL, N'e8BvlSLvwzgyCMkFgCehhwiHVAIDbJq3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1325, NULL, NULL, NULL, NULL, NULL, N'BUcdfOm1N7GYo-M89dKkvDJXubP5GiLf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1326, NULL, NULL, NULL, NULL, NULL, N'-3QpyYLbVV9AtWp8rI0SnEB2s1K-J3uL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1327, NULL, NULL, NULL, NULL, NULL, N'aXDEuc0ptCOZ8ZHV_xs9PRzrQkezvF0z')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1328, NULL, NULL, NULL, NULL, NULL, N'1fH0HztWs7-1WTfMl6_k0o9XpStLNIK2')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1329, NULL, NULL, NULL, NULL, NULL, N'ayWPqahp3nXAPGnmIYXqAxq_jUHaA9fk')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1330, NULL, NULL, NULL, NULL, NULL, N'2t1KWfuZSA1NfWdfGQjDkwSUmIlkW-O8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1331, NULL, NULL, NULL, NULL, NULL, N'TAHqtaJ20iU0E4kbIKG11hAnwmGozCI-')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1332, NULL, NULL, NULL, NULL, NULL, N'sc0GAHo6G2Sbqt-7UDpmeUGmoTNnK1kI')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1333, NULL, NULL, NULL, NULL, NULL, N'DwnNnZQUdsnCtT74icdRudTP9LBljyp8')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1334, NULL, NULL, NULL, NULL, NULL, N'ZWiEudwcIhufALsqUci98Ao3N_356H7x')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1335, NULL, NULL, NULL, NULL, NULL, N'ojt6tobcFixlI1xnc418jGpxcXFXJu_W')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1336, NULL, NULL, NULL, NULL, NULL, N'GnDixpmHFc3wwHy9QXnWzVlHDr_d6n-L')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1337, NULL, NULL, NULL, NULL, NULL, N'eZYWjRBbZv0TDKAw_y6HCaJvND0a2wWD')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1338, NULL, NULL, NULL, NULL, NULL, N'1anPsYn49oRcirHENnBhsOk0FzWzI_uL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1339, NULL, NULL, NULL, NULL, NULL, N'_KYjWZtwxxlpjEnmyZyz4QX_Jv2PP9UT')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1340, NULL, NULL, NULL, NULL, NULL, N'ifdL_9iQYzx5Z3Oc977IoxA6T4mZep7n')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1341, NULL, NULL, NULL, NULL, NULL, N'LFNjAE_01cEW_VVpzufPO4pFCxCnx0ZM')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1342, NULL, NULL, NULL, NULL, NULL, N'GlgrOBohVAw7yaiJsBhJFei1TunMsHli')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1343, NULL, NULL, NULL, NULL, NULL, N'sWH22HDb_6GCwSMh_43ZMkltAc2hYsQ1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1344, NULL, NULL, NULL, NULL, NULL, N'z4eibWa-S3aJlRjOlVqAC6pS7JG-gkHo')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1345, NULL, NULL, NULL, NULL, NULL, N'IWtSrqYFyahJfArnxQmroI3UNustbT6q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1346, NULL, NULL, NULL, NULL, NULL, N'bd1kYwB2mtD7_7wo0b1P3wfHVkeyOk9W')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1347, NULL, NULL, NULL, NULL, NULL, N'pDieOruVrjAZIAZCN12Oxgs4c1gCAOIF')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1348, NULL, NULL, NULL, NULL, NULL, N'lqr3B87pu9KDMrPBeghv_eXyCP_s2-9N')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1349, NULL, NULL, NULL, NULL, NULL, N'QL9d5Fx-8efIqu-1Dqwytx6NxgX_HF2q')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1350, NULL, NULL, NULL, NULL, NULL, N'TMZjnb8-j-CO9UZCx63ikqHvQ6MHTlfH')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1351, NULL, NULL, NULL, NULL, NULL, N'S-8dgucObl7joBXygB_6QEJqxPVY99Bt')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1352, NULL, NULL, NULL, NULL, NULL, N'6gEon2HVminJUD6cUUR1tXQndGOHvcci')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1353, NULL, NULL, NULL, NULL, NULL, N'RHg6_ftL1gA1ahYbQEvtcnJ60kgAPVGa')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1354, NULL, NULL, NULL, NULL, NULL, N'Ve59sswLXONvqrAyg_ZRRQGg7K-0HErL')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1355, NULL, NULL, NULL, NULL, NULL, N'5PpIJlL-ErilH7W2s6HYmoXsnBefVCx3')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1356, NULL, NULL, NULL, NULL, NULL, N'qONd5qlHmWpcWOgAEcwbnFe4pILrz5KS')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1357, NULL, NULL, NULL, NULL, NULL, N'kzVSp-T1wyPbR6v8wEprytMH7MZ7MdGE')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1358, NULL, NULL, NULL, NULL, NULL, N'vH4qEVOKo8Q5eSU4pCwU-SwAK5R6VKel')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1359, NULL, NULL, NULL, NULL, NULL, N'tKWsBSNMaBTSBmmjxYDKhAEcT1bnZ7mp')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1360, NULL, NULL, NULL, NULL, NULL, N'NQ7XroEReRAgucO9xbW6425E0OIpA8Zf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1361, NULL, NULL, NULL, NULL, NULL, N'wj3J1ilqb2_2Ye5NVrjsX_SGNp0EHIGg')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1362, NULL, NULL, NULL, NULL, NULL, N'ILDUm4XZELyqWkAaDZknF4tzqi4gX3y1')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1363, NULL, NULL, NULL, NULL, NULL, N'LFO_T5y2TCYFbNA74MrJqkB3UvuYmnd6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1364, NULL, NULL, NULL, NULL, NULL, N'oVCIXkpZbpdFuRbPpJzlnJSx4hiqHl2E')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1365, NULL, NULL, NULL, NULL, NULL, N'6OAIOi_X5rqan4Ex2G3J95l2KSPjefUK')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1366, NULL, NULL, NULL, NULL, NULL, N'8_uL5yu2gprjc1tL07RqdTq3Q8QkMdO6')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1367, NULL, NULL, NULL, NULL, NULL, N'we4fGONXwPN6c8M5tcodKvyrsDxTR2Yj')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1368, NULL, NULL, NULL, NULL, NULL, N'53RjrTCxNrQDsVVJRTddmDjBHZLRYQ5S')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1369, NULL, NULL, NULL, NULL, NULL, N'kycYwv88aYCaQ9NuIpprYlt1pTK_7wBq')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1370, NULL, NULL, NULL, NULL, NULL, N'NBC5tIJ65uOg16554bbfXSjP42tn7UGP')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1371, NULL, NULL, NULL, NULL, NULL, N'-rxAcvGE19Tyw1h4tGLxyNoW9oFRB6yf')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1372, NULL, NULL, NULL, NULL, NULL, N'om5rQMX2EjXZpCEIBWiWm288bjBBsvLX')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1373, NULL, NULL, NULL, NULL, NULL, N'DxtjExhhPltEyITE7IqxxBzQhcuXO6dz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1374, NULL, NULL, NULL, NULL, NULL, N'E3pVml6jaLisZCSRjIMcYOwzPs79jRgN')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1375, NULL, NULL, NULL, NULL, NULL, N'uzGGcfGwbv0a9giFXqefdsVFl0m6QMid')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1376, NULL, NULL, NULL, NULL, NULL, N'eLIMouUsGmuSv4IVvpqtmR3cVq1faKFZ')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1377, NULL, NULL, NULL, NULL, NULL, N'tENcUStTRQX5OSQWj1wZ_a5NX9yxCH5O')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1378, NULL, NULL, NULL, NULL, NULL, N'iwb_1eCpaUAvAqF0AZpmcWGdglxY31r7')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1379, NULL, NULL, NULL, NULL, NULL, N'aVkKPztciLjWXuOQz48Fns4pnZ_FtUBz')
INSERT [dbo].[visitors] ([customerID], [fname], [lname], [address], [email], [userID], [sessionID]) VALUES (1380, NULL, NULL, NULL, NULL, NULL, N'Q5fw6Brr0s1x698YCBdwXR2cNNAdJFLS')
SET IDENTITY_INSERT [dbo].[visitors] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__payments__D2315F19BA263B11]    Script Date: 12/6/2022 1:52:32 PM ******/
ALTER TABLE [dbo].[payments] ADD UNIQUE NONCLUSTERED 
(
	[paymentNum] ASC,
	[paymentCVV] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_item] ADD  CONSTRAINT [DF_order_item_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [currDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_orderStatus]  DEFAULT ((1)) FOR [orderStatus]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (dateadd(day,(6),getdate())) FOR [expectedDelivery]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_amountSale]  DEFAULT ((0)) FOR [amountSale]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK_order_item_orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[orders] ([orderID])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK_order_item_orders]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK_order_item_products] FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK_order_item_products]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK_orderItemToProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK_orderItemToProducts]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orderToUser] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orderToUser]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_productsToSupplier] FOREIGN KEY([supplierID])
REFERENCES [dbo].[suppliers] ([supplierID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_productsToSupplier]
GO
ALTER TABLE [dbo].[shoppingCart]  WITH CHECK ADD  CONSTRAINT [FK__shoppingC__userI__1BC821DD] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[shoppingCart] CHECK CONSTRAINT [FK__shoppingC__userI__1BC821DD]
GO
ALTER TABLE [dbo].[shoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_scToProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[shoppingCart] CHECK CONSTRAINT [FK_scToProduct]
GO
ALTER TABLE [dbo].[shoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_scToVisitor] FOREIGN KEY([customerID])
REFERENCES [dbo].[visitors] ([customerID])
GO
ALTER TABLE [dbo].[shoppingCart] CHECK CONSTRAINT [FK_scToVisitor]
GO
ALTER TABLE [dbo].[visitors]  WITH CHECK ADD  CONSTRAINT [FK_CustomerToUser] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[visitors] CHECK CONSTRAINT [FK_CustomerToUser]
GO
/****** Object:  StoredProcedure [dbo].[InsertFullName]    Script Date: 12/6/2022 1:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[InsertFullName]
(
    -- Add the parameters for the stored procedure here
    @Fullname nchar(30)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	INSERT INTO dbo.tblFullname (Fullname) VALUES (@Fullname)
END
GO
/****** Object:  Trigger [dbo].[StatusUpdate]    Script Date: 12/6/2022 1:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StatusUpdate] ON [dbo].[orders]
    AFTER UPDATE
AS
    BEGIN
	    IF UPDATE(orderStatus)
        UPDATE users
			SET    users.orderNotification =  inserted.orderStatus
			FROM inserted
			WHERE users.userID = inserted.userID

    END ;
GO
ALTER TABLE [dbo].[orders] ENABLE TRIGGER [StatusUpdate]
GO
/****** Object:  Trigger [dbo].[UpdateOrderItems]    Script Date: 12/6/2022 1:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[UpdateOrderItems] ON [dbo].[orders]
    AFTER INSERT
AS
    BEGIN
        INSERT INTO order_item (orderID,productID,quantity)
		Select
			inserted.orderID,
			SC.productId,
			SC.numItems
		From shoppingcart SC, inserted 
		Where SC.customerID= inserted.customerId OR SC.userID=inserted.UserID;
    END ;
GO
ALTER TABLE [dbo].[orders] ENABLE TRIGGER [UpdateOrderItems]
GO
/****** Object:  Trigger [dbo].[notEnoughInventory]    Script Date: 12/6/2022 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[notEnoughInventory]
   ON  [dbo].[products]
   AFTER UPDATE
AS
BEGIN

	UPDATE SC set SC.numItems = P.productQuantity 
	FROM dbo.shoppingCart AS SC, dbo.products AS P
	WHERE P.productQuantity < SC.numItems AND P.productID = SC.productID


END
GO
ALTER TABLE [dbo].[products] ENABLE TRIGGER [notEnoughInventory]
GO
/****** Object:  Trigger [dbo].[restockInventory]    Script Date: 12/6/2022 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[restockInventory]
   ON  [dbo].[products]
   AFTER UPDATE
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE P set productQuantity = productQuantity + 10  
	FROM dbo.products AS P
	WHERE P.productQuantity < 5


END
GO
ALTER TABLE [dbo].[products] ENABLE TRIGGER [restockInventory]
GO
/****** Object:  Trigger [dbo].[notEnoughInventorySC]    Script Date: 12/6/2022 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[notEnoughInventorySC]
   ON  [dbo].[shoppingCart]
   AFTER INSERT, UPDATE

AS
BEGIN

	UPDATE SC set SC.numItems = P.productQuantity 
	FROM dbo.shoppingCart AS SC, dbo.products AS P
	WHERE P.productQuantity < SC.numItems AND P.productID = SC.productID


END
GO
ALTER TABLE [dbo].[shoppingCart] ENABLE TRIGGER [notEnoughInventorySC]
GO
/****** Object:  Trigger [dbo].[removeFromCart]    Script Date: 12/6/2022 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[removeFromCart]
   ON  [dbo].[shoppingCart]
   AFTER UPDATE
AS 
BEGIN

	SET NOCOUNT ON;
	
	DELETE FROM dbo.shoppingCart
	WHERE numItems = 0

END
GO
ALTER TABLE [dbo].[shoppingCart] ENABLE TRIGGER [removeFromCart]
GO
ALTER DATABASE [group9POS] SET  READ_WRITE 
GO
