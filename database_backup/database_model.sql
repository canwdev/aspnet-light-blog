USE [dc_Database]
GO
/****** Object:  Table [dbo].[dc_user]    Script Date: 06/19/2017 19:56:49 ******/
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
/****** Object:  Table [dbo].[dc_settings]    Script Date: 06/19/2017 19:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dc_settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[set_title] [nvarchar](50) NULL,
	[set_value] [nvarchar](50) NULL,
	[set_data] [nvarchar](max) NULL,
 CONSTRAINT [PK_dc_settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dc_article_tag]    Script Date: 06/19/2017 19:56:49 ******/
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
/****** Object:  Table [dbo].[dc_article]    Script Date: 06/19/2017 19:56:49 ******/
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
/****** Object:  Table [dbo].[bc_group]    Script Date: 06/19/2017 19:56:49 ******/
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
