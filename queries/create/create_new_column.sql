SELECT last_name, first_name, points, points + 10 as added
FROM customers
WHERE added > 10;

-- this will not run because the column 'added' has not been created so the
-- where statement doesn't understand what we are refering to.

-- We need to create a new table for this, and then select certain values from there.