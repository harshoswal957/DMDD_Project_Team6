-- CREATE SEQUENCES FOR PKs:

CREATE SEQUENCE pk10_seq START WITH 10001 MAXVALUE 10999;

CREATE SEQUENCE pk11_seq START WITH 11001 MAXVALUE 11999;

CREATE SEQUENCE pk12_seq START WITH 12001 MAXVALUE 12999;

CREATE SEQUENCE pk13_seq START WITH 13001 MAXVALUE 13999;

CREATE SEQUENCE pk14_seq START WITH 14001 MAXVALUE 14999;

CREATE SEQUENCE pk15_seq START WITH 15001 MAXVALUE 15999;

CREATE SEQUENCE pk16_seq START WITH 16001 MAXVALUE 16999;

CREATE SEQUENCE pk17_seq START WITH 17001 MAXVALUE 17999;

CREATE SEQUENCE pk18_seq START WITH 18001 MAXVALUE 18999;

CREATE SEQUENCE pk19_seq START WITH 19001 MAXVALUE 19999;

CREATE SEQUENCE pk20_seq START WITH 20001 MAXVALUE 20999;

CREATE SEQUENCE pk21_seq START WITH 21001 MAXVALUE 21999;

CREATE SEQUENCE pk22_seq START WITH 22001 MAXVALUE 22999;


--CREATE TABLES:
CREATE TABLE department (
    department_id        INT DEFAULT pk10_seq.NEXTVAL PRIMARY KEY,
    department_name      VARCHAR(50),
    hod_name             VARCHAR(20),
    number_of_employees  INT
);

CREATE TABLE patient_doctor (
    doc_pat_id   INT DEFAULT pk11_seq.NEXTVAL PRIMARY KEY,
    patient_id   INT,
    doctor_id    INT,
    appoin_date  DATE
);

CREATE TABLE laboratory (
    test_id         INT DEFAULT pk12_seq.NEXTVAL PRIMARY KEY,
    patient_id      INT,
    date_of_test    DATE,
    date_of_result  DATE,
    type_of_test    VARCHAR(20),
    test_result     VARCHAR(10),
    staff_id        INT
);

CREATE TABLE staff (
    staff_id       INT DEFAULT pk13_seq.NEXTVAL PRIMARY KEY,
    first_name     VARCHAR(20),
    last_name      VARCHAR(20),
    age            INT,
    address        VARCHAR(50),
    department_id  INT,
    shift_type     VARCHAR(10)
);

CREATE TABLE doctor (
    doctor_id       INT DEFAULT pk14_seq.NEXTVAL PRIMARY KEY,
    first_name      VARCHAR(20),
    last_name       VARCHAR(20),
    address         VARCHAR(50),
    specialization  VARCHAR(20),
    date_of_birth   DATE,
    age             INT,
    department_id   INT
);

CREATE TABLE inventory (
    item_id        INT DEFAULT pk15_seq.NEXTVAL PRIMARY KEY,
    item_name      VARCHAR(30),
    item_brand     VARCHAR(50),
    quantity       INT,
    purchase_date  DATE,
    department_id  INT
);

CREATE TABLE patient (
    patient_id     INT DEFAULT pk16_seq.NEXTVAL PRIMARY KEY,
    first_name     VARCHAR(20),
    last_name      VARCHAR(20),
    address        VARCHAR(50),
    insurance      VARCHAR(20),
    date_of_birth  DATE,
    age            INT,
    covid_19       VARCHAR(10),
    blood_group    VARCHAR(10),
    payment_id     INT
);

CREATE TABLE paymenttransactions (
    payment_id      INT DEFAULT pk17_seq.NEXTVAL PRIMARY KEY,
    payment_amount  INT,
    payment_date    DATE,
    patient_id      INT
);

CREATE TABLE patient_medicine (
    pat_med_id   INT DEFAULT pk18_seq.NEXTVAL PRIMARY KEY,
    patient_id   INT,
    medicine_id  INT
);

CREATE TABLE patient_ward (
    pat_ward_id      INT DEFAULT pk19_seq.NEXTVAL PRIMARY KEY,
    patient_id       INT,
    ward_id          INT,
    admit_date       DATE,
    dischardge_date  DATE
);

CREATE TABLE medicine (
    medicine_id    INT DEFAULT pk20_seq.NEXTVAL PRIMARY KEY,
    medicine_name  VARCHAR(20),
    quantity       INT
);

CREATE TABLE hospitalward (
    ward_id        INT DEFAULT pk21_seq.NEXTVAL PRIMARY KEY,
    ward_type      VARCHAR(20),
    building_name  VARCHAR(20),
    floor          INT,
    staff_id       INT
);

CREATE TABLE staff_ward (
    staff_ward_id  INT DEFAULT pk22_seq.NEXTVAL PRIMARY KEY,
    ward_id        INT,
    staff_id       INT
);

--Creating foreign key Constraint
  ALTER TABLE patient_doctor
    ADD CONSTRAINT fk_pd_pid FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE patient_doctor
    ADD CONSTRAINT fk_pd_did FOREIGN KEY ( doctor_id )
        REFERENCES doctor ( doctor_id );

ALTER TABLE laboratory
    ADD CONSTRAINT fk_lab_pid FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE laboratory
    ADD CONSTRAINT fk_lab_staffid FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

ALTER TABLE staff
    ADD CONSTRAINT fk_staff_did FOREIGN KEY ( department_id )
        REFERENCES department ( department_id );

ALTER TABLE doctor
    ADD CONSTRAINT fk_doc_deptid FOREIGN KEY ( department_id )
        REFERENCES department ( department_id );

ALTER TABLE inventory
    ADD CONSTRAINT fk_inv_deptid FOREIGN KEY ( department_id )
        REFERENCES department ( department_id );

ALTER TABLE patient
    ADD CONSTRAINT fk_p_payid FOREIGN KEY ( payment_id )
        REFERENCES paymenttransactions ( payment_id );

