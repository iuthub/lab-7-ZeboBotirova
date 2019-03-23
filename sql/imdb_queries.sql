SELECT name FROM `movies` WHERE year=1995;

SELECT count(actor_id) FROM roles as R JOIN movies as M on M.id=R.movie_id
WHERE M.name="Lost in Translation";

SELECT first_name 
FROM actors JOIN roles AS R ON id=R.actor_id JOIN movies AS M ON R.movie_id=M.id  
WHERE M.name="Lost in Translation";

SELECT first_name, last_name
FROM directors JOIN movies_directors AS MR ON id=MR.director_id JOIN movies AS M ON MR.movie_id=M.id  
WHERE M.name="Fight Club";

SELECT COUNT(M.id) AS num_mov
FROM movies As M JOIN movies_directors AS MR ON M.id=MR.movie_id JOIN directors AS D ON MR.director_id=D.id  
WHERE D.first_name="Clint" AND D.last_name="Eastwood";

SELECT name, D.first_name, D.last_name 
FROM movies As M JOIN movies_directors AS MR ON M.id=MR.movie_id JOIN directors AS D ON MR.director_id=D.id  
WHERE D.first_name="Clint" AND D.last_name="Eastwood"
GROUP BY D.first_name, D.last_name;

SELECT first_name, last_name 
FROM `directors` JOIN directors_genres ON directors_genres.director_id = directors.id
WHERE directors_genres.genre = "Horror";

SELECT first_name, last_name 
FROM actors where id IN(SELECT actor_id from roles where movie_id 
	in(SELECT movie_id FROM movies_directors where director_id 
		in(SELECT id FROM directors where first_name="Christopher" and last_name="Nolan")))