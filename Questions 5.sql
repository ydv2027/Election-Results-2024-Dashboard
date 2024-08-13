#Constituency with the Closest Contest:
#Find the constituency where the margin of victory is the smallest.
#Return the constituency name, the winner's name, the runner-up's name,runner_up_party, and the margin of victory.
use lok_sabha 
;WITH cte AS (
    SELECT *,
        LEAD(candidate) OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC) AS Runnerup_Candidate,
        LEAD(party) OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC) AS Runnerup_party,
        (total_votes - LEAD(total_votes) OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC)) AS Margin_of_victory,
        DENSE_RANK() OVER (PARTITION BY state, pc_name ORDER BY total_votes DESC) AS r
    FROM 
        electionresults_2024
        
)
,cte2 as (
select *, row_number() over (order by margin_of_victory asc ) as min_margin from  cte  where r=1

)
select  pc_name,candidate as Winner,party as Winning_party,Runnerup_Candidate,Runnerup_party, margin_of_victory from cte2 where min_margin <= 5