ALTER TABLE paymenttransactions
    ADD CONSTRAINT fk_pt_pid FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE patient_medicine
    ADD CONSTRAINT fk_pm_pid FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE patient_medicine
    ADD CONSTRAINT fk_pm_mid FOREIGN KEY ( medicine_id )
        REFERENCES medicine ( medicine_id );

ALTER TABLE patient_ward
    ADD CONSTRAINT fk_pw_pid FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE patient_ward
    ADD CONSTRAINT fk_pw_hw FOREIGN KEY ( ward_id )
        REFERENCES hospitalward ( ward_id );

ALTER TABLE hospitalward
    ADD CONSTRAINT fk_hw_staffid FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

ALTER TABLE staff_ward
    ADD CONSTRAINT fk_sw_sid FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

ALTER TABLE staff_ward
    ADD CONSTRAINT fk_sw_wardid FOREIGN KEY ( ward_id )
        REFERENCES hospitalward ( ward_id );

--DISABLE CONSTRAINTS
ALTER TABLE staff_ward DISABLE CONSTRAINT fk_sw_sid;

ALTER TABLE staff_ward DISABLE CONSTRAINT fk_sw_wardid;

ALTER TABLE hospitalward DISABLE CONSTRAINT fk_hw_staffid;

ALTER TABLE patient_ward DISABLE CONSTRAINT fk_pw_pid;

ALTER TABLE patient_ward DISABLE CONSTRAINT fk_pw_hw;

ALTER TABLE patient_medicine DISABLE CONSTRAINT fk_pm_pid;

ALTER TABLE patient_medicine DISABLE CONSTRAINT fk_pm_mid;

ALTER TABLE patient DISABLE CONSTRAINT fk_p_payid;

ALTER TABLE inventory DISABLE CONSTRAINT fk_inv_deptid;

ALTER TABLE doctor DISABLE CONSTRAINT fk_doc_deptid;

ALTER TABLE staff DISABLE CONSTRAINT fk_staff_did;

ALTER TABLE laboratory DISABLE CONSTRAINT fk_lab_pid;

ALTER TABLE laboratory DISABLE CONSTRAINT fk_lab_staffid;

ALTER TABLE patient_doctor DISABLE CONSTRAINT fk_pd_pid;

ALTER TABLE patient_doctor DISABLE CONSTRAINT fk_pd_did;

--Data Insertion 

--Patient Table

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'RICHARD',
    'GILL',
    '350 RIVERWAY',
    'YES',
    '26-Jan-1998',
    23,
    'NO',
    'B+',
    17001
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'MARY',
    'HALL',
    '150 TREMONT STREET',
    'YES',
    '14-Mar-1999',
    22,
    'NO',
    'AB+',
    17002
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'JACOB',
    'BAKER',
    '11 TETLOW STREET',
    'NO',
    '7-Sep-1988',
    32,
    'NO',
    'O-',
    17003
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'SMITH',
    'RIVERA',
    '34 SOMERVILLE',
    'YES',
    '23-Aug-2002',
    18,
    'YES',
    'A+',
    17004
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'ADAMS',
    'GREENS',
    '50 OAKLAND AVE',
    'YES',
    '10-Feb-2011',
    10,
    'YES',
    'B+',
    17005
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'JOHN',
    'FLORES',
    '42 DOWNTOWN STREET',
    'NO',
    '20-April-1998',
    23,
    'NO',
    'AB+',
    17006
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'CAMPBELL',
    'ROGERS',
    '345 LACANIA STREET',
    'YES',
    '19-July-1987',
    33,
    'NO',
    'B+',
    17007
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'NELSON',
    'CARTER',
    '92 DAKOTA ROAD',
    'NO',
    '1-Jan-2018',
    3,
    'YES',
    'AB+',
    17008
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'HIMANSHU',
    'SINGH',
    '75 ALPES STREET',
    'YES',
    '15-March-1999',
    22,
    'NO',
    'B+',
    17009
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'ROBERT',
    'LIAM',
    '25 MG STREET',
    'YES',
    '24-April-1978',
    43,
    'NO',
    'O+',
    17010
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'AMY',
    'SANTIAGO',
    '144 BAKER STREET',
    'NO',
    '15-Mar-1994',
    26,
    'YES',
    'AB-',
    17011
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'JAKE',
    'PERALTA',
    '54 CAMBRIDGE',
    'YES',
    '15-Apr-1975',
    46,
    'NO',
    'A+',
    17012
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'ROSA',
    'DIAZ',
    '66 ATLANTA ',
    'NO',
    '4-Dec-2019',
    1,
    'NO',
    'B+',
    17013
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'TEDDY',
    'JEFORDS',
    '352 RIVERWAY',
    'YES',
    '27-Nov-2002',
    18,
    'NO',
    'AB-',
    17014
);

INSERT INTO patient (
    first_name,
    last_name,
    address,
    insurance,
    date_of_birth,
    age,
    covid_19,
    blood_group,
    payment_id
) VALUES (
    'CHARLES',
    'BOYLE',
    '92 ORN STREET',
    'NO',
    '16-Jan-1992',
    29,
    'NO',
    'O+',
    17015
);

--PaymentTransactions TABLE

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    1200,
    '2-Jan-2021',
    16001
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    200,
    '2-Jan-2021',
    16002
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    345,
    '3-Jan-2021',
    16003
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    650,
    '5-Jan-2021',
    16004
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    2000,
    '5-Jan-2021',
    16005
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    120,
    '5-Jan-2021',
    16006
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    560,
    '6-Jan-2021',
    16007
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    1400,
    '6-Jan-2021',
    16008
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    1145,
    '7-Jan-2021',
    16009
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    675,
    '7-Jan-2021',
    16010
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    190,
    '8-Jan-2021',
    16011
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    650,
    '8-Jan-2021',
    16012
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    995,
    '8-Jan-2021',
    16013
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    435,
    '9-Jan-2021',
    16014
);

INSERT INTO paymenttransactions (
    payment_amount,
    payment_date,
    patient_id
) VALUES (
    4500,
    '9-Jan-2021',
    16015
);

