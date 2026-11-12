USE [PurchaseSalesInventory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](120) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parties]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](160) NOT NULL,
	[Gstin] [nvarchar](15) NULL,
	[StateCode] [nvarchar](2) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](160) NOT NULL,
	[OpeningBalance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sku] [nvarchar](40) NOT NULL,
	[Name] [nvarchar](160) NOT NULL,
	[Barcode] [nvarchar](80) NULL,
	[Unit] [nvarchar](30) NOT NULL,
	[HsnCode] [nvarchar](20) NOT NULL,
	[GstRate] [decimal](5, 2) NOT NULL,
	[CostPrice] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[StockQty] [decimal](18, 3) NOT NULL,
	[ReorderLevel] [decimal](18, 3) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoiceLines]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoiceLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseInvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[GstRate] [decimal](5, 2) NOT NULL,
	[LineTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PurchaseInvoiceLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoices]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](40) NOT NULL,
	[InvoiceDate] [datetime2](7) NOT NULL,
	[PartyId] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Cgst] [decimal](18, 2) NOT NULL,
	[Sgst] [decimal](18, 2) NOT NULL,
	[Igst] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_PurchaseInvoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoiceLines]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoiceLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesInvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[CostPriceAtSale] [decimal](18, 2) NOT NULL,
	[GstRate] [decimal](5, 2) NOT NULL,
	[LineTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_SalesInvoiceLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](40) NOT NULL,
	[InvoiceDate] [datetime2](7) NOT NULL,
	[PartyId] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Cgst] [decimal](18, 2) NOT NULL,
	[Sgst] [decimal](18, 2) NOT NULL,
	[Igst] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_SalesInvoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMovements]    Script Date: 11/12/2026 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMovements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OccurredAt] [datetime2](7) NOT NULL,
	[QuantityDelta] [decimal](18, 3) NOT NULL,
	[SourceType] [nvarchar](30) NOT NULL,
	[SourceId] [int] NOT NULL,
	[UserName] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_StockMovements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20261104162126_InitialCreate', N'8.0.11')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0e66cc0a-503c-4e0a-abc5-20e663b091f1', N'Viewer', N'VIEWER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'372d6c35-5f3c-442f-bc49-b7bfa57837b3', N'Purchase', N'PURCHASE', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5ce52d73-6010-4f61-ac0b-fbd255ae214f', N'Manager', N'MANAGER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6a7319b9-ba19-4039-a9d6-649615167da5', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8601286a-62c4-445d-9fe0-94c65b3f7f50', N'Sales', N'SALES', NULL)
