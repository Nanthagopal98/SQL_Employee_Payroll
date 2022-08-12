CREATE DATABASE PRACTICE_EMPLOYEE_PAYROLL
USE PRACTICE_EMPLOYEE_PAYROLL


CREATE TABLE COMPANIES(
COMPANY_NAME VARCHAR(30) PRIMARY KEY NOT NULL,
COMPANY_ID INT )

INSERT INTO COMPANIES VALUES ('ABC Company', 101)
INSERT INTO COMPANIES VALUES ('XYZ Company', 102)


CREATE TABLE PAYROLL_DETAILS(
EMPLOYEE_ID INT PRIMARY KEY NOT NULL,
BASIC_PAY FLOAT,
DEDUCTIONS AS ([BASIC_PAY]*.05),
TAXABLE_PAY AS (CASE WHEN ([BASIC_PAY] >= 25000) THEN ([BASIC_PAY]*.03) ELSE (0) END),
INCOMETAX AS (CASE WHEN ([BASIC_PAY] >= 25000) THEN ([BASIC_PAY]*.10) ELSE (0) END),
NET_PAY AS ([BASIC_PAY]-([BASIC_PAY]*0.05)-(CASE WHEN ([BASIC_PAY] > 25000) THEN ([BASIC_PAY]*.03) ELSE (0) END)-(CASE WHEN ([BASIC_PAY] >= 25000) THEN ([BASIC_PAY]*.10) ELSE (0) END))
) 
CREATE UNIQUE INDEX UNIQUE_ID ON PAYROLL_DETAILS (EMPLOYEE_ID)

DROP TABLE PAYROLL_DETAILS

INSERT INTO PAYROLL_DETAILS VALUES (1,20000)
INSERT INTO PAYROLL_DETAILS VALUES (2,25000)
INSERT INTO PAYROLL_DETAILS VALUES (3,18000)
INSERT INTO PAYROLL_DETAILS VALUES (4,45000)
INSERT INTO PAYROLL_DETAILS VALUES (5,35000)

CREATE TABLE EMPLOYEE_DETAIL(
EMPLOYEE_ID INT PRIMARY KEY NOT NULL, 
EMPLOYEE_NAME VARCHAR(25),
GENDER VARCHAR(2),
PHONE_NUMBER FLOAT,
EMAIL VARCHAR(30)
)
CREATE UNIQUE INDEX UNIQUE_ID ON EMPLOYEE_DETAIL (EMPLOYEE_ID) 
ALTER TABLE EMPLOYEE_DETAIL ADD COMPANY_NAME VARCHAR(30) NOT NULL DEFAULT 'A'

UPDATE EMPLOYEE_DETAIL SET COMPANY_NAME = 'ABC Company' WHERE EMPLOYEE_ID = 1 
UPDATE EMPLOYEE_DETAIL SET COMPANY_NAME = 'XYZ Company' WHERE EMPLOYEE_ID = 2
UPDATE EMPLOYEE_DETAIL SET COMPANY_NAME = 'ABC Company' WHERE EMPLOYEE_ID = 3 
UPDATE EMPLOYEE_DETAIL SET COMPANY_NAME = 'ABC Company' WHERE EMPLOYEE_ID = 4 
UPDATE EMPLOYEE_DETAIL SET COMPANY_NAME = 'XYZ Company' WHERE EMPLOYEE_ID = 5 


INSERT INTO EMPLOYEE_DETAIL VALUES (1,'NANTHA','M',9874563210,'nantha@gmail.com') 
INSERT INTO EMPLOYEE_DETAIL VALUES (2,'ELA','M',9874563210,'el@gmail.com') 
INSERT INTO EMPLOYEE_DETAIL VALUES (3,'RAVI','M',9874563210,'ravi@gmail.com') 
INSERT INTO EMPLOYEE_DETAIL VALUES (4,'SUBASH','M',9874563210,'subash@gmail.com') 
INSERT INTO EMPLOYEE_DETAIL VALUES (5,'RAMYA','F',9874563210,'ramya@gmail.com') 

