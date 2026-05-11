SELECT gn.GenreName, ROUND(AVG(r.Score), 2) as AvgRating, COUNT(r.RatingID) as ReviewCount
FROM Genres gn
JOIN Game_Genres ggn ON gn.GenreID = ggn.GenreID
JOIN Games g ON ggn.GameID = g.GameID
JOIN Ratings r ON g.GameID = r.GameID
GROUP BY gn.GenreName
HAVING COUNT(r.RatingID) > 5
ORDER BY AvgRating DESC;

SELECT d.DevName, COUNT(g.GameID) as PremiumGameCount, ROUND(AVG(r.Score), 2) as AvgScore
FROM Developers d
JOIN Games g ON d.DevID = g.DevID
JOIN Ratings r ON g.GameID = r.GameID
WHERE g.Price > 50.00
GROUP BY d.DevName
ORDER BY AvgScore DESC;

SELECT u.Username, COUNT(r.RatingID) as ReviewCount, MAX(r.ReviewDate) as LastReview
FROM Users u
JOIN Ratings r ON u.UserID = r.UserID
GROUP BY u.Username
HAVING COUNT(r.RatingID) > 1
ORDER BY ReviewCount DESC;

SELECT Title, Price, 
       (SELECT ROUND(AVG(Price), 2) FROM Games) as MarketAverage
FROM Games
WHERE Price > (SELECT AVG(Price) FROM Games);
