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

#UC9
#Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;

#UC10
#Ability to make Terissa as part of Sales and Marketing Department
UPDATE employee_payroll SET department = 'Sales' WHERE name = 'Terisa';
INSERT INTO employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
('Terisa', 'Marketing', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2018-01-03');

#UC11
#Ability to implement a Entity - Relationship Model into the database
drop table employee_payroll;
create table Company
(
comp_id int unsigned not null,
comp_name varchar(20) not null,
primary key(comp_id)
);
select * from Company;

create table Employee
(
comp_id int unsigned not null,
emp_id int unsigned not null,
name varchar(250) not null,
gender char(1) not null,
phone_number VARCHAR(250) not null,
address VARCHAR(250) not null,
primary key(emp_id),
foreign key(comp_id) references Company(comp_id)
);
select * from Employee;

create table Payroll
(
emp_id int unsigned not null,
basic_pay double not null,
deductions double not null,
taxable_pay double not null,
tax double not null,
net_pay double not null,
foreign key(emp_id) references Employee(emp_id)
);
select * from Payroll;

create table Department
(
dept_id int unsigned not null,
dept_name varchar(20) not null,
primary key(dept_id)
);
select * from Department;

create table Employee_Department
(
emp_id int unsigned not null,
dept_id int unsigned not null,
primary key(emp_id, dept_id),
foreign key(emp_id) references Employee(emp_id),
foreign key(dept_id) references Department(dept_id)
);
select * from Employee_Department;

insert into Company values
(1, 'Capgemini'),
(2, 'Reliance'),
(3, 'IRCTC');

insert into Employee values
(1, 1001, 'Ram', 'M', 8956855565, 'Main street, andheri, Mumbai 465002'),
(1, 1002, 'Shyam', 'M', 8956875565, 'Second street, andheri, Mumbai 465002'),
(3, 1003, 'Sita', 'F', 8956875565, 'third street, andheri, Mumbai 465002');

insert into Payroll values
(1001, 60000.0, 5000.0, 55000.0, 5000.0, 50000.0),
(1002, 70000.0, 5000.0, 65000.0, 5000.0, 60000.0),
(1003, 80000.0, 5000.0, 75000.0, 5000.0, 70000.0);

insert into Department values
(101, 'Marketing'),
(102, 'Sales'),
(103, 'Accounts');

insert into Employee_Department values 
(1001, 101),
(1001, 102),
(1002, 103);