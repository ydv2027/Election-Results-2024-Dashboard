#Highest Losing Vote Count:
#Identify the candidate who received the highest number of votes among all losing candidates across all constituencies. 
#Return the candidate's name, constituency, party, and the number of votes they received.
use lok_sabha;
WITH ranked_candidates AS (
    SELECT *,
        DENSE_RANK() OVER (PARTITION BY pc_name ORDER BY total_votes DESC) AS rank_within_pc
    FROM 
        electionresults_2024
)
SELECT 
    state, 
    pc_name, 
    candidate, 
    party, 
    total_votes
FROM 
    ranked_candidates
WHERE 
    rank_within_pc > 1  -- Only losing candidates
ORDER BY 
    total_votes DESC
LIMIT 1;
