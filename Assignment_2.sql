/*
				Assignment 2 
                  Worth 3%
                Total Assignment is out of 75 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/


/*  NOTE   Please read all the questions before creating your table in question 1 as your table and data need to be good enough quality to satisfy the conditions for Question 3 - 6 */

 CREATE DATABASE ASSIGNMENT2;
 USE ASSIGNMENT2;
 
 /*
 Question 1
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row and are related by one of their columns ( make sure you have a least 1 date column )   ( 15 marks )
 
  
 */
 CREATE TABLE Student_General_Info(id INT NOT NULL PRIMARY KEY, name varchar(45) NOT NULL, gender enum('male', 'female', 'other') DEFAULT 'other', birthday DATE NOT NULL, height FLOAT NOT NULL);
 
 CREATE TABLE Student_Grade (id INT NOT NULL PRIMARY KEY, FOREIGN KEY(id) REFERENCES Student_General_Info(id), math FLOAT NOT NULL, literature FLOAT NOT NULL, science FLOAT NOT NULL, sports FLOAT NOT NULL);
 

 /*
 Question 2
/////// NOTE remember the order of which table you insert into first is important
 
 Write 10 statements to add to the source table you created in question 1   ( 10 marks )
 
 Write 10 statements to add to the dependant table you created in question 1  ( 10 marks )
  
 */
 INSERT INTO Student_General_Info(id, name, gender, birthday, height) VALUES ('1001','Kazuto Kirigaya','male','2008-10-07','165'),('1002','Asuna Yuuki','female','2007-09-30','160'), ('1003','Shino Asada','female','2009-08-21','150'), ('1004','Kirigaya Suguha','female','2009-04-19','157'), ('1005','Keiko Ayano','female','2010-10-04','140'),('1006','Tsuboi Ryoutarou','male','1999-11-28','182'),('1007','Rika Shinozaki','female','2007-05-18','157'),('1008','Egiru','male','1995-03-09','195'),('1009','Yui-MHCP001',DEFAULT,'2022-08-01','20'),('1010','Kayaba Akihiko','male','1995-01-01','180');

INSERT INTO Student_Grade (id, math, literature, science, sports) VALUES('1001', '67', '66', '77', '99'),('1002', '94', '95', '98', '90'),('1003', '77', '76', '85', '70'),('1004', '94', '60', '78', '95'),('1005', '78', '88', '67', '60'),('1006', '66', '56', '67', '95'),('1007', '87', '66', '77', '60'),('1008', '47', '56', '77', '99'),('1009', '100', '100', '100', '100'),('1010', '95', '99', '94', '80');
 
 /*
 Question 3
 
 Write a SELECT statement that uses the LIKE statement and a character to find some of the records in one of your tables you created in Question 1 ( Use either the % or the _ for the rest of your wildcard)   ( 10 marks )
 
  
 */
SELECT*FROM Student_General_Info WHERE birthday LIKE '19________%' ;
 
  /*
 Question 4
 
 Write a SELECT statement that uses the BETWEEN statement to find some of the records in one of your tables using the date column you created in Question 1  ( 10 marks )
 
  
 */
 SELECT*FROM Student_General_Info WHERE birthday BETWEEN '2007-01-01' and '2010-01-01'; 
 
 /*
 Question 5
 
 Write a SELECT statement that uses another BETWEEN statement and sorts the data by 2 of the columns one in Ascending and one in Descending order on the tables you created in Question 1  ( 10 marks )
 
  
 */

SELECT*FROM Student_Grade WHERE math BETWEEN '60' AND '100' ORDER BY math ASC, literature DESC; 
 
  /*
 Question 6
 
 Write a SELECT statement that selects a list of values (using the IN operator) from one of your tables, then use that same query and use the NOT operator to get the opposite data on the tables you created in Question 1   ( 10 marks )
 
  
 */
  SELECT*FROM Student_General_Info WHERE gender IN ('male','other');
  SELECT*FROM Student_General_Info WHERE gender NOT IN ('male','other');
  
  
  
  
  
  
  