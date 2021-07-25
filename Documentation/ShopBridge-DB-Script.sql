USE [master]
GO
/****** Object:  Database [ShopBridge]    Script Date: 25-07-2021 20:17:14 ******/
CREATE DATABASE [ShopBridge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBridge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBridge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBridge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBridge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopBridge] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBridge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBridge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBridge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBridge] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBridge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBridge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBridge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBridge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBridge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBridge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBridge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBridge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopBridge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBridge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBridge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBridge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBridge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBridge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBridge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBridge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopBridge] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBridge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBridge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBridge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBridge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopBridge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopBridge] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopBridge] SET QUERY_STORE = OFF
GO
USE [ShopBridge]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25-07-2021 20:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProductCategory] [int] NOT NULL,
	[Price] [int] NULL,
	[Dimensions] [nvarchar](50) NULL,
	[UniqueIdentityNumber] [nvarchar](50) NULL,
	[ProductExpiryDate] [datetime] NULL,
	[ManufacturedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDateTime] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDateTime] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 25-07-2021 20:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [ProductCategory], [Price], [Dimensions], [UniqueIdentityNumber], [ProductExpiryDate], [ManufacturedBy], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime], [DeletedBy], [DeletedDateTime], [IsActive]) VALUES (N'00be9ff1-acc6-4bb0-904b-67b280b86999', N'Diamond-Watch', N'Gurantee Diamond', 1, 309999, N'20*60', N'WEE#VBVB#', CAST(N'2021-07-25T10:50:39.290' AS DateTime), N'Rolex', N'1', CAST(N'2021-07-25T10:50:39.293' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [ProductCategory], [Price], [Dimensions], [UniqueIdentityNumber], [ProductExpiryDate], [ManufacturedBy], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime], [DeletedBy], [DeletedDateTime], [IsActive]) VALUES (N'02042480-f789-4493-b75d-2a1aa90aba07', N'Apple-Digital Watch', N'Analog Watch', 1, 3566, N'89*99', N'AWZSD23', CAST(N'2021-07-25T12:45:27.807' AS DateTime), N'Titan', N'1', CAST(N'2021-07-25T12:02:43.530' AS DateTime), N'1', CAST(N'2021-07-25T12:45:29.007' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [ProductCategory], [Price], [Dimensions], [UniqueIdentityNumber], [ProductExpiryDate], [ManufacturedBy], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime], [DeletedBy], [DeletedDateTime], [IsActive]) VALUES (N'85cc1e96-022a-4bdb-9cff-e7b062397778', N'Digital Watch', N'Analog Watch', 1, 3566, N'89*99', N'AWZSD23', CAST(N'2021-07-25T14:30:47.930' AS DateTime), N'Titan', N'1', CAST(N'2021-07-25T14:30:47.970' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [ProductCategory], [Price], [Dimensions], [UniqueIdentityNumber], [ProductExpiryDate], [ManufacturedBy], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime], [DeletedBy], [DeletedDateTime], [IsActive]) VALUES (N'a7fb6aa2-f765-421c-93ef-2b05e662642c', N'Steel-Watch', N'Gurantee', 1, 309, N'20*66', N'WEE##', CAST(N'2021-07-25T10:34:05.267' AS DateTime), N'Rolex', N'1', CAST(N'2021-07-25T10:34:05.310' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [ProductCategory], [Price], [Dimensions], [UniqueIdentityNumber], [ProductExpiryDate], [ManufacturedBy], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime], [DeletedBy], [DeletedDateTime], [IsActive]) VALUES (N'ab4a95cc-63d8-4091-a710-73ea589e5cc2', N'Gold Watch', N'Analog Watch', 1, 3566, N'89*99', N'AWZSD23', CAST(N'2021-07-25T14:31:29.943' AS DateTime), N'Titan', N'1', CAST(N'2021-07-25T14:31:29.983' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 
GO
INSERT [dbo].[ProductCategory] ([Id], [Category], [Description], [CreatedBy], [CreatedDateTime], [IsActive]) VALUES (1, N'Watches', N'Good Watches', N'1', CAST(N'2021-07-25T10:33:15.550' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_ProductCategory] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductCategory_ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [ShopBridge] SET  READ_WRITE 
GO
