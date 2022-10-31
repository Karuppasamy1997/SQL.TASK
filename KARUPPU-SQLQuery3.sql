CREATE TABLE KARUPPASAMY_EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(40),
LAST_NAME VARCHAR(40),
SALARY DECIMAL(10,2),
DEPARTMENT_ID INT,
YEAR_OF_JOINING DATETIME,
YEAR_OF_RELIEVING DATETIME,
);
--SELECT * FROM KARUPPASAMY_EMPLOYEE;
INSERT INTO KARUPPASAMY_EMPLOYEE (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,YEAR_OF_JOINING,YEAR_OF_RELIEVING)VALUES
(01,'VADIVEL' ,'SAKTHIVEL',20000.50,102,10-20-2021,10-11-2022),
(02,'HARI','HARAN',40000.49,103,11-31-2019,11-31-2023),
(03,'VEL','MURGAN',334555.43,104,05-23-2014,12-24-2015),
(04,'SMITH','RYAN',25000.60,90,09-15-2022,12-20-2023),
(05,'ANISH','KUMAR',25000.60,90,09-15-2022,12-20-2023);

/*CREATE TABLE KARUPPASAMY_DEMO(NUMBER INT);
INSERT INTO KARUPPASAMY_DEMO(NUMBER)VALUES
(25)
SELECT * FROM KARUPPASAMY_DEMO;
DROP TABLE KARUPPASAMY_DEMO;
*/
--DELETE FROM KARUPPASAMY_EMPLOYEE;

SELECT * FROM KARUPPASAMY_EMPLOYEE;

CREATE TABLE KARUPPASAMY_DEPARTMENT(
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(40),
MANAGER_ID INT,
)
INSERT INTO KARUPPASAMY_DEPARTMENT(DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID)
VALUES (1001,'HR',90),
(10,'DEVELOPER',45),
(20,'TESTING',67),
(22,'SALES',NULL),
(50,'SUPPORT',NULL),
(42,'TELECOM',89),
(01,'TEAM LEADER',NULL);
--DELETE FROM KARUPPASAMY_DEPARTMENT;
SELECT * FROM KARUPPASAMY_EMPLOYEE;
SELECT * FROM KARUPPASAMY_DEPARTMENT;

--1.Write a query to display all the name which starts with S 
SELECT * FROM KARUPPASAMY_EMPLOYEE WHERE FIRST_NAME LIKE '%V%';

--2.Write a query to display all the name starts with S and ends with character n. 
SELECT * FROM KARUPPASAMY_EMPLOYEE WHERE FIRST_NAME LIKE '%V%' AND LAST_NAME LIKE '%N%';

--3.Write a query to display all the employees who are all working for department 90 and their name must starts with ‘S’. 
SELECT * FROM KARUPPASAMY_EMPLOYEE WHERE DEPARTMENT_ID=90 AND FIRST_NAME LIKE '%S%';

SELECT * FROM KARUPPASAMY_DEPARTMENT;

--4.Display all the department id which contain 2 as 2nd character
SELECT * FROM KARUPPASAMY_DEPARTMENT WHERE DEPARTMENT_ID LIKE '%_1%'

--5.Write a query to display all the employees who are all working in department 10,20,50 and 90. 
SELECT * FROM KARUPPASAMY_DEPARTMENT WHERE DEPARTMENT_ID=90 OR DEPARTMENT_ID=10 OR DEPARTMENT_ID=20 OR DEPARTMENT_ID=50;


--6.Write a query to display who are all getting salary between 5000 and 7000.
SELECT * FROM KARUPPASAMY_EMPLOYEE WHERE SALARY BETWEEN 40000 AND 70000;



 --8.Display all the records in employees table and sort the first name in ascending order.
SELECT * FROM KARUPPASAMY_EMPLOYEE ORDER BY FIRST_NAME ASC;

/*7.Display First_name, salary, department_id and manager_id of the employee who don't have manager 
SELECT KARUPPASAMY_EMPLOYEE.FIRST_NAME,KARUPPASAMY_EMPLOYEE.SALARY,KARUPPASAMY_EMPLOYEE.DEPARTMENT_ID,KARUPPASAMY_DEPARTMENT.MANAGER_ID FROM
KARUPPASAMY_EMPLOYEE JOIN KARUPPASAMY_DEPARTMENT ON KARUPPASAMY_EMPLOYEE.DEPARTMENT_ID=KARUPPASAMY_DEPARTMENT.DEPARTMENT_ID WHERE 
KARUPPASAMY_DEPARTMENT.MANAGER_ID IS NULL;*/

--9.Display first name, department id and salary from employees table and sort the records ( sort department id in ascending order and salary in descending order)  
SELECT FIRST_NAME,DEPARTMENT_ID,SALARY FROM KARUPPASAMY_EMPLOYEE ORDER BY DEPARTMENT_ID ASC,SALARY DESC ;

