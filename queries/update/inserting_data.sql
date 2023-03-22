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




