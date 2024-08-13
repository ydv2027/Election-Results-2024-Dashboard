#Constituency-wise Voter Turnout:
#Write a query to calculate the total voter turnout (sum of total votes) for each constituency.
#Then, find the constituency with the highest and lowest voter turnout.
use lok_sabha
;with cte as (
select PC_Name,sum(Total_Votes) as t_votes
from electionresults_2024
group by pc_name
)
, cte2 as (
select *,
         row_number () over (order by t_votes desc) as max_vote,
         row_number () over (order by t_votes asc) as min_vote
         from cte
         
         )select pc_name,t_votes from  cte2
         where 1 in (max_vote,min_vote)