--Department table

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'Finance',
    'RAMAN GOEL',
    3
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'Management',
    'MAY GREENS',
    5
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'Nurse',
    'BO CHAN',
    24
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'Housekeeping',
    'TOM ROBERTS',
    10
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'AssociateDoctor',
    'RACHAEL ',
    5
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'SeniorDoctor',
    'ELI FISHER',
    3
);

INSERT INTO department (
    department_name,
    hod_name,
    number_of_employees
) VALUES (
    'LabStaff',
    'CHRIS EVANS',
    5
);

--Doctor TABLE

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'EMMA ',
    'WILLIAM',
    '777 BROCKTON AVENEUE',
    'CARDIOLOGIST',
    '19-July-1987',
    33,
    10006
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'JACOB',
    'BROWN',
    '250 HARTFORD AVENUE',
    'DERMATOLOGIST',
    '28-Sep-1993',
    27,
    10005
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'MASON',
    'MILLER',
    '337 RESELL STREET',
    'DENTIST',
    '25-Jan-1990',
    31,
    10005
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'OLIVIA',
    'DAVIS',
    '200 OTIS STREET',
    'GYNACOLOGIST',
    '3-Oct-1991',
    29,
    10006
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'LILY',
    'LOPEZ',
    '115 BOSTON ROAD',
    'GYNACOLOGIST',
    '16-April-1995',
    26,
    10005
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'CHLOE',
    'THOMAS',
    '333 MAIN STREET',
    'ENT',
    '5-Aug-1989',
    31,
    10006
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'DANIEL',
    'MOORE',
    '100 CHARLTON ROAD',
    'GYNACOLOGIST',
    '22-Feb-1981',
    40,
    10005
);

INSERT INTO doctor (
    first_name,
    last_name,
    address,
    specialization,
    date_of_birth,
    age,
    department_id
) VALUES (
    'JAMES',
    'PEREZ',
    '340 PALMER ROAD',
    'CARDIOLOGIST',
    '28-May-1985',
    35,
    10006
);

--HospitalWard Table

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'GENERAL',
    'NEW',
    1,
    13002
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'GENERAL',
    'NEW',
    1,
    13002
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'GENERAL',
    'NEW',
    1,
    13010
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'GENERAL',
    'OLD',
    2,
    13008
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'PRIVATE',
    'NEW',
    3,
    13009
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'PRIVATE',
    'NEW',
    3,
    13009
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'PRIVATE',
    'OLD',
    3,
    13009
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'PRIVATE',
    'OLD',
    2,
    13008
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'EMERGENCY',
    'NEW',
    1,
    13010
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'EMERGENCY',
    'NEW',
    1,
    13010
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'EMERGENCY',
    'OLD',
    1,
    13014
);

INSERT INTO hospitalward (
    ward_type,
    building_name,
    floor,
    staff_id
) VALUES (
    'EMERGENCY',
    'OLD',
    1,
    13014
);



--Laboratory Project

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16003,
    '25-Jan-21',
    '27-Jan-21',
    'Covid RT-PCR',
    'Abnormal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16015,
    '27-Jan-21',
    '27-Jan-21',
    'Hemogram Blood Test',
    'Normal',
    13002
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16007,
    '26-Jan-21',
    '26-Jan-21',
    'Haemoglobin',
    'Normal',
    13003
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16010,
    '18-Jan-21',
    '18-Jan-21',
    'Creatin Test',
    'Normal',
    13002
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16001,
    '26-Jan-21',
    '26-Jan-21',
    'Stool Test',
    'Abnormal',
    13004
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16013,
    '30-Jan-21',
    '30-Jan-21',
    'X-ray',
    'Normal',
    13008
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16005,
    '02-Jan-21',
    '02-Jan-21',
    'Lipid Profile',
    'Abnormal',
    13009
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16006,
    '02-Feb-21',
    '02-Feb-21',
    'Urionogram',
    'Abnormal',
    13006
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16004,
    '05-Feb-21',
    '05-Feb-21',
    'Cardiac Risk Markers',
    'Normal',
    13010
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16011,
    '06-Feb-21',
    '06-Feb-21',
    'Haemoglobin',
    'Abnormal',
    13011
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16007,
    '07-Feb-21',
    '07-Feb-21',
    'Covid RT-PCR',
    'Abnormal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16012,
    '10-Mar-21',
    '10-Mar-21',
    'Lipid Profile',
    'Normal',
    13012
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16008,
    '12-Feb-21',
    '12-Feb-21',
    'Covid RT-PCR',
    'Abnormal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16002,
    '13-Feb-21',
    '13-Feb-21',
    'Covid RT-PCR',
    'Normal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16014,
    '15-Feb-21',
    '15-Feb-21',
    'Cardiac Risk Markers',
    'Normal',
    13010
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16013,
    '16-Feb-21',
    '16-Feb-21',
    'Urionogram',
    'Abnormal',
    13014
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16001,
    '18-Feb-21',
    '18-Feb-21',
    'Haemoglobin',
    'Abnormal',
    13013
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16009,
    '18-Feb-21',
    '18-Feb-21',
    'Covid RT-PCR',
    'Normal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16008,
    '19-Feb-21',
    '19-Feb-21',
    'Cardiac Risk Markers',
    'Normal',
    13008
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16011,
    '20-Feb-21',
    '20-Feb-21',
    'Hemogram Blood Test',
    'Abnormal',
    13012
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16015,
    '22-Feb-21',
    '22-Feb-21',
    'Covid RT-PCR',
    'Normal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16006,
    '24-Feb-21',
    '24-Feb-21',
    'Covid RT-PCR',
    'Normal',
    13001
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16010,
    '27-Feb-21',
    '27-Feb-21',
    'Lipid Profile',
    'Abnormal',
    13004
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16013,
    '28-Feb-21',
    '28-Feb-21',
    'Hemogram Blood Test',
    'Normal',
    13008
);

INSERT INTO laboratory (
    patient_id,
    date_of_test,
    date_of_result,
    type_of_test,
    test_result,
    staff_id
) VALUES (
    16014,
    '01-Mar-21',
    '01-Mar-21',
    'Cardiac Risk Markers',
    'Abnormal',
    13009
);

