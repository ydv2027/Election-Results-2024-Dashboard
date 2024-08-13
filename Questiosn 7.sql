#Winning Candidates with Less Than 50% Votes:
#Find the constituencies where the winning candidate received less than 50% of the total votes cast in that constituency.
#List the constituency, winner's name, total votes, and the percentage of votes they received.

use lok_sabha
;with cte as 
		(
              select *, 
                      total_votes*100/sum(total_votes) over (partition by state,pc_name) as voting_percentage,
					  dense_rank() over (partition by state,pc_name order by TOTAL_votes desc) as Candidate_rank
			  from electionresults_2024 
        )
        select * FROM CTE where Candidate_rank=1 and voting_percentage <50
