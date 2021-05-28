/*
Fourth section of sqlzoo, SELECT from Nobel https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
*/

--#1
/*
List each country name where the population is larger than that of 'Russia'.
*/
select name from world 
 where population > (select population from world where name = 'Russia')
 
--#2
/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
*/ 
select name 
from world 
where continent = 'Europe' and 
GDP/population > (select GDP/population from world where name = 'United Kingdom')

--#3
/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
*/ 
select name, continent 
from world
where continent in (select continent from world where name in ('Argentina', 'Australia'))
order by name

--#4
/*
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
*/ 
select name, population
from world
where population > (select population from world where name = 'Canada') and 
population <  (select population from world where name = 'Poland')

--#5
/*
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
*/ 
SELECT 
  name, 
  CONCAT(ROUND((population*100)/(SELECT population 
                                 FROM world WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
                     FROM world
                     WHERE continent='Europe')
