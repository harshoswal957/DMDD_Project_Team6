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
  date_of_birth date,
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
  payment_date date, 
  patient_id int
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

--Disabling Constraint

ALTER TABLE Staff_Ward
DISABLE CONSTRAINT FK_SW_SID ;
ALTER TABLE Staff_Ward
DISABLE CONSTRAINT FK_SW_WARDID ;

ALTER TABLE HospitalWard
DISABLE CONSTRAINT FK_SW_STAFFID ;

ALTER TABLE Patient_Ward
DISABLE CONSTRAINT FK_PW_PID ;
ALTER TABLE Patient_Ward
DISABLE CONSTRAINT FK_SW_HW ;

ALTER TABLE Patient_Medicine
DISABLE CONSTRAINT FK_SW_PID ;
ALTER TABLE Patient_Medicine
DISABLE CONSTRAINT FK_SW_MID ;

ALTER TABLE Patient
DISABLE CONSTRAINT FK_P_PAYID ;

ALTER TABLE Inventory
DISABLE CONSTRAINT FK_INV_PDEPTID ;

ALTER TABLE Doctor
DISABLE CONSTRAINT FK_DOC_DEPTID ;

ALTER TABLE STAFF
DISABLE CONSTRAINT FK_STAFF_DID ;

ALTER TABLE LABORATORY
DISABLE CONSTRAINT FK_LAB_PID ;
ALTER TABLE LABORATORY
DISABLE CONSTRAINT FK_LAB_STAFFID ;

ALTER TABLE PATIENT_DOCTOR
DISABLE CONSTRAINT FK_PD_PID ;
ALTER TABLE PATIENT_DOCTOR
DISABLE CONSTRAINT FK_PD_DID ;




--Data Insertion 

--Patient Table

INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('RICHARD','GILL','350 RIVERWAY','YES','26-Jan-1998',23,'NO','B+',17001);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('MARY','HALL','150 TREMONT STREET','YES','14-Mar-1999',22,'NO','AB+',17002);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('JACOB','BAKER','11 TETLOW STREET','NO','7-Sep-1988',32,'NO','O-',17003);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('SMITH','RIVERA','34 SOMERVILLE','YES','23-Aug-2002',18,'YES','A+',17004);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('ADAMS','GREENS','50 OAKLAND AVE','YES','10-Feb-2011',10,'YES','B+',17005);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('JOHN','FLORES','42 DOWNTOWN STREET','NO','20-April-1998',23,'NO','AB+',17006);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('CAMPBELL','ROGERS','345 LACANIA STREET','YES','19-July-1987',33,'NO','B+',17007);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('NELSON','CARTER','92 DAKOTA ROAD','NO','1-Jan-2018',3,'YES','AB+',17008);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('HIMANSHU','SINGH','75 ALPES STREET','YES','15-March-1999',22,'NO','B+',17009);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('ROBERT','LIAM','25 MG STREET','YES','24-April-1978',43,'NO','O+',17010);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('AMY','SANTIAGO','144 BAKER STREET','NO','15-Mar-1994',26,'YES','AB-',17011);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('JAKE','PERALTA','54 CAMBRIDGE','YES','15-Apr-1975',46,'NO','A+',17012);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('ROSA','DIAZ','66 ATLANTA ','NO','4-Dec-2019',1,'NO','B+',17013);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('TEDDY','JEFORDS','352 RIVERWAY','YES','27-Nov-2002',18,'NO','AB-',17014);
INSERT INTO PATIENT (first_name, last_name, address, insurance, date_of_birth, age, covid_19, blood_group, payment_id) VALUES('CHARLES','BOYLE','92 ORN STREET','NO','16-Jan-1992',29,'NO','O+',17015);


--PaymentTransactions TABLE

INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (1200,'2-Jan-2021',16001);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (200,'2-Jan-2021',16002);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (345,'3-Jan-2021',16003);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (650,'5-Jan-2021',16004);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (2000,'5-Jan-2021',16005);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (120,'5-Jan-2021',16006);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (560,'6-Jan-2021',16007);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (1400,'6-Jan-2021',16008);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (1145,'7-Jan-2021',16009);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (675,'7-Jan-2021',16010);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (190,'8-Jan-2021',16011);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (650,'8-Jan-2021',16012);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (995,'8-Jan-2021',16013);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (435,'9-Jan-2021',16014);
INSERT INTO PAYMENTTRANSACTIONS (payment_amount, payment_date,patient_id) VALUES (4500,'9-Jan-2021',16015);


--Department table

INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('Finance','RAMAN GOEL',3);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('Management','MAY GREENS',5);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('Nurse','BO CHAN',24);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('Housekeeping','TOM ROBERTS',10);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('AssociateDoctor','RACHAEL ',5);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('SeniorDoctor','ELI FISHER',3);
INSERT INTO DEPARTMENT (department_name, hod_name, number_of_employees) VALUES ('LabStaff','CHRIS EVANS',5);


