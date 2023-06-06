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
-- 4. Employees from Town
DELIMITER $$ CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50)) BEGIN
SELECT first_name,
    last_name
FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns AS t ON t.town_id = a.town_id
WHERE t.name = town_name
ORDER BY e.first_name,
    e.last_name,
    e.employee_id;
END $$ DELIMITER;
-- 5. Salary Level Function
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19.4)) RETURNS VARCHAR(7) RETURN (
    CASE
        WHEN salary < 30000 THEN 'Low'
        WHEN salary <= 50000 THEN 'Average'
        ELSE 'High'
    END
);
-- 6. Employees by Salary Level
DELIMITER $$ CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(7)) BEGIN
SELECT first_name,
    last_name
FROM employees
WHERE (
        salary < 30000
        AND salary_level = 'Low'
    )
    OR (
        salary >= 30000
        AND salary <= 50000
        AND salary_level = 'Avarage'
    )
    OR (
        salary > 50000
        AND salary_level = 'High'
    )
ORDER BY first_name DESC,
    last_name DESC;
END $$ DELIMITER;
-- 7. Define Function
CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50)) RETURNS INT RETURN word REGEXP (concat('^[', set_of_letters, ']+$'));
-- 8. Find Full Name
DELIMITER $$ CREATE PROCEDURE usp_get_holders_full_name() BEGIN
SELECT CONCAT_WS(' ', h.first_name, h.last_name) AS 'full_name'
FROM `account_holders` AS h
    JOIN (
        SELECT DISTINCT a.account_holder_id
        FROM `accounts` AS a
    ) as a ON h.id = a.account_holder_id
ORDER BY `full_name`;
END $$ DELIMITER;
-- 10. Future Value Function
CREATE FUNCTION ufn_calculate_future_value(
    initial_sum DECIMAL(19, 4),
    interest_rate_per_year DECIMAL(19, 4),
    number_of_years INT
) RETURNS DECIMAL(19, 4) RETURN initial_sum * POW((1 + interest_rate_per_year), number_of_years);
-- 12. Deposit Money
DELIMITER $$ CREATE PROCEDURE usp_deposit_money(
    account_id INT,
    money_amount DECIMAL(19, 4)
) BEGIN IF money_amount > 0 THEN START TRANSACTION;
UPDATE `accounts` AS a
SET a.balance = a.balance + money_amount
WHERE a.id = account_id;
IF (
    SELECT a.balance
    FROM `accounts` AS a
    WHERE a.id = account_id
) < 0 THEN ROLLBACK;
ELSE COMMIT;
END IF;
END IF;
END $$ DELIMITER;
-- 13. Withdraw Money
DELIMITER $$ CREATE PROCEDURE usp_withdraw_money(
    account_id INT,
    money_amount DECIMAL(19, 4)
) BEGIN IF money_amount > 0 THEN START TRANSACTION;
UPDATE `accounts` AS a
SET a.balance = a.balance - money_amount
WHERE a.id = account_id;
IF (
    SELECT a.balance
    FROM `accounts` AS a
    WHERE a.id = account_id
) < 0 THEN ROLLBACK;
ELSE COMMIT;
END IF;
END IF;
END $$ DELIMITER;