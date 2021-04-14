-- CREATE SEQUENCES FOR PKs:

create sequence pk10_seq
start with 10001
maxvalue 10999;

create sequence pk11_seq
start with 11001
maxvalue 11999;

create sequence pk12_seq
start with 12001
maxvalue 12999;

create sequence pk13_seq
start with 13001
maxvalue 13999;

create sequence pk14_seq
start with 14001
maxvalue 14999;

create sequence pk15_seq
start with 15001
maxvalue 15999;

create sequence pk16_seq
start with 16001
maxvalue 16999;

create sequence pk17_seq
start with 17001
maxvalue 17999;

create sequence pk18_seq
start with 18001
maxvalue 18999;

create sequence pk19_seq
start with 19001
maxvalue 19999;

create sequence pk20_seq
start with 20001
maxvalue 20999;

create sequence pk21_seq
start with 21001
maxvalue 21999;

create sequence pk22_seq
start with 22001
maxvalue 22999;



--CREATE TABLES:
CREATE TABLE Department (
  department_id int DEFAULT pk10_seq.nextval PRIMARY KEY,
  department_name varchar(50),
  hod_name varchar(20),
  number_of_employees int
);

CREATE TABLE Patient_Doctor (
  doc_pat_id int DEFAULT pk11_seq.nextval PRIMARY KEY,
  patient_id int,
  doctor_id int,
  appoin_date date
);

CREATE TABLE Laboratory (
  test_id int DEFAULT pk12_seq.nextval PRIMARY KEY,
  patient_id int,
  date_of_test date,
  date_of_result date,
  type_of_test varchar(20),
  test_result varchar(10),
  staff_id int
);

CREATE TABLE Staff (
  staff_id int DEFAULT pk13_seq.nextval PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  age int,
  address varchar(50),
  department_id int,
  shift_type varchar(10)
);

CREATE TABLE Doctor (
  doctor_id int DEFAULT pk14_seq.nextval PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  address varchar(50),
  specialization varchar(20),
  date_of_birth int,
  age int,
  department_id int
);

CREATE TABLE Inventory (
  item_id int DEFAULT pk15_seq.nextval PRIMARY KEY,
  item_name varchar(20),
  item_brand varchar(20),
  quantity int,
  purchase_date date
);

CREATE TABLE Patient (
  patient_id int DEFAULT pk16_seq.nextval PRIMARY KEY,
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
  payment_id int DEFAULT pk17_seq.nextval PRIMARY KEY,
  payment_amount int,
  payment_date date
);

CREATE TABLE Patient_Medicine (
  pat_med_id int DEFAULT pk18_seq.nextval PRIMARY KEY,
  patient_id int,
  medicine_id int
);

CREATE TABLE Patient_Ward (
  pat_ward_id int DEFAULT pk19_seq.nextval PRIMARY KEY,
  patient_id int,
  ward_id int,
  admit_date date,
  dischardge_date date
);

CREATE TABLE Medicine (
  medicine_id int DEFAULT pk20_seq.nextval PRIMARY KEY,
  medicine_name varchar(20),
  quantity int
);

CREATE TABLE HospitalWard (
  ward_id int DEFAULT pk21_seq.nextval PRIMARY KEY,
  ward_type varchar(20),
  building_name varchar(20),
  floor int,
  staff_id int
);

CREATE TABLE Staff_Ward (
  staff_ward_id int DEFAULT pk22_seq.nextval PRIMARY KEY,
  ward_id int,
  staff_id int
);