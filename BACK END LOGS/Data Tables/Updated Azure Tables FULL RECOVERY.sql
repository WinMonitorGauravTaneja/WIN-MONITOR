USE [master]
GO
/****** Object:  Database [WinMonitor_Database]    Script Date: 19-02-2016 11:53:19 ******/
CREATE DATABASE [WinMonitor_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WinMonitor_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WinMonitor_Database.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WinMonitor_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WinMonitor_Database_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WinMonitor_Database] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WinMonitor_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WinMonitor_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WinMonitor_Database] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WinMonitor_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WinMonitor_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WinMonitor_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WinMonitor_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WinMonitor_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WinMonitor_Database] SET  MULTI_USER 
GO
ALTER DATABASE [WinMonitor_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WinMonitor_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WinMonitor_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WinMonitor_Database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WinMonitor_Database]
GO
/****** Object:  User [WinMonitor_Login]    Script Date: 19-02-2016 11:53:19 ******/
CREATE USER [WinMonitor_Login] FOR LOGIN [WinMonitor_Login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Help]    Script Date: 19-02-2016 11:53:19 ******/
CREATE USER [Help] FOR LOGIN [Help] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_datareader] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [WinMonitor_Login]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [WinMonitor_Login]
GO
/****** Object:  Table [dbo].[DBCompany]    Script Date: 19-02-2016 11:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBCompany](
	[DBCompanyId] [varchar](50) NOT NULL,
	[DBCompanyName] [varchar](50) NULL,
	[DBURL] [varchar](50) NULL,
 CONSTRAINT [CPK] PRIMARY KEY CLUSTERED 
(
	[DBCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBComponent_With_Status]    Script Date: 19-02-2016 11:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBComponent_With_Status](
	[DBCSId] [varchar](50) NOT NULL,
	[DBComponentName] [varchar](50) NULL,
	[DBStatus] [varchar](50) NULL,
	[DBType] [varchar](50) NULL,
	[DBCompanyId] [varchar](50) NULL,
 CONSTRAINT [CWSPK] PRIMARY KEY CLUSTERED 
(
	[DBCSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBIncidents]    Script Date: 19-02-2016 11:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBIncidents](
	[DBIncidentId] [varchar](50) NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBCSId] [varchar](50) NULL,
	[DBDescription] [varchar](200) NULL,
 CONSTRAINT [IPK] PRIMARY KEY CLUSTERED 
(
	[DBIncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBLogin]    Script Date: 19-02-2016 11:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBLogin](
	[DBUsername] [varchar](50) NOT NULL,
	[DBPassword] [varchar](50) NULL,
 CONSTRAINT [LPK] PRIMARY KEY CLUSTERED 
(
	[DBUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBSubscriptions]    Script Date: 19-02-2016 11:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBSubscriptions](
	[DBId] [varchar](50) NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBEmail] [varchar](50) NULL,
	[DBPhone] [varchar](50) NULL,
	[DBType] [varchar](50) NULL,
 CONSTRAINT [SPK] PRIMARY KEY CLUSTERED 
(
	[DBId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CUN]    Script Date: 19-02-2016 11:53:19 ******/
ALTER TABLE [dbo].[DBCompany] ADD  CONSTRAINT [CUN] UNIQUE NONCLUSTERED 
(
	[DBURL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD FOREIGN KEY([DBCompanyId])
REFERENCES [dbo].[DBCompany] ([DBCompanyId])
GO
ALTER TABLE [dbo].[DBIncidents]  WITH CHECK ADD FOREIGN KEY([DBCSId])
REFERENCES [dbo].[DBComponent_With_Status] ([DBCSId])
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKStatus] CHECK  (([DBStatus]='Major' OR [DBStatus]='Minor' OR [DBStatus]='Operational'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKStatus]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKType] CHECK  (([DBType]='Specific' OR [DBType]='Main'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKType]
GO
ALTER TABLE [dbo].[DBSubscriptions]  WITH CHECK ADD  CONSTRAINT [SCHKType] CHECK  (([DBType]='Email' OR [DBType]='SMS'))
GO
ALTER TABLE [dbo].[DBSubscriptions] CHECK CONSTRAINT [SCHKType]
GO
USE [master]
GO
ALTER DATABASE [WinMonitor_Database] SET  READ_WRITE 
GO
