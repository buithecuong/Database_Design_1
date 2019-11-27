

Create Database EMPLOYEE;

Create Database EMPLOYEE_TEST;


create table locations(
Location_ID Numeric(2,0) not null, City varchar(20) not null, Store_Manager Numeric(5,0),
Constraint employee_location_id_pk PRIMARY KEY(Location_ID));

select * from locations;
insert into locations(Location_ID, City) VALUES (11, 'Sarnia');
insert into locations(Location_ID, City) VALUES (22, 'London');
insert into locations(Location_ID, City) VALUES (33, 'Toronto');
select * from locations;


create table departments(
department_id Numeric(4,0) not null, department_name varchar(50) not null
constraint employee_department_id_pk PRIMARY KEY(department_id));
select * from departments;

insert into departments VALUES (1001, 'IT');
insert into departments VALUES (1002, 'Administration');
insert into departments VALUES (1003, 'Men ''s Clothing');
insert into departments VALUES (1004, 'Women''s Clothing');
insert into departments VALUES (1005, 'Kids');
insert into departments VALUES (1006, 'Toys');
insert into departments VALUES (1000, 'Others');
select * from departments;


create table locations_department(
location_ID Numeric(2,0) not null, department_id Numeric(4,0) not null, deparment_Manager Numeric(5,0),
Constraint employee_location_department_id_pk PRIMARY KEY(department_id, location_ID),
Constraint employee_location_department_location_id_fk FOREIGN  KEY(location_ID) REFERENCES locations(Location_ID),
Constraint employee_location_department_department_id_fk FOREIGN  KEY(department_id) REFERENCES departments(department_id)
);
select * from locations_department;

drop table employees;

create table employees(
 Employee_ID Numeric(5,0) not null, 
 Constraint employees_employee_id_pk PRIMARY KEY(Employee_ID),
 Constraint employees_employee_id_uq UNIQUE(Employee_ID),
 First_Name varchar(15) not null,
 Middle_Initital char(1),
 Last_Name varchar(15) not null,
 Social_Security_Number Numeric(9,0) not null,
 Constraint employees_soc_sec_num_uq UNIQUE(Social_Security_Number), 
 Constraint employees_soc_sec_num_ck CHECK( Social_Security_Number >= 0 AND Social_Security_Number <=999999999),
 Birth_Date Date not null,
 Constraint employees_birth_date_ck CHECK( Birth_Date >= '1970-01-01'),
 Sex char(1) not null,
 Constraint employees_sex_ck CHECK( Sex = 'F' OR sex = 'M'),
 Pension_Contributor bit not null,
 Constraint employees_pension_contributor_ck CHECK( Pension_Contributor = 1 OR Pension_Contributor = 0),
 Hire_Date Date,
 Constraint employees_hire_date_ck CHECK( Hire_Date > Birth_Date),
 Store_Location numeric(2,0) not null,
 Constraint employees_store_location_fk FOREIGN  KEY(Store_Location) REFERENCES locations(Location_ID),
 Work_Department numeric(4,0),
 Constraint employees_work_department_fk FOREIGN  KEY(Work_Department) REFERENCES departments(department_id),
 Job_Class Char(1) ,
 Constraint employees_job_class_ck CHECK( Job_Class in ('T', 'J', 'C', 'M')),
 Job_Level numeric(2,0) not null,
 Constraint employees_job_level_ck CHECK( Job_Level > 0 and Job_Level < 10),
 Coach_ID numeric(5,0) , 
 Salary numeric(9,2) not null,
 Bonus numeric(7,2) ,
 Commission numeric(7,2) , 
 Constraint employees_commission_bonus_ck CHECK( commission > 0 or  bonus >0),
 Constraint employees_salary_ck CHECK( salary < 92000.00 and ( salary > commission or salary > bonus))
 
 );

 Alter table employees
 ADD Constraint df_employees_hire_date default GETDATE() FOR Hire_Date;

 Alter table employees
 ADD Constraint df_employees_job_class default 'T' FOR Job_Class;
 
 Alter table employees
Add Constraint df_employees_work_department default 1000 for Work_Department;

 Alter table employees
	 Add Constraint employees_bonus_ck CHECK( commission > 0 or bonus >0);
Alter table employees
	Add Constraint employees_commission_ck CHECK( commission > 0 or bonus >0);

Alter table employees
 Add constraint employees_salary_ck CHECK( salary < 92000.00 and (salary > commission or salary > bonus));

 Alter table employees
DROP constraint DF__employees__Work___33D4B598;
 
 ALTER TABLE employees
ADD CONSTRAINT df_employees_work_department
	DEFAULT 1001 FOR Work_Department;

Alter table employees



 /* Valid data against constraint*/
 insert into employees VALUES (10000, 'Cuong', 'T', 'Bui', 100000000, '1983-07-22', 'M', 1, '2019-08-26', 11, 1005, 'J', 5, 1234, 60000.00, 0, 5000);
 select * from employees

  /* out of range constraint of Social Security Number
 insert into employees VALUES (10009, 'Cuong1', 'T', 'Bui1', -1, '1991-07-21', 'M', 1, '2006-04-30', 22, 1005, 'M', 8, 1230, 560000.00, 1000, 5000);*/

 /* Sex constraint*/
 insert into employees VALUES (10010, 'Cuong10', 'T', 'Bui10', 100000010, '1999-07-21', 'S', 1, '2016-05-29', 33, 1003, 'M', 7, 1231, 660000.00, 0, 5000);

 /* hire_date constraint*/
 insert into employees VALUES (10011, 'Cuong11', 'T', 'Bui11', 100000011, '1989-06-21', 'F', 0, '1969-04-19', 33, 1004, 'M', 7, 1231, 660000.00, 0, 5000);

 /*insert into employees(Employee_ID, First_Name, Middle_Initital, Last_Name, Social_Security_Number, Birth_Date, Sex, Pension_Contributor,Hire_Date, Store_Location, Work_Department, Job_Class, Job_Level, Coach_ID, Salary, Bonus, Commission)
 VALUES (10011, 'Cuong11', 'T', 'Bui11', 100000011, '1989-06-21', 'F', 0, '1969-04-19', 33, 1004, 'M', 7, 1231, 660000.00, 0, 5000);*/

 insert into employees(Employee_ID, First_Name, Middle_Initital, Last_Name, Social_Security_Number, Birth_Date, Sex, Pension_Contributor, Store_Location, Work_Department, Job_Level, Coach_ID, Salary, Bonus, Commission)
 VALUES (10001, 'Cuong01', 'T', 'Bui01', 100000001, '1989-06-21', 'F', 0,  33, 1004,  7, 1231, 66000.00, 0, 5000);
 
 select * from employees

  insert into employees(Employee_ID, First_Name, Middle_Initital, Last_Name, Social_Security_Number, Birth_Date, Sex, Pension_Contributor, Store_Location,  Job_Level, Coach_ID, Salary, Bonus, Commission)
 VALUES (10002, 'Cuong01', 'T', 'Bui01', 100000002, '1989-06-21', 'F', 0,  33,   7, 1231, 66000.00, 0, 5000);





