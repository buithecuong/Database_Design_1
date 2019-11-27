create Database MyFirstDB;
USe MyFirstDB;
Create table StudentTable (
Student_ID int primary key,
Fname varchar(20) not null,
Lname varchar(20),
DOB date not null,
GPA numeric(5,2) not null);

Create table order_header (
order_number Decimal(10,0),
order_date date not null,
sales_person varchar(25),
bills_to varchar(35),
bills_to_address varchar(45),
bills_to_city varchar(20),
bills_to_state varchar(2),
bills_to_zip varchar(10),
PRIMArY KEY(order_number));

Create table order_item (
order_number Decimal(10,0) not null,
line_item Decimal(4,0) not null,
part_number varchar(12) not null,
quantity Decimal(4,0),
PRIMArY KEY(order_number, line_item),
Foreign key (order_number)
 REFERENCES order_header(order_number));


 insert into order_header
 values(112, '2019-10-21', 'H S', 'CK C', '1185 Sherpard Yone', 'Toronto', 'On', 'M9J A2Z');

 select * from order_header;
 
 insert into order_item
 values(111, 3, 'ABC003', 2);
 /* values(111, 3, 'ABC003', 2);*/

 select * from order_item;

 create table Employee(
 Emp_ID int not null Primary key,
 Fname varchar(20) not null,
 Lname varchar(20),
 Gender char(1) check (Gender = 'F' or Gender = 'M'),
 Nationality varchar(20) not null Default ('Indian'),
 DOB Date not null,
 Cellphone Varchar(20) unique
 );

 insert into Employee (Emp_ID, F
 values(116, 'Cuong', 'Bui', 'K', Default, '07/22/1983', '12355661');
 select *  from Employee;

 create table New_Employee(
 Emp_ID int not null Primary key,
 Fname varchar(20) not null,
 Lname varchar(20),
 Gender char(1) check (Gender = 'F' or Gender = 'M'),
 Nationality varchar(20) not null Default ('Indian'),
 DOB Date not null,
 Cellphone Varchar(20) unique
 );

 insert into New_Employee
 select * from Employee;

 select * from New_Employee;



