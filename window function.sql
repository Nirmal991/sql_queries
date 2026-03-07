-- Window Function

-- A window function performs a calculation across a set of rows (called a window)
-- but does NOT group the rows into a single result like GROUP BY.
--  It keeps individual rows visible while also giving calculated values.

-- function_name() OVER (
--     PARTITION BY column_name
--     ORDER BY column_name
-- )

create database window_demo;
use window_demo;

-- Create the employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert 8 dummy records
INSERT INTO employee (id, name, department, salary) VALUES
(1, 'Alice Johnson', 'HR', 45000.00),
(2, 'Bob Smith', 'IT', 60000.00),
(3, 'Charlie Brown', 'Finance', 55000.00),
(4, 'Diana Prince', 'Marketing', 48000.00),
(5, 'Ethan Hunt', 'Operations', 52000.00),
(6, 'Fiona Davis', 'Sales', 47000.00),
(7, 'George Miller', 'IT', 62000.00),
(8, 'Hannah Lee', 'Finance', 53000.00);

select * from employee;

SELECT name, salary
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);


select department, max(salary) as max
from employee
group by department;

select e.*,
max(salary) over(partition by department) as max_salary
from employee e;

-- row_num, , dense_rank, lead and lag

select e.*,
row_number() over(partition by department) as rn
from employee e; 

select e.*,
row_number() over() as rn
from employee e; 

select * from (
select e.*,
row_number() over(partition by department order by id) as rn
from employee e) x
where x.rn < 3;

-- rank

select e.*,
rank() over(partition by department order by salary desc) as rnk
from employee e;

