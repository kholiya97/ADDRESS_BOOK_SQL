-----------------UC1--------------------
CREATE DATABASE ADDRESS_BOOK;
USE ADDRESS_BOOK;


-------------UC2----------------
---------Creating a Table---------

CREATE TABLE ADDRESS_BOOK
(
FirstName char(25),
LastName char(25),
City char(25),
StateName char(25),
Zip int,
Phone varchar(25),
Email varchar(25)
);
 SELECT * FROM ADDRESS_BOOK;

 -----------UC3-------------
----------Inserting values into a table------------
INSERT INTO Address_Book VALUES('Himanshu','Kholiya','Pithoragarh','Uttrakhand','262550','845784','kholiyahimanshu@gmail.com');
INSERT INTO Address_Book VALUES('Vishal','Singh','Mumbai','Maharashtra','560085','454645','vishalsingh@gmail.com');
INSERT INTO Address_Book VALUES('Harshpal','Singh','Pune','Maharashtra','8375','763784','harshpal@gmail.com');
INSERT INTO Address_Book VALUES('Krunal','Kamble','Karad','Maharashtra','574895','09384903','krunalkamble@gmail.com');
INSERT INTO Address_Book VALUES('Kawasaki','Bkl','Karnataka','Karnataka','455454','09384903','kawasakibkl@gmail.com');
SELECT * FROM ADDRESS_BOOK;


----------------UC4--------------
-----Editing Details Using Name----------
UPDATE Address_Book SET Phone='7002285211' WHERE FirstName='Himanshu';


--------UC5--------------
-------Deleating a person using name---------
DELETE FROM Address_Book WHERE FirstName= 'Kawasaki';

--------------------UC6-------------
----------Retrieving Data by City or State----------
Select * from Address_Book WHERE City='Karad';
Select * from Address_Book WHERE StateName='Maharashtra';

------------UC7-----------
---------Size of Address book by City or State------------
Select COUNT(City) as City_Count FROM Address_Book;
Select COUNT(StateName) as State_Count FROM Address_Book;

----------------UC8--------------
-----------Sorting data------------
SELECT * FROM Address_Book ORDER BY(FirstName);

---UC9:- Ability to identify each Address Book with name and Type.

--UC9.1:- Alter Address Book to add name and type.
alter table Address_Book add Name varchar(255),Type varchar(255);

select * from Address_Book;

--UC9.2:- Here the type could Family, Friends, Profession, etc.

update Address_Book set Name='JAISHREERAM';

update Address_Book set Type ='Family' where FirstName='Vishal';
select * from Address_Book;

update Address_Book set Type ='Friend' where FirstName='Himanshu'; 
select * from Address_Book;

--UC10:- Ability to get number of contact persons i.e. count by type.

select count(type) 
from Address_Book;

select Type, count(*) as TypeCount 
from Address_Book
group by Type;

--UC11:- Ability to add person to both Friend and Family.

insert into Address_Book(FirstName,LastName,City,StateName,Zip,Phone,Email,Name,Type) values('Kumar','Mumbai','Maharashtra','400105','8762498989','sham@gmail.com','ShamContact','Family');
select * from Address_Book;
