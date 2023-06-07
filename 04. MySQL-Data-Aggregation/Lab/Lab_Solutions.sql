-- 1. Departments Info
SELECT department_id,
    COUNT(id) AS 'Number of employees'
FROM employees
GROUP BY department_id
ORDER BY department_id,
    'Number of employees';
-- 2. Average Salary
SELECT department_id,
    ROUND(AVG(salary), 2) AS 'Average Salary'
FROM employees
GROUP BY department_id
ORDER BY department_id;
-- 4. Appetizers Count
SELECT COUNT(category_id)
FROM products
WHERE price > 8
    AND category_id = 2;