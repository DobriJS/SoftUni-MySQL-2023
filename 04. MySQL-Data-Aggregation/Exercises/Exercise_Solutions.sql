-- 1. Records' Count
SELECT COUNT(*) AS 'count'
from wizzard_deposits;
-- 2. Longest Magic Wand
SELECT MAX(magic_wand_size) AS 'longest_magic_wand'
from wizzard_deposits;
-- 3. Longest Magic Wand per Deposit Groups
SELECT deposit_group,
    MAX(magic_wand_size) AS `longest_magic_wand`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand`,
    deposit_group;
-- 4. Smallest Deposit Group Per Magic Wand Size
SELECT deposit_group
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size)
LIMIT 1;