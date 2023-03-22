USE nba;

DELETE FROM player
WHERE id = 1;

SET SQL_SAFE_UPDATES=0;

-- Deletes all:
DELETE FROM player;