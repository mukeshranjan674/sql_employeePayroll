#UC1
#DataBase Created
CREATE DATABASE employee_payroll_service;

#UC2
#Table Created
CREATE TABLE employee_payroll
(
id INT unsigned NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
salary Double NOT NULL,
start DATE NOT NULL,
PRIMARY KEY (id)
);

#UC3
#Ability to insert into the table
INSERT INTO employee_payroll(name, salary, start) VALUES
('Bill', 1000000.00, '2020-02-02'),
('Terisa', 20000000.00, '2018-02-02'),
('Charlie', 30000000.00, '2018-02-02');

#UC4
#Ability to retrieve all data of table
SELECT * FROM employee_payroll_service;
					
#UC5
#Ability to retrieve salary of particular employee
SELECT salary FROM employee_payroll_service WHERE name = 'Bill';
#Ability to retrieve employee data for a particular range of date
SELECT * FROM employee_payroll_service
WHERE start BETWEEN CAST('2018-01-01' AS DATE) and DATE(NOW());	

#UC6
#Ability to alter table data with addition of a new field gender
ALTER table employee_payroll add gender char(1) AFTER name;
#Ability to set gender using 'where' condition with employee name
update employee_payroll set gender = 'F' WHERE name = 'Terisa';
update employee_payroll set gender = 'M' WHERE name = 'Billie' 
OR name = 'Charlie';

#UC7
#Ability to find sum, average, min, max, count by male or female
SELECT sum(salary) FROM employee_payroll WHERE gender = 'F'
GROUP BY gender;
SELECT gender, sum(salary) FROM employee_payroll
WHERE gender = 'M' GROUP BY gender;
SELECT gender, avg(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, min(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, max(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, count(salary) FROM employee_payroll GROUP BY gender;

#UC8
#Ability to extend employee_payroll data to store employee information like 
#employee phone, address and department
ALTER TABLE employee_payroll ADD phone_number VARCHAR(250) AFTER name;
ALTER TABLE employee_payroll ADD address VARCHAR(250) AFTER phone_number;
ALTER TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';