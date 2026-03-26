-- Session 1
START TRANSACTION;
UPDATE workers SET salary = salary + 10 WHERE id = 1;

-- (pause here)

UPDATE departments SET name = 'Updated' WHERE id = 1;
COMMIT;

-- Session 2
START TRANSACTION;
UPDATE departments SET name = 'New' WHERE id = 1;

-- (pause here)

UPDATE workers SET salary = salary + 5 WHERE id = 1;
COMMIT;