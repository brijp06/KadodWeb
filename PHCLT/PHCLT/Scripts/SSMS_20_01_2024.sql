USE [SSMS]
GO
/****** Object:  Table [dbo].[CustomerProductMaster]    Script Date: 20-01-2024 12:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProductMaster](
	[CustomerProductMasterId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[CustomerTaluka] [int] NULL,
	[CustomerDistrict] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[Mob1] [nvarchar](100) NULL,
	[Mob2] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerProductMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersProduct]    Script Date: 20-01-2024 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersProduct](
	[CustomersProductId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerProductMasterId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[Products] [nvarchar](max) NULL,
	[TillWarrantyDate] [datetime] NULL,
	[PurchaseDate] [datetime] NULL,
	[CustomerBillImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomersProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerProductMaster] ON 

INSERT [dbo].[CustomerProductMaster] ([CustomerProductMasterId], [CustomerName], [CustomerAddress], [CustomerTaluka], [CustomerDistrict], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Mob1], [Mob2]) VALUES (1, N'Brij Patel demo', N'flkgjdfklg', 192, 21, CAST(N'2024-01-19T18:44:42.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'897897465486', N'')
INSERT [dbo].[CustomerProductMaster] ([CustomerProductMasterId], [CustomerName], [CustomerAddress], [CustomerTaluka], [CustomerDistrict], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Mob1], [Mob2]) VALUES (2, N'Karan Patel', N'some new address', 118, 13, CAST(N'2024-01-19T18:48:53.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'897897465486', N'')
SET IDENTITY_INSERT [dbo].[CustomerProductMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomersProduct] ON 

INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (1, 2, CAST(N'2024-01-20T12:24:22.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'demo', CAST(N'2024-01-30T00:00:00.000' AS DateTime), CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (2, 1, CAST(N'2024-01-20T12:26:38.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'dell inspiron gaming laptop  ', CAST(N'2024-01-25T00:00:00.000' AS DateTime), CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (3, 1, CAST(N'2024-01-20T12:26:38.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'ipad', CAST(N'2024-01-25T00:00:00.000' AS DateTime), CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (4, 1, CAST(N'2024-01-20T12:26:38.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'iphone', CAST(N'2024-01-25T00:00:00.000' AS DateTime), CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (5, 1, CAST(N'2024-01-20T12:31:58.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'demo', CAST(N'2024-01-24T00:00:00.000' AS DateTime), CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (6, 2, CAST(N'2024-01-20T12:39:42.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'demo', CAST(N'2024-01-25T00:00:00.000' AS DateTime), CAST(N'2024-01-03T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[CustomersProduct] ([CustomersProductId], [CustomerProductMasterId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive], [Products], [TillWarrantyDate], [PurchaseDate], [CustomerBillImage]) VALUES (7, 1, CAST(N'2024-01-20T12:41:02.000' AS DateTime), N'System', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 1, N'demo', CAST(N'2024-01-31T00:00:00.000' AS DateTime), CAST(N'2024-01-31T00:00:00.000' AS DateTime), N'customer-bill-20240120071031842.png')
SET IDENTITY_INSERT [dbo].[CustomersProduct] OFF
GO
