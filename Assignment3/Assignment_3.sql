/*
				Assignment 3
                  
                Total Assignment is out of 50 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements
                
                Make sure you run the CreateDB Script to create the sample database 
				
                You will need it to create the queries based on these tables
                
                There is a .jpg file which shows the tables in the database

*/

create schema if not exists Assignment3;
use Assignment3;

create table if not exists DEPARTMENT
(DEPTNO int unsigned not null unique, DEPTNAME varchar(45) not null, MGRNO int unsigned not null unique, 
ADMRDEPT enum('tech','no-tech') default 'no-tech', LOCATION varchar(45) not null, primary key(MGRNO,DEPTNO));

create table if not exists EMPLOYEE
(EMPNO int unsigned not null unique, FIRSTNAME varchar(45) not null, MIDINIT varchar(45) default'_',
LASTNAME varchar(45) not null, WORKDEPT int unsigned not null PRIMARY KEY, PHONENO int not null, HIREDATE date not null, 
JOB varchar(25), EDLEVEL enum('college','university','other')  default 'other', SEX enum('male','female','other') default 'other', 
BIRTHDATE date not null, SALARY decimal(10,2) not null, BONUS decimal(10,2) default 0, COMM varchar(45), key f_k(EMPNO,WORKDEPT),
constraint f_k foreign key(EMPNO,WORKDEPT) references DEPARTMENT(MGRNO,DEPTNO) on delete cascade on update cascade);

create table if not exists PROJECT
(PROJNO int unsigned not null PRIMARY KEY, PROJNAME varchar(45) not null, DEPTNO int unsigned not null unique,
RESPEMP int unsigned not null, PRSTAFF int unsigned not null, PRSTDATE date not null, PRENDATE date not null,
MAJPROJ varchar(45) not null, foreign key(DEPTNO) references DEPARTMENT(DEPTNO), 
foreign key(DEPTNO) references EMPLOYEE(WORKDEPT));

create table if not exists PROJACT
(PROJNO int unsigned not null PRIMARY KEY, ACTNO int unsigned not null unique, ACSTAFF  int unsigned not null,
ACSTDATE date not null, ACENDATE date not null, foreign key (PROJNO) references PROJECT(PROJNO));

create table if not exists ACT
(ACTNO int unsigned not null PRIMARY KEY, ACTKWD varchar(10) not null, ACTDESC varchar(45) not null );

create table if not exists EMP_ACT
(EMPNO int unsigned not null unique, PROJNO int unsigned not null unique, ACTNO int unsigned not null unique,
EMPTIME time not null, EMPSTDATE date not null, EMPENDATE date not null, foreign key(PROJNO) references PROJACT(PROJNO),
foreign key(ACTNO) references ACT(ACTNO));

create table if not exists EMPACT
(EMPNO int unsigned not null unique, PROJNO int unsigned not null unique, ACTNO int unsigned not null unique,
EMPTIME time not null, EMPSTDATE date not null, EMPENDATE date not null, foreign key(ACTNO) references PROJACT(ACTNO));

create table if not exists EMPPROJACT
(EMPNO int unsigned not null unique, PROJNO int unsigned not null unique, ACTNO int unsigned not null unique,
EMPTIME time not null, EMPSTDATE date not null, EMPENDATE date not null, foreign key(PROJNO) references PROJACT(PROJNO));
/*
 Question 1
 
 Write a statement to SELECT all of the columns in the DEPARTMENT table  ( 5 marks )
 
*/

# Put your answer here
select*from assignment3.DEPARTMENT;

/*
 Question 2
 
  Write a statement to SELECT all of the columns in the EMPLOYEE table but only return 5 rows   ( 5 marks )
 
*/
insert into assignment3.DEPARTMENT values (1001,'IT',901,'tech','Canada'),(1002,'IT',902,'tech','Canada'),
(1003,'IT',903,'tech','Canada'),(1004,'IT',904,'tech','Canada'),(1005,'IT',905,'tech','Canada'),(1006,'IT',906,'tech','Canada'),
(1007,'QA',907,'no-tech','Canada'),(1008,'QA',908,'no-tech','Canada'),(1009,'QA',909,'no-tech','Canada'),(1010,'IT',910,'tech','Canada');
SET FOREIGN_KEY_CHECKS=0;
insert into assignment3.EMPLOYEE(EMPNO,FIRSTNAME,MIDINIT,LASTNAME,WORKDEPT,PHONENO,HIREDATE,JOB,EDLEVEL,SEX,BIRTHDATE,SALARY,BONUS,COMM)
values(1001,'John',default,'Bob',901,123456789,'1999-01-01','IT object',default,'male','1980-03-01',5600.12,300,'TOP2 QA'),
(1002,'Apple',default,'Class',902,123456789,'1999-05-01','IT class',default,'male','1960-05-01',5600.12,300,'TOP3 QA'),
(1003,'Banana',default,'School',903,564789123,'1998-04-11','IT QA',default,'male','1960-07-01',6000.12,300,'TOP1 QA'),
(1004,'Kivi',default,'Book',904,258741963,'2001-06-23','IT ABC',default,'female','1985-09-01',5600.12,300,'Worker'),
(1005,'Peach',default,'Assignment',905,951748632,'1996-09-14','ITOUT',default,'male','1970-01-01',5600.12,300,'Worker'),
(1006,'Grape',default,'Marks',906,265398741,'2003-11-05','IT C',default,'female','1978-12-01',4000.12,300,'Worker'),
(1007,'Bear',default,'Room',907,486257193,'1988-02-09','IT T T C',default,'male','1966-10-01',9000.12,300,'TOP1 sales'),
(1008,'Can',default,'Meat',908,985632147,'1990-12-23','IT.OS',default,'female','1965-02-01',7000.12,300,'TOP3 sales'),
(1009,'Bread',default,'Color',909,897654123,'1995-07-30','IT',default,'male','1955-01-01',8400.12,300,'TOP2 sales'),
(1010,'Face',default,'Choose',910,658932174,'1970-09-05','IT',default,'male','1956-01-01',9999.12,300,'BOSS');
SET FOREIGN_KEY_CHECKS=1;
select*from assignment3.EMPLOYEE limit 0,5;

