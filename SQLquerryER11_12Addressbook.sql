create database AddressBookDB;
use AddressBookDB
---UC12:- Draw the ER Diagram for Address Book Service DB. 

-- UC12.1:- Create table ContactDetails

create table ContactDetails(FirstName varchar(50) not null,LastName varchar(50) not null,Address varchar(50) not null default 'Mumbai' foreign key references Addresses(Address),PhoneNumber varchar(10) not null, Email varchar(50) not null,
Primary key(FirstName,LastName));

select * from ContactDetails;

-- UC12.2:- insert value  ContactDetails table

insert into ContactDetails(FirstName,LastName,PhoneNumber,Email)values('Vishal','Singh','9930315160','vishsing@gmail.com');
insert into ContactDetails(FirstName,LastName,Address,PhoneNumber,Email)values('Himanshu','Kholiya','Pune','1234567891','himanshu@gmail.com');
insert into ContactDetails(FirstName,LastName,Address,PhoneNumber,Email)values('Omprakash','Khwashi','Nagpur','1515161918','om@gmail.com');

select * from ContactDetails;

-- UC12.3:-  Create table Addresses
Create table Addresses(Address varchar(50) not null default 'Lalit' primary key,City varchar(20) not null,State varchar(20) not null,Zip varchar(6) not null default '412105');

select * from Addresses; --Display table

-- UC12.4:- insert value  Addresses table
insert into Addresses(Address,City,State) values('KokanNagar','Mumbai','Maharashtra');

insert into Addresses(City,State) values('Pune','Maharashtra');

update Addresses set Address='Bajaj Nagar' where Address='Pune';
select * from Addresses;

create table AddressBookName(Name_id int not null identity(1,1) primary key, AddressBookName varchar(50) not null unique ,ContactType varchar(50) not null unique);

select * from AddressBookName;

-- UC12.5:- insert value  AddressBookName table
insert into AddressBookName values('Books','Friend'),('Baba','Parents'),('Taii','Sister');
select * from AddressBookName;

-- UC12.6:-  Create table ContactTypeMapping

create table ContactTypeMapping(FirstName varchar(50) not null,LastName varchar(50) not null,Name_id int not null foreign key references AddressBookName(Name_id),
Foreign key(FirstName,LastName) references ContactDetails(FirstName,LastName), unique(FirstName,LastName,Name_id));

select * from ContactTypeMapping;


-- UC12.7:-  insert value  ContactTypeMapping table
insert into ContactTypeMapping (FirstName,LastName,Name_id) values('Vishal','Singh','1');

select * from ContactTypeMapping;


--- UC13:- Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10 are working with new table structure.

--UC13.1:- retrieve data perticuar city or state

select * from ContactDetails CD 
inner join Addresses A on A.Address=CD.Address;

---UC13.2:- Count Book by city or state
select COUNT(*),City from ContactDetails CD 
inner join Addresses A on A.Address=CD.Address
group by A.City;

--UC13.3:- Contacts city sorted Alphabetically

select * from ContactDetails CD 
inner join Addresses A on A.Address=CD.Address
order by CD.FirstName,CD.LastName ;

--UC13.4:- Count contact
select Count(*) From ContactDetails;