CREATE TABLE EMPLOYEE_DEPARTMENT(
EMPLOYEE_ID INT  NOT NULL, 
EMPLOYEE_NAME VARCHAR(25),
DEPARTMENT_ID VARCHAR(10) NOT NULL,
DEPARTMENT_NAME VARCHAR(25)
)
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (1,'NANTHA','01D','DEVELOPER')
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (2,'ELA','01D','DEVELOPER')
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (3,'RAVI','01S','SALES')
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (4,'SUBASH','01M','MARKETING')
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (5,'RAMYA','01M','MARKETING')
INSERT INTO EMPLOYEE_DEPARTMENT VALUES (5,'RAMYA','01M','SALES')

CREATE TABLE DEPARTMENT_DETAILS(
DEPARTMENT_ID VARCHAR(10) PRIMARY KEY NOT NULL,
DEPARTMENT_NAME VARCHAR(25)
)
INSERT INTO DEPARTMENT_DETAILS VALUES ('01D','DEVELOPER')
INSERT INTO DEPARTMENT_DETAILS VALUES ('01S','SALES')
INSERT INTO DEPARTMENT_DETAILS VALUES ('01M','MARKETING')

CREATE TABLE ADDRESS (
STREET VARCHAR(20),
CITY VARCHAR(15),
STATE VARCHAR (15),
PIN INT
)
ALTER TABLE ADDRESS ADD EMPLOYEE_ID INT  NOT NULL DEFAULT (0)
UPDATE ADDRESS SET EMPLOYEE_ID = 1 WHERE CITY = 'COIMBATORE'
UPDATE ADDRESS SET EMPLOYEE_ID = 2 WHERE CITY = 'SALEM'
UPDATE ADDRESS SET EMPLOYEE_ID = 3 WHERE CITY = 'PALAKKAD'
UPDATE ADDRESS SET EMPLOYEE_ID = 4 WHERE CITY = 'BANGALORE'
UPDATE ADDRESS SET EMPLOYEE_ID = 5 WHERE CITY = 'MUMBAL'

INSERT INTO ADDRESS VALUES ('11A, A STREET','COIMBATORE','TAMILNADU',665588)
INSERT INTO ADDRESS VALUES ('12B, B STREET','SALEM','TAMILNADU',625348)
INSERT INTO ADDRESS VALUES ('13C, C STREET','PALAKKAD','KERALA',554466)
INSERT INTO ADDRESS VALUES ('14D, D STREET','BANGALORE','KARNATAKA',456677)
INSERT INTO ADDRESS VALUES ('15E, E STREET','MUMBAL','MAHARASTRA',334488)

ALTER TABLE EMPLOYEE_DETAIL ADD CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_NAME) REFERENCES COMPANIES(COMPANY_NAME) 
ALTER TABLE ADDRESS ADD CONSTRAINT FK_ID FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE_DETAIL(EMPLOYEE_ID)
ALTER TABLE PAYROLL_DETAILS ADD CONSTRAINT FK_PAYROLL FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE_DETAIL(EMPLOYEE_ID)
ALTER TABLE EMPLOYEE_DEPARTMENT ADD CONSTRAINT FK_DEPT FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE_DETAIL(EMPLOYEE_ID) 
ALTER TABLE EMPLOYEE_DEPARTMENT ADD CONSTRAINT FK_DEPT_TO_EMP FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT_DETAILS

TRUNCATE TABLE COMPANIES
SELECT * FROM COMPANIES
SELECT * FROM EMPLOYEE_DETAIL
SELECT * FROM PAYROLL_DETAILS
SELECT * FROM EMPLOYEE_DEPARTMENT
SELECT * FROM DEPARTMENT_DETAILS
SELECT * FROM ADDRESS

SELECT 