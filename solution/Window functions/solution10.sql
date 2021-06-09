/*
10th section of sqlzoo, https://sqlzoo.net/wiki/Window_functions
*/

--#3
/*
Use PARTITION to show the ranking of each party in S14000021 in each year. Include yr, party, votes and ranking (the party with the most votes is 1).
*/
select yr, party, votes, 
rank()over (partition by yr order by votes desc)
from ge
where constituency = 'S14000024'
order by party,yr
