-- 1. Find Names of All Employees by First Name
SELECT first_name,
    last_name
FROM employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;
-- 2. Find Names of All Employees by Last Name
SELECT first_name,
    last_name
FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;
-- 3. Find First Names of All Employess
SELECT first_name
FROM employees
WHERE department_id IN (3, 10)
    AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;
-- 4. Find All Employees Except Engineers
SELECT first_name,
    last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;
-- 5. Find Towns with Name Length
SELECT `name`
FROM towns
WHERE LENGTH(`name`) = 5
    OR LENGTH(`name`) = 6
ORDER BY `name` ASC;
-- 6. Find Towns Starting With
SELECT *
FROM towns
WHERE LOWER(LEFT(name, 1)) IN ('m', 'k', 'b', 'e')
ORDER BY name ASC;
-- 7. Find Towns Not Starting With
SELECT *
FROM towns
WHERE name REGEXP '^[^RrBbDd]'
ORDER BY name ASC;
-- 8. Create View Employees Hired After
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name,
    last_name
FROM employees
WHERE YEAR(hire_date) > 2000;
-- 9. Length of Last Name
SELECT first_name,
    last_name
FROM employees
WHERE CHAR_LENGTH(last_name) = 5;