GO
SET IDENTITY_INSERT [dbo].[Parties] ON 
GO
INSERT [dbo].[Parties] ([Id], [Type], [Name], [Gstin], [StateCode], [Address], [Phone], [Email], [OpeningBalance]) VALUES (1, 1, N'Sup 001', N'13333', N'27', N'445558', N'123344', N'mailtojaid@gmail.com', CAST(1000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Parties] ([Id], [Type], [Name], [Gstin], [StateCode], [Address], [Phone], [Email], [OpeningBalance]) VALUES (2, 2, N'CUST001', N'35548', N'27', N'445558', N'46665464', N'mailtojaid001@gmail.com', CAST(15200.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Parties] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Barcode], [Unit], [HsnCode], [GstRate], [CostPrice], [UnitPrice], [StockQty], [ReorderLevel], [IsActive]) VALUES (1, N'00124', N'PROD001', N'123333', N'pcs', N'1233', CAST(18.00 AS Decimal(5, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(1900.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), 1)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseInvoiceLines] ON 
GO
INSERT [dbo].[PurchaseInvoiceLines] ([Id], [PurchaseInvoiceId], [ProductId], [Quantity], [UnitPrice], [GstRate], [LineTotal]) VALUES (1, 1, 1, CAST(1500.000 AS Decimal(18, 3)), CAST(6.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(5, 2)), CAST(10620.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseInvoiceLines] ([Id], [PurchaseInvoiceId], [ProductId], [Quantity], [UnitPrice], [GstRate], [LineTotal]) VALUES (2, 1, 1, CAST(500.000 AS Decimal(18, 3)), CAST(6.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(5, 2)), CAST(3540.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PurchaseInvoiceLines] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseInvoices] ON 
GO
INSERT [dbo].[PurchaseInvoices] ([Id], [InvoiceNo], [InvoiceDate], [PartyId], [SubTotal], [Cgst], [Sgst], [Igst], [GrandTotal], [Notes], [CreatedBy]) VALUES (1, N'PUR-20261104162844-944', CAST(N'2026-11-04T00:00:00.0000000' AS DateTime2), 1, CAST(12000.00 AS Decimal(18, 2)), CAST(1080.00 AS Decimal(18, 2)), CAST(1080.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14160.00 AS Decimal(18, 2)), N'124LLK', N'admin@example.com')
GO
SET IDENTITY_INSERT [dbo].[PurchaseInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesInvoiceLines] ON 
GO
INSERT [dbo].[SalesInvoiceLines] ([Id], [SalesInvoiceId], [ProductId], [Quantity], [UnitPrice], [CostPriceAtSale], [GstRate], [LineTotal]) VALUES (1, 1, 1, CAST(100.000 AS Decimal(18, 3)), CAST(7.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(5, 2)), CAST(826.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[SalesInvoiceLines] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesInvoices] ON 
GO
INSERT [dbo].[SalesInvoices] ([Id], [InvoiceNo], [InvoiceDate], [PartyId], [SubTotal], [Cgst], [Sgst], [Igst], [GrandTotal], [Notes], [CreatedBy]) VALUES (1, N'SAL-20261104162908-498', CAST(N'2026-11-04T00:00:00.0000000' AS DateTime2), 2, CAST(700.00 AS Decimal(18, 2)), CAST(63.00 AS Decimal(18, 2)), CAST(63.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(826.00 AS Decimal(18, 2)), N'124LLK', N'admin@example.com')
GO
SET IDENTITY_INSERT [dbo].[SalesInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[StockMovements] ON 
GO
INSERT [dbo].[StockMovements] ([Id], [ProductId], [OccurredAt], [QuantityDelta], [SourceType], [SourceId], [UserName]) VALUES (1, 1, CAST(N'2026-11-04T16:28:44.9615965' AS DateTime2), CAST(1500.000 AS Decimal(18, 3)), N'Purchase', 0, N'admin@example.com')
GO
INSERT [dbo].[StockMovements] ([Id], [ProductId], [OccurredAt], [QuantityDelta], [SourceType], [SourceId], [UserName]) VALUES (2, 1, CAST(N'2026-11-04T16:28:44.9775944' AS DateTime2), CAST(500.000 AS Decimal(18, 3)), N'Purchase', 0, N'admin@example.com')
GO
INSERT [dbo].[StockMovements] ([Id], [ProductId], [OccurredAt], [QuantityDelta], [SourceType], [SourceId], [UserName]) VALUES (3, 1, CAST(N'2026-11-04T16:29:08.6525141' AS DateTime2), CAST(-100.000 AS Decimal(18, 3)), N'Sale', 0, N'admin@example.com')
GO
SET IDENTITY_INSERT [dbo].[StockMovements] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PurchaseInvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseInvoiceLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseInvoiceLines] CHECK CONSTRAINT [FK_PurchaseInvoiceLines_Products_ProductId]
GO
ALTER TABLE [dbo].[PurchaseInvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseInvoiceLines_PurchaseInvoices_PurchaseInvoiceId] FOREIGN KEY([PurchaseInvoiceId])
REFERENCES [dbo].[PurchaseInvoices] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseInvoiceLines] CHECK CONSTRAINT [FK_PurchaseInvoiceLines_PurchaseInvoices_PurchaseInvoiceId]
GO
ALTER TABLE [dbo].[PurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseInvoices_Parties_PartyId] FOREIGN KEY([PartyId])
REFERENCES [dbo].[Parties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseInvoices] CHECK CONSTRAINT [FK_PurchaseInvoices_Parties_PartyId]
GO
ALTER TABLE [dbo].[SalesInvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoiceLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesInvoiceLines] CHECK CONSTRAINT [FK_SalesInvoiceLines_Products_ProductId]
GO
ALTER TABLE [dbo].[SalesInvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoiceLines_SalesInvoices_SalesInvoiceId] FOREIGN KEY([SalesInvoiceId])
REFERENCES [dbo].[SalesInvoices] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesInvoiceLines] CHECK CONSTRAINT [FK_SalesInvoiceLines_SalesInvoices_SalesInvoiceId]
GO
ALTER TABLE [dbo].[SalesInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoices_Parties_PartyId] FOREIGN KEY([PartyId])
REFERENCES [dbo].[Parties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesInvoices] CHECK CONSTRAINT [FK_SalesInvoices_Parties_PartyId]
GO
ALTER TABLE [dbo].[StockMovements]  WITH CHECK ADD  CONSTRAINT [FK_StockMovements_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockMovements] CHECK CONSTRAINT [FK_StockMovements_Products_ProductId]
GO
