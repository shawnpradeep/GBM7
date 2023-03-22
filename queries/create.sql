CREATE SCHEMA `nba` ;

USE nba;

CREATE TABLE player(
	id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    team_id INT
);