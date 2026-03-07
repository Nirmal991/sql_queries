# SQL Complete Guide

This document contains categorized SQL topics with definitions and examples.  
Topics are divided into **Basic**, **Intermediate**, and **Advanced** levels to help learners progress step by step.

---

# 1. Basic SQL Topics

## 1.1 SQL
**Definition:**  
SQL (Structured Query Language) is used to manage and manipulate data stored in relational databases.

**Example**
```sql
SELECT * FROM employees;
```

---

## 1.2 SELECT Statement
**Definition:**  
The SELECT statement is used to retrieve data from a database table.

**Example**
```sql
SELECT name, salary FROM employees;
```

---

## 1.3 WHERE Clause
**Definition:**  
The WHERE clause filters records based on specific conditions.

**Example**
```sql
SELECT * FROM employees
WHERE salary > 50000;
```

---

## 1.4 ORDER BY
**Definition:**  
ORDER BY sorts the result set in ascending or descending order.

**Example**
```sql
SELECT * FROM employees
ORDER BY salary DESC;
```

---

## 1.5 INSERT
**Definition:**  
INSERT is used to add new records to a table.

**Example**
```sql
INSERT INTO employees (id, name, salary)
VALUES (1, 'Rahul', 50000);
```

---

## 1.6 UPDATE
**Definition:**  
UPDATE modifies existing records in a table.

**Example**
```sql
UPDATE employees
SET salary = 60000
WHERE id = 1;
```

---

## 1.7 DELETE
**Definition:**  
DELETE removes records from a table.

**Example**
```sql
DELETE FROM employees
WHERE id = 1;
```

---

## 1.8 DISTINCT
**Definition:**  
DISTINCT removes duplicate values from query results.

**Example**
```sql
SELECT DISTINCT department FROM employees;
```

---

## 1.9 LIMIT
**Definition:**  
LIMIT restricts the number of records returned by a query.

**Example**
```sql
SELECT * FROM employees
LIMIT 5;
```

---

# 2. Intermediate SQL Topics

## 2.1 GROUP BY
**Definition:**  
GROUP BY groups rows that have the same values into summary rows.

**Example**
```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department;
```

---

## 2.2 HAVING
**Definition:**  
HAVING filters grouped records after GROUP BY.

**Example**
```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

---

## 2.3 JOIN
**Definition:**  
JOIN combines rows from two or more tables based on a related column.

**Example**
```sql
SELECT employees.name, departments.department_name
FROM employees
JOIN departments
ON employees.department_id = departments.id;
```

---

## 2.4 INNER JOIN
**Definition:**  
Returns records that have matching values in both tables.

**Example**
```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id;
```

---

## 2.5 LEFT JOIN
**Definition:**  
Returns all records from the left table and matching records from the right table.

**Example**
```sql
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;
```

---

## 2.6 RIGHT JOIN
**Definition:**  
Returns all records from the right table and matched records from the left table.

**Example**
```sql
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.id;
```

---

## 2.7 Aggregate Functions
**Definition:**  
Functions that perform calculations on a set of values.

Common functions:
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

**Example**
```sql
SELECT AVG(salary)
FROM employees;
```

---

## 2.8 Subquery
**Definition:**  
A query nested inside another SQL query.

**Example**
```sql
SELECT name
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

---

# 3. Advanced SQL Topics

## 3.1 Index
**Definition:**  
An index improves the speed of data retrieval operations.

**Example**
```sql
CREATE INDEX idx_employee_name
ON employees(name);
```

---

## 3.2 Views
**Definition:**  
A view is a virtual table based on the result of a SQL query.

**Example**
```sql
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 70000;
```

---

## 3.3 Stored Procedures
**Definition:**  
A stored procedure is a saved SQL program that can be executed repeatedly.

**Example**
```sql
CREATE PROCEDURE GetEmployees()
BEGIN
SELECT * FROM employees;
END;
```

---

## 3.4 Triggers
**Definition:**  
A trigger automatically executes when certain database events occur.

**Example**
```sql
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.created_at = NOW();
```

---

## 3.5 Transactions
**Definition:**  
A transaction is a sequence of SQL operations executed as a single unit.

**Example**
```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;
```

---

## 3.6 Window Functions
**Definition:**  
Window functions perform calculations across a set of table rows related to the current row.

**Example**
```sql
SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```

---

# Conclusion

This README provides a structured roadmap to learn SQL:

- **Basic** → Fundamental queries and operations  
- **Intermediate** → Data grouping and table relationships  
- **Advanced** → Performance optimization and database programming

Learning these topics will help you build strong SQL skills for **data analysis, backend development, and database management**.
