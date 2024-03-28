use hotel;





--1. What is the total number of reservations in the dataset?
select count(*)
from [dbo].[hoteltable];


--2. Which meal plan is the most popular among guests?
select top(1)
[type_of_meal_plan],count(*) as total

from [dbo].[hoteltable]
group by [type_of_meal_plan]
order by count(*) desc;


--3. What is the average price per room for reservations involving children?
select
[avg_price_per_room] 
from [dbo].[hoteltable]
where [no_of_children] >0;


--4. How many reservations were made for the year 20XX (replace XX with the 2017)?
select 
count(*) as total_reservations
from [dbo].[hoteltable]
where year(arrival_date)=2017;


--5. What is the most commonly booked room type?
select top(1)
[room_type_reserved],count(*) as total

from [dbo].[hoteltable]
group by [room_type_reserved]
order by count(*) desc;

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select 
count(*) as total_reservations_fall_on__weekend
from [dbo].[hoteltable]
where no_of_weekend_nights > 0


--7. What is the highest and lowest lead time for reservations?
select
max(lead_time) as highest_lead_time,
min(lead_time) as lowest_lead_time
from [dbo].[hoteltable]


--8. What is the most common market segment type for reservations?
select top(1)
market_segment_type,count(*) as total

from [dbo].[hoteltable]
group by market_segment_type
order by count(*) desc;


--9. How many reservations have a booking status of "Confirmed"?
select
count(booking_status) as total_confirmed
from [dbo].[hoteltable]
where booking_status='Not_Canceled'


--10. What is the total number of adults and children across all reservations?
select 
sum(no_of_adults) as total_adults,
sum(no_of_children) as total_children
from [dbo].[hoteltable]

--11. What is the average number of weekend nights for reservations involving children?
select 
avg(no_of_weekend_nights) as avg_num_of_weekend
from [dbo].[hoteltable]
where no_of_children>0

--12. How many reservations were made in each month of the year?
SELECT 
    MONTH(arrival_date) AS month,
    COUNT(*) AS reservation_count
FROM 
    [dbo].[hoteltable]
GROUP BY 
    MONTH(arrival_date)
--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select 
room_type_reserved,
avg(no_of_weekend_nights) as avg_weekend,
avg(no_of_week_nights) as avg_week_nights

FROM 
    [dbo].[hoteltable]
group by room_type_reserved



--14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

select 
room_type_reserved, count(*) as total
, avg(avg_price_per_room) as avg_price
from
    [dbo].[hoteltable]
where no_of_children>0
group by 
room_type_reserved
ORDER BY 
    COUNT(*) DESC


--15. Find the market segment type that generates the highest average price per room.
select top(1)
market_segment_type,avg(avg_price_per_room)
from
    [dbo].[hoteltable]
group by market_segment_type
order by avg(avg_price_per_room) desc 

