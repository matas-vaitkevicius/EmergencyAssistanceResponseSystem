﻿USE [Ears]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 18/01/2016 21:18:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GcmUserId] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Location] [geography] NULL,
	[LastSeenOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Crew](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoogleUserId] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Location] [geography] NULL,
	[LastSeenOn] [datetime] NULL,
 CONSTRAINT [PK_Crew] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Callout](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Crew] [int] NOT NULL,
	[Route] [nvarchar](max) NOT NULL,
	[Location] [geography] NOT NULL,
	[LastSignal] [datetime] NOT NULL,
	[IsFinished] [bit] NOT NULL
 CONSTRAINT [PK_Callout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Callout]  WITH CHECK ADD  CONSTRAINT [FK_Callout_Crew] FOREIGN KEY([Crew])
REFERENCES [dbo].[Crew] ([Id])
GO

ALTER TABLE [dbo].[Callout] CHECK CONSTRAINT [FK_Callout_Crew]
GO


