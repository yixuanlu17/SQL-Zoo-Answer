  
/*
11th section of sqlzoo, https://sqlzoo.net/wiki/Self_join
*/

--#6
/*
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

--#10
/*
Find the routes involving two buses that can go from Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.
*/
select r1.num, r1.company,s2.name, r3.num, r3.company
from route r1 
join route r2 on (r1.company = r2.company) AND (r1.num = r2.num)
join route r3 on (r2.stop = r3.stop)
join route r4 on (r3.company = r4.company) AND (r3.num = r4.num)
join stops s1 on (r1.stop = s1.id)
join stops s2 on (r2.stop = s2.id)
join stops s3 on (r3.stop = s3.id)
join stops s4 on (r4.stop = s4.id)
where s1.name='Craiglockhart' and s4.name= 'Lochend' and s2.id=s3.id
