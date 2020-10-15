
CREATE TABLE IF NOT EXISTS players(
playerID INTEGER PRIMARY KEY,
name VARCHAR (100) NOT NULL,
score INTEGER DEFAULT 0,
country VARCHAR(100),
email VARCHAR(100),
twitter VARCHAR(100),
facebook VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS rankings(
playerID INTEGER PRIMARY KEY,
score INTEGER DEFAULT 0,
FOREIGN KEY (playerID) REFERENCES players(playerID)
);

INSERT INTO players(playerID, name,country, email)
	VALUES (1234, 
	'John Smith',
    'USA',
    'johnsmith123@email.com'),
	(1235, 
	'Jane Smithe',
    'UK',
    'bossb123@email.com');
    
INSERT INTO rankings(playerID)
	SELECT playerID FROM players;
    
SELECT playerID FROM rankings;

UPDATE rankings
SET score = 10000
WHERE playerID = 1234;

UPDATE rankings
SET score = 20000
WHERE playerID = 1235;
    
SELECT playerID, score, RANK() OVER( ORDER BY score DESC) ranking FROM rankings;

UPDATE rankings
SET score = 20001
WHERE playerID = 1234;

SELECT playerID, score, RANK() OVER( ORDER BY score DESC) ranking FROM rankings;

    
