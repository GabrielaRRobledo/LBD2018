Select * from Alumnos left join Profesores on Alumnos.Matricula= Profesores.IdProfesor 

Select * from Alumnos inner join Profesores on Alumnos.Matricula= Profesores.IdProfesor 


Select Materia.Materia from Materias join Alumnos on Materia.IMateria= Alumnos.Matricula group by  Materia.Materia

Select Alumno.Grupo,Alumno.Edad from Alumnos join  Alumno on Profesores.IdProfesor= Alumnos.Matricula group by Alumno.Grupo,Alumno.Edad

Select Alumno.Grupo,Alumno.Edad from Alumnos join  Alumno on Profesores.IdProfesor= Alumnos.Matricula group by Alumno.Grupo,Alumno.Edad

Select * from Alumnos left join Profesores on Alumnos.Matricula= Profesores.IdProfesor where Alumno.Grupo>2
select * from Materia where Materia.IdMateria=(select IdMateria from Materias where Materia ='Artes')

Select Nombres into Alumnos
from Alumno
where Nombre='Gabriela'

Select * from Alumnos

update Alumnos set Nombre='Gabriela'
from Profesores join Alumno
on Profesores.Matricula=Alumnos.Matricula
where Alumnos.Matricula= 1791329

Delete from Alumnos
from Profesores join Alumnos
on Profesores.Matricula=Alumnos.Matricula

Select * from Profesores join Alumnos on Alumnos.IdProfesores= Profesores.IProfesores

Select from Profesores;
 
 Create view Alumnos_v as select nombre from Alumnos
 Select COUNT(Nombre) from Alumnos_v

 create view copia as select * from 
 where Grado>4
 with check option;

 select * from copia

 delete from copia