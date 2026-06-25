CREATE DATABASE MusicStreaming;
USE musicstreaming;

CREATE TABLE users (
user_id INT PRIMARY KEY,
user_name VARCHAR(30),
email VARCHAR(30),
country VARCHAR(20),
subscription_type VARCHAR(30)
);

INSERT INTO users
(user_id,user_name,email,country,subscription_type)
VALUES
(1,'Anup','anup@gmail.com','India','Premium'),
(2,'Rahul','rahul@gmail.com','India','Free'),
(3,'Priya','priya@gmail.com','India','Premium'),
(4,'Amit','amit@gmail.com','India','Free'),
(5,'Sneha','sneha@gmail.com','India','Premium'),
(6,'Karan','karan@gmail.com','USA','Premium'),
(7,'Riya','riya@gmail.com','UK','Free'),
(8,'Arjun','arjun@gmail.com','India','Premium'),
(9,'Neha','neha@gmail.com','Canada','Free'),
(10,'Vikas','vikas@gmail.com','India','Premium'),
(11,'Pooja','pooja@gmail.com','India','Free'),
(12,'Rohit','rohit@gmail.com','India','Premium'),
(13,'Nikita','nikita@gmail.com','USA','Free'),
(14,'Sahil','sahil@gmail.com','India','Premium'),
(15,'Meera','meera@gmail.com','UK','Premium'),
(16,'Varun','varun@gmail.com','India','Free'),
(17,'Aisha','aisha@gmail.com','India','Premium'),
(18,'Yash','yash@gmail.com','Canada','Free'),
(19,'Deepak','deepak@gmail.com','India','Premium'),
(20,'Simran','simran@gmail.com','India','Free')
;

SELECT * FROM users;


CREATE TABLE artists (
artist_id INT PRIMARY KEY,
artist_name VARCHAR (30),
genre VARCHAR (30)
);

INSERT INTO artists
(artist_id,artist_name,genre)
VALUES
(1,'Arijit Singh','Bollywood'),
(2,'Shreya Ghoshal','Bollywood'),
(3,'A R Rahman','Bollywood'),
(4,'Atif Aslam','Pop'),
(5,'Taylor Swift','Pop'),
(6,'Ed Sheeran','Pop'),
(7,'Drake','Hip Hop'),
(8,'Eminem','Rap'),
(9,'The Weeknd','R&B'),
(10,'BTS','K-Pop'),
(11,'Justin Bieber','Pop'),
(12,'Adele','Soul'),
(13,'Badshah','Rap'),
(14,'Neha Kakkar','Bollywood'),
(15,'Imagine Dragons','Rock'),
(16,'Coldplay','Rock'),
(17,'Dua Lipa','Pop'),
(18,'Selena Gomez','Pop'),
(19,'Bruno Mars','Pop'),
(20,'Alan Walker','EDM');

SELECT * FROM artists;


