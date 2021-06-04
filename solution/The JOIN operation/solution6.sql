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
    
--#10
/*
Show the stadium and the number of goals scored in each stadium.
*/
SELECT stadium, COUNT(player) goals_scored
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium
    
--#11
/*
Show the stadium and the number of goals scored in each stadium.
*/
SELECT matchid,mdate,COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid,mdate



--#13
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
