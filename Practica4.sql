USE [master]
GO
/****** Object:  Database [Practica3]    Script Date: 28/04/2018 03:40:56 p. m. ******/
CREATE DATABASE [Practica3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica3', FILENAME = N'C:\Users\SEPT\Practica3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica3_log', FILENAME = N'C:\Users\SEPT\Practica3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica3] SET  MULTI_USER 
GO
ALTER DATABASE [Practica3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica3] SET QUERY_STORE = OFF
GO
USE [Practica3]
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
USE [Practica3]
GO
/****** Object:  Table [dbo].[Alumnos]   Script Date: 28/04/2018 03:40:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Matricula] [int] NOT NULL,
	[Nombre(s)] [varchar](50) NOT NULL,
	[Apellido(s)] [varchar](50) NOT NULL,
	[Grado] [nchar](10) NOT NULL,
	[Grupo] [nchar](10) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [nchar](10) NOT NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 28/04/2018 03:40:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[IdCalificaciones] [int] NOT NULL,
	[Matricula] [int] NOT NULL,
	[IdMateria] [int] NOT NULL,
	[Examenes] [int] NOT NULL,
	[Tareas] [int] NOT NULL,
	[Asistencia] [int] NOT NULL,
	[PuntosExtra] [int] NOT NULL,
	[Promedio]  AS ((([Examenes]+[Tareas])+[Asistencia]/(3))+[PuntosExtra]),
 CONSTRAINT [PK_Calificaciones] PRIMARY KEY CLUSTERED 
(
	[IdCalificaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 28/04/2018 03:40:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[IdMateria] [int] NOT NULL,
	[Materia] [varchar](50) NOT NULL,
	[IdProfesor] [int] NOT NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 28/04/2018 02:09:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[IdProfesor] [int] NOT NULL,
	[Nombre(s)] [varchar](50) NULL,
	[Apellido(s)] [varchar](50) NULL,
	[Grupo] [nchar](10) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_Profesores] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Alumnos] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Alumnos] ([Matricula])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Alumnos]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Materias] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materias] ([IdMateria])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Materias]
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD  CONSTRAINT [FK_Materias_Profesores] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesores] ([IdProfesor])
GO
ALTER TABLE [dbo].[Materias] CHECK CONSTRAINT [FK_Materias_Profesores]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791329, N'Gabriela', N'Robledo', 5, 1, N'Romero 327', 11, '16789356' 'g.r@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791330, N'Gissel', N'Rodriguez', 3, 2, N'Alondra 219', 8, '15896078' 'gs.r@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791331, N'Manuel', N'Gonzalez', 6, 3, N'Jaripeo 3865', 12, '13987645' 'm.g.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791332, N'Mario', N'Paez', 5, 1, N'Rioja 278', 10, '89764534' 'm.p.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791333, N'Enrique', N'Garcia', 4, 1, N'Ruiseñor 567', 9, '78263816' 'E.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791334, N'Katia', N'Luna', 2, 2, N'Fuste 543', 7, '12345216' 'k.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791335, N'Jorge', N'Rocha', 3, 2, N'Gaviota 123', 8, '88789868' 'j.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791335, N'Antonio', N'Sada', 6, 3, N'Trebol 956', 12, '133324526' 'a.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791335, N'Nahomi', N'Coronado', 4, 2, N'Casur 281', 10, '19868506' 'n.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombres], [Apellidos], [Grado], [Grupo], [Direccion], [Edad], [Telefono], [Email]) VALUES (1791335, N'Glenda', N'Rodriguez', 5, 2, N'Roma 219', 11, '10986533' 'gl.@hotmail.com')
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1244, 1791329, 0897, 9, 7, 6, 3)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1245, 1791330, 0898, 9, 9, 9, 5)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1246, 1791331, 0897, 8, 7, 8, 2)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1247, 1791332, 0898, 10, 10, 10, 5)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1248, 1791333, 0898, 6, 7, 6)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1249, 1791334, 0896, 7, 7, 6, 1)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1250, 1791335, 0891, 5, 5, 6)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1251, 1791336, 0895, 9, 10, 10, 5)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1252, 1791337, 0894, 7, 7, 7, 4)
GO
INSERT [dbo].[Calificaciones] ([IdCalificacion], [Matricula], [IdMateria], [Tareas], [Asistencias], [Examenes], [PuntosExtra], [Promedio]) VALUES (1253, 1791338, 0893, 6, 8, 6, 1)
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia], [IdProfesor]) VALUES (0898, N'Artes', 45678)
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia], [IdProfesor]) VALUES (0897, N'Ciencias', 45679)
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia], [IdProfesor]) VALUES (0893, N'Español', 45671)
GO
USE [master]
GO
ALTER DATABASE [Practica3] SET  READ_WRITE 
GO

