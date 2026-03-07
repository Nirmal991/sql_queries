use test;

select * from employees;

create database company;
use company;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
drop table employees;

INSERT INTO employees (first_name, last_name, department, salary, hire_date)
VALUES
('Amit', 'Sharma', 'IT', 55000.00, '2020-03-15'),
('Priya', 'Mehta', 'HR', 48000.00, '2019-07-10'),
('Ravi', 'Patel', 'Finance', 60000.00, '2021-01-20'),
('Sneha', 'Kapoor', 'Marketing', 45000.00, '2018-11-05'),
('Arjun', 'Verma', 'Operations', 52000.00, '2022-06-25');

select * from employees;

select first_name as 'FIRST NAME', last_name, department from employees;

select * from employees where department = 'IT';  -- where is use to filter
select * from employees where department = 'IT' order by salary desc;  -- order by is use to sort the stuff
select * from employees limit 2;
select distinct department from employees; -- distinct is used form unique
select first_name, last_name, salary*1.1 as 'salary after raise' from employees;
select concat(first_name,' ',last_name) as 'full name', year(hire_date) as 'year', round(salary) as 'final' from employees where salary > 45000;

select avg(salary) from employees;

select * from employees where salary > (select avg(salary) from employees);  -- subqueries

select first_name, last_name from employees where department = 'IT' UNION
select first_name, last_name from employees where department = 'Finance';

select count(*), department from employees group by department;





