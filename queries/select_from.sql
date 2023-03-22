-- @block
	-- USE sql_store
	USE sql_store;
	-- SELECT _____ <---- specify columns we want to receive
	-- FROM _____ <---- table we want to query
	-- select == SELECT (not case sensitive)

	SELECT *
	FROM customers;
    
-- @block
	SELECT customer_id, first_name, last_name
    FROM customers;
	