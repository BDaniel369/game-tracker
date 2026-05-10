-- 1. Create Developer Table
CREATE TABLE Developers (
    DevID SERIAL PRIMARY KEY,
    DevName VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    FoundedYear INT CHECK (FoundedYear > 1950) [cite: 16, 19, 20]
);

-- 2. Create Genre Table
CREATE TABLE Genres (
    GenreID SERIAL PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL UNIQUE [cite: 28, 30]
);

-- 3. Create Games Table
CREATE TABLE Games (
    GameID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Price DECIMAL(10, 2) DEFAULT 0.00,
    DevID INT REFERENCES Developers(DevID) ON DELETE SET NULL [cite: 11, 22, 26]
);

-- 4. Create Game_Genres Junction Table (M:N Relationship)
CREATE TABLE Game_Genres (
    GameID INT REFERENCES Games(GameID) ON DELETE CASCADE,
    GenreID INT REFERENCES Genres(GenreID) ON DELETE CASCADE,
    PRIMARY KEY (GameID, GenreID) [cite: 32, 33, 35]
);

-- 5. Create Users Table
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE DEFAULT CURRENT_DATE [cite: 39, 41]
);

-- 6. Create Ratings Table
CREATE TABLE Ratings (
    RatingID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    GameID INT REFERENCES Games(GameID) ON DELETE CASCADE,
    Score INT CHECK (Score >= 0 AND Score <= 10),
    ReviewText TEXT,
    ReviewDate DATE DEFAULT CURRENT_DATE [cite: 44, 46, 47]
);
