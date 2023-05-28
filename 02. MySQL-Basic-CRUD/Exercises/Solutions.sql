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