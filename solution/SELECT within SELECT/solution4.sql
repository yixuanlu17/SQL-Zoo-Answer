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

