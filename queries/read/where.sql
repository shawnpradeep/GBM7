USE sql_store;

SELECT *
FROM products
WHERE quantity_in_stock > 30;
-- ORDER BY name;

/*
The WHERE keyword allows us to utilize conditional statements.

>   greater than
>=  greater than or equal to
<   less than
<=  less than or equal to
<>  not equal
!=  not equal
=   equals

AND
OR
NOT
*/

USE sql_store;

SELECT *
FROM customers
WHERE NOT(customer_id > 2 AND customer_id < 9)
ORDER BY customer_id DESC
LIMIT 2;


SELECT *
FROM customers
WHERE last_name like "b%";

-- like allows us to provide a pattern, the above pattern is all last names that start with 'b'

