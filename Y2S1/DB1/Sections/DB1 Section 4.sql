use master 
create database school

use school 
create table Student 
(Student_ID int primary key,
 Student_Fname nvarchar(10),
 Student_Mname nvarchar(10),
 Student_lname nvarchar(10),
 Student_Fax nvarchar(10) constraint c_uq1 unique,
 Student_Bdate datetime)

use school
 alter table student
 drop PK__Student__A2F4E9ACE735E56C

 use school
 alter table student
 drop column Student_ID

 use school
 alter table student
 add Student_ID int identity(1,1) constraint PK_Student primary key



 use school
 create table Class
(classID int identity(1,1)  primary key,
 Class_Name nvarchar(10) ,
 Class_Floor nvarchar(10)  default 'unknown_Floor') 


 use school
 create table Teacher 
(Teacher_SSN BIGint Constraint pk_Teacher primary key ,
 Teacher_Fname nvarchar(10),
 Teacher_Minit nvarchar(10),
 Teacher_Lname nvarchar(10))

 
USE school
create table [Teacher Class]
(Teacherid bigint,
 class_ID int,
 No_Of_Subjects int ,
 constraint c4 check ( No_Of_Subjects >=4 and No_Of_Subjects <=10 ), 
 constraint c8 foreign key (Teacherid) references teacher(Teacher_SSN) on delete cascade  on update cascade,
 constraint c9 foreign key (class_ID) references class(classID) on delete cascade ,
 constraint c6 primary key (Teacherid,class_ID))

 USE school
 create table Teacher_Tel
(Teacher_Snn bigint,
 Telephone_Number nvarchar(10),
 constraint c10 foreign key (teacher_snn) references Teacher(Teacher_SSN) on delete cascade  on update cascade,
 constraint c7 primary key (Teacher_Snn,Telephone_Number))

use school
alter table class 
add Teacher_ssn int

use school
alter table class 
add constraint FK_class foreign key (Teacher_ssn) references Teacher(Teacher_SSN) 












