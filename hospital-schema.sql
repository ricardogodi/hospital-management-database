DROP DATABASE IF EXISTS HOSPITAL;

CREATE DATABASE HOSPITAL;

USE HOSPITAL;
CREATE TABLE PHYSICIANS (
  physician_id INT PRIMARY KEY,
  name VARCHAR(255),
  phone_num VARCHAR(15),
  field VARCHAR(255),
  address VARCHAR(255),
  certification_num VARCHAR(255)
);

CREATE TABLE INSTRUCTIONS (
  instruction_code VARCHAR(255) PRIMARY KEY,
  description TEXT,
  fee DECIMAL(10,2)
);

CREATE TABLE NURSES (
  nurse_id INT PRIMARY KEY,
  address VARCHAR(255),
  name VARCHAR(255),
  phone_num VARCHAR(15),
  certification_num VARCHAR(255)
);

CREATE TABLE ROOMS (
  room_number INT PRIMARY KEY,
  capacity INT,
  fee DECIMAL(10,2)
);


CREATE TABLE PATIENTS (
  patient_id INT PRIMARY KEY,
  name VARCHAR(255),
  phone_num VARCHAR(15),
  address VARCHAR(255),
  nurse_id INT,
  medication_name VARCHAR(255),
  medication_amount INT,
  room_number INT,
  num_nights INT,
  FOREIGN KEY (nurse_id) REFERENCES NURSES(nurse_id),
  FOREIGN KEY (room_number) REFERENCES ROOMS(room_number)
);

CREATE TABLE HEALTH_RECORDS (
  health_id INT PRIMARY KEY,
  disease VARCHAR(255),
  status VARCHAR(255),
  date DATE,
  description TEXT,
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id)
);

 CREATE TABLE INVOICES (
  invoice_id INT PRIMARY KEY,
  instruction_fee DECIMAL(10,2),
  room_fee DECIMAL(10,2),
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id)
);

CREATE TABLE PAYMENTS (
  payment_id INT PRIMARY KEY,
  amount DECIMAL(10,2),
  date DATE,
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id)
);

CREATE TABLE INVOICE_PAYMENTS (
  patient_id INT,
  invoice_id INT,
  payment_id INT,
  PRIMARY KEY (patient_id, invoice_id, payment_id),
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id),
  FOREIGN KEY (invoice_id) REFERENCES INVOICES(invoice_id),
  FOREIGN KEY (payment_id) REFERENCES PAYMENTS(payment_id)
);

CREATE TABLE MONITORED (
  patient_id INT,
  physician_id INT,
  duration VARCHAR(255),
  PRIMARY KEY (patient_id, physician_id),
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id),
  FOREIGN KEY (physician_id) REFERENCES PHYSICIANS(physician_id)
);

CREATE TABLE ORDERS (
  patient_id INT,
  instruction_code VARCHAR(255),
  physician_id INT,
  order_date DATE,
  PRIMARY KEY (patient_id, instruction_code, physician_id),
  FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id),
  FOREIGN KEY (instruction_code) REFERENCES INSTRUCTIONS(instruction_code),
  FOREIGN KEY (physician_id) REFERENCES PHYSICIANS(physician_id)
);

CREATE TABLE EXECUTED (
  instruction_code VARCHAR(255),
  nurse_id INT,
  date DATE,
  PRIMARY KEY (instruction_code, nurse_id),
  FOREIGN KEY (instruction_code) REFERENCES INSTRUCTIONS(instruction_code),
  FOREIGN KEY (nurse_id) REFERENCES NURSES(nurse_id)
);

