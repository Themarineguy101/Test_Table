USE [master]
GO
/****** Object:  Database [Game Faction Data]    Script Date: 6/9/2020 10:52:35 AM ******/
CREATE DATABASE [Game Faction Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Game Faction Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Game Faction Data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Game Faction Data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Game Faction Data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Game Faction Data] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Game Faction Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Game Faction Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Game Faction Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Game Faction Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Game Faction Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Game Faction Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [Game Faction Data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Game Faction Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Game Faction Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Game Faction Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Game Faction Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Game Faction Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Game Faction Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Game Faction Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Game Faction Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Game Faction Data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Game Faction Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Game Faction Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Game Faction Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Game Faction Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Game Faction Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Game Faction Data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Game Faction Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Game Faction Data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Game Faction Data] SET  MULTI_USER 
GO
ALTER DATABASE [Game Faction Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Game Faction Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Game Faction Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Game Faction Data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Game Faction Data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Game Faction Data] SET QUERY_STORE = OFF
GO
USE [Game Faction Data]
GO
/****** Object:  Table [dbo].[Faction]    Script Date: 6/9/2020 10:52:35 AM ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 6/9/2020 10:52:35 AM ******/
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
/****** Object:  Table [dbo].[Mod]    Script Date: 6/9/2020 10:52:35 AM ******/
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
USE [master]
GO
ALTER DATABASE [Game Faction Data] SET  READ_WRITE 
GO