--Medicine Table

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Crocin',
    10000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Cephalexin',
    50000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Dolo',
    23000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Lisinopril',
    34650
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Amlodipine',
    500
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Valcyte',
    3400
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Acarbose',
    67000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Gabitril',
    12500
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Papain',
    45600
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Matulane',
    2990
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Gantrisin',
    4300
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Rapaflo',
    45000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Mannitol',
    25000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Tabloid',
    10000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Zadaxin',
    35000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Zemplar',
    200
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Pemoline',
    1000
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Valtropin',
    350
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Kantrex',
    12550
);

INSERT INTO medicine (
    medicine_name,
    quantity
) VALUES (
    'Keflex',
    32000
);

--Inventory Table

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Oxygen Cylinder',
    'Abbott',
    25,
    '16-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Pulse Oxymeter',
    'Johnson and Johnson',
    32,
    '16-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Defibrillator',
    'General Electric Company',
    8,
    '16-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Sanitizer',
    'Becton, Dickinson and Company',
    60,
    '16-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Nitrile Gloves',
    'Becton, Dickinson and Company',
    70,
    '24-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Drape',
    'Dr Schumacher India',
    23,
    '31-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Surgeon Blade',
    'Abbott',
    25,
    '31-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Sterile Gloves',
    'Becton, Dickinson and Company',
    40,
    '24-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Disposable Gown',
    'Abbott',
    25,
    '31-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'IV set',
    'Johnson and Johnson',
    15,
    '16-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Thermometer',
    'Abbott',
    20,
    '10-Dec-2020',
    10004
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Vials',
    'Becton, Dickinson and Company',
    50,
    '15-Dec-2020',
    10007
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Test tubes',
    'Dr Schumacher India',
    30,
    '17-Dec-2020',
    10007
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Syringes',
    'Dr Schumacher India',
    46,
    '25-Dec-2020',
    10007
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Spirit Solution',
    'Becton, Dickinson and Company',
    6,
    '25-Dec-2020',
    10007
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Stethoscope',
    'Dr Schumacher India',
    10,
    '20-Dec-2020',
    10006
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Patient Documents Folder',
    'VM Stationary',
    60,
    '7-Dec-2020',
    10002
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Desktop',
    'Microsoft',
    12,
    '3-Nov-2020',
    10001
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Office Stationary',
    'Staples',
    40,
    '11-Nov-2020',
    10002
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'ipad',
    'Apple',
    10,
    '3-Nov-2020',
    10002
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Standard bedpan',
    'Medicare',
    12,
    '7-Aug-2020',
    10003
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Bath basins',
    'Medicare',
    24,
    '27-Aug-2020',
    10003
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Wheelchair',
    'RK Enterprises',
    20,
    '11-Jun-2020',
    10003
);

INSERT INTO inventory (
    item_name,
    item_brand,
    quantity,
    purchase_date,
    department_id
) VALUES (
    'Walker',
    'MSH Surigicals',
    30,
    '3-Jun-2020',
    10003
);

--Staff Table

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Raj',
    'Yadav',
    28,
    '155 MG ROAD',
    10001,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Mitali',
    'Gupta',
    30,
    '32 FC ROAD',
    10002,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Khajan',
    'Joshi',
    28,
    '321 CHARLES DRIVE',
    10003,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Ishita',
    'Gandhi',
    26,
    '32 MULBERRY STREET',
    10004,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Harsh',
    'Oswal',
    27,
    '365 HEMINGWAY DRIVE',
    10005,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Ishana',
    'Rajguru',
    32,
    '25  PRINCEWAY CROSSING',
    10006,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Sumit',
    'Chawla',
    23,
    '1416 ST ALPHONSUS STREET',
    10007,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Parth',
    'Denver',
    45,
    '332 RIVERWAY APARTMENT',
    10003,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Akhil',
    'Srivastav',
    76,
    '35 MASS AVENUE',
    10003,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'John',
    'Snow',
    89,
    '360 TREMONT STREET',
    10003,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Steve',
    'Mathew',
    45,
    '141 WALDHOM',
    10001,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Anish',
    'Bafna',
    23,
    '26 JESSICA DRIVE',
    10002,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Lee',
    'Hang',
    43,
    '14 PARKER HILL',
    10004,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Xinyu',
    'Xang',
    32,
    '55 JAMES WILLIAM PARK',
    10003,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Loo',
    'Xee',
    67,
    '43 BRINGHAMTON CIRCLE',
    10007,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Nancy',
    'Parker',
    81,
    '23 RIVERWAY APRTMENTS',
    10006,
    'DAY'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Bryan',
    'Fullerton',
    45,
    '100 TREMONT STREET',
    10005,
    'NIGHT'
);

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'Adam',
    'Lavigne',
    55,
    '526 HUNTIGTON AVENUE',
    10001,
    'NIGHT'
);

--Patient_Doctor Table

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16001,
    14001,
    '28-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16002,
    14004,
    '20-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16003,
    14003,
    '18-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16004,
    14002,
    '21-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16005,
    14001,
    '22-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16006,
    14008,
    '05-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16007,
    14004,
    '22-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16008,
    14006,
    '28-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16009,
    14003,
    '23-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16010,
    14005,
    '19-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16011,
    14007,
    '16-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16012,
    14002,
    '24-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16013,
    14002,
    '29-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16014,
    14003,
    '22-May-21'
);

INSERT INTO patient_doctor (
    patient_id,
    doctor_id,
    appoin_date
) VALUES (
    16015,
    14001,
    '23-May-21'
);

