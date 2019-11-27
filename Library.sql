create database LIBRARY;

create table librarian
( librarian_id INTEGER NOT null,
librarian_fname VARCHAR(20) not null,
librarian_lname VARCHAR(20) not null,
librarian_email VARCHAR(30) not null,
librarian_phone VARCHAR(30) not null,
CONSTRAINT librarian_id_pk
primary key(librarian_id));


create table 
create table card_member_info
(member_id integer not null,
 member_fname varchar(20) not null,
 member_lname varchar(20),
 member_email varchar(30) not null,