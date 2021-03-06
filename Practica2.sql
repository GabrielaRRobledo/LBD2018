USE [master]
GO
/****** Object:  Database [PracticaDos]    Script Date: 24/02/2018 02:40:50 p.m. ******/
CREATE DATABASE [PracticaDos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PracticaDos', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PracticaDos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PracticaDos_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PracticaDos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PracticaDos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PracticaDos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PracticaDos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PracticaDos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PracticaDos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PracticaDos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PracticaDos] SET ARITHABORT OFF 
GO
ALTER DATABASE [PracticaDos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PracticaDos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PracticaDos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PracticaDos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PracticaDos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PracticaDos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PracticaDos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PracticaDos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PracticaDos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PracticaDos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PracticaDos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PracticaDos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PracticaDos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PracticaDos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PracticaDos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PracticaDos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PracticaDos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PracticaDos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PracticaDos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PracticaDos] SET  MULTI_USER 
GO
ALTER DATABASE [PracticaDos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PracticaDos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PracticaDos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PracticaDos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PracticaDos]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 24/02/2018 02:40:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Matricula] [nchar](10) NOT NULL,
	[Nombre(s)] [nvarchar](50) NULL,
	[Apellido Paterno] [nchar](10) NULL,
	[Apellido Materno] [nchar](10) NULL,
	[Fecha de nacimiento] [date] NULL,
	[Semestre] [int] NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BalanceMensual]    Script Date: 24/02/2018 02:40:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceMensual](
	[No.Factura] [int] NOT NULL,
	[Empresa] [text] NULL,
	[Forma de pago] [nchar](10) NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [Empresa] PRIMARY KEY CLUSTERED 
(
	[No.Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mercancia]    Script Date: 24/02/2018 02:40:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mercancia](
	[Id] [nchar](10) NOT NULL,
	[Articulo] [ntext] NULL,
	[Num. de Lote] [int] NULL,
	[Precio] [money] NULL,
	[cantidad] [money] NULL,
	[Total]  AS ([Precio]*[cantidad]),
 CONSTRAINT [Lote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 24/02/2018 02:40:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IdSucursal] [nchar](10) NOT NULL,
	[Ubicacion] [text] NULL,
	[Gerente] [text] NULL,
	[No.Trabajadores] [nchar](10) NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 24/02/2018 02:40:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[IdTrabajador] [nchar](10) NOT NULL,
	[Fecha de ingreso] [date] NULL,
	[Puesto] [nchar](10) NULL,
	[Horastrabajadas] [int] NULL,
	[Sueldoxhora] [int] NULL,
	[Dia de descanso] [nchar](10) NULL,
	[Salario]  AS ([Horastrabajadas]*[Sueldoxhora]),
 CONSTRAINT [PK_Trabajadores] PRIMARY KEY CLUSTERED 
(
	[IdTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Fecha]    Script Date: 24/02/2018 02:40:50 p.m. ******/
CREATE NONCLUSTERED INDEX [Fecha] ON [dbo].[BalanceMensual]
(
	[No.Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PracticaDos] SET  READ_WRITE 
GO