--PATIENT_MEDICINE Table

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16001,
    20001
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16002,
    20002
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16003,
    20003
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16004,
    20004
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16005,
    20005
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16006,
    20006
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16007,
    20007
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16008,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16009,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16010,
    20010
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16011,
    20011
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16012,
    20012
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16013,
    20013
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16014,
    20014
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16015,
    20015
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16001,
    20016
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16002,
    20017
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16003,
    20018
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16004,
    20019
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16005,
    20020
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16006,
    20005
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16007,
    20006
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16008,
    20007
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16009,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16010,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16011,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16012,
    20006
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16013,
    20007
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16014,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16015,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16001,
    20003
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16002,
    20004
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16003,
    20005
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16004,
    20006
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16005,
    20007
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16006,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16007,
    20011
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16008,
    20012
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16009,
    20013
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16010,
    20001
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16011,
    20002
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16012,
    20003
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16013,
    20004
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16014,
    20005
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16015,
    20006
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16001,
    20007
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16002,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16003,
    20015
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16004,
    20016
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16005,
    20017
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16006,
    20018
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16007,
    20019
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16008,
    20020
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16009,
    20011
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16010,
    20012
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16011,
    20013
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16012,
    20016
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16013,
    20017
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16014,
    20018
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16015,
    20019
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16001,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16002,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16003,
    20010
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16004,
    20019
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16005,
    20020
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16006,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16007,
    20010
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16008,
    20011
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16009,
    20012
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16010,
    20013
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16011,
    20008
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16012,
    20009
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16013,
    20010
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16014,
    20019
);

INSERT INTO patient_medicine (
    patient_id,
    medicine_id
) VALUES (
    16015,
    20020
);

--Staff_Ward Table

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21001,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21002,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21003,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21004,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21005,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21006,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21007,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21008,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21009,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21010,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21011,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21012,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21001,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21002,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21003,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21004,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21005,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21006,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21007,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21008,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21009,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21010,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21011,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21012,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21001,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21002,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21003,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21004,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21005,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21006,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21007,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21008,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21009,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21010,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21011,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21012,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21001,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21002,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21003,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21004,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21005,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21006,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21007,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21008,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21009,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21010,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21011,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21012,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21001,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21002,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21003,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21004,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21005,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21006,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21007,
    13014
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21008,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21009,
    13010
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21010,
    13008
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21011,
    13002
);

INSERT INTO staff_ward (
    ward_id,
    staff_id
) VALUES (
    21012,
    13008
);

--Patient_Ward Table

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16001,
    21001,
    '23-Mar-20',
    '26-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16002,
    21002,
    '24-Mar-20',
    '27-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16003,
    21003,
    '25-Mar-20',
    '27-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16004,
    21004,
    '26-Mar-20',
    '02-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16005,
    21005,
    '27-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16006,
    21006,
    '28-Mar-20',
    '31-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16007,
    21007,
    '29-Mar-20',
    '01-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16008,
    21008,
    '30-Mar-20',
    '31-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16009,
    21009,
    '31-Mar-20',
    '02-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16010,
    21010,
    '01-Apr-20',
    '03-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16011,
    21011,
    '02-Apr-20',
    '05-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16012,
    21012,
    '03-Apr-20',
    '07-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16013,
    21005,
    '04-Apr-20',
    '06-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16014,
    21006,
    '29-Mar-20',
    '31-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16001,
    21005,
    '31-Mar-20',
    '08-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16002,
    21006,
    '01-Apr-20',
    '04-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16003,
    21010,
    '25-Mar-20',
    '26-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16004,
    21011,
    '26-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16005,
    21012,
    '11-Apr-20',
    '14-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16006,
    21005,
    '12-Apr-20',
    '15-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16007,
    21002,
    '13-Apr-20',
    '16-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16008,
    21003,
    '29-Mar-20',
    '31-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16009,
    21005,
    '30-Mar-20',
    '01-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16010,
    21001,
    '25-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16012,
    21003,
    '25-Mar-20',
    '27-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16013,
    21004,
    '26-Mar-20',
    '27-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16014,
    21005,
    '25-Mar-20',
    '31-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16001,
    21007,
    '25-Mar-20',
    '06-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16002,
    21008,
    '26-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16003,
    21009,
    '24-Apr-20',
    '30-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16004,
    21010,
    '29-Mar-20',
    '07-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16005,
    21011,
    '30-Mar-20',
    '02-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16007,
    21005,
    '01-Apr-20',
    '04-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16008,
    21006,
    '02-Apr-20',
    '05-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16009,
    21002,
    '30-Apr-20',
    '01-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16010,
    21003,
    '01-May-20',
    '06-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16012,
    21005,
    '29-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16013,
    21006,
    '30-Mar-20',
    '19-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16014,
    21010,
    '31-Mar-20',
    '03-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16001,
    21012,
    '02-Apr-20',
    '03-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16002,
    21005,
    '25-Mar-20',
    '27-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16003,
    21006,
    '26-Mar-20',
    '30-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16004,
    21002,
    '31-Mar-20',
    '12-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16005,
    21003,
    '01-Apr-20',
    '10-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16008,
    21002,
    '31-Mar-20',
    '05-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16009,
    21006,
    '01-Apr-20',
    '06-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16010,
    21002,
    '02-Apr-20',
    '03-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16012,
    21005,
    '18-May-20',
    '19-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16013,
    21006,
    '19-May-20',
    '20-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16014,
    21002,
    '20-May-20',
    '20-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16015,
    21003,
    '25-Mar-20',
    '28-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16001,
    21010,
    '26-Mar-20',
    '09-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16002,
    21011,
    '25-Mar-20',
    '03-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16003,
    21012,
    '26-Mar-20',
    '29-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16004,
    21010,
    '25-Mar-20',
    '24-Apr-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16005,
    21004,
    '26-Mar-20',
    '28-Mar-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16007,
    21006,
    '28-May-20',
    '31-May-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16010,
    21003,
    '31-May-20',
    '03-Jun-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16012,
    21011,
    '02-Jun-20',
    '04-Jun-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16013,
    21012,
    '03-Jun-20',
    '09-Jun-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16014,
    21006,
    '04-Jun-20',
    '04-Jun-20'
);

INSERT INTO patient_ward (
    patient_id,
    ward_id,
    admit_date,
    dischardge_date
) VALUES (
    16015,
    21010,
    '05-Jun-20',
    '08-Jun-20'
);

