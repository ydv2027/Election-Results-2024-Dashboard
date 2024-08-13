#Margin of Victory:
#For each constituency (pc_name), find the margin of victory, defined as the difference in votes between the winner and the runner-up. 
#Return the constituency name, winner's name, and the margin of victory.
use lok_sabha
;WITH Margin_victory AS
(
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC) AS winner_and_runnerup 
    FROM electionresults_2024
), 
cte2 AS 
(
    SELECT *,
          ifnull((total_votes- LEAD(total_votes) OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC)),0) AS vote_margin_bw_w_r 
    FROM Margin_victory 
    WHERE winner_and_runnerup in (1,2)
) 
SELECT 
    pc_name as `Constituency name` , 
    candidate AS winner, 
	vote_margin_bw_w_r  
FROM cte2;
