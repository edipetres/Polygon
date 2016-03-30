create database Polygon;
use Polygon;

Drop table if exists Report;
Drop table if exists Building;
Drop table if exists Employee;
Drop table if exists Customer;



create table Employee(
emp_id int primary key,
fname varchar(30),
lname varchar(30),
username varchar(30),
pwd varchar(30),
email varchar(30),
phone_no varchar(15)
);

create table Customer(
customer_id int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname varchar(30),
lname varchar(30),
username varchar(30),
pwd varchar(30),
email varchar(30),
phone_no varchar(15)
);
create table City(
zip int(10) primary key,
city varchar(50)
);
create table Building (
building_id int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(30),
street varchar(50),
zip int(10),
parcel_no int,
size int(5),
condition_level int,
floorplanURL varchar(50),
customer_id int,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

create table Report(
report_id int primary key,
building_id int,
checkDate DATE,
condition_level int,
comments varchar(30),
FOREIGN KEY (building_id) REFERENCES Building(building_id)
);
