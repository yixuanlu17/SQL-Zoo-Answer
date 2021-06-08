/*
Seventh section of sqlzoo, https://sqlzoo.net/wiki/More_JOIN_operations
*/

--#2
/*
When was Citizen Kane released?
*/
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

--#6
/*
Cast list for Casablanca
*/
select actor.name from actor
inner join casting  
on actor.id = casting.actorid
where casting.movieid = 27

--#7
/*
Obtain the cast list for the film 'Alien'
*/
select actor.name from actor
inner join casting on actor.id = casting.actorid
inner join movie on movie.id = casting.movieid
where movie.title = 'Alien'

--#8
/*
List the films in which 'Harrison Ford' has appeared
*/
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford'

--#11
/*
Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
*/
select yr, count(movie.id) from movie
inner join casting on movie.id = casting.movieid
inner join actor on actor.id = casting.actorid
where actor.name = 'Rock Hudson'
group by yr
having count(movie.id)>2

--#12
/*
List the film title and the leading actor for all of the films 'Julie Andrews' played in.
*/
select title, name 
from movie
inner join casting on movie.id = casting.movieid
inner join actor on actor.id = casting.actorid
where movie.id in
(select movieid from casting
where actorid in (select id from actor where name = 'Julie Andrews'))
and ord = 1


--#13
/*
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/
select name from
movie
inner join casting on movie.id = casting.movieid
inner join actor on actor.id = casting.actorid
where ord=1
group by name
having count(name) > = 15
order by name

--#15
/*
List all the people who have worked with 'Art Garfunkel'.
*/
SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON actorid=id where name='Art Garfunkel') 
AND name != 'Art Garfunkel'
GROUP BY name
