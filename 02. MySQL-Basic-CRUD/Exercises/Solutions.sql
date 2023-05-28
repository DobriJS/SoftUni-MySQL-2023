-- 1. Find All Information About Departments
SELECT *
FROM departments
ORDER BY department_id;
-- 2. Find all Department Names
SELECT name
FROM departments
ORDER BY department_id;
-- 3. Find Salary of Each Employee
SELECT first_name,
    last_name,
    salary
FROM employees
ORDER BY employee_id;
-- 4. Find Full Name of Each Employee
SELECT first_name,
    middle_name,
    last_name
FROM employees
ORDER BY employee_id;
-- 5. Find Email Address of Each
SELECT CONCAT(
        first_name,
        '.',
        last_name,
        '@softuni.bg'
    ) AS full_email_address
FROM employees;
-- 6. Find All Different Employee’s Salaries
SELECT DISTINCT salary
FROM employees;
-- 7. Find all Information About Employees
SELECT *
FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;
-- 8. Find Names of All Employees by Salary in Range
SELECT first_name,
    last_name,
    job_title
FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;
-- 9. Find Names of All Employees
SELECT CONCAT_WS(' ', first_name, middle_name, last_name) AS 'Full Name'
FROM employees
WHERE salary = 25000
    OR salary = 14000
    OR salary = 12500
    OR salary = 23600;