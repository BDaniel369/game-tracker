-- 1. Create Developer Table
CREATE TABLE Developers (
    DevID SERIAL PRIMARY KEY,
    DevName VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    FoundedYear INT CHECK (FoundedYear > 1800) 
);

-- 2. Create Genre Table
CREATE TABLE Genres (
    GenreID SERIAL PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL UNIQUE 
);

-- 3. Create Games Table
CREATE TABLE Games (
    GameID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Price DECIMAL(10, 2) DEFAULT 0.00,
    DevID INT REFERENCES Developers(DevID) ON DELETE SET NULL 
);

-- 4. Create Game_Genres Junction Table (M:N Relationship)
CREATE TABLE Game_Genres (
    GameID INT REFERENCES Games(GameID) ON DELETE CASCADE,
    GenreID INT REFERENCES Genres(GenreID) ON DELETE CASCADE,
    PRIMARY KEY (GameID, GenreID) 
);

-- 5. Create Users Table
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE DEFAULT CURRENT_DATE 
);

-- 6. Create Ratings Table
CREATE TABLE Ratings (
    RatingID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    GameID INT REFERENCES Games(GameID) ON DELETE CASCADE,
    Score INT CHECK (Score >= 0 AND Score <= 10),
    ReviewText TEXT,
    ReviewDate DATE DEFAULT CURRENT_DATE 
);
