#Vote Percentage Calculation:
#Write a query to calculate the percentage of total votes each candidate received within their constituency. 
#List the candidate's name, party, constituency, total votes, and the calculated vote percentage.
use lok_sabha;
select state,pc_name,candidate, party , total_votes ,(total_votes*100)/sum(total_votes) over (partition by pc_name ) as vote_percentage
from electionresults_2024
group by state,pc_name,candidate, party , total_votes
order by state,pc_name,total_votes desc