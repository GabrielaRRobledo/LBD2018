USE [master]
GO
/****** Object:  Database [Practica3]    Script Date: 30/05/2018 09:01:58 p. m. ******/
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

CREATE PROCEDURE agregarAlumnos
(@matricula int,@nombre varchar(50),@apellidos varchar(50),@grado int,@grupo int,@direccion varchar(50),@telefono nchar(10),@email varchar(50))
AS
BEGIN
INSERT [dbo].[Alumnos] ([Matricula], [Nombre(s)], [Apellido(s)], [Grado], [Grupo], [Direccion], [Telefono], [Email]) VALUES (@matricula,@nombre,@apellidos,@grado,@grupo,@direccion,@telefono,@email)
END
GO
EXEC agregarAlumnos 172819,'Maria','Lopez',2,3,'Los Cristales 213','1291313','ml@gmail.com'
GO


CREATE PROCEDURE cambiarCalif
(@matricula int,@idMateriaProfe int,@examen int,@Tareas int,@asistencia int)
AS
BEGIN
update Calificaciones set Examenes=@examen, Tareas=@Tareas, Asistencia=@asistencia where Matricula=@matricula and IdMateriaProfe=@idMateriaProfe
END
GO
EXEC cambiarCalif 1791329,5,100,100,100
GO


CREATE PROCEDURE agregarMateria
(@materia varchar(50))
AS
BEGIN
declare @ultima int
select @ultima=Max(M.IdMateria) from Materias as M
SET @ultima=@ultima +1 
INSERT INTO Materias select @ultima,@materia
END
GO
EXEC agregarMateria 'Educacion Fisica'
GO


CREATE PROCEDURE agregarMateriaProfe
(@materia int,@idProfe int)
AS
BEGIN
INSERT INTO MateriaProfe select @materia,@idProfe
END
GO
EXEC agregarMateriaProfe 4,100
GO


CREATE PROCEDURE eliminarMateria 
(@materia int)
AS
BEGIN
DECLARE @IDMATERIAPROFE int
delete from Calificaciones where Calificaciones.IdMateriaProfe=(select IdMateriaProfe from MateriaProfe where IdMateria=@materia)
delete from MateriaProfe where IdMateria=@materia
delete from Materias where IdMateria=@materia
END
GO
EXEC eliminarMateria 10 
GO


create function PuntosParaPasar
(@matricula int, @materiaProfe int)
returns int
begin
declare @puntos int 
	select @puntos=promedio from Calificaciones where Matricula=@matricula and IdMateriaProfe=@materiaProfe
	set @puntos= (@puntos - 70)*-1
return @puntos
end;
go


create function MateriasReprobadas
(@matricula int)
returns int
begin
declare @reprobadas int
	select @reprobadas=COUNT(Promedio) from Calificaciones where Matricula=@matricula and Promedio<70
	
return @reprobadas
end;
go




CREATE TRIGGER EliminarProfesor
on Profesores 
instead of Delete 
as 
begin 
 declare @idProfesor int; 
 select @idProfesor= P.IdProfesor from Profesores as P 
 join deleted d on d.IdProfesor =P.IdProfesor;
 UPDATE MateriaProfe set idProfesor=999 where IdProfesor= @idProfesor;
 end;
 DELETE FROM Profesores WHERE IdProfesor=100
 SELECT * FROM MateriaProfe
 GO


ALTER TRIGGER PuntosPorCambiarMaestro
on MateriaProfe
after update
AS 
begin 
	declare @update int; 
	select @update=up.IdMateriaProfe from MateriaProfe as MP
	join inserted up on up.IdMateriaProfe=MP.IdMateriaProfe;
	update Calificaciones set Asistencia=100 where IdMateriaProfe=@update;
end;
go