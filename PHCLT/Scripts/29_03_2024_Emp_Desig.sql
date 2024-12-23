USE [Phclt]
GO
/****** Object:  Table [dbo].[DesignationMaster]    Script Date: 3/29/2024 9:22:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationMaster](
	[DesignationMasterId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DesignationName] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCenterEmployee]    Script Date: 3/29/2024 9:22:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCenterEmployee](
	[SubCenterEmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PHCId] [int] NOT NULL,
	[VillageId] [int] NOT NULL,
	[SubCenterId] [int] NOT NULL,
	[DesgnationId] [int] NOT NULL,
	[EmployeeName] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SubCenterEmployee] PRIMARY KEY CLUSTERED 
(
	[SubCenterEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DesignationMaster] ON 

INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (1, 1, N'Pharmacist', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (2, 1, N'Nurse midwife', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (3, 1, N'Health worker (F) / ANM', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (4, 2, N'Block extension educator', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (5, 2, N'Health assistant male', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (6, 2, N'Health assistant (F)', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DesignationMaster] ([DesignationMasterId], [UserId], [DesignationName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [IsActive]) VALUES (7, 2, N'Upper division clerk', 1, CAST(N'2024-03-29T18:03:44.477' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DesignationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCenterEmployee] ON 

INSERT [dbo].[SubCenterEmployee] ([SubCenterEmployeeId], [PHCId], [VillageId], [SubCenterId], [DesgnationId], [EmployeeName], [UserId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive]) VALUES (1, 3, 1, 15, 5, N'demo some edit', 2, CAST(N'2024-03-29T20:13:28.000' AS DateTime), 2, CAST(N'2024-03-29T20:20:44.000' AS DateTime), 2, 1)
INSERT [dbo].[SubCenterEmployee] ([SubCenterEmployeeId], [PHCId], [VillageId], [SubCenterId], [DesgnationId], [EmployeeName], [UserId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive]) VALUES (4, 3, 1, 13, 6, N'demo some edit some new', 2, CAST(N'2024-03-29T20:24:04.000' AS DateTime), 2, CAST(N'2024-03-29T20:31:30.000' AS DateTime), 2, 1)
INSERT [dbo].[SubCenterEmployee] ([SubCenterEmployeeId], [PHCId], [VillageId], [SubCenterId], [DesgnationId], [EmployeeName], [UserId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsActive]) VALUES (5, 3, 1, 13, 4, N'karan demo ', 2, CAST(N'2024-03-29T20:31:54.000' AS DateTime), 2, CAST(N'2024-03-29T20:32:15.000' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[SubCenterEmployee] OFF
GO
