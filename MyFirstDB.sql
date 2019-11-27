create table STUDENT(
student_id numeric(7) primary key,
fName varchar(10) not null,
initial varchar(10),
lName varchar(10),
address varchar(40),
phoneNumber varchar(15) 
);

insert into STUDENT
 values(1234567, 'Cuong', 'T', 'The', '12 Marowyne', '1234');

 select * from STUDENT;

 select student_id as 'Student ID', fName as FirstName from STUDENT;

 select concat(fName, ' ', Rtrim(initial), lName) as 'Full Name from Student;