USE [master]
GO
/****** Object:  Database [dc_Database]    Script Date: 07/21/2017 16:07:04 ******/
CREATE DATABASE [dc_Database] ON  PRIMARY 
( NAME = N'dc_Database', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dc_Database.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dc_Database_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dc_Database_1.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dc_Database] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dc_Database].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [dc_Database] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dc_Database] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dc_Database] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dc_Database] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dc_Database] SET ARITHABORT OFF
GO
ALTER DATABASE [dc_Database] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dc_Database] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dc_Database] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dc_Database] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dc_Database] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dc_Database] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dc_Database] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dc_Database] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dc_Database] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dc_Database] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dc_Database] SET  DISABLE_BROKER
GO
ALTER DATABASE [dc_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dc_Database] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dc_Database] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dc_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dc_Database] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dc_Database] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dc_Database] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dc_Database] SET  READ_WRITE
GO
ALTER DATABASE [dc_Database] SET RECOVERY FULL
GO
ALTER DATABASE [dc_Database] SET  MULTI_USER
GO
ALTER DATABASE [dc_Database] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dc_Database] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'dc_Database', N'ON'
GO
USE [dc_Database]
GO
/****** Object:  Table [dbo].[dc_user]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_user](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](50) NULL,
	[upassword] [nvarchar](max) NULL,
	[gid] [int] NULL,
	[nickname] [nvarchar](50) NULL,
	[headimg] [nvarchar](max) NULL,
	[intro] [text] NULL,
 CONSTRAINT [PK_dc_user] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dc_settings]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[set_title] [nvarchar](50) NULL,
	[set_value] [nvarchar](50) NULL,
 CONSTRAINT [PK_dc_settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dc_article_tag]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_article_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_tag_name] [nvarchar](50) NULL,
	[article_tag_intro] [text] NULL,
 CONSTRAINT [PK_article_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dc_article_comment]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_article_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[author_id] [int] NULL,
	[comment_text] [text] NULL,
	[authorized] [nvarchar](10) NULL,
	[time_commit] [datetime] NULL,
 CONSTRAINT [PK_dc_article_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dc_article]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [text] NULL,
	[time_commit] [datetime] NULL,
	[time_update] [datetime] NULL,
	[author] [nvarchar](50) NULL,
	[article_intro] [text] NULL,
	[article_context] [text] NULL,
	[article_tag_id] [int] NULL,
	[title_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_dc_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bc_group]    Script Date: 07/21/2017 16:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bc_group](
	[gid] [int] NOT NULL,
	[groupname] [nvarchar](50) NULL,
 CONSTRAINT [PK_bc_group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