--Doctor TABLE

INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('EMMA ','WILLIAM','777 BROCKTON AVENEUE','CARDIOLOGIST','19-July-1987',33,10006);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('JACOB','BROWN','250 HARTFORD AVENUE','DERMATOLOGIST','28-Sep-1993',27,10005);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('MASON','MILLER','337 RESELL STREET','DENTIST','25-Jan-1990',31,10005);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('OLIVIA','DAVIS','200 OTIS STREET','GYNACOLOGIST','3-Oct-1991',29,10006);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('LILY','LOPEZ','115 BOSTON ROAD','GYNACOLOGIST','16-April-1995',26,10005);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('CHLOE','THOMAS','333 MAIN STREET','ENT','5-Aug-1989',31,10006);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('DANIEL','MOORE','100 CHARLTON ROAD','GYNACOLOGIST','22-Feb-1981',40,10005);
INSERT INTO DOCTOR (first_name, last_name, address, specialization, date_of_birth, age, department_id) VALUES('JAMES','PEREZ','340 PALMER ROAD','CARDIOLOGIST','28-May-1985',35,10006);


--HospitalWard Table

INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('GENERAL','NEW',1,10002);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('GENERAL','NEW',1,10002);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('GENERAL','NEW',1,10010);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('GENERAL','OLD',2,10008);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('PRIVATE','NEW',3,10009);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('PRIVATE','NEW',3,10009);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('PRIVATE','OLD',3,10009);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('PRIVATE','OLD',2,10008);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('EMERGENCY','NEW',1,10010);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('EMERGENCY','NEW',1,10010);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('EMERGENCY','OLD',1,10014);
INSERT INTO HospitalWard (ward_type, building_name, floor, staff_id)VALUES ('EMERGENCY','OLD',1,10014);




--Laboratory Project

INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16003,'25-Jan-21','27-Jan-21','Covid RT-PCR','Abnormal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16015,'27-Jan-21','27-Jan-21','Hemogram Blood Test','Normal',15002);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16007,'26-Jan-21','26-Jan-21','Haemoglobin','Normal',15003);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16010,'18-Jan-21','18-Jan-21','Creatin Test','Normal',15002);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16001,'26-Jan-21','26-Jan-21','Stool Test','Abnormal',15004);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16013,'30-Jan-21','30-Jan-21','X-ray','Normal',15008);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16005,'02-Jan-21','02-Jan-21','Lipid Profile','Abnormal',15009);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16006,'02-Feb-21','02-Feb-21','Urionogram','Abnormal',15006);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16004,'05-Feb-21','05-Feb-21','Cardiac Risk Markers','Normal',15010);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16011,'06-Feb-21','06-Feb-21','Haemoglobin','Abnormal',15011);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16007,'07-Feb-21','07-Feb-21','Covid RT-PCR','Abnormal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16012,'10-Mar-21','10-Mar-21','Lipid Profile','Normal',15012);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16008,'12-Feb-21','12-Feb-21','Covid RT-PCR','Abnormal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16002,'13-Feb-21','13-Feb-21','Covid RT-PCR','Normal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16014,'15-Feb-21','15-Feb-21','Cardiac Risk Markers','Normal',15010);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16013,'16-Feb-21','16-Feb-21','Urionogram','Abnormal',15014);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16001,'18-Feb-21','18-Feb-21','Haemoglobin','Abnormal',15013);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16009,'18-Feb-21','18-Feb-21','Covid RT-PCR','Normal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16008,'19-Feb-21','19-Feb-21','Cardiac Risk Markers','Normal',15008);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16011,'20-Feb-21','20-Feb-21','Hemogram Blood Test','Abnormal',15012);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16015,'22-Feb-21','22-Feb-21','Covid RT-PCR','Normal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16006,'24-Feb-21','24-Feb-21','Covid RT-PCR','Normal',15001);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16010,'27-Feb-21','27-Feb-21','Lipid Profile','Abnormal',15004);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16013,'28-Feb-21','28-Feb-21','Hemogram Blood Test','Normal',15008);
INSERT INTO LABORATORY (patient_id,date_of_test, date_of_result,type_of_test,test_result,staff_id) VALUES(16014,'01-Mar-21','01-Mar-21','Cardiac Risk Markers','Abnormal',15009);

--Medicine Table

INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Crocin',10000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Cephalexin',50000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Dolo',23000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Lisinopril',34650);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Amlodipine',500);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Valcyte',3400);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Acarbose',67000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Gabitril',12500);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Papain',45600);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Matulane',2990);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Gantrisin',4300);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Rapaflo',45000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Mannitol',25000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Tabloid',10000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Zadaxin',35000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Zemplar',200);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Pemoline',1000);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Valtropin',350);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Kantrex',12550);
INSERT INTO MEDICINE (medicine_name, quantity) VALUES ('Keflex',32000);
