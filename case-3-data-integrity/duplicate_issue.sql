duplicate_issue.sql
-- Create table without constraint
CREATE TABLE users ( id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(100), name VARCHAR(100));
-- Insert duplicate data
INSERT INTO users (email, name) VALUES('test@gmail.com', 'User A'),('test@gmail.com', 'User B'),('abc@gmail.com', 'User C'),('abc@gmail.com', 'User D');
-- Check duplicates
SELECT email, COUNT(*) as count FROM users GROUP BY email HAVING count > 1;