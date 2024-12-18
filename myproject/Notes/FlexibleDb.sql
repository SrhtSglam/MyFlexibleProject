USE [master]
GO
/****** Object:  Database [FlexibleDb]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE DATABASE [FlexibleDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopDb', FILENAME = N'C:\DB\shopDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopDb_log', FILENAME = N'C:\DB\shopDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlexibleDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlexibleDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlexibleDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlexibleDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlexibleDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlexibleDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlexibleDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlexibleDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlexibleDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlexibleDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlexibleDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlexibleDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlexibleDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlexibleDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlexibleDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlexibleDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlexibleDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlexibleDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlexibleDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlexibleDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlexibleDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlexibleDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlexibleDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlexibleDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlexibleDb] SET RECOVERY FULL 
GO
ALTER DATABASE [FlexibleDb] SET  MULTI_USER 
GO
ALTER DATABASE [FlexibleDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlexibleDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlexibleDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlexibleDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlexibleDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlexibleDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopDb', N'ON'
GO
ALTER DATABASE [FlexibleDb] SET QUERY_STORE = OFF
GO
USE [FlexibleDb]
GO
/****** Object:  User [BILGITAS\STJ067]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE USER [BILGITAS\STJ067] FOR LOGIN [BILGITAS\STJ067] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BILGITAS\STJ067]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[UserId] [varchar](50) NULL,
	[AddressName] [varchar](50) NULL,
	[AddressStreet] [varchar](50) NULL,
	[AddressCity] [varchar](50) NULL,
	[AddressCountry] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/27/2024 2:13:43 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CartId] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Url] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[UserId] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[ProductId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Name] [varchar](250) NULL,
	[Url] [varchar](250) NULL,
	[Price] [float] NULL,
	[Description] [varchar](250) NULL,
	[ImageUrl] [varchar](250) NULL,
	[IsApproved] [bit] NULL,
	[IsHome] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Url] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebProperties]    Script Date: 11/27/2024 2:13:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebProperties](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](150) NULL,
	[PropertyEnabled] [bit] NULL,
 CONSTRAINT [PK_WebProperties] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104130445_InitialCreate', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105064000_AddProduct', N'8.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9519ce2a-4460-4d54-ac0a-20a0a4effb00', N'admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'51a47439-c50e-49fe-bc8a-8dab10cdd70b', N'9519ce2a-4460-4d54-ac0a-20a0a4effb00')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'51a47439-c50e-49fe-bc8a-8dab10cdd70b', N'admin', N'admin', N'sa', N'SA', N'adminuser@myproject.com', N'ADMINUSER@MYPROJECT.COM', 1, N'AQAAAAIAAYagAAAAEAYRveYvH2tvGZqIhCG6F/shimIx+L4eeyuSpDyRt+6fFYmM85uxBqQzl4c+x5GY8w==', N'5TNDOJPIVGEY2WEYA7BEBOHH5UO4BKTC', N'e62ed5ca-3a6c-4ead-983d-9afe3c1e96ec', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f77a2d12-3883-4d51-955e-0ed425204074', N'John', N'Fred', N'johnfred', N'JOHNFRED', N'johnfreddy@gmail.com', N'JOHNFREDDY@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFwzpYUaxdymxJYjDhAID42UKYwh6rSU6Tu5ELLgkOaoL8EQu36ut6jn34mx8ZVnvQ==', N'NUFBMOL2FPV3UEGEYIODEL44JUCTHAZO', N'a4fa79cf-8661-4858-ac67-b0537564c4b8', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (1, N'51a47439-c50e-49fe-bc8a-8dab10cdd70b')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (2, N'7e3e58bc-6c57-4aac-93a7-7a0658e1258e')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (3, N'0532e422-a957-4743-bc66-617e346ce0a2')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (4, N'9a6f34b0-bc6c-466d-9c46-cc69d039fa3c')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (5, N'b2fe3b60-b781-4640-81e4-c1f273a9ee00')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (6, N'f77a2d12-3883-4d51-955e-0ed425204074')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (7, N'0682bd4f-02de-4479-84cb-4809a223efa6')
INSERT [dbo].[Cart] ([Id], [UserId]) VALUES (8, N'1bbf7c4e-389b-4a19-8779-c4abedde2066')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (1, N'Personal', N'personal')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (2, N'Home', N'home')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (3, N'Office', N'office')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [FirstName], [LastName], [Address], [City], [Phone], [Email], [Note]) VALUES (1, N'51a47439-c50e-49fe-bc8a-8dab10cdd70b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 1, 1)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 1, 2)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 1, 3)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 1, 4)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 2, 5)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 2, 6)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 2, 7)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 3, 8)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 3, 9)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 3, 10)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (3, 4, 11)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (3, 5, 12)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 6, 13)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 6, 14)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 6, 15)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 6, 16)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 7, 17)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 7, 18)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 7, 19)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 8, 20)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 8, 21)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 9, 22)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 10, 23)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 10, 24)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 11, 25)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 12, 26)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 12, 27)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 13, 28)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 14, 29)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 15, 30)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (2, 15, 31)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 16, 32)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (3, 17, 33)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (3, 17, 34)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 18, 35)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 19, 36)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 20, 37)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 20, 38)
INSERT [dbo].[ProductCategory] ([CategoryId], [SubCategoryId], [ProductId]) VALUES (1, 21, 39)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1, N'Casper', N'Excalibur G870.1270-DFB0X-B', N'Excalibur-G870.1270-DFB0X-B', 51999, N'Intel Core i7 12700H 32GB 1TB SSD RTX4060 Freedos 15.6" Taşınabilir Bilgisayar', N'laptop1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (2, N'Dell', N'Inspiron 3520', N'Inspiron-3520', 17999, N'Intel Core i5 1235U 8GB 512GB SSD Ubuntu 15.6" FHD 120Hz Taşınabilir Bilgisayar', N'laptop2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (3, N'Monster', N'Abra A5 V21.3.2', N'Abra-A5-V21.3.2', 32699, N'Intel Core I7 12700H 32 GB Ram 1 Tb SSD 4 GB Rtx 2050 Freedos 15,6" Fhd 144 Hz Oyun Bilgisayarı', N'laptop3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (4, N'HP', N'Victus Gaming', N'Victus-Gaming', 42665, N'15 Intel Core i5 12500H 16GB 512GB SSD RTX4060 Freedos 15.6" Taşınabilir Bilgisayar B03C7EA', N'laptop4.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (5, N'Samsung', N'Galaxy Tab S10 Ultra', N'Galaxy-Tab-S10-Ultra', 35869, N'12GB 512GB SM-X920', N'tablet1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (6, N'Apple', N'iPad 10.nesil', N'iPad-10.nesil', 14169, N'64GB 10.9" Wi-Fi Tablet Pembe MCMC4TU/A', N'tablet2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (7, N'Samsung', N'Galaxy Tab S9 FE+ SM-X610', N'Galaxy-Tab-S9-FE+-SM-X610', 14799, N'8GB 128GB 12.4" Gray Tablet', N'tablet3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (8, N'Casper', N'Excalibur E65H.127F-DFB0X-0HD', N'Excalibur-E65H.127F-DFB0X-0HD', 38999, N'Intel Core i7 12700F 32GB 1TB SSD RTX4060 Freedos Masaüstü Bilgisayar', N'pc1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (9, N'Warp', N'Optima B760', N'Optima-B760', 29999, N'Intel Core i5 12400F 16GB 512GB SSD RTX4060 Freedos Masaüstü Bilgisayar', N'pc2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (10, N'Zeiron', N'Damage X40', N'Damage-X40', 36374, N'Ryzen 7 5700X 32GB Ram 1tb M.2 Nvme SSD RTX4060 8gb 27" 240Hz Oyuncu Masaüstü Bilgisayar', N'pc3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (11, N'Kyocera', N'Ecosys MA4500IX', N'Ecosys-MA4500IX', 36507, N'Mono Çok Fonksiyonlu Lazer yazıcı', N'printer1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (12, N'Epson', N'103 Ecotank', N'103-Ecotank', 365, N'65 ml 4 Renk Kutulu Orijinal Mürekkep Seti', N'material1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (13, N'Realme', N'GT6T', N'GT6T', 28699, N'12GB 256GB (Realme Türkiye Garantili) Yeşil', N'phone1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (14, N'Apple', N'iPhone 13', N'iPhone-13', 34199, N'128 GB Beyaz', N'phone2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (15, N'Samsung', N'Galaxy M34', N'Galaxy-M34', 8999, N'5G 6 GB 128 GB (Samsung Türkiye Garantili) Gümüş 128 GB Gümüş', N'phone3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (16, N'Samsung', N'Galaxy M34', N'Galaxy-M34', 8998, N'5G 6 GB 128 GB (Samsung Türkiye Garantili) Mavi 128 GB Mavi', N'phone4.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (17, N'Xiaomi', N'Redmi Watch 5', N'Redmi-Watch-5', 1199, N'Active Silver Akıllı Saat Sesli Görüşme Özellikli', N'clock1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (18, N'Xiaomi', N'Redmi Watch 5', N'Redmi-Watch-5', 1239, N'Active Akıllı Saat Sesli Görüşme Özellikli', N'clock2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (19, N'TCL', N'MT40X Movetime Family Watch', N'MT40X-Movetime-Family-Watch', 3879, N'4G Akıllı Çocuk Saati - Mavi', N'clock3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (20, N'Toshiba', N'65UA3E63DT', N'65UA3E63DT', 26499, N'65" 165 Ekran Dahili Uydu Alıcılı 4K Ultra HD Smart DLED TV', N'tv1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (21, N'TCL', N'98C755', N'98C755', 189999, N'98" 248 Ekran Dahili Uydu Alıcılı 4K Ultra HD Smart QLED TV', N'tv2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (22, N'Xiaomi', N'Mi Box S', N'Mi-Box-S', 2298, N'4K Android TV Box (2. Nesil)', N'cinema1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (23, N'Sge Teknoloji', N'Nostaljik Hoparlörlü', N'Nostaljik-Hoparlörlü', 2324, N'Çantalı Usb+Sd Pikap Plak Çalar', N'music1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (24, N'Everton', N'RT-301B', N'RT-301B', 499, N'El Fenerli Taşınabilir Nostaljik Radyo Hoparlör USB Tf Aux Destekli', N'music2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (25, N'Vestel', N'NF45011', N'NF45011', 21069, N'402 Lt E Enerji Sınıfı No-Frost Buzdolabı', N'fridge1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (26, N'Kumtel', N'KO-40TAHDF', N'KO-40TAHDF', 2739, N'Siyah Cam Ankastre Ocak', N'stove1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (27, N'Kumtel', N'KO-40TAHDF', N'KO-40TAHDF', 2919, N'Beyaz Cam Ankastre Ocak', N'stove2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (28, N'Dyson', N'Washg1™', N'Washg1', 24999, N'(Parlak Mavi / Mat Siyah) Islak Zemin Temizleyici', N'mop1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (29, N'Kiwi', N'KVC-4108', N'KVC-4108', 599, N'Dikey Elektrikli Süpürge Kablolu Siyah KVC-4108', N'mop2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (30, N'Dyson', N'Airwrap™', N'Airwrap', 25363, N'Complete Long Volumise (Prusya Mavisi/parlak Bakır)', N'hair1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (31, N'Dyson', N'Airstrait™', N'Airstrait', 19999, N'Saç Düzleştirici (Prusya Mavisi/Parlak Bakır)', N'hair2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (32, N'DJI', N'Mini 4 Pro', N'Mini-4-Pro', 45999, N'Fly More Combo Plus ( Rc 2) İthalatçı Garantili', N'drone1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (33, N'Nikon', N'D5200', N'D5200', 15400, N'18-55 mm Kit Fotoğraf Makinesi', N'photo1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (34, N'Nikon', N'D5100', N'D5100', 13150, N'18-55 VR 16.2MP 3" LCD Dijital SLR Fotoğraf Makinesi', N'photo2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (35, N'Rockstar Games', N'Grand Theft Auto V', N'Grand-Theft-Auto-V', 484, N'Pc Rockstargames Cd-Key Gta 5', N'game1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (36, N'Microsoft', N'Xbox Oyun ve Şarj Kiti 9.Nesil', N'Xbox-Oyun-ve-Şarj-Kiti-9.Nesil', 1429, N'Xbox Oyun ve Şarj Kiti 9.Nesil', N'xbox1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (37, N'Sony', N'Playstation 3', N'Playstation-3', 8199, N'Slim Kasa+ 500GB + 180 Oyun+ 2 Sıfır Joistick +1 Yıl Garanti', N'ps3-1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (38, N'Sony', N'PS3', N'PS3', 6999, N'320 Gb+30 Oyun+2 Kol(Ithalatçı Garantili)', N'ps3-2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Company], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (39, N'Sony', N'Playstation 4', N'Playstation-4', 13389, N'PS4 Slim 1TB- Türkçe Menü', N'ps4-1.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (1, N'Laptop', N'laptop')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (2, N'Tablet', N'tablet')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (3, N'Desktop PC', N'desktop-pc')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (4, N'Printer', N'printer')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (5, N'Consume Materials', N'consume-materials')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (6, N'Phone', N'phone')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (7, N'Smart Clock', N'smart-clock')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (8, N'TV', N'tv')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (9, N'Cinema System', N'cinema-system')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (10, N'Music System', N'music-system')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (11, N'Fridge', N'fridge')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (12, N'Stove', N'stove')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (13, N'Water Heaters', N'water-heaters')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (14, N'Mop', N'mop')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (15, N'Hair Dryer', N'hair-dryer')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (16, N'Drone', N'drone')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (17, N'SLR Photo Machine', N'slr-photo-machine')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (18, N'Computer Games', N'computer-games')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (19, N'XBOX One', N'xbox-one')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (20, N'Playstation 3', N'playstation-3')
INSERT [dbo].[SubCategories] ([SubCategoryId], [Name], [Url]) VALUES (21, N'Playstation 4', N'playstation-4')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/27/2024 2:13:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [FlexibleDb] SET  READ_WRITE 
GO
