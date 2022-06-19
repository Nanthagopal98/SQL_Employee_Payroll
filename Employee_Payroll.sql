--UC-1
CREATE DATABASE Payroll_Service
SELECT * FROM SYS.DATABASES
USE Payroll_Service

--UC-2
CREATE TABLE Employee_Payroll(
ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NAME VARCHAR(20) NOT NULL,
SALARY FLOAT NOT NUll,
START_DATE DATE NOT NULL
)

--UC-3
INSERT INTO Employee_Payroll VALUES('NANTHAGOPAL',15000,'2022-06-19')
INSERT INTO Employee_Payroll VALUES('ELA',25000,'2022-06-01')
INSERT INTO Employee_Payroll VALUES('THAMARAI',20000,'2018-02-25')
INSERT INTO Employee_Payroll VALUES('SENTHIL',25000,'2021-01-01')
INSERT INTO Employee_Payroll VALUES('PRIYA',10000,'2018-01-01','F')
INSERT INTO Employee_Payroll VALUES('RAMYA',40000,'2019-01-01','F')
INSERT INTO Employee_Payroll VALUES('LALITHA',30000,'2020-01-01','F')

--UC-4
SELECT * FROM Employee_Payroll

--UC-5
SELECT NAME,SALARY FROM Employee_Payroll WHERE NAME='NANTHAGOPAL'
SELECT NAME FROM Employee_Payroll WHERE START_DATE BETWEEN '2021-06-01' AND CURRENT_TIMESTAMP

--UC-6
ALTER TABLE Employee_Payroll ADD GENDER VARCHAR(2) NOT NULL DEFAULT('')
UPDATE Employee_Payroll SET GENDER = 'M' WHERE NAME = 'ELA' 
UPDATE Employee_Payroll SET GENDER = 'M' WHERE NAME = 'NANTHAGOPAL'
UPDATE Employee_Payroll SET GENDER = 'M' WHERE NAME = 'THAMARAI'
UPDATE Employee_Payroll SET GENDER = 'M' WHERE NAME = 'SENTHIL'

--UC-7
SELECT GENDER, SUM(SALARY) AS TOTAL_SALARY FROM Employee_Payroll GROUP BY GENDER
SELECT GENDER, MIN(SALARY) AS TOTAL_SALARY FROM Employee_Payroll GROUP BY GENDER
SELECT GENDER, MAX(SALARY) AS TOTAL_SALARY FROM Employee_Payroll GROUP BY GENDER
SELECT GENDER, AVG(SALARY) AS TOTAL_SALARY FROM Employee_Payroll GROUP BY GENDER
SELECT GENDER, COUNT(GENDER) AS NO_OF_EMPLOYEES FROM Employee_Payroll GROUP BY GENDER

--UC-8
ALTER TABLE Employee_Payroll ADD PHONE INT NOT NULL DEFAULT(0), ADDRESS VARCHAR(50) NOT NULL DEFAULT(''), DEPARTMENT VARCHAR(20) NOT NULL DEFAULT('') 
UPDATE Employee_Payroll SET PHONE = 987456123, ADDRESS = 'NANTHA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE ID = 1
UPDATE Employee_Payroll SET PHONE = 879456522, ADDRESS = 'ELA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE NAME = 'ELA'
UPDATE Employee_Payroll SET PHONE = 547992536, ADDRESS = 'THAMARAI ADDRESS', DEPARTMENT = 'MAINTENANCE' WHERE NAME = 'THAMARAI'
UPDATE Employee_Payroll SET PHONE = 879465625, ADDRESS = 'SENTHIL ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE NAME = 'SENTHIL'
UPDATE Employee_Payroll SET PHONE = 987456123, ADDRESS = 'NANTHA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE ID = 5
UPDATE Employee_Payroll SET PHONE = 987456123, ADDRESS = 'PRIYA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE NAME = 'PRIYA'
UPDATE Employee_Payroll SET PHONE = 987456123, ADDRESS = 'RAMYA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE NAME = 'RAMYA'
UPDATE Employee_Payroll SET PHONE = 987456123, ADDRESS = 'LALITHA ADDRESS', DEPARTMENT = 'DEVELOPER' WHERE NAME = 'LALITHA'