CREATE TABLE albums (
album_id INT PRIMARY KEY,
album_title varchar (30),
artist_id INT,
release_year INT,
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO albums
(album_id,album_title,artist_id,release_year)
VALUES
(1,'Love Hits',1,2021),
(2,'Melodies',2,2020),
(3,'Soul Music',3,2019),
(4,'Pop Star',4,2022),
(5,'Midnights',5,2023),
(6,'Divide',6,2018),
(7,'Scorpion',7,2019),
(8,'Recovery',8,2017),
(9,'After Hours',9,2020),
(10,'Butter',10,2021),
(11,'Justice',11,2021),
(12,'30',12,2022),
(13,'Rap King',13,2021),
(14,'Bollywood Beats',14,2022),
(15,'Evolve',15,2018),
(16,'Music Of The Spheres',16,2021),
(17,'Future Nostalgia',17,2020),
(18,'Rare',18,2020),
(19,'24K Magic',19,2017),
(20,'Different World',20,2019);

SELECT * FROM albums;


CREATE TABLE songs (
song_id INT PRIMARY KEY,
song_title VARCHAR (30),
album_id INT,
duration INT,
genre VARCHAR (30),
FOREIGN KEY (album_id) REFERENCEs albums(album_id)
);

INSERT INTO songs
(song_id,song_title,album_id,duration,genre)
VALUES
(1,'Tum Hi Ho',1,240,'Bollywood'),
(2,'Sun Raha Hai',1,250,'Bollywood'),
(3,'Teri Ore',2,230,'Bollywood'),
(4,'Kun Faya Kun',3,300,'Bollywood'),
(5,'Jeena Jeena',4,220,'Pop'),
(6,'Anti Hero',5,210,'Pop'),
(7,'Perfect',6,260,'Pop'),
(8,'Gods Plan',7,230,'Hip Hop'),
(9,'Not Afraid',8,250,'Rap'),
(10,'Blinding Lights',9,200,'R&B'),
(11,'Butter',10,220,'K-Pop'),
(12,'Peaches',11,230,'Pop'),
(13,'Easy On Me',12,240,'Soul'),
(14,'DJ Waley Babu',13,210,'Rap'),
(15,'Dilbar',14,220,'Bollywood'),
(16,'Believer',15,240,'Rock'),
(17,'My Universe',16,250,'Rock'),
(18,'Levitating',17,230,'Pop'),
(19,'Rare',18,220,'Pop'),
(20,'Faded',20,240,'EDM');

SELECT * FROM songs;


CREATE TABLE playlists (
playlist_id INT PRIMARY KEY,
user_id INT,
playlist_name VARCHAR(30),
created_date DATE,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO playlists
(playlist_id,user_id,playlist_name,created_date)
VALUES
(1,1,'Workout Mix','2024-01-01'),
(2,2,'Travel Songs','2024-01-02'),
(3,3,'Party Hits','2024-01-03'),
(4,4,'Relax Music','2024-01-04'),
(5,5,'Bollywood Hits','2024-01-05'),
(6,6,'Morning Playlist','2024-01-06'),
(7,7,'Study Time','2024-01-07'),
(8,8,'Road Trip','2024-01-08'),
(9,9,'Weekend Fun','2024-01-09'),
(10,10,'Gym Songs','2024-01-10'),
(11,11,'Focus Mode','2024-01-11'),
(12,12,'Mood Booster','2024-01-12'),
(13,13,'Dance Hits','2024-01-13'),
(14,14,'Love Songs','2024-01-14'),
(15,15,'Rock Collection','2024-01-15'),
(16,16,'Rap Beats','2024-01-16'),
(17,17,'Night Drive','2024-01-17'),
(18,18,'Peaceful Songs','2024-01-18'),
(19,19,'Top Charts','2024-01-19'),
(20,20,'Favorites','2024-01-20');

SELECT * FROM playlists;


CREATE TABLE playlist_songs (
playlist_id INT,
song_id INT,
date_added DATE,
PRIMARY KEY (playlist_id, song_id),
FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO playlist_songs
(playlist_id,song_id,date_added)
VALUES
(1,1,'2024-01-01'),
(1,7,'2024-01-01'),
(2,10,'2024-01-02'),
(2,16,'2024-01-02'),
(3,8,'2024-01-03'),
(3,11,'2024-01-03'),
(4,4,'2024-01-04'),
(4,13,'2024-01-04'),
(5,15,'2024-01-05'),
(5,3,'2024-01-05'),
(6,6,'2024-01-06'),
(7,17,'2024-01-07'),
(8,18,'2024-01-08'),
(9,20,'2024-01-09'),
(10,14,'2024-01-10'),
(11,9,'2024-01-11'),
(12,5,'2024-01-12'),
(13,12,'2024-01-13'),
(14,2,'2024-01-14'),
(15,16,'2024-01-15');

SELECT * FROM playlist_songs;


CREATE TABLE streams (
stream_id INT PRIMARY KEY,
user_id INT,
song_id INT,
timestamp DATETIME,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO streams
(stream_id,user_id,song_id,timestamp)
VALUES
(1,1,1,'2024-05-01 10:00:00'),
(2,1,7,'2024-05-01 10:05:00'),
(3,2,10,'2024-05-02 09:00:00'),
(4,3,8,'2024-05-02 09:10:00'),
(5,4,4,'2024-05-03 08:00:00'),
(6,5,15,'2024-05-03 08:15:00'),
(7,6,6,'2024-05-04 07:00:00'),
(8,7,17,'2024-05-04 07:10:00'),
(9,8,18,'2024-05-05 06:00:00'),
(10,9,20,'2024-05-05 06:15:00'),
(11,10,14,'2024-05-06 11:00:00'),
(12,11,9,'2024-05-06 11:15:00'),
(13,12,5,'2024-05-07 12:00:00'),
(14,13,12,'2024-05-07 12:20:00'),
(15,14,2,'2024-05-08 01:00:00'),
(16,15,16,'2024-05-08 01:20:00'),
(17,16,11,'2024-05-09 02:00:00'),
(18,17,13,'2024-05-09 02:15:00'),
(19,18,3,'2024-05-10 03:00:00'),
(20,19,1,'2024-05-10 03:20:00');

SELECT * FROM streams;


-- 1.	Find the top 5 most streamed songs.

SELECT
    s.song_title,
    COUNT(st.stream_id) AS total_streams
FROM songs s
JOIN streams st
ON s.song_id = st.song_id
GROUP BY s.song_title
ORDER BY total_streams DESC
LIMIT 5;


-- 2.	List all playlists created by a specific user.

SELECT p.playlist_name
FROM playlists p
JOIN users u
ON p.user_id = u.user_id
WHERE u.user_name = 'Anup'; 


-- 3.	Calculate the total streaming time per user.

SELECT
    u.user_name,
    SUM(s.duration) AS total_seconds
FROM users u
JOIN streams st
ON u.user_id = st.user_id
JOIN songs s
ON st.song_id = s.song_id
GROUP BY u.user_name; 


-- 4.	Identify the most prolific artist (artist with the most songs in the database). 

SELECT
    a.artist_name,
    COUNT(song_id) AS total_songs
FROM artists a
JOIN albums al
ON a.artist_id = al.artist_id
JOIN songs s
ON al.album_id = s.album_id
GROUP BY a.artist_name
ORDER BY total_songs DESC
LIMIT 1;


-- 5.	Find users who have created more than 10 playlists.

SELECT
    u.user_name,
    COUNT(p.playlist_id) AS playlist_count
FROM users u
JOIN playlists p
ON u.user_id = p.user_id
GROUP BY u.user_name
HAVING COUNT(p.playlist_id) > 10;


-- 6.	List all songs in a specific playlist.

SELECT
    p.playlist_name,
    s.song_title
FROM playlists p
JOIN playlist_songs ps
ON p.playlist_id = ps.playlist_id
JOIN songs s
ON ps.song_id = s.song_id
WHERE p.playlist_name = 'Workout Mix';


-- 7.	Calculate the average number of songs per playlist.

SELECT
    AVG(song_count) AS avg_songs_per_playlist
FROM (
    SELECT
	ps.playlist_id,
	COUNT(song_id) AS song_count
    FROM playlist_songs ps
    GROUP BY ps.playlist_id
) as tbl;


-- 8.	Find the most popular genre among users.

SELECT
    s.genre,
    COUNT(*) AS streams
FROM streams st
JOIN songs s
ON st.song_id = s.song_id
GROUP BY s.genre
ORDER BY streams DESC
LIMIT 1;


-- 9.	Identify songs that have never been added to any playlist.

SELECT song_title
FROM songs
WHERE song_id NOT IN (
    SELECT song_id
    FROM playlist_songs
);


-- 10.	Find the artist with the highest total song streams.

SELECT
    a.artist_name,
    COUNT(st.stream_id) AS total_streams
FROM artists a
JOIN albums al
ON a.artist_id = al.artist_id
JOIN songs s
ON al.album_id = s.album_id
JOIN streams st
ON s.song_id = st.song_id
GROUP BY a.artist_name
ORDER BY total_streams DESC
LIMIT 1; 











 
