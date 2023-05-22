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
-- 10. Countries Holding 'A' 3 or More Times
SELECT country_name,
    iso_code
FROM countries
WHERE (
        CHAR_LENGTH(country_name) - CHAR_LENGTH(REPLACE(LOWER(country_name), 'a', ''))
    ) >= 3
ORDER BY iso_code;
-- 11. Mix of Peak and River Names
SELECT p.peak_name,
    r.river_name,
    LOWER(
        CONCAT(
            LEFT(p.peak_name, LENGTH(p.peak_name) - 1),
            r.river_name
        )
    ) AS mix
FROM rivers AS r,
    peaks AS p
WHERE UPPER(RIGHT(p.peak_name, 1)) = UPPER(LEFT(r.river_name, 1))
ORDER BY mix;
-- 12. Games From 2011 and 2012 Year
SELECT `name`,
    DATE_FORMAT(`start`, '%Y-%m-%d') AS `start`
FROM `games`
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start`
LIMIT 50;
-- 13. User Email Providers
SELECT user_name,
    SUBSTRING_INDEX(email, '@', -1) AS `email_provider`
FROM users
ORDER BY `email_provider`,
    user_name;