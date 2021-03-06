/*
Fifth section of sqlzoo, https://sqlzoo.net/wiki/SUM_and_COUNT
*/

--#2
/*
List all the continents - just once each.
*/
select distinct (continent) from world 

--#4
/*
How many countries have an area of at least 1000000
*/
select count(name) from world
where area>= 1000000

--#5
/*
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
*/
select sum (population) from world
where name in ('Estonia', 'Latvia', 'Lithuania')

--#6
/*
For each continent show the continent and number of countries.
*/
select continent, count(name) from world
group by continent
