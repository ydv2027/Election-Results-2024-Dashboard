#Party-wise Average Vote Count:
#Write a query to calculate the average number of votes received by candidates of each party across all constituencies.
#List the party name and the average vote count.
use lok_sabha;
select party, avg(Total_Votes) as average_votes
from electionresults_2024
group by Party 