--CONSTRAINTS
ALTER TABLE patient MODIFY (
    payment_id NOT NULL
);

ALTER TABLE patient
    ADD CONSTRAINT age_chk_pat CHECK ( age BETWEEN 0 AND 99 );

ALTER TABLE patient MODIFY (
    covid_19 NOT NULL
);

ALTER TABLE patient
    ADD CONSTRAINT ins_chk_pat CHECK ( insurance IN ( 'YES', 'NO' ) );

ALTER TABLE patient
    ADD CONSTRAINT covid_chk_pat CHECK ( covid_19 IN ( 'YES', 'NO' ) );

ALTER TABLE doctor MODIFY (
    specialization NOT NULL
);

ALTER TABLE doctor
    ADD CONSTRAINT age_chk_doc CHECK ( age BETWEEN 0 AND 80 );

ALTER TABLE staff
    ADD CONSTRAINT age_chk_stf CHECK ( age BETWEEN 0 AND 90 );

ALTER TABLE staff
    ADD CONSTRAINT shft_chk_stf CHECK ( shift_type IN ( 'DAY', 'NIGHT' ) );

ALTER TABLE medicine MODIFY (
    medicine_name unique
);

ALTER TABLE hospitalward
    ADD CONSTRAINT wrdtp_chk_hspw CHECK ( ward_type IN ( 'GENERAL', 'PRIVATE', 'EMERGENCY' ) );

ALTER TABLE hospitalward
    ADD CONSTRAINT bldg_chk_hspw CHECK ( building_name IN ( 'OLD', 'NEW' ) );

ALTER TABLE paymenttransactions ADD CONSTRAINT amnt_chk_pymt CHECK ( payment_amount > 50 );

ALTER TABLE laboratory
    ADD CONSTRAINT tstrl_chk_lab CHECK ( test_result IN ( 'Normal', 'Abnormal' ) );

--Enabling Foreign Key Constraints

ALTER TABLE staff_ward ENABLE CONSTRAINT fk_sw_sid;

ALTER TABLE staff_ward ENABLE CONSTRAINT fk_sw_wardid;

ALTER TABLE hospitalward ENABLE CONSTRAINT fk_hw_staffid;

ALTER TABLE patient_ward ENABLE CONSTRAINT fk_pw_pid;

ALTER TABLE patient_ward ENABLE CONSTRAINT fk_pw_hw;

ALTER TABLE patient_medicine ENABLE CONSTRAINT fk_pm_pid;

ALTER TABLE patient_medicine ENABLE CONSTRAINT fk_pm_mid;

ALTER TABLE patient ENABLE CONSTRAINT fk_p_payid;

ALTER TABLE inventory ENABLE CONSTRAINT fk_inv_deptid;

ALTER TABLE doctor ENABLE CONSTRAINT fk_doc_deptid;

ALTER TABLE staff ENABLE CONSTRAINT fk_staff_did;

ALTER TABLE laboratory ENABLE CONSTRAINT fk_lab_pid;

ALTER TABLE laboratory ENABLE CONSTRAINT fk_lab_staffid;

ALTER TABLE patient_doctor ENABLE CONSTRAINT fk_pd_pid;

ALTER TABLE patient_doctor ENABLE CONSTRAINT fk_pd_did;

--RENAME COLUMN NAME
ALTER TABLE patient_ward RENAME COLUMN dischardge_date TO discharge_date;



--Views 

--LAB ADMIN VIEW
CREATE
VIEW view_lab_admin AS
    SELECT
        patient_id,
        first_name,
        last_name,
        address,
        date_of_birth,
        age,
        covid_19,
        blood_group
    FROM
        patient;

CREATE USER lab_admin IDENTIFIED BY labadmin654321;

GRANT connect TO lab_admin;

GRANT SELECT ON view_lab_admin TO lab_admin;

--LAB ADMIN LABORATORY VIEW
CREATE VIEW view_lab_admin_laboratory AS
    SELECT
        test_id,
        patient_id,
        date_of_test,
        date_of_result,
        type_of_test,
        test_result,
        staff_id
    FROM
        laboratory;

GRANT SELECT, INSERT, UPDATE, DELETE ON view_lab_admin_laboratory TO lab_admin;

--LAB ADMIN STAFF VIEW
CREATE VIEW view_lab_admin_staff AS
    SELECT
        staff_id
    FROM
        staff;

GRANT SELECT ON view_lab_admin_staff TO lab_admin;



--reception view
CREATE VIEW view_reception_patient AS
    SELECT
        patient_id,
        first_name,
        last_name,
        address,
        insurance,
        date_of_birth,
        age,
        covid_19,
        blood_group,
        payment_id
    FROM
        patient;

CREATE VIEW view_payment_transaction AS
    SELECT
        payment_id,
        payment_amount,
        payment_date
    FROM
        paymenttransactions;		

--RECEPTION USER
CREATE USER reception IDENTIFIED BY hospital654321;						

--RECEPTION USER PERMISSIONS						
GRANT connect TO reception;

GRANT SELECT, INSERT, UPDATE, DELETE ON view_reception_patient TO reception;

GRANT SELECT, INSERT, UPDATE, DELETE ON view_payment_transaction TO reception;	    

--DOCTOR VIEWS
CREATE VIEW view_doctor_patient AS
    SELECT
        patient_id,
        doctor_id,
        appoin_date
    FROM
        patient_doctor;

CREATE VIEW view_doctor AS
    SELECT
        patient_id,
        first_name,
        last_name,
        address,
        date_of_birth,
        age,
        covid_19,
        blood_group
    FROM
        patient;

--DOCTOR USER
CREATE USER doc123 IDENTIFIED BY doctor654321;

--DOCTOR USER PERMISSIONS
GRANT connect TO doc123;

GRANT SELECT ON view_doctor TO doc123;

GRANT SELECT ON view_doctor_patient TO doc123;

--Analyst Views
CREATE VIEW view_analyst_department AS
    SELECT
        department_name,
        hod_name,
        number_of_employees
    FROM
        department;

