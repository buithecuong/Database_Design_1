drop table Sales_Agent;
create table Sales_Agent (
agentCode Integer not null, 
agentLName	 varchar(15) not null, 
agentFName varchar(15) not null,
agentInitial char(1),
agentAreaCode char(3),
agentPhone char(8),
agentStreetNum Integer not null, 
agentStreetName varchar(30),
agentCity varchar(15),
agentState char(2),
agentZip char(5) unique not null,
dateHired Date,
ytdPay numeric,
ytdFica numeric,
ytdFit numeric,
ytdSales numeric,
AgentDep Integer,
Salaried Bit,
Constraint sales_agent_agent_code_pk PRIMARY KEY(agentCode));

select * from Sales_Agent;

SET ANSI_WARNINGS  OFF;

insert into Sales_Agent VALUES (1001, 'Bui', 'Cuong', 'T', 'A01', '64712300', 12, 'Marowyne Drive', 'Toronto', 'ON', 'M2J2A3', '2019-08-26', 2003, 1993, 2009,2006, 1345, 0);

insert into Sales_Agent VALUES (1002, 'Kaul', 'Navadev', 'J', 'A02', '64712302', 122, 'Sheppard', 'Toronto', 'ON', 'K2J2A3', '2018-08-26', 2013, 1999, 2006,2006, 1042, 0);

insert into Sales_Agent VALUES (1003, 'Dick', 'Neil', 'J', 'A03', '64712303', 123, 'Steels', 'Toronto', 'ON', 'N2JKA3', '2008-06-25', 2012, 2009, 1998, 2344, 1043, 1);

insert into Sales_Agent VALUES (1004, 'Clar', 'Carl', 'M', 'A04', '3471230', 124, 'Bloor', 'Birkingham', 'NY', 'D2JKA3', '2002-06-26', 2012, 2009, 1998, 2342, 1044, 1);

insert into Sales_Agent VALUES (1005, 'Carlos', 'Robert', 'U', 'A05', '3474230', 125, 'Bincolo', 'New Fin', 'PA', 'U2JKA3', '2015-01-27', 2010, 2007, 1996, 2343, 1045, 0);

insert into Sales_Agent VALUES (1006, 'Finch', 'Tech', 'H', 'A06', '3441236', 126, 'Pertuburg', 'Pante Caloden', 'DE', 'L2JOA3', '2014-03-12', 2014, 2008, 1999, 2543, 1047, 1);
insert into Sales_Agent VALUES (1007, 'Fedenal', 'Vlad', 'G', 'A07', '3441237', 127, 'Saint', 'Dre Marco', 'UJ', 'R2JOE0', '03/12/2009', 2014, 2008, 1999, 2543, 1047, 1);

select agentfName as 'First Name', agentLName 'Last Name', agentPhone 'Phone Number' from Sales_Agent;

select agentfName as 'First Name', agentLName 'Last Name', concat(agentStreetNum, ' ' , agentStreetName, ' ', agentCity, ' ', agentState, ' ', agentZip) as Address from Sales_Agent
where  agentState in ('NY', 'DE', 'PA');


select agentCode as 'Agent ID', concat( agentLName, ' ', agentInitial, ' ', agentFName) as 'Full Name', agentPhone 'Phone Number' from Sales_Agent 
where (ytdPay+ ytdFica+ ytdFit+ ytdSales) > 50000 and AgentDep > 0;


select concat( agentLName, ' ', agentInitial, ' ', agentFName) as 'Full Name', agentPhone 'Phone Number' from Sales_Agent 
where dateHired in ('2001-01-01', '2010-08-30');

select agentCode as 'Agent ID', concat( agentLName, ' ', agentInitial, ' ', agentFName) as 'Full Name', agentPhone 'Phone Number' from Sales_Agent 
where Salaried = 0 and ytdSales > 250000;