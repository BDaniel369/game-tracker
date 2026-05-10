-- Populate Developers
INSERT INTO Developers (DevName, Country, FoundedYear) VALUES
('Nintendo', 'Japan', 1889),
('Rockstar Games', 'USA', 1998),
('CD Projekt Red', 'Poland', 1994),
('FromSoftware', 'Japan', 1986),
('Ubisoft', 'France', 1986),
('Naughty Dog', 'USA', 1984),
('Santa Monica Studio', 'USA', 1999),
('Capcom', 'Japan', 1979),
('BioWare', 'Canada', 1995),
('Bethesda Game Studios', 'USA', 2001);

-- Populate Genres
INSERT INTO Genres (GenreName) VALUES
('RPG'), ('Action'), ('Adventure'), ('Platformer'), 
('Open World'), ('Horror'), ('Shooter'), ('Strategy'), 
('Simulation'), ('Sports');

-- Populate Games
INSERT INTO Games (Title, ReleaseDate, Price, DevID) VALUES
('The Legend of Zelda', '2017-03-03', 59.99, 1),
('Elden Ring', '2022-02-25', 59.99, 4),
('Cyberpunk 2077', '2020-12-10', 49.99, 3),
('God of War', '2018-04-20', 19.99, 7),
('Grand Theft Auto V', '2013-09-17', 29.99, 2),
('Resident Evil Village', '2021-05-07', 39.99, 8),
('The Last of Us Part II', '2020-06-19', 39.99, 6),
('Starfield', '2023-09-06', 69.99, 10),
('Mass Effect', '2007-11-20', 14.99, 9),
('Assassin Creed Valhalla', '2020-11-10', 59.99, 5);

-- Populate Game_Genres
INSERT INTO Game_Genres (GameID, GenreID) VALUES
(1, 3), (1, 5), (2, 1), (2, 2), (3, 1), 
(4, 2), (5, 5), (6, 6), (7, 3), (8, 1);

-- Populate Users
INSERT INTO Users (Username, Email) VALUES
('Gamer1', 'gamer1@email.com'),
('AdminAlex', 'alex@email.com'),
('PixelMaster', 'pixel@email.com'),
('RetroFan', 'retro@email.com'),
('QuestLog', 'quest@email.com'),
('CouchPotato', 'couch@email.com'),
('SpeedRunner', 'run@email.com'),
('BossFight', 'boss@email.com'),
('LootBox', 'loot@email.com'),
('SavePoint', 'save@email.com');

-- Populate Ratings
INSERT INTO Ratings (UserID, GameID, Score, ReviewText) VALUES
(1, 1, 10, 'A masterpiece.'),
(2, 2, 9, 'Incredible world building.'),
(3, 3, 7, 'Great story, buggy at launch.'),
(4, 4, 10, 'Best combat in the series.'),
(5, 5, 8, 'Classic open world fun.'),
(6, 6, 9, 'Scary and polished.'),
(7, 7, 10, 'Emotional roller coaster.'),
(8, 8, 6, 'A bit empty but pretty.'),
(9, 9, 9, 'Classic RPG goodness.'),
(10, 10, 7, 'Visually stunning, but repetitive.');
