#Top Three Candidates per Constituency:
#Write a query to find the top three candidates with the highest votes in each constituency (pc_name), along with their vote counts.
use lok_sabha;
with top_3_candidate as (
select  *,row_number() over (partition by state,pc_name  order by total_votes desc ) as winner_by_seat
From electionresults_2024
)
select state,pc_name,party,candidate, total_votes  from top_3_candidate where winner_by_seat in (1,2,3) 
