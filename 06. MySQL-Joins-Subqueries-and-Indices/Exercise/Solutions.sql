-- 1. Employee Address
SELECT e.employee_id,
    e.job_title,
    a.address_id,
    a.address_text
FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
ORDER BY a.address_id
LIMIT 5;
-- 2. Addresses with Towns
SELECT e.first_name,
    e.last_name,
    t.name AS name,
    a.address_text
FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns AS t ON a.town_id = t.town_id
ORDER BY e.first_name,
    e.last_name
LIMIT 5;
-- 3. Sales Employee
SELECT employee_id,
    first_name,
    last_name,
    d.name AS `department_name`
FROM employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY employee_id DESC;
-- 4. Employee Departments
SELECT e.employee_id,
    e.first_name,
    e.salary,
    d.name AS department_name
FROM employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;