/*
 First go into the GBM7 repo on github.com/shawnpradeep/GBM7.
 
 Download the create-databases.sql, open up MySQL Workbench.
 Go to File > Open SQL Script (CTRL + SHIFT + O) > Find create-databases.sql
 
 Run the script with CTRL + SHIFT + ENTER or the yellow lightning bolt under the Query tab
 If you look to the right, the panel labled SCHEMAS has a refresh icon, hit it and we should see our data appear.
*/


-- READING DATA:

/*
We use the USE keyword to specify which schema we are focusing on. We can have multiple tables with similar names, but they can be placed in different schemas.
To let the SQL engine know the path we are choosing to pull from, we use the USE keyword to specify the Schema we are looking to go into.
*/

-- ex.)
USE sql_inventory;

-- NOT CASE SENSITIVE
use sql_store;

-- We use ; to represent the end of a SQL statement.


/*
Every SQL statement (action we perform) will be displayed in the panel below. It will let us know whether we successfully performed the action and what cells of the data tables it affected.
If it fails, it will terminate, and let us know what statement failed and mark it with a red x mark.
*/


/*
The SELECT keyword will specify the columns we wish to access in a data table. So in the example below, we are accessing all (*) the columns in the customers table.

We do not need to specify the SCHEMA we are pulling from because we already did with the USE keyword. The SQL engine will go into the 'sql_store' schema and pull the 
'customers' table.
*/
-- SELECT Keyword
SELECT *
FROM customers;


/*
We can pull specific columns as well. It is good practice to use underscores where there are spaces, however if you wish to name a column with an actual space you have to use
quotation marks around the entire String. More on that later.
*/
SELECT customer_id, first_name, last_name
FROM customers;


/*
The WHERE keyword adds boolean logic and conditional statements into SQL. Suppose we only want to display customers whose birthday is greater than 1980-01-01.
We can use the WHERE keyword to let the SQL engine know to only display the rows that satisfy that condition.
*/
SELECT *
FROM customers
WHERE birth_date > '1980-01-01';


-- Sorting ASC and DESC
SELECT *
FROM customers
WHERE birth_date > '1980-01-01'
ORDER BY birth_date DESC;


-- LIMIT
SELECT *
FROM customers
WHERE birth_date > '1980-01-01'
ORDER BY birth_date DESC
LIMIT 3;

-- CREATING
-- Creating new columns with operations:
/*
Suppose at the end of the year, for being such good customers, we decided to give all our customers a bonus of 1000 pts to their accounts. 
We can use SELECT to perform such an operation.
*/
SELECT *, points + 1000 as incremented
FROM customers;


/*
If we want to create a new table with the data we've calculated,
We want to use the CREATE keyword: (refresh after creating)
*/
CREATE TABLE new_table AS (SELECT *, points + 1000 as incremented FROM customers);


/* 
Suppose we wanted to replace our old table with the data from our new table.
There are multiple ways to do this, each with their own benefits, in this case, the TRUNCATE keyword will work well.
*/
TRUNCATE new_table;
INSERT INTO new_table SELECT *, points+1000 FROM customers;


-- LETS CREATE A TABLE FOR NBA PLAYERS
CREATE SCHEMA `nba` ;

USE nba;

CREATE TABLE player(
	id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    tead_id INT
);

-- UPDATING COLUMN NAME (FIX TYPO)
ALTER TABLE player
RENAME COLUMN tead_id TO team_id;

-- UPDATING TABLE VALUES
USE nba;

INSERT INTO player (id, first_name, last_name, team_id)
VALUES (
	'1',
    'Steph',
    'Curry',
    '2'
);

/* Cannot have Duplicate Primary Key 'id'
INSERT INTO player (id, first_name, last_name, team_id)
VALUES (
	'1',
    'Draymond',
    'Green',
    '3'
);
*/

-- Insert multiple elements:
INSERT INTO player (id, first_name, last_name, team_id)
VALUES 
	('2', 'Draymond', 'Green', '4'),
    ('3', 'Lebron', 'James', '5'),
    ('4', 'Trae', 'Young', '6'),
    ('5', 'James', 'Harden', '9');


-- DELETION:
/*
We can tables using the DROP keyword.
*/
DROP TABLE new_table;


/* We can delete rows (data entries) using the DELETE keyword) */
DELETE FROM customers
WHERE id = 1;

SET SQL_SAFE_UPDATES=0;

-- Deletes all rows (data entries):
DELETE FROM products;

/*
Let's talk about primary keys and foreign keys. Open up the customers table. Each customer has a primary key called customer_id.
The primary key is unique to that customer, you won't find duplicate primary keys. This key will be present in other tables, but it always represents a unique customer.
If you open up the orders table, you can see that same customer_id. Here we don't have all the information about that customer like first_name, last_name, phone, etc.
We don't need it in the orders table, but if we ever do we have the customer_id which will represent a key to that person's information in the customers table.

In the orders table, the order_id is the primary key, and the customer_id is the foreign key (pointer to another table). The power in using data like this, is that data is
always presented in its simplest form. We are never fetching extraneous information that we don't plan to use. This makes data costs low. Another benefit of this, is that we
know that a order_id always points back to a single customer, however a single_customer can point back to multiple order_id(s).

If we look back at the NBA players and NBA teams example in the slides, we see the same principle at work. Each player has a unique player_id and each team has a team_id.
Players can be apart of one team, but a team can have multiple players.
*/


/*
This is the power of relational databases and where they get their name, the tables have relationships with each other with these primary -> foreign key relations.

The organization technique of representing data like this, reducing data redudency, is called normalization.
*/