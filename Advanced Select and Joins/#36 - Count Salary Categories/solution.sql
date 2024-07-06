/*
Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.
The result format is in the following example.
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
*/

/*

THIS SOLUTION, ALTHOUGH CORRECT, HAVEN'T BEEN PROCESSED BY LEET CODE:


CREATE TEMP TABLE IF NOT EXISTS categories ( category VARCHAR(30) );
TRUNCATE TABLE categories;
INSERT INTO categories VALUES
    ('Low Salary'),
    ('Average Salary'),
    ('High Salary');

WITH categorized_incomes AS(
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
)
SELECT
    c.category,
    COUNT(i.category) accounts_count
FROM categories c
LEFT JOIN categorized_incomes i ON c.category = i.category
GROUP BY 1;
*/

SELECT
    'Low Salary' category,
    COUNT(account_id) FILTER (WHERE income < 20000) accounts_count
FROM Accounts
UNION
SELECT
    'Average Salary' category,
    COUNT(account_id) FILTER (WHERE income BETWEEN 20000 AND 50000) accounts_count
FROM Accounts
UNION
SELECT
    'High Salary' category,
    COUNT(account_id) FILTER (WHERE income > 50000) accounts_count
FROM Accounts