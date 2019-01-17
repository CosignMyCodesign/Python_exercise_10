-- 1. Open up the database file in the DB Browser for SQLite application to see it.

-- 2. Go ahead and click around a little bit to familarize yourself with the database.

-- 3. When you're ready to start the exercise, click the tab labeled "Execute SQL", type in your query and run it.
   
    -- For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game.

-- 1. Query all of the entries in the Genre table

SELECT * from Genre;

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist 
VALUES (null, 'Bryann Trejo', 2019 );

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album 
VALUES (null, 'Edify', "01/01/2019", 2948, "Truth Ministries", 31, 13 );

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song 
VALUES (null, 'Set Apart', 221, "12/28/2018", 13, 31, 26 ), 
(null, 'Follow', 262, "12/30/2018", 13, 31, 26 ), 
(null, 'Serendipity', 232, "12/31/2018", 13, 31, 26 );

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

    -- Reminder: Direction of join matters. Try the following statements and see the difference in results.

    --gives back all albums whether they have songs or not
    -- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;

    --Only gives you back albums that HAVE songs
    -- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT s.title as "Song Title", al.title as "Album Title", ar.artistname as "Artist Name"
FROM song s
LEFT JOIN album al on al.albumid = s.albumid
LEFT JOIN artist ar on s.artistid = ar.artistid
WHERE ar.artistname = "ZZTop"
AND al.title = "Eliminator"
--or AND al.title like "eliminator"


--or if you want all artists whther they have an album or not
SELECT s.title as "Song Title", al.title as "Album Title", ar.artistname as "Artist Name"
FROM artist a
LEFT JOIN artist ar on al.artistid = ar.artistid;



-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT AlbumId, COUNT(*) 
FROM Song
GROUP BY AlbumId;

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT ArtistId, COUNT(*) 
FROM Song
GROUP BY ArtistId;

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT GenreId, COUNT(*) 
FROM Song
GROUP BY GenreId;

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT title, MAX(AlbumLength)
FROM Album

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT title, MAX(SongLength)
FROM Song

-- 11. Modify the previous query to also display the title of the album.

SELECT song.title, album.title, MAX(SongLength)
FROM Song
INNER JOIN Album ON song.albumId = album.Albumid;