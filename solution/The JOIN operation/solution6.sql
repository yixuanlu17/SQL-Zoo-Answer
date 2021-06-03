/*
Sixth section of sqlzoo, https://sqlzoo.net/wiki/The_JOIN_operation
*/

--#8
/*
Show names of all players who scored a goal against Germany.
*/
SELECT distinct player
FROM game 
JOIN goal ON goal.matchid = game.id 
    WHERE (team1='GER' or team2='GRE') and teamid <>'GER'

--#8
/*
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
*/
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2