--10.Display first three characters from first name. 
SELECT SUBSTRING(FIRST_NAME,1,3) AS 'FIRST_NAME' FROM KARUPPASAMY_EMPLOYEE ;

--11.Display last two character from last name. 
SELECT RIGHT(LAST_NAME,2) AS FIRSR_NAME FROM KARUPPASAMY_EMPLOYEE;


--12.Display all the first name and position of a in that name (first occurrence of a).  
SELECT FIRST_NAME,CHARINDEX('A',FIRST_NAME) AS POSTION FROM KARUPPASAMY_EMPLOYEE;

--13. Write a query to select maximum salary from employees table. 
SELECT MAX(SALARY ) AS MAXIMUMSALARY FROM  KARUPPASAMY_EMPLOYEE;


--14.Write a query to select second maximum salary from employees table. 
SELECT MAX(SALARY) FROM KARUPPASAMY_EMPLOYEE WHERE SALARY <(SELECT MAX(SALARY) FROM KARUPPASAMY_EMPLOYEE);

--15.Display average salary in the department 90 
SELECT AVG(SALARY) AS AVERAGESALART FROM KARUPPASAMY_EMPLOYEE WHERE DEPARTMENT_ID=90;


--16.Display number of employees joined in each year into department 30.
SELECT FIRST_NAME,YEAR_OF_JOINING, DEPARTMENT_ID , COUNT(*) FROM KARUPPASAMY_EMPLOYEE WHERE 
DEPARTMENT_ID=90 GROUP BY FIRST_NAME,YEAR_OF_JOINING,DEPARTMENT_ID;
SELECT AVG( SALARY)  FROM KARUPPASAMY_EMPLOYEE WHERE DEPARTMENT_ID=102; 


 

 --17.Display average salary for employees who did a job in the past. 
SELECT AVG(SALARY) AS PAST FROM KARUPPASAMY_EMPLOYEE WHERE YEAR_OF_RELIEVING<=GETDATE();

--18)Display the month in which more than 5 employees joined in any department 
SELECT MONTH(YEAR_OF_JOINING) AS MONTH_IN FROM KARUPPASAMY_EMPLOYEE GROUP BY
MONTH(YEAR_OF_JOINING) HAVING COUNT(YEAR_OF_JOINING)>5;



--19)Display employee last name, starting date for all jobs from 2000 to 2005
SELECT LAST_NAME ,DAY(YEAR_OF_JOINING) FROM KARUPPASAMY_EMPLOYEE WHERE YEAR (YEAR_OF_JOINING) BETWEEN 2000 AND 2005;

--20)Display years in which more than 10 employees joined. 
INSERT INTO KARUPPASAMY_EMPLOYEE(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,YEAR_OF_JOINING,YEAR_OF_RELIEVING) VALUES
(10,'KALEES','WARAN',244543.34,56,1993-12-31,1998-12-31),
(20, 'VIJAY','KUMAR',244543.34,56,1996-12-01,2000-12-01),

(30, 'MOGAN','VASU',244543.34,56,1993-12-31,1998-12-31),
(40,'VIYAY','SETHUPATHI',244543.34,56,1956-12-01,1958-12-01),
ALTER TABLE  KARUPPASAMY_EMPLOYEE ADD YEAR_OF_JOINING
(50, 'SANTHOSH','SHREE',244543.34,56,1993-02-301,1995-2-31),
(70, 'PRIYA', 'MANI',244543.34,56,1953-12-31,1956-12-31),
(80, 'GOGUAL','RAM',244543.34,56,1999-01-31,2000-01-31),
(90, 'JEGAN','NATHAN',244543.34,56,2000-12-31,2001-12-31),
(100,'SUBERAMANI','VINOTH',244543.34,56,2020-12-31,2021-12-31);

 SELECT YEAR(YEAR_OF_JOINING),COUNT(YEAR_OF_JOINING) FROM KARUPPASAMY_EMPLOYEE
 GROUP BY YEAR(YEAR_OF_JOINING) HAVING COUNT(MONTH(YEAR_OF_JOINING)) > 2;


--Display employee ID for jobs with average salary more than 10000.  
--Display the number of days between working for all employees. 
--.Display employees who joined in the current year.  
--Display first name in upper case and last name in lower case. 
.--Display the length of first name for employees where last name contain character ‘b’ after 3rd position.  
---Display first name and experience of the employees. 
.--Display employees who joined in the month of May.  
.--write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name. 
--.Difference between primary key and Foreign key with exmple. 
--Repalce ‘null’ value to ‘AAA’  
.--Create View table for ID,FIRST_NAME,LAST_NAME, DEPARTMENT_ID,DEPARTMENT_NAME. 
.--Create SYNONYMS for EMPLOYEE table. 
.--Create a procedure for who are joined between 2 dates. 
--Create a procedure for insert a rows in Department table. 
--.write a query for convert ‘2006-12-30 00:38:54.840’ to 20061230003854

