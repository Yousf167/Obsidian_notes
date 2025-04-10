use school
insert into Teacher
values	(30700,'Ahmed','H.','hassan'),(30340,'Taha','T.','yasser'),(30120,'dale','H.','philip')

select *  from	Teacher

use school
insert into class (Class_Name,Teacher_ssn)
values ('Class vx',30700)

select * from class

use school
insert into STUDENT(Student_Fname,Student_Fax)
values ('ali','65872') 

select * from student

insert into student
values ('ziad','mohamed','faroq','45523','12/01/2004')
select* from class

update class 
set class_floor='third' where class_name='Class v'

sELECT *  FROM Teacher_Tel
delete from teacher where teacher_ssn=30340

insert into Teacher_tel
values(30700,'00201019'),(30700,'70020101')

select Telephone_Number as [phone Number] from Teacher_Tel

truncate table Teacher_tel 



select * from Teacher_Tel


select student_id from student

select class_floor as 'Floor' from class
where class_name='Class V'

select * from class

select distinct class_floor,Class_Name,classID from class











