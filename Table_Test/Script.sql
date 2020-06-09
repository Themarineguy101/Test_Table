USE [Game Faction Data]
GO
/****** Object:  Table [dbo].[Faction]    Script Date: 6/9/2020 11:01:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faction](
	[Faction] [nchar](90) NOT NULL,
	[Game] [nchar](100) NOT NULL,
	[Mod] [nchar](100) NULL,
	[Fighting Style] [nchar](1000) NULL,
	[Preferred Weapon] [nchar](100) NULL,
	[Strength] [nchar](200) NULL,
	[Weakness] [nchar](200) NULL,
	[Special] [nchar](500) NULL,
	[Notes] [nchar](100) NULL,
 CONSTRAINT [PK_Faction] PRIMARY KEY CLUSTERED 
(
	[Faction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 6/9/2020 11:01:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Game] [nchar](100) NOT NULL,
	[Genre] [nchar](60) NULL,
	[Release Date] [nchar](100) NULL,
	[Memory Used] [nchar](10) NULL,
	[Theme] [nchar](10) NULL,
	[Mods] [nchar](100) NULL,
	[Factions] [nchar](200) NULL,
	[Special notes] [nchar](500) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Game] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mod]    Script Date: 6/9/2020 11:01:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod](
	[Mod] [nchar](100) NOT NULL,
	[Game] [nchar](100) NOT NULL,
	[Genre] [nchar](50) NULL,
	[Release Date] [nchar](20) NULL,
	[Memory] [nchar](100) NULL,
	[Theme] [nchar](100) NULL,
	[Important changes] [nchar](1000) NULL,
	[Special notes] [nchar](1000) NULL,
 CONSTRAINT [PK_Mod] PRIMARY KEY CLUSTERED 
(
	[Mod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Faction]  WITH CHECK ADD  CONSTRAINT [FK_Faction_Game] FOREIGN KEY([Game])
REFERENCES [dbo].[Game] ([Game])
GO
ALTER TABLE [dbo].[Faction] CHECK CONSTRAINT [FK_Faction_Game]
GO
ALTER TABLE [dbo].[Faction]  WITH CHECK ADD  CONSTRAINT [FK_Faction_Mod] FOREIGN KEY([Mod])
REFERENCES [dbo].[Mod] ([Mod])
GO
ALTER TABLE [dbo].[Faction] CHECK CONSTRAINT [FK_Faction_Mod]
GO
ALTER TABLE [dbo].[Mod]  WITH CHECK ADD  CONSTRAINT [FK_Mod_Game] FOREIGN KEY([Game])
REFERENCES [dbo].[Game] ([Game])
GO
ALTER TABLE [dbo].[Mod] CHECK CONSTRAINT [FK_Mod_Game]
GO
