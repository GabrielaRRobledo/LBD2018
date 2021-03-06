USE [master]
GO
/****** Object:  Database [Practica3]    Script Date: 30/05/2018 04:05:13 p. m. ******/
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
/****** Object:  Table [dbo].[Alumnos]    Script Date: 30/05/2018 04:05:13 p. m. ******/
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
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 30/05/2018 04:05:13 p. m. ******/
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
/****** Object:  Table [dbo].[Materias]    Script Date: 30/05/2018 04:05:13 p. m. ******/
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
/****** Object:  Table [dbo].[MateriaProfe]    Script Date: 30/05/2018 04:05:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriaProfe](
	[IdMateriaProfe] [int] IDENTITY(1,1) NOT NULL,
	[IdMateria] [int] NOT NULL,
	[IdProfesor] [int] NOT NULL,
 CONSTRAINT [PK_MateriaProfe] PRIMARY KEY CLUSTERED 
(
	[IdMateriaProfe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 30/05/2018 04:05:13 p. m. ******/
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
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791329, N'Gabriela', N'Robledo', 6, N'1         ', N'Romero 327', N'1678935698', N'g.r@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791330, N'Gissel', N'Rodriguez', 3, N'2         ', N'Alondra 219', N'15896078  ', N'gs.r@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791331, N'Manuel', N'Gonzalez', 6, N'3         ', N'Jaripeo 3865', N'13987645  ', N'm.g.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791332, N'Mario', N'Paez', 5, N'1         ', N'Rioja 278', N'89764534  ', N'm.p.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791333, N'Enrique', N'Garcia', 4, N'1         ', N'Ruise�or 567', N'78263816  ', N'E.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791334, N'Katia', N'Luna', 2, N'2         ', N'Fuste 543', N'12345216  ', N'k.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791335, N'Jorge', N'Rocha', 3, N'2         ', N'Gaviota 123', N'88789868  ', N'j.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791336, N'Antonio', N'Sada', 6, N'3         ', N'Trebol 956', N'133324526 ', N'a.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791337, N'Nahomi', N'Coronado', 4, N'2         ', N'Casur 281', N'19868506  ', N'n.@hotmail.com')
GO
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (1791338, N'Glenda', N'Rodriguez', 5, N'2         ', N'Roma 219', N'10986533  ', N'gl.@hotmail.com')
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (1, 1791332, 1, 100, 100, 60, 3)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (2, 1791330, 2, 82, 70, 100, 2)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (3, 1791331, 3, 52, 45, 40, 10)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (4, 1791329, 5, 70, 60, 90, 4)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (5, 1791333, 6, 30, 77, 100, 1)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (6, 1791334, 3, 12, 50, 100, 3)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (7, 1791335, 2, 90, 100, 100, 1)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (8, 1791336, 9, 86, 80, 80, 10)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (9, 1791337, 8, 34, 100, 100, 4)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (10, 1791338, 7, 90, 70, 90, 2)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (11, 1791338, 5, 79, 100, 90, 4)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (12, 1791337, 10, 99, 85, 80, 5)
GO
INSERT [dbo].[Calificaciones] ([IdCalificaciones], [Matricula], [IdMateriaProfe], [Examenes], [Tareas], [Asistencia], [PuntosExtra]) VALUES (13, 1791333, 11, 90, 80, 30, 12)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (1, 1, 100)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (2, 2, 101)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (3, 3, 103)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (4, 4, 102)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (5, 5, 103)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (6, 5, 105)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (7, 6, 106)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (8, 7, 100)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (9, 7, 108)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (10, 8, 107)
GO
INSERT [dbo].[MateriaProfe] ([IdMateriaProfe], [IdMateria], [IdProfesor]) VALUES (11, 9, 109)
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (1, N'Base de Datos')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (2, N'Artes')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (3, N'Espa�ol')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (4, N'Algebra Lineal')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (5, N'Geometria')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (6, N'Ambiente')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (7, N'Programacion C++')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (8, N'Automatas')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (9, N'Fisica')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (10, N'Telecomunicaciones')
GO
INSERT [dbo].[Materias] ([IdMateria], [Materia]) VALUES (11, N'Quimica')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (100, N'Alberto', N'Neira', N'Mty 81', N'9818291928', N'ef@gmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (101, N'Gabriel', N'Gonzalez', N'La reforma 13', N'182819382 ', N'gs.z@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (102, N'Romeo', N'Perez', N'Rioja 192', N'1193829218', N'rp.a@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (103, N'Rosa', N'Gamez', N'Risue�or 391', N'113112328 ', N'rg.m@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (104, N'Jose', N'Loyola', N'Paez 129', N'89138218  ', N'll.j@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (105, N'Osvaldo', N'Gonzalez', N'Grecia 192', N'919383218 ', N'oz.g@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (106, N'Miguel', N'Lara', N'Trebol 813', N'938212318 ', N'tl.a@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (107, N'David', N'Tamez', N'Garcia', N'8138291828', N'dt.z@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (108, N'Perla', N'Salazar', N'Fuste 832', N'818239318 ', N'ps.s@hotmail.com')
GO
INSERT [dbo].[Profesores] ([IdProfesor], [Nombre(s)], [Apellido(s)], [Direccion], [Telefono], [Email]) VALUES (109, N'Kevin', N'Alanis', N'Roma 193', N'81829321  ', N'ka.a@hotmail.com')
GO
UPDATE Alumnos
SET Grado=6 WHERE [Nombre(s)]='Gabriela' AND Grupo=1

UPDATE Materias
SET Materia='Algebra Lineal' WHERE Materia='Algebra'

UPDATE Calificaciones
SET Examenes=100 WHERE IdCalificaciones=6

UPDATE Profesores 
SET Telefono='8138291828' WHERE Email='dt.z@hotmail.com'

UPDATE MateriaProfe
SET IdProfesor=100 WHERE IdMateriaProfe=8
GO

DELETE FROM Materias
WHERE IdMateria=11

DELETE FROM Profesores 
WHERE Direccion='Apodaca 433'

DELETE FROM MateriaProfe
WHERE IdMateria=3 AND IdProfesor=107

DELETE FROM Alumnos
WHERE Telefono = '13492213'

DELETE FROM Calificaciones
WHERE Promedio=75

ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Alumnos] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Alumnos] ([Matricula])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Alumnos]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_MateriaProfe] FOREIGN KEY([IdMateriaProfe])
REFERENCES [dbo].[MateriaProfe] ([IdMateriaProfe])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_MateriaProfe]
GO
ALTER TABLE [dbo].[MateriaProfe]  WITH CHECK ADD  CONSTRAINT [FK_MateriaProfe_Materias] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materias] ([IdMateria])
GO
ALTER TABLE [dbo].[MateriaProfe] CHECK CONSTRAINT [FK_MateriaProfe_Materias]
GO
ALTER TABLE [dbo].[MateriaProfe]  WITH CHECK ADD  CONSTRAINT [FK_MateriaProfe_Profesores] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesores] ([IdProfesor])
GO
ALTER TABLE [dbo].[MateriaProfe] CHECK CONSTRAINT [FK_MateriaProfe_Profesores]
GO
USE [master]
GO
ALTER DATABASE [Practica3] SET  READ_WRITE 
GO
