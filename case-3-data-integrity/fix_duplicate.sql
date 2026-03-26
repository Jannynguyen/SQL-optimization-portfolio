-- Step 1: Identify duplicates
SELECT email, COUNT(*)FROM users GROUP BY email HAVING COUNT(*) > 1;
-- Step 2: Keep 1 record, remove others
DELETE FROM users WHERE id NOT IN ( SELECT MIN(id) FROM users GROUP BY email);
-- Step 3: Add unique constraint
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);