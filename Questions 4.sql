#Party-wise Winners:
#write a query to list the total number of seats won by each party across all constituencies. Sort the results by the number of seats won in descending order.

use lok_sabha 
;with Party_wise_Seats
as
(
select *,dense_rank() over (partition by state, pc_name order by total_votes desc) as winners from electionresults_2024
)
select party,count(party) as Total_seats 
from Party_wise_Seats where winners=1
group by party 
order by total_seats desc