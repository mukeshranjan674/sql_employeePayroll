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