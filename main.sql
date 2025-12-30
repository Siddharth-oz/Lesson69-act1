CREATE TABLE IF NOT EXISTS Salesman (
Salesman_id TEXT PRIMARY KEY,
name TEXT,
city TEXT,
Comission REAL
);

INSERT INTO Salesman (Salesman_id, name, city, Comission) VALUES
('5001', 'James Hoog', 'New York', 0.15),
('5002', 'Nail Knite', 'Paris', 0.13),
('5005', 'Pit Alex', 'London', 0.11),
('5006', 'Mc Lyon', 'Paris', 0.14),
('5007', 'Paul Adam', 'Rome', 0.13),
('5003', 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE IF NOT EXISTS Customer (
customer_id TEXT,
custOMER_name TEXT PRIMARY KEY,
city TEXT,
grade INTEGER,
SALESMAN_ID TEXT,
FOREIGN KEY (SALESMAN_ID) REFERENCES
SALESMAN (SALESMAN_ID));
INSERT INTO CUSTOMER (CUSTOMER_ID,
CUSTOMER_NAME, CITY, GRADE, SALESMAN_ID) VALUES
('3002', 'nick rimando', 'new york', 100, '5001'),
('3007', 'brad davis', 'new york', 200, '5001'),
('3005', 'graham zusi', 'california',200, '5002'),
('3008', 'julian green', 'london', 300, '5002'),
('3004', 'fabian johnson', 'paris',300, '5006'),
('3009', 'geoff cameron', 'berlin',100,'5003'),
('3003', 'jozy altidor', 'moscow' 200, '5007'),
('3001', 'brad guzan', 'london', NULL, '5005');
CREATE TABLE IF NOT EXISTS Orders (
ord_no TEXT PRIMARY KEY,
purch_amt REAL,
ord_date TEXT,
customer_id TEXT,
Salesman_id TEXT,
FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
FOREIGN KEY (Salesman_id) REFERENCES Salesman (Salesman_id)
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES
('70001', 150.5, '2012-10-05', '3005', '5002'),
('70009', 270.65, '2012-09-10', '3001', '5001'),
('70002', 65.26, '2012-10-05', '3002', '5003'),
'70004', 110.5, '2012-08-17', '3009', '5007'),
( ('70007', 948.5, '2012-09-10', '3005', '5005'),
('70005', 2400.6, '2012-07-27', '3007', '5006');
SELECT FROM Customer;
SELECT * FROM Salesman;
SELECT customer.custOMER_name, salesman.name, salesman.city
FROM Customer
JOIN Salesman ON Customer.city=Salesman.city;

SELECT Customer.custOMER_name,Salesman.city    
FROM Customer
JOIN Salesman ON Customer.Salesman_id=Salesman.Salesman_id;

SELECT Orders.ord_no,Customer.custOMER_name,Orders.customer_id,Orders.Salesman_id
FROM Orders
JOIN Customer ON Orders.customer_id=Customer.customer_id
JOIN Salesman ON Orders.Salesman_id=Salesman.Salesman_id
WHERE Customer.city <> Salesman.city;

SELECT Orders.ord_no, Customer.custOMER_name AS "Customer",Customer.grade AS "Grade"
FROM Orders
Join Salesman ON Orders.Salesman_id=Salesman.Salesman_id
JOIN Customer ON Orders.customer_id=Customer.Customer_id
WHERE CUSTOMER.GRADE IS NOT NULL

SELCET CUSTOMER.CUSTOMER_NAME AS "CUSTOMER",
CUSTOMER.CITY AS "CITY",
SALESMAN.NAME AS "SALESMAN",
SALESMAN.COMMISION
FROM CUSTOMER
JOIN SALESMAN ON CUSTOMER.SALESMAN_ID=sALESMAN.SALESMAN_ID
WHERE SALESMAN.COMISSION BETWWEN 0.12 AND 0.14;

SELECT ORDERS.ORDERS.ORD_NO,CUSTOMER.CUSTOMER_NAME,SALESMAN.COMMISION AS "COMMISION%",ORDERS.PURCH_AMT*SALESMAN.COMMISON AS "COMMISION"
FROM ORDERS
JOIN SALESMAN ON ORDERS.SALESMAN_ID=SALESMAN.SALESMAN_ID
JOIN SALESMAN ON ORDERS.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID
WHERE CUSTOMER.GRADE > =200;

SELECT *
FROM CUSTOMER
JOIN ORDERS ON CUSTOMER.CUSTOMER_ID=ORDERS.CUSTOMER_ID
WHERE ORDERS.ORD_DATE='2012-10-05';