USE [master]
GO

CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Test.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Test] SET ARITHABORT OFF 
GO

ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Test] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Test] SET RECOVERY FULL 
GO

ALTER DATABASE [Test] SET  MULTI_USER 
GO

ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Test] SET  READ_WRITE 
GO

USE [Test]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student](
	[Sid] [int] NOT NULL,
	[Name] [nchar](1000) NOT NULL,
	[Addr] [nchar](1000) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Test]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Classes](
	[Cid] [int] NOT NULL,
	[Subject] [nchar](1000) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [Test]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Taken](
	[Sid] [int] NOT NULL,
	[Cid] [int] NOT NULL,
	[Grade] [nchar](1000) NOT NULL,
 CONSTRAINT [PK_Taken] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC,
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Taken]  WITH CHECK ADD  CONSTRAINT [FK_Taken_Classes] FOREIGN KEY([Cid])
REFERENCES [dbo].[Classes] ([Cid])
GO

ALTER TABLE [dbo].[Taken] CHECK CONSTRAINT [FK_Taken_Classes]
GO

ALTER TABLE [dbo].[Taken]  WITH CHECK ADD  CONSTRAINT [FK_Taken_Student] FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO

ALTER TABLE [dbo].[Taken] CHECK CONSTRAINT [FK_Taken_Student]
GO

CREATE LOGIN [test_user] WITH PASSWORD='password', DEFAULT_DATABASE=[Test], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [test_user] WITH PASSWORD='password', DEFAULT_DATABASE=[Test], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [Test]
GO
CREATE USER [test_user] FOR LOGIN [test_user]
GO

USE [Test]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_datareader] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_owner] ADD MEMBER [test_user]
GO
USE [Test]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [test_user]
GO


USE [master]
GO