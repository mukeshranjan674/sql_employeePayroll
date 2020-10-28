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
INSERT INTO employee_payroll_service(name, salary, start) VALUES
('Billie', 1000000.00, '2020-02-02'),
('Terisa', 20000000.00, '2018-02-02'),
('Charlie', 30000000.00, '2018-02-02');

#UC4
#Ability to retrieve all data of table
select * from employee_payroll_service;
					
#UC5
#Ability to retrieve salary of particular employee
select salary from employee_payroll_service where name = 'Bill';
#Ability to retrieve employee data for a particular range of date
select * from employee_payroll_service
where start between cast('2018-01-01' as date) and date(now());	

#UC6
#Ability to alter table data with addition of a new field gender
alter table employee_payroll_service add gender char(1) after name;
#Ability to set gender using 'where' condition with employee name
update employee_payroll_service set gender = 'F' where name = 'Terisa';
update employee_payroll_service set gender = 'M' where name = 'Billie' 
or name = 'Charlie';

#UC7
#Ability to find sum, average, min, max, count by male or female
select sum(salary) from employee_payroll_service where gender = 'F'
group by gender;
select gender, sum(salary) from employee_payroll_service
where gender = 'M' group by gender;
select gender, avg(salary) from employee_payroll_service group by gender;
select gender, min(salary) from employee_payroll_service group by gender;
select gender, max(salary) from employee_payroll_service group by gender;
select gender, count(salary) from employee_payroll_service group by gender;
