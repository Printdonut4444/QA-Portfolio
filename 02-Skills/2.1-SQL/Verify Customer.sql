-- 01-Basic-Queries.sql

-- Show all Customers
SELECT *
FROM Customers;

-- Show only active users
SELECT *
FROM users
WHERE status='ACTIVE';

-- Show first 10 users
SELECT *
FROM users
LIMIT 10;