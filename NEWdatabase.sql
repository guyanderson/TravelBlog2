USE [master]
GO
/****** Object:  Database [TravelBlog]    Script Date: 8/2/2017 4:49:49 PM ******/
CREATE DATABASE [TravelBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelBlog', FILENAME = N'C:\Users\epicodus\TravelBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelBlog_log', FILENAME = N'C:\Users\epicodus\TravelBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TravelBlog] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelBlog] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TravelBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelBlog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelBlog] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TravelBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelBlog] SET  MULTI_USER 
GO
ALTER DATABASE [TravelBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelBlog] SET QUERY_STORE = OFF
GO
USE [TravelBlog]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TravelBlog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/2/2017 4:49:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 8/2/2017 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceId] [int] IDENTITY(1,1) NOT NULL,
	[Drink] [nvarchar](max) NULL,
	[Eat] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[LocationId] [int] NULL,
	[See] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 8/2/2017 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Currency] [nvarchar](max) NULL,
	[FlavorText] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Population] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 8/2/2017 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Bio] [nvarchar](max) NULL,
	[LocationId] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regions]    Script Date: 8/2/2017 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170802180209_Initial', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170802234206_Initial', N'1.0.0-rtm-21431')
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([ExperienceId], [Drink], [Eat], [Image], [LocationId], [See], [Title]) VALUES (6, NULL, NULL, N'http://www.sondoongcave.org/images/hang-son-doong-cave-vietnam2.jpg', NULL, NULL, N'Son Doong Cave')
SET IDENTITY_INSERT [dbo].[Experiences] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [Currency], [FlavorText], [Image], [Language], [Name], [Population]) VALUES (1, N'USD', N'This is the new York town in America called New York', N'https://www.gentlegiant.com/wp-content/uploads/2015/06/New-York.jpg', N'English', N'New York', N'8.1 million')
INSERT [dbo].[Locations] ([LocationId], [Currency], [FlavorText], [Image], [Language], [Name], [Population]) VALUES (2, N'VND', N'This is where the movie King Kong was shot', N'http://www.quangbinhtourism.vn/Portals/0/Ditichlichsu/quang_binh_quan_500_01.jpg', N'VIetnamese', N'Quang Binh', N'863,000')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [Bio], [LocationId], [Name]) VALUES (1, N'asd', 1, N'sad')
SET IDENTITY_INSERT [dbo].[People] OFF
/****** Object:  Index [IX_Experiences_LocationId]    Script Date: 8/2/2017 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Experiences_LocationId] ON [dbo].[Experiences]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_LocationId]    Script Date: 8/2/2017 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_People_LocationId] ON [dbo].[People]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Regions_LocationId]    Script Date: 8/2/2017 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Regions_LocationId] ON [dbo].[Regions]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Locations_LocationId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Locations_LocationId]
GO
ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_Regions_Locations_LocationId]
GO
USE [master]
GO
ALTER DATABASE [TravelBlog] SET  READ_WRITE 
GO
