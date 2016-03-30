create database Polygon;
use Polygon;

Drop table if exists Report;
Drop table if exists Building;
Drop table if exists Employee;
Drop table if exists Customer;



create table Employee(
emp_id int primary key,
fname varchar(30) NOT NULL,
lname varchar(30) NOT NULL,
username varchar(30) NOT NULL,
pwd varchar(30) NOT NULL,
email varchar(30),
phone_no varchar(15)
);

create table Customer(
customer_id int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname varchar(30) NOT NULL,
lname varchar(30) NOT NULL,
username varchar(30) NOT NULL,
pwd varchar(30) NOT NULL,
email varchar(30),
phone_no varchar(15)
);
create table City(
zip int(10) primary key,
city varchar(50) NOT NULL
);
create table Building (
building_id int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(30),
street varchar(50) NOT NULL,
zip int(10) NOT NULL,
parcel_no int,
size int(5) NOT NULL,
condition_level int,
floorplanURL varchar(50),
customer_id int NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

create table CheckupReport(
creport_id int primary key,
building_id int NOT NULL,
checkDate DATE NOT NULL,
condition_level int NOT NULL,
reportStatus varchar(10) NOT NULL,
comments varchar(30),
employee_id int NOT NULL,
FOREIGN KEY (building_id) REFERENCES Building(building_id),
FOREIGN KEY (employee_id) REFERENCES Employee(emp_id)
);

create table DamageReport(
dreport_id int primary key,
building_id int NOT NULL,
checkDate DATE NOT NULL,
incident varchar(10),
reportStatus varchar(10) NOT NULL,
comments varchar(30),
FOREIGN KEY (building_id) REFERENCES Building(building_id)
);
