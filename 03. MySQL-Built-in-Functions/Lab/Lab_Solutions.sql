-- 1. Find Book Titles
SELECT title
FROM books
WHERE SUBSTRING(title, 1, 3) = "The"
ORDER BY id;
-- 2. Replace Titles
SELECT REPLACE(title, 'The', '***') AS Title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;
-- 3. Sum Cost of All Books
SELECT ROUND(SUM(cost), 2) as total_cost
FROM books
ORDER BY id;