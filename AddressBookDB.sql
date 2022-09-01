--UC1:- Ability to create a Address Book Service DB.
--Use SQL Client to create DB and DB Records.
CREATE DATABASE AddressBookDB;
USE AddressBookDB;


--UC2:- Ability to create a Address Book Table with first and last names, 
--address, city, state, zip, phone number and email as its attributes.
CREATE TABLE AddressBook
(
firstName varchar(20) not null,
lastName varChar(20) not null,
address varchar(100) not null,
city varchar(20) not null,
state varchar(20) not null,
zip int not null,
phoneNumber varchar(12),
email varchar(20) not null
);
select * from AddressBook;

-- UC3:- Ability to insert new Contacts to Address Book.
insert into AddressBook (firstName,lastName,address,city,state,zip,phoneNumber,email) 
values('Pruthvika','lokesh','karnataka','smg','Karnataka','577427','89437873','pruthvika@gmail.com');
select * from AddressBook;

insert into AddressBook values('Mandara','M','Karnataka Banglore','Banglore','Karnataka','577275','8172365898','mandaram@gmail.com');
insert into AddressBook values('Amar','Nayak','Andra Pradesh','abc','Andra Pradesh','577215','8172365898','amar@gmail.com');

insert into AddressBook values('Rahul','Nayr','Nagpur','Nagpur','Maharashtra','442203','12345678910','opre@gmail.com');
insert into AddressBook values('Prashant','Singh','Nagpur','Nagpur','Maharashtra','442443','12345678910','prashant@gmail.com');


--UC4:- Ability to edit existing contact person using their name.
update AddressBook set zip=222145 where firstName='Mandara';
select * from AddressBook;

update AddressBook set email='mandaram@gmail.com' where firstName='Mandara';

update AddressBook set lastName='Singh' where firstName='Rahul';
select * from AddressBook;


--UC5:- Ability to delete a person using person's name.
Delete AddressBook where firstName='Rahul';
select * from AddressBook;


--UC6:- Ability to Retrieve Person belonging to a City or State from the Address Book.
select city,state from AddressBook;
select * from AddressBook where state='Karnataka' 
select * from AddressBook where city='smg' or state='Karnataka';


--UC7:- Ability to understand the size of address book by City and State.
-- Here size indicates the count.
select COUNT(city) from AddressBook;

select city, count(*) as AddressCount
from AddressBook group by (city);

select COUNT(state) from AddressBook;

select state, count(*) as AddressCount
from AddressBook group by (state);


--UC8:- Ability to retrieve entries sorted alphabetically by Person’s name for a given city.
select * from AddressBook order by city ASC;  --sorted by ASCII value of city

select * from AddressBook where city = 'smg'
order by (firstName);

select * from AddressBook where city = 'Banglore'
order by (firstName);


--UC9:- Ability to identify each Address Book with name and Type.
--UC9.1:- Alter Address Book to add name and type.
alter table AddressBook add Name varchar(255),Type varchar(255);
select * from AddressBook;

--UC9.2:- Here the type could Family, Friends, Profession, etc.
update AddressBook set Name='ShreeRam';

update AddressBook set Type ='Friend' where firstName='Pruthvika' or firstName='Prashant';
select * from AddressBook;

update AddressBook set Type ='Family' where firstName='Mandara' or firstName='Amar'; 
select * from AddressBook;


--UC10:- Ability to get number of contact persons i.e. count by type.
select count(type) from AddressBook;

select Type, count(*) as TypeCount 
from AddressBook group by Type;


--UC11:- Ability to add person to both Friend and Family.
insert into AddressBook(firstName,lastName,address,city,state,zip,phoneNumber,email,Name,Type) 
values('Shani','Seth','KAR','Skp','Karnataka','577427','8762498989','shani@gmail.com','ShaniContact','Family');
 
insert into AddressBook values('Ravi','Verma','KAR','Skp','Karnataka','577427','7862498989','ravi@gmail.com','RaviContact','Friend');
select * from AddressBook;