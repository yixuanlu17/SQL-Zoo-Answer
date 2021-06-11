  
/*
11th section of sqlzoo, https://sqlzoo.net/wiki/Self_join
*/

--#6
/*
6.
The query shown is similar to the previous one, 
however by joining two copies of the stops table we can refer 
to stops by name rather than by number. Change the query so 
that the services between 'Craiglockhart' and 'London Road'
are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
*/
SELECT a.company, a.num, s1.name, s2.name 
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) 
JOIN stops s1 ON a.stop =s1.id
JOIN stops s2 ON b.stop = s2.id
WHERE s1.name = 'Craiglockhart' AND s2.name = 'London Road'
