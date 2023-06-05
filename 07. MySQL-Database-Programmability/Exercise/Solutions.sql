-- 1. Employees with Salary Above 35000
DELIMITER $$ CREATE PROCEDURE usp_get_employees_salary_above_35000() BEGIN
SELECT first_name,
    last_name
FROM employees
WHERE salary > 35000
ORDER BY first_name,
    last_name,
    employee_id;
END $$ DELIMITER;
-- 2. Employees with Salary Above Number
CREATE PROCEDURE usp_get_employees_salary_above(salary_limit DOUBLE(19, 4)) BEGIN
SELECT first_name,
    last_name
FROM employees
WHERE salary >= salary_limit
ORDER BY first_name,
    last_name,
    employee_id;
END $$ DELIMITER;
-- 3. Town Names Starting With
DELIMITER $$ CREATE PROCEDURE usp_get_towns_starting_with(name_starts_with VARCHAR(50)) BEGIN
SELECT name
FROM towns
WHERE name LIKE CONCAT(name_starts_with, '%')
ORDER BY name;
END $$ DELIMITER;