CREATE VIEW view_analyst_doctor AS
    SELECT
        doctor_id,
        first_name,
        last_name,
        address,
        specialization,
        date_of_birth,
        age,
        department_id
    FROM
        doctor;

CREATE VIEW view_analyst_hospitalward AS
    SELECT
        ward_id,
        ward_type,
        building_name,
        floor,
        staff_id
    FROM
        hospitalward;

CREATE VIEW view_analyst_laboratory AS
    SELECT
        test_id,
        patient_id,
        date_of_test,
        date_of_result,
        type_of_test,
        test_result,
        staff_id
    FROM
        laboratory;

CREATE VIEW view_analyst_medicine AS
    SELECT
        medicine_id,
        medicine_name,
        quantity
    FROM
        medicine;

CREATE VIEW view_analyst_patient AS
    SELECT
        patient_id,
        first_name,
        last_name,
        address,
        insurance,
        date_of_birth,
        age,
        covid_19,
        blood_group,
        payment_id
    FROM
        patient;

CREATE VIEW view_analyst_patientdoctor AS
    SELECT
        doc_pat_id,
        patient_id,
        doctor_id,
        appoin_date
    FROM
        patient_doctor;

CREATE VIEW view_analyst_paymenttransaction AS
    SELECT
        payment_amount,
        payment_date,
        payment_id
    FROM
        paymenttransactions;

CREATE VIEW view_analyst_staff AS
    SELECT
        staff_id,
        first_name,
        last_name,
        age,
        address,
        department_id,
        shift_type
    FROM
        staff;

CREATE VIEW view_analyst_inventory AS
    SELECT
        item_id,
        item_name,
        item_brand,
        quantity,
        purchase_date,
        department_id
    FROM
        inventory;

CREATE VIEW view_analyst_staffward AS
    SELECT
        staff_ward_id,
        ward_id,
        staff_id
    FROM
        staff_ward;

CREATE VIEW view_analyst_patientward AS
    SELECT
        pat_ward_id,
        ward_id,
        patient_id,
        admit_date,
        discharge_date
    FROM
        patient_ward;

CREATE VIEW view_analyst_patientmedicine AS
    SELECT
        pat_med_id,
        patient_id,
        medicine_id
    FROM
        patient_medicine;

--Analyst User
CREATE USER analyst IDENTIFIED BY aa10987654321;

--Analyst User Permissions
GRANT connect TO analyst;

GRANT SELECT ON view_analyst_department TO analyst;

GRANT SELECT ON view_analyst_doctor TO analyst;

GRANT SELECT ON view_analyst_hospitalward TO analyst;

GRANT SELECT ON view_analyst_inventory TO analyst;

GRANT SELECT ON view_analyst_staffward TO analyst;

GRANT SELECT ON view_analyst_patientward TO analyst;

GRANT SELECT ON view_analyst_patientmedicine TO analyst;

GRANT SELECT ON view_analyst_staff TO analyst;

GRANT SELECT ON view_analyst_paymenttransaction TO analyst;

GRANT SELECT ON view_analyst_patientdoctor TO analyst;

GRANT SELECT ON view_analyst_medicine TO analyst;

GRANT SELECT ON view_analyst_patient TO analyst;

GRANT SELECT ON view_analyst_laboratory TO analyst;

--INDEX
CREATE INDEX find_patient ON
    patient (
        first_name
    );

--DISPALY WARD NUMBER OF COVID PATIENT								
SELECT
    p.first_name    AS "Patient",
    a.ward_id       AS "Room No.",
    a.admit_date    AS "Date and Time of admission"
FROM
         patient p
    JOIN patient_ward a ON p.patient_id = a.patient_id
WHERE
    ( covid_19 = 'Yes' );

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--PROCEDURES

--Procedure to get appointment and doctor details with patient_id as input												
CREATE OR REPLACE PROCEDURE get_appoin_details (
    patid_in        IN   INT,
    appoindate_out  OUT  DATE,
    docid_out       OUT  INT,
    docfname_out    OUT  VARCHAR,
    doclname_out    OUT  VARCHAR,
    docspec_out     OUT  VARCHAR
) IS
BEGIN
    dbms_output.put_line('THANK YOU FOR CHECKING. APPOINTMENT AND DOCTOR DETAILS ARE BELOW:');
    SELECT
        a.appoin_date,
        a.doctor_id,
        b.first_name,
        b.last_name,
        b.specialization
    INTO
        appoindate_out,
        docid_out,
        docfname_out,
        doclname_out,
        docspec_out
    FROM
             patient_doctor a
        JOIN doctor b ON a.doctor_id = b.doctor_id
    WHERE
        a.patient_id = patid_in;

END get_appoin_details;
/												
------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;						
--Anonymous block						
DECLARE
    aptdate_var   DATE;
    docid_var     INT;
    docfname_var  VARCHAR(50);
    doclname_var  VARCHAR(50);
    docspec_var   VARCHAR(50);
BEGIN
    get_appoin_details(&patientid, aptdate_var, docid_var, docfname_var, doclname_var,
                      docspec_var);
    dbms_output.put_line('Appointment date = ' || aptdate_var);
    dbms_output.put_line('doctor id = ' || docid_var);
    dbms_output.put_line('doctor first name = ' || docfname_var);
    dbms_output.put_line('doctor last name = ' || doclname_var);
    dbms_output.put_line('doctor specialization = ' || docspec_var);
END;
/	

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--Procedure to get department details with staff_id as input						

CREATE OR REPLACE PROCEDURE get_staff_details (
    staffid_in           IN   INT,
    department_name_out  OUT  VARCHAR
) IS
BEGIN
    dbms_output.put_line('THANK YOU FOR CHECKING. STAFF DETAILS ARE BELOW:');
    SELECT
        a.department_name
    INTO department_name_out
    FROM
             department a
        JOIN staff b ON a.department_id = b.department_id
    WHERE
        b.staff_id = staffid_in;

END get_staff_details;
/												
------------------------------------------------------------------------------------------						
SET SERVEROUTPUT ON;						
--Anonymous block						
DECLARE
    department_name VARCHAR(50);
BEGIN
    get_staff_details(&staffid, department_name);
    dbms_output.put_line('Department name = ' || department_name);
END;
/					
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Functions
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- FUNCTION TO GET NUMBER OF EMPLOYEES IN DAY/NIGHT SHIFT

CREATE OR REPLACE FUNCTION get_total_emp (
    in_shift VARCHAR
) RETURN NUMBER IS
    l_total_emp NUMBER;
BEGIN
    SELECT
        COUNT(shift_type)
    INTO l_total_emp
    FROM
        staff
    WHERE
        shift_type = in_shift;

    RETURN l_total_emp;
END;
/
------------------------------------------------------------------------------------------
SELECT
    get_total_emp('&DAYorNIGHT')
FROM
    dual;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

-- FUNCTION TO GET NUMBER OF TRANSACTIONS
CREATE OR REPLACE FUNCTION totalnumberoftransactions RETURN NUMBER IS
    total NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO total
    FROM
        paymenttransactions;

    RETURN total;
END;
/
------------------------------------------------------------------------------------------
DECLARE
    c NUMBER(9);
BEGIN
    c := totalrevenue();
    dbms_output.put_line('Total revenue generated: ' || c);
END;
/

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--FUNCTION TO GET THE PATIENT ID WITH FIRST NAME
CREATE OR REPLACE FUNCTION findpatientid (
    name_in IN VARCHAR2
) RETURN NUMBER IS
    cnumber NUMBER;
    CURSOR c1 IS
    SELECT
        patient_id
    FROM
        patient
    WHERE
        first_name = name_in;

BEGIN
    OPEN c1;
    FETCH c1 INTO cnumber;
    IF c1%notfound THEN
        cnumber := 00000;
    END IF;
    CLOSE c1;
    RETURN cnumber;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'An error was encountered - '
                                        || sqlcode
                                        || ' -ERROR- '
                                        || sqlerrm);
END;
------------------------------------------------------------------------------------------
SELECT
    first_name,
    findpatientid(first_name) AS pat_id
FROM
    patient
WHERE
    first_name = 'AMY';

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Staff age shift trigger

DROP TRIGGER staff_age_shift;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER staff_age_shift BEFORE
    INSERT ON staff
    FOR EACH ROW
    WHEN ( new.age > 50
           AND new.shift_type = 'NIGHT' )
BEGIN
    dbms_output.put_line('SENIOR CITIZEN, PLEASE ASSIGN DAY SHIFTS ONLY:');
END;
/

INSERT INTO staff (
    first_name,
    last_name,
    age,
    address,
    department_id,
    shift_type
) VALUES (
    'HARSH',
    'OSWAL',
    65,
    '155 MG ROAD',
    10001,
    'NIGHT'
);

SELECT
    *
FROM
    staff;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Inventory Quantity too low trigger

DROP TRIGGER inventory_quantity_low;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER inventory_quantity_low AFTER
    UPDATE ON inventory
    FOR EACH ROW
    WHEN ( new.quantity BETWEEN 1 AND 5 )
BEGIN
    dbms_output.put_line('Quantity very low:');
END;
/

UPDATE inventory
SET
    quantity = 2
WHERE
    item_id = 15002;

SELECT
    *
FROM
    inventory;





--Medicine Quantity too low trigger

DROP TRIGGER medicine_quantity_low;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER medicine_quantity_low AFTER
    UPDATE ON medicine
    FOR EACH ROW
    WHEN ( new.quantity < 5 )
BEGIN
    dbms_output.put_line('Quantity very low:');
END;
/

UPDATE medicine
SET
    quantity = 2
WHERE
    medicine_id = 20002;

SELECT
    *
FROM
    medicine;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--SELECT STATEMENTS FOR TABLES
SELECT
    *
FROM
    patient_ward;

SELECT
    *
FROM
    hospitalward;

SELECT
    *
FROM
    department;

SELECT
    *
FROM
    patient_doctor;

SELECT
    *
FROM
    patient;

SELECT
    *
FROM
    doctor;

SELECT
    *
FROM
    laboratory;

SELECT
    *
FROM
    staff;

SELECT
    *
FROM
    inventory;

SELECT
    *
FROM
    paymenttransactions;

SELECT
    *
FROM
    patient_medicine;

SELECT
    *
FROM
    medicine;

SELECT
    *
FROM
    patient_ward;

SELECT
    *
FROM
    hospitalward;

SELECT
    *
FROM
    staff_ward;	

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Queries
--To display the names of the inventory items whose qty is less than 5

SELECT
    item_id,
    item_name
FROM
    inventory
WHERE
        department_id = 4
    AND quantity < 5;

--To display the names of the patients who never got tested
SELECT
    patient_id,
    last_name,
    first_name
FROM
    patient p1
WHERE
    NOT EXISTS (
        SELECT
            lab.patient_id
        FROM
            laboratory lab
        WHERE
            lab.patient_id = p1.patient_id
    );

-- To display the total revenue for all the payment transactions 
SELECT
    SUM(payment_amount) AS total_revenue
FROM
    paymenttransactions;

--To display the monthly revenue or between any dates

SELECT
    SUM(payment_amount) AS total_revenue
FROM
    paymenttransactions
WHERE
    payment_date BETWEEN '01-JAN-21' AND '13-jan-21';												
--Queries
--DISPLAY WARD ALLOTMENT OF A PATIENT					
SELECT
    p.first_name    AS "Patient",
    a.ward_id       AS "Room No.",
    a.admit_date    AS "Date and Time of admission"
FROM
         patient p
    JOIN patient_ward a ON p.patient_id = a.patient_id;

--DISPALY WARD NUMBER OF COVID PATIENT				
				
SELECT
    p.first_name    AS "Patient",
    a.ward_id       AS "Room No.",
    a.admit_date    AS "Date and Time of admission"
FROM
         patient p
    JOIN patient_ward a ON p.patient_id = a.patient_id
WHERE
    ( covid_19 = 'Yes' );