create database test;
use test;

create table employees1 (
employee_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
hire_date DATE DEFAULT '2026-02-26',
email varchar(100) unique,
phone_num varchar(100) unique,
salary decimal(10,2) check (salary > 0.0),
employment_status enum('active', 'on leave', 'terminated') default 'active',
updated_at timestamp default CURRENT_TIMESTAMP on update current_timestamp,
created_at timestamp default CURRENT_TIMESTAMP,
foreign key (department_id) references department(department_id)  -- can put constraint heer 
);

INSERT INTO employees1 
(first_name, last_name, hire_date, email, phone_num, salary, employment_status)
VALUES
('John', 'Doe', '2026-02-26', 'john.doe@example.com', '1234567890', 50000.00, 'active'),
('Jane', 'Smith', '2026-02-26', 'jane.smith@example.com', '9876543210', 60000.00, 'on leave'),
('Michael', 'Brown', '2026-02-26', 'michael.brown@example.com', '5551234567', 45000.00, 'active'),
('Emily', 'Johnson', '2026-02-26', 'emily.johnson@example.com', '4449876543', 70000.00, 'terminated'),
('David', 'Williams', '2026-02-26', 'david.williams@example.com', '3332221111', 55000.00, 'active');

select * from employees1;

create table department(
department_id int primary key auto_increment,
department_name varchar(100) not null,
location varchar(100),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

insert into department(department_name, location)
values
('IT', 'BLOCK A'),
('HR', 'BLOCK B'),
('SALES', 'BLOCK C');
select * from department;

drop table	employees1, department;
drop table if exists ok; 


alter table employees1
modify column department_id int not null;

alter table employees1 add foreign key (department_id) references department(department_id);

alter table employees1
drop column department_id;

-- ALTER table action 
-- action

ALTER TABLE employees1
add column emergency_contact varchar(100) not null check (emergency_contact regexp '^\d{10}$ ');

ALTER TABLE employees1
drop column emergency_contact;

alter table employees1
add check (emergency_contact regexp '^\d{10}$ ');

alter table employees1
modify column emergency_contact varchar(100) not null;

