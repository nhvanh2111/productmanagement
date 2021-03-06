USE [master]
GO
/****** Object:  Database [ProductManagement]    Script Date: 13-Aug-21 8:31:57 AM ******/
CREATE DATABASE [ProductManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProductManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProductManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProductManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProductManagement]
GO
/****** Object:  Table [dbo].[TblCategories]    Script Date: 13-Aug-21 8:31:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblCategories](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblProducts]    Script Date: 13-Aug-21 8:31:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblProducts](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[unit] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryid] [varchar](10) NULL,
 CONSTRAINT [PK_TblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 13-Aug-21 8:31:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUsers](
	[userID] [varchar](10) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_TblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'AD', N'Adidas', N'Made in Indonesia')
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'CV ', N'Converse', N'Made in America')
INSERT [dbo].[TblCategories] ([categoryID], [categoryName], [description]) VALUES (N'PM', N'Puma', N'Made in China')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'AD034', N'Adidas 02', N'4', 1000000, 54, N'AD')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'AD050', N'Adidas 01', N'2', 3000000, 20, N'AD')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'CV002', N'Converse 002', N'1', 2000000, 30, N'AD')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'CV003', N'Converse 003', N'3', 2000000, 50, N'CV')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'CV004', N'Converse 004', N'2', 1400000, 20, N'CV')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'CV005', N'Converse 005', N'4', 1100000, 10, N'CV')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'CV007', N'Converse 007', N'2', 1100000, 32, N'CV')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'PM122', N'Puma 021', N'3', 1000000, 21, N'PM')
INSERT [dbo].[TblProducts] ([productID], [productName], [unit], [price], [quantity], [categoryid]) VALUES (N'PM123', N'Puma 001', N'5', 2000000, 30, N'PM')
INSERT [dbo].[TblUsers] ([userID], [fullName], [password], [status]) VALUES (N'Anh', N'Nguyen', N'123', 1)
INSERT [dbo].[TblUsers] ([userID], [fullName], [password], [status]) VALUES (N'Vanh', N'Nguyen', N'1234', 1)
ALTER TABLE [dbo].[TblProducts]  WITH CHECK ADD  CONSTRAINT [CategoryID] FOREIGN KEY([categoryid])
REFERENCES [dbo].[TblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[TblProducts] CHECK CONSTRAINT [CategoryID]
GO
USE [master]
GO
ALTER DATABASE [ProductManagement] SET  READ_WRITE 
GO
