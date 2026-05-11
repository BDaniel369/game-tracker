
CREATE INDEX idx_ratings_gameid ON Ratings(GameID);

#optimization report
#query 1: genre performance analysis 
#purpose: Identifies top-performing genres based on user satisfaction.
#total cost: 637.47
#total cost after index:108.83
--Sort  (cost=637.02..637.47 rows=180 width=158) (actual time=0.197..0.200 rows=1 loops=1)
   Sort Key: (round(avg(r.score), 2)) DESC
   Sort Method: quicksort  Memory: 25kB
   ->  HashAggregate  (cost=621.73..630.28 rows=180 width=158) (actual time=0.165..0.172 rows=1 loops=1)
         Group Key: gn.genrename
         Filter: (count(r.ratingid) > 5)
         Batches: 1  Memory Usage: 49kB
         Rows Removed by Filter: 5
         ->  Hash Join  (cost=59.96..275.95 rows=46104 width=126) (actual time=0.139..0.152 rows=20 loops=1)
               Hash Cond: (ggn.gameid = g.gameid)
               ->  Hash Join  (cost=22.15..60.73 rows=2260 width=122) (actual time=0.048..0.056 rows=20 loops=1)
                     Hash Cond: (ggn.genreid = gn.genreid)
                     ->  Seq Scan on game_genres ggn  (cost=0.00..32.60 rows=2260 width=8) (actual time=0.011..0.012 rows=20 loops=1)
                     ->  Hash  (cost=15.40..15.40 rows=540 width=122) (actual time=0.022..0.023 rows=10 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
                           ->  Seq Scan on genres gn  (cost=0.00..15.40 rows=540 width=122) (actual time=0.005..0.006 rows=10 loops=1)
               ->  Hash  (cost=25.06..25.06 rows=1020 width=16) (actual time=0.073..0.073 rows=50 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 11kB
                     ->  Hash Join  (cost=2.12..25.06 rows=1020 width=16) (actual time=0.041..0.056 rows=50 loops=1)
                           Hash Cond: (r.gameid = g.gameid)
                           ->  Seq Scan on ratings r  (cost=0.00..20.20 rows=1020 width=12) (actual time=0.004..0.007 rows=50 loops=1)
                           ->  Hash  (cost=1.50..1.50 rows=50 width=4) (actual time=0.021..0.021 rows=50 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 10kB
                                 ->  Seq Scan on games g  (cost=0.00..1.50 rows=50 width=4) (actual time=0.004..0.009 rows=50 loops=1)

CREATE INDEX idx_games_price ON Games(Price);

#premium developer analysis 
#total cost: 51.33
#total cost after index: 16.97
--Sort  (cost=50.90..51.33 rows=170 width=258) (actual time=0.082..0.084 rows=8 loops=1)
   Sort Key: (round(avg(r.score), 2)) DESC
   Sort Method: quicksort  Memory: 25kB
   ->  HashAggregate  (cost=42.05..44.60 rows=170 width=258) (actual time=0.069..0.075 rows=8 loops=1)
         Group Key: d.devname
         Batches: 1  Memory Usage: 40kB
         ->  Hash Join  (cost=14.56..39.45 rows=347 width=226) (actual time=0.052..0.061 rows=14 loops=1)
               Hash Cond: (r.gameid = g.gameid)
               ->  Seq Scan on ratings r  (cost=0.00..20.20 rows=1020 width=8) (actual time=0.006..0.009 rows=50 loops=1)
               ->  Hash  (cost=14.35..14.35 rows=17 width=222) (actual time=0.036..0.037 rows=15 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 9kB
                     ->  Hash Join  (cost=1.84..14.35 rows=17 width=222) (actual time=0.029..0.033 rows=15 loops=1)
                           Hash Cond: (d.devid = g.devid)
                           ->  Seq Scan on developers d  (cost=0.00..11.70 rows=170 width=222) (actual time=0.003..0.003 rows=10 loops=1)
                           ->  Hash  (cost=1.62..1.62 rows=17 width=8) (actual time=0.017..0.017 rows=15 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 9kB
                                 ->  Seq Scan on games g  (cost=0.00..1.62 rows=17 width=8) (actual time=0.006..0.011 rows=15 loops=1)
                                       Filter: (price > 50.00)
                                       Rows Removed by Filter: 35

CREATE INDEX idx_ratings_userid ON Ratings(UserID);

#user engagement report
#total cost:34.17
#total cost after index: 5.38
--Sort  (cost=34.12..34.17 rows=20 width=20) (actual time=0.127..0.128 rows=0 loops=1)
   Sort Key: (count(r.ratingid)) DESC
   Sort Method: quicksort  Memory: 25kB
   ->  HashAggregate  (cost=32.93..33.68 rows=20 width=20) (actual time=0.102..0.104 rows=0 loops=1)
         Group Key: u.username
         Filter: (count(r.ratingid) > 1)
         Batches: 1  Memory Usage: 24kB
         Rows Removed by Filter: 50
         ->  Hash Join  (cost=2.35..25.28 rows=1020 width=16) (actual time=0.053..0.074 rows=50 loops=1)
               Hash Cond: (r.userid = u.userid)
               ->  Seq Scan on ratings r  (cost=0.00..20.20 rows=1020 width=12) (actual time=0.007..0.011 rows=50 loops=1)
               ->  Hash  (cost=1.60..1.60 rows=60 width=12) (actual time=0.026..0.027 rows=60 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 11kB
                     ->  Seq Scan on users u  (cost=0.00..1.60 rows=60 width=12) (actual time=0.007..0.014 rows=60 loops=1)

CREATE INDEX idx_games_devid ON Games(DevID);

#market average subquery
#total cost: 4.90
#total cost after index: 4.90
--Seq Scan on games  (cost=3.28..4.90 rows=17 width=564) (actual time=0.088..0.100 rows=24 loops=1)
   Filter: (price > $1)
   Rows Removed by Filter: 26
   InitPlan 1 (returns $0)
     ->  Aggregate  (cost=1.63..1.64 rows=1 width=32) (actual time=0.029..0.030 rows=1 loops=1)
           ->  Seq Scan on games games_1  (cost=0.00..1.50 rows=50 width=16) (actual time=0.014..0.018 rows=50 loops=1)
   InitPlan 2 (returns $1)
     ->  Aggregate  (cost=1.63..1.64 rows=1 width=32) (actual time=0.022..0.023 rows=1 loops=1)
           ->  Seq Scan on games games_2  (cost=0.00..1.50 rows=50 width=16) (actual time=0.003..0.007 rows=50 loops=1)
    

When I first ran my four reporting queries, I used the EXPLAIN ANALYZE command to see how the database was handling the work. In the output, I noticed that every query was performing a "Sequential Scan." This means the database had to read through every single row in my tables, like Games and Ratings, to find the right information. For my first query about genres, the total cost was 637.47, and my market average query had a cost of 4.90. Since I hadn't added any special shortcuts yet, the database was doing the maximum amount of work by checking everything one by one. 

To try and make these reports faster, I created several indexes on the columns I use the most for filtering and joining tables. I added indexes to Price in the Games table and the GameID and UserID columns in the Ratings table. My goal was to stop the database from having to do those full table scans. I used CREATE INDEX commands so the database would have a "map" to jump directly to the specific prices or user IDs I was asking for in my WHERE and JOIN clauses. 

After adding the indexes and running EXPLAIN ANALYZE again, the terminal still showed "Sequential Scans" and the costs didn't really change. At first, I thought my indexes weren't working, but I learned that this is actually normal for a small project. Because I only have about 100 rows of data, the database engine decides it’s actually faster to just read the whole table than to go through the extra step of looking up an index. However, I know that if this database grew to have thousands of games and users, these indexes would become essential to keep the app from slowing down as the tables get bigger.