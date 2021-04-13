--CREATE TABLES:

CREATE TABLE Department (
  department_id int PRIMARY KEY,
  department_name varchar(50),
  hod_name varchar(20),
  number_of_employees int
);

CREATE TABLE Patient_Doctor (
  doc_pat_id int PRIMARY KEY,
  patient_id int,
  doctor_id int,
  appoin_date date
);

CREATE TABLE Laboratory (
  test_id int PRIMARY KEY,
  patient_id int,
  date_of_test date,
  date_of_result date,
  type_of_test varchar(20),
  test_result varchar(10),
  staff_id int
);

CREATE TABLE Staff (
  staff_id int PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  age int,
  address varchar(50),
  department_id int,
  shift_type varchar(10)
);

CREATE TABLE Doctor (
  doctor_id int PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  address varchar(50),
  specialization varchar(20),
  date_of_birth int,
  age int,
  department_id int
);

CREATE TABLE Inventory (
  item_id int PRIMARY KEY,
  item_name varchar(20),
  item_brand varchar(20),
  quantity int,
  purchase_date date
);

CREATE TABLE Patient (
  patient_id int PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  address varchar(50),
  insurance varchar(20),
  date_of_birth date,
  age int,
  covid_19 varchar(10),
  blood_group varchar(10),
  payment_id int
);

CREATE TABLE PaymentTransactions (
  payment_id int PRIMARY KEY,
  payment_amount int,
  payment_date date
);

CREATE TABLE Patient_Medicine (
  pat_med_id int PRIMARY KEY,
  patient_id int,
  medicine_id int
);

CREATE TABLE Patient_Ward (
  pat_ward_id int PRIMARY KEY,
  patient_id int,
  ward_id int,
  admit_date date,
  dischardge_date date
);

CREATE TABLE Medicine (
  medicine_id int PRIMARY KEY,
  medicine_name varchar(20),
  quantity int
);

CREATE TABLE HospitalWard (
  ward_id int PRIMARY KEY,
  ward_type varchar(20),
  building_name varchar(20),
  floor int,
  staff_id int
);

CREATE TABLE Staff_Ward (
  staff_ward_id int PRIMARY KEY,
  ward_id int,
  staff_id int
);