/*
 Question 3
 
  Write a statement to SELECT all of the columns from the PROJECT table where there is more than 3 PRSTAFF  ( 5 marks )
 
*/
SET FOREIGN_KEY_CHECKS=0;
insert into PROJECT values(202301,'project 1',1001,23001,1,'2023-01-01','2023-12-01','NMADBC23'),
(202302,"project 3 PROGRAMMING",1002,23009,1,'2023-02-01','2023-12-01','AD00269'),
(202303,"project 1",1003,23012,9,'2023-03-01','2023-12-01','ADCB@@'),
(202304,"project 1",1004,23013,8,'2023-07-01','2023-12-01','AD00<>'),
(202305,"project 4 PROGRAMMING LANGUAGE",1005,23002,7,'2023-08-01','2023-12-01','AD 1NM'),
(202306,"project 1",1006,23004,6,'2001-09-01','2002-12-01','AD 569'),
(202307,"project 1",1007,23005,5,'2000-12-01','2003-12-01','569 AD'),
(202308,"project 5 COMPUTER PROGRAMMING",1008,23006,4,'2023-06-01','2023-12-01','adnmlo'),
(202309,"project 1",1009,23007,3,'2023-05-01','2023-12-01','aDGOkl'),
(202310,"project 1",1010,23008,2,'2023-04-01','2023-12-01',23);
SET FOREIGN_KEY_CHECKS=1;
select*from PROJECT where PRSTAFF>3;

/*
 Question 4
 
 Write a statement to SELECT PROJNO and RESPEMP AND the date fields from the PROJECT table where the project was still running on July 1 2002 (5 marks) 
 
*/
select PROJNO, RESPEMP,PRSTDATE, PRENDATE from PROJECT where PRSTDATE <='2002-07-01' and PRENDATE >='2002-07-01';

/*
 Question 5
 
  Write a statement to SELECT PROJNO, PROJNAME AND DEPTNO from the PROJECT table where PROJNAME has the word PROGRAMMING in it   ( 5 marks )
 
   
 */
 
 select PROJNO, PROJNAME, DEPTNO from PROJECT where PROJNAME like '%PROGRAMMING%';

/*
 Question 6
 
  Write a statement to SELECT from the PROJECT table where MAJPROJ starts with AD and has 4 wildcard place holders   ( 5 marks )
 
  
 */
select*from PROJECT where MAJPROJ like 'AD____';

/*
 Question 7
 
 Write a statement to SELECT from the EMPLOYEE table where that returns all the records where the JOB name is 5 characters long (make sure to remove any spaces) ( 5 marks )
  
 */
 select*from EMPLOYEE where replace(JOB,' ','') like '_____';
 
 /*
 Question 8
 
 Write a statement to SELECT the EMPNO and put the  FIRSTNME AND the LASTNAME column  together with a space in between and call it FULLNAME from the EMPLOYEE table as columns  ( 5 marks ) (HINT substring functions)
 
  
 */
 select EMPNO, concat(FIRSTNAME,  " ", LASTNAME) as FULLNAME from EMPLOYEE; 
 /*
 Question 9
 
 Write a statement to SELECT the EMPNO and the first 4 characters of the FIRSTNME AND the starting at the 2nd character to the end of the LASTNAME column from  the EMPLOYEE table as columns  ( 5 marks ) (HINT substring functions)
 
  
 */
 select EMPNO, substring(FIRSTNAME,1,4) as column1, substring(LASTNAME,2) as column2 from EMPLOYEE;
 
  /*
 Question 10

 Write a statement to SELECT the EMPNO and the YEAR out of the HIRE DATE and the MONTH of out of the birthdate from the EMPLOYEE table as columns  ( 5 marks ) (HINT date functions)
  
 */
 select EMPNO, substring(HIREDATE,1,4) as 'YEAR', substring(BIRTHDATE,6,2) as 'MONTH' from EMPLOYEE;
 
 