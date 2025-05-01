CREATE SCHEMA IF NOT EXISTS MyMobile;
USE MyMobile;

DROP TABLE IF EXISTS Cancellation;
DROP TABLE IF EXISTS Customer_Plan;
DROP TABLE IF EXISTS Call_Traffic;
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Plan;
DROP TABLE IF EXISTS Customer;

CREATE TABLE IF NOT EXISTS Plan (
  Plan_ID INT PRIMARY KEY,
  Type VARCHAR(120),
  Name VARCHAR(120),
  Duration INT,
  Cost DECIMAL(10,2),
  Features VARCHAR(255)
  );

CREATE TABLE IF NOT EXISTS Customer (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(45),
  Address VARCHAR(255),
  Phone_Number VARCHAR(10),
  Email VARCHAR(255),
  Date_of_birth DATE
);

CREATE TABLE IF NOT EXISTS Transaction (
  Transaction_ID INT PRIMARY KEY,
  Plan_ID INT,
  Customer_ID INT,
  Type VARCHAR(30),
  Date DATETIME,
  Amount DECIMAL(10,2),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Plan_ID) REFERENCES Plan(Plan_ID)
  );

CREATE TABLE IF NOT EXISTS Call_Traffic (
  Call_ID INT PRIMARY KEY,
  Customer_ID INT,
  Date DATETIME,
  Duration DECIMAL(10,2),
  Type VARCHAR(45),
  Cost DECIMAL(10,2),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
  );

CREATE TABLE IF NOT EXISTS Customer_Plan (
  Customer_ID INT,
  Plan_ID INT,
  PRIMARY KEY (Customer_ID, Plan_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Plan_ID) REFERENCES Plan(Plan_ID)
  );
  
CREATE TABLE IF NOT EXISTS Cancellation (
  Cancellation_ID INT PRIMARY KEY,
  Customer_ID INT,
  Date DATE,
  Reason VARCHAR(255),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
  );

