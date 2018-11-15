USE [master]
GO
/****** Object:  Database [DBBookShare]    Script Date: 11/15/2018 1:40:34 AM ******/
CREATE DATABASE [DBBookShare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBBookShare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBBookShare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBBookShare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBBookShare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBBookShare] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBBookShare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBBookShare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBBookShare] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBBookShare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBBookShare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBBookShare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBBookShare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBBookShare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBBookShare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBBookShare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBBookShare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBBookShare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBBookShare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBBookShare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBBookShare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBBookShare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBBookShare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBBookShare] SET RECOVERY FULL 
GO
ALTER DATABASE [DBBookShare] SET  MULTI_USER 
GO
ALTER DATABASE [DBBookShare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBBookShare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBBookShare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBBookShare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBBookShare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBBookShare', N'ON'
GO
ALTER DATABASE [DBBookShare] SET QUERY_STORE = OFF
GO
USE [DBBookShare]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBBookShare]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] NOT NULL,
	[title] [nvarchar](200) NULL,
	[author] [nvarchar](200) NULL,
	[ISBN] [nvarchar](100) NULL,
	[language] [nvarchar](100) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[coverImg] [nvarchar](100) NULL,
	[createdTime] [datetime] NULL,
	[creatorID] [int] NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRating]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRating](
	[id] [int] NOT NULL,
	[ratePoint] [real] NULL,
	[userID] [int] NULL,
	[bookID] [int] NULL,
 CONSTRAINT [PK_BookRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookReview]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReview](
	[id] [int] NOT NULL,
	[content] [text] NULL,
	[createdTime] [datetime] NULL,
	[userID] [int] NULL,
	[bookID] [int] NULL,
 CONSTRAINT [PK_BookReview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradedBookImage]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradedBookImage](
	[id] [int] NOT NULL,
	[image] [nvarchar](100) NULL,
	[tradingID] [int] NULL,
 CONSTRAINT [PK_TradedBookImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trading]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trading](
	[id] [int] NOT NULL,
	[description] [text] NULL,
	[tradingStatus] [int] NULL,
	[completedTime] [datetime] NULL,
	[lenderRatePoint] [real] NULL,
	[borrowerRatePoint] [real] NULL,
	[bookID] [int] NULL,
	[lenderID] [int] NULL,
	[borrowerID] [int] NULL,
 CONSTRAINT [PK_Trading] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/15/2018 1:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[fullName] [nvarchar](200) NULL,
	[dob] [date] NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[address] [text] NULL,
	[phoneNum] [nvarchar](50) NULL,
	[linkFacebook] [nvarchar](200) NULL,
	[avatar] [nvarchar](100) NULL,
	[userPoint] [real] NULL,
	[createdTime] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User] FOREIGN KEY([creatorID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User]
GO
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_Book]
GO
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_User]
GO
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_Book]
GO
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_User]
GO
ALTER TABLE [dbo].[TradedBookImage]  WITH CHECK ADD  CONSTRAINT [FK_TradedBookImage_Trading] FOREIGN KEY([tradingID])
REFERENCES [dbo].[Trading] ([id])
GO
ALTER TABLE [dbo].[TradedBookImage] CHECK CONSTRAINT [FK_TradedBookImage_Trading]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_Book]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User] FOREIGN KEY([lenderID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User1] FOREIGN KEY([borrowerID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User1]
GO
USE [master]
GO
ALTER DATABASE [DBBookShare] SET  READ_WRITE 
GO
