USE [master]
GO
/****** Object:  Database [Practica3]    Script Date: 30/05/2018 06:30:27 p. m. ******/
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
SELECT * from Materias;
select * from MateriaProfe;
Select * from Profesores;
Select * from Alumnos

SELECT Materia,[Nombre(s)] from MateriaProfe 
join Materias on Materias.IdMateria= MateriaProfe.IdMateria join Profesores on Profesores.IdProfesor=MateriaProfe.IdProfesor

Select A.[Nombre(s)] as 'Alumno',P.[Nombre(s)] as 'Profesor',Ca.Promedio from Calificaciones as Ca
left join MateriaProfe as MP on MP.IdMateriaProfe=Ca.IdMateriaProfe
left join Profesores as P on P.IdProfesor=MP.IdProfesor
left join Alumnos as A on A.Matricula=Ca.Matricula
GROUP BY A.[Nombre(s)],P.[Nombre(s)],Ca.Promedio

 
Select A.[Nombre(s)] as 'Alumno',M.Materia,Ca.Promedio from Calificaciones as Ca
join Alumnos as A on A.Matricula=Ca.Matricula
join MateriaProfe as MP on MP.IdMateriaProfe=Ca.IdMateriaProfe
join Materias as M on M.IdMateria=MP.IdMateria
GROUP BY A.[Nombre(s)],M.Materia,Ca.Promedio

select Materias.Materia, AL.[Apellido(s)] from Materias 
inner join MateriaProfe as MaP on MaP.IdMateria=Materias.IdMateria
inner join Calificaciones as CA on CA.IdMateriaProfe= MaP.IdMateriaProfe
inner join Alumnos as AL on AL.Matricula=CA.Matricula
GROUP BY Materias.Materia, AL.[Apellido(s)]


Select P.[Nombre(s)] as 'Profesor', COUNT(A.[Nombre(s)]) as 'Cantidad Alumnos' from Profesores as P
left join MateriaProfe as MP on MP.IdProfesor=P.IdProfesor
left join Calificaciones as Ca on Ca.IdMateriaProfe=MP.IdMateriaProfe
left join Alumnos as A on A.Matricula=Ca.Matricula
GROUP BY P.[Nombre(s)]

Select Ma.Materia, COUNT(A.[Nombre(s)]) as 'Cantidad Alumnos' from Materias as Ma
right join MateriaProfe as MP on MP.IdMateria=Ma.IdMateria
right join Profesores as P on P.IdProfesor=MP.IdProfesor
right join Calificaciones as Ca on Ca.IdMateriaProfe=MP.IdMateriaProfe
right join Alumnos as A on A.Matricula=Ca.Matricula
GROUP BY Ma.Materia


Select Ma.Materia, COUNT(P.[Nombre(s)]) as 'Cantidad Profesores' from Materias as Ma
join MateriaProfe as MP on MP.IdMateria=Ma.IdMateria
join Profesores as P on P.IdProfesor=MP.IdProfesor
GROUP BY Ma.Materia


Select M.Materia,MAX(C.Promedio)as 'Mejor Promedio' from MateriaProfe as MP
join Calificaciones as C on C.IdMateriaProfe=MP.IdMateriaProfe
join Materias as M on M.IdMateria=MP.IdMateria
GROUP BY M.Materia

Select M.Materia,MAX(C.Promedio)as 'Mejor Promedio', MIN(C.Promedio) as 'Peor Promedio' from Calificaciones as C
left join MateriaProfe as MP on MP.IdMateriaProfe=C.IdMateriaProfe
Left join Materias as M on M.IdMateria=MP.IdMateria
GROUP BY M.Materia

select A.[Apellido(s)],A.[Nombre(s)], M.Materia, C.Asistencia,C.Examenes,C.PuntosExtra,C.Tareas from Alumnos as A
join Calificaciones as C on C.Matricula=A.Matricula
join MateriaProfe as MP on MP.IdMateriaProfe=C.IdMateriaProfe
join Materias AS M ON M.IdMateria=MP.IdMateria
GROUP BY A.[Apellido(s)],A.[Nombre(s)],C.Asistencia,C.Examenes,C.PuntosExtra,C.Tareas,M.Materia



select * from Materias where Materias.IdMateria=(select IdMateria from Materias where Materia ='Base de Datos')
GO

with Aprobados as (
Select A.[Nombre(s)] as 'Alumno',M.Materia,Ca.Promedio from Calificaciones as Ca
join Alumnos as A on A.Matricula=Ca.Matricula
join MateriaProfe as MP on MP.IdMateriaProfe=Ca.IdMateriaProfe
join Materias as M on M.IdMateria=MP.IdMateria
where Ca.Promedio>=70
group by  A.[Nombre(s)],M.Materia,Ca.Promedio
)select * from Aprobados 
GO

select * 
into #Reprobados
from Calificaciones
where Promedio<70

select * from  #Reprobados


