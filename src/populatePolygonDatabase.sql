
INSERT INTO Customer(company_name,fname,lname,username,pwd,email,phone_no) VALUES ('Microsoft','Robert','Gosh','robgosh','pwd123','robgosh@gmail.com',91805532);

INSERT INTO Services VALUES (11,'Leak detection');
INSERT INTO Services VALUES (12,'Moisture testing');
INSERT INTO Services VALUES (13,'Drying services');
INSERT INTO Services VALUES (14,'Grafiti removal');
INSERT INTO Services VALUES (15,'Burglary restoration');
INSERT INTO Services VALUES (16,'Fire damage');

INSERT INTO Employee(fname,lname,username,pwd,email,phone_no) 
VALUES ('John','Brown','johnbrown','pwd123','johnb@gmail.com',91007744);

INSERT INTO Building (name,street,zip,parcel_no,size,condition_level,customer_id)
VALUES ('Norre Flat', 'Norreport',1400,1500,344,0,1);

INSERT INTO ServiceRequest (building_id,employee_id,requestDate,service_id,description,reportStatus)
VALUES (2,0,2016-04-01,11,'This is description for my service request.','pending');
