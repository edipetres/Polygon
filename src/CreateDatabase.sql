drop table if exists building;
drop table if exists customer;

CREATE TABLE customer (
customerID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40),
email VARCHAR(40),
phone int(20),
password VARCHAR(20)
); 

CREATE TABLE building (
buildingID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
customerID INT(8),
name VARCHAR(40), 
address VARCHAR(120),
size INT(5),
cond INT(5),
lastCheckUp DATE,
link VARCHAR(50),
FOREIGN KEY (customerID)
REFERENCES customer(customerID) 
);
