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
#ABILITY TO INSERT DATA IN TABLE
INSERT INTO employee_payroll_service(name, salary, start) VALUES
('Billie', 1000000.00, '2020-02-02'),
('Terisa', 20000000.00, '2018-02-02'),
('Charlie', 30000000.00, '2018-02-02');
										
