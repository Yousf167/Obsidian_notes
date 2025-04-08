USE school


select Student_Fname from Student order by Student_Fname asc

select * from Student where Student_ID >=1 and Student_ID <=9  

select * from Student where Student_ID not between 1 and 9  

select * from Student where Student_Fname  like 'a[^h]%'

select * from student where Student_Fname  like '[a-j]%' order by Student_Fname asc

select * from student where (Student_Fname = 'ahmed' and Student_Mname='mohamed') 


select * from class where (Class_Name like '%v%' or Class_Name like '%h') and (Teacher_ssn like '307__' )

select * from class

select * from Student

--update class
--set Class_Floor='fifth' WHERE classID='10'

--update student
--set gender='Male' WHERE gender is NULL

--insert into Student
--values('sara','seif','ahmed',3252,'2019/01/07','Female'),('tasneem','yousry','ahmed',67,'2013/12/05','Female'),('rahma','rashd','sa3d',6778,'2013/10/024','Female'),('lylia','tamer','magdy',45,'2017/10/05','Female'),('jana','taha','walid',89,'2013/10/05','Female'),('salma','tamer','ahmed',872,'2015/10/05','Female'),('joly','karem','emad',762,'2016/10/05','Female')

insert into Student (Student_Fname,Student_Mname,Student_lname,Student_Fax,Student_Bdate)
values('ali','aareq','diaa',73682,'2019/01/07')

--alter table student
--add gender varchar(6) 

select * from CLASS where class_name  not in ('CLASS V','cLaSs d','class y')


select Student_Fname,Student_Mname,Student_lname from student order by Student_fname asc,Student_Mname asc, Student_lname asc

select class_name, class_floor from class order by 2 desc ,1 asc 




SELECT student_fname as [first name] , student_lname,'Identification number:' as new, student_id
FROM student 



select  student_fname+' '+student_lname as name,Student_ID from student where Student_lname is not null

select * from Student WHERE Student_lname is null


select GETDATE()

select count(*) from Student--count rows=20, if there is null count it

select count(Student_lname) from Student--count only those whom who have values in this column,

select  max(year(GETDATE())-year(Student_Bdate) )as age from Student  where Student_Bdate is not null

--select avg(year(GETDATE())-year(Student_Bdate)) as age,Student_Bdate from Student where Student_Bdate is not null


select max(Student_Bdate) from Student

select * from student order by Student_Fname asc

select min(Student_Bdate) from Student

select cast(Student_Bdate as date) from Student


select (Cast(Student_Fax as int)) from Student




select Cast(Student_Bdate as time) from Student


--select sum(cast(Student_Fax as int)) from Student 
select * from Student

select distinct gender from Student

select gender,count(*) from student group by gender


select  * from student 

select gender,COUNT(gender) from student group by gender


select Student_Fname,gender,count(*) from Student group by Student_Fname,gender


select gender, count(gender) 
from Student 
where Student_Fname like '%a%' 
group by gender







select gender, count(gender)  from Student where Student.Student_Fname like '%a%' 
group by gender 
having count(gender)>=1
order by gender desc