-- create database Polygon;
use Polygon;

Drop table if exists DamageReport;
Drop table if exists CheckupReport;
Drop table if exists Building;
Drop table if exists City;
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
company_name varchar(30),
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
creport_id int auto_increment primary key,
building_id int NOT NULL,
checkDate DATE,
condition_level int,
reportStatus enum('pending','active','done') NOT NULL,
comments varchar(255),
employee_id int,
FOREIGN KEY (building_id) REFERENCES Building(building_id),
FOREIGN KEY (employee_id) REFERENCES Employee(emp_id)
);


create table ServiceRequest(
srequest_id int primary key,
building_id int NOT NULL,
employee_id int,
requestDate DATE,
checkDate DATE,
service_id int,
description varchar(255),
reportStatus enum('pending','active','done') NOT NULL,
FOREIGN KEY (building_id) REFERENCES Building(building_id),
FOREIGN KEY (employee_id) REFERENCES Employee(emp_id)
);
create table Services(
service_id int primary key,
service_name varchar(40)
);




INSERT INTO Building(street, zip, size, customer_id) VALUES('123 Fakestreet', 45692, 90, 1);
INSERT INTO CheckupReport(building_id, checkDate, reportStatus) VALUES (2, current_date(),'pending');
INSERT INTO Employee(emp_id,fname, lname, username, pwd) VALUES (3,'Fixer','Worker','fworker', '123');
-- get pending reports
select reportStatus, street, zip, size, fname, lname, company_name, checkDate from CheckupReport
join Building ON Building.building_id=CheckupReport.building_id
join Customer ON Customer.customer_id=Building.customer_id;

-- get active/assigned 
UPDATE CheckupReport
SET reportStatus='active', employee_id=3, checkDate=current_date()
WHERE creport_id=5;
-- after filling in report
UPDATE CheckupReport
SET checkDate=current_date(), condition_level=1, reportStatus='done', comments='everything is ok'
WHERE creport_id=2;

select * from checkupreport;
select creport_id, reportStatus, street, zip, size, Customer.fname, Customer.lname, company_name, Employee.fname, Employee.lname from CheckupReport
join Building ON Building.building_id=CheckupReport.building_id
join Customer ON Customer.customer_id=Building.customer_id
join Employee ON Employee.emp_id=CheckupReport.employee_id
where reportStatus='active';