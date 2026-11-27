                                                                           -- Ad-Hoc Business Requests -- 
																 -- Goodcabs Operational Performance AD-HOC Analysis --
														    ===============================================================   
/*
Business Request - 1: City-Level Fare and Trip Summary Report
Generate a report that displays the total trips,
average fare per km, average fare per trip,
and the percentage contribution of each city's trips to the overall trips. 
This report will help in assessing trip volume, pricing efficiency, and each city's contribution to the overall trip count.

Fields: 
1. city_name  
2. total_trips  
3. avg_fare_per_km  
4. avg_fare_per_trip  
5. %_contribution_to_total_trips 
*/

--SQL Code : -
-- Require Data Tables: 
select * from dim_city;

select * from fact_trips;

select
     cd.city_name,
	 count(ft.trip_id) as total_trips,
	 round(sum(ft.fare_amount)/sum(ft.distance_travelled),2) as avg_fare_per_km,
	 round(sum(ft.fare_amount)/count(ft.trip_id) , 2) as avg_fare_per_trip,
	 cast(round((count(ft.trip_id):: numeric /(select count(*) from fact_trips)::numeric)*100 ,2) as TEXT) || ' %' as '%_contribution_of_total_trips'
from dim_city as cd
inner join fact_trips as ft on cd.city_id = ft.city_id
group by cd.city_name
order by cd.city_name asc;

/*
Business Request - 2: Monthly City-Level Trips Target Performance Report  

Generate a report that evaluates the target performance for trips at the monthly and city level. 
For each city and month, compare the actual total trips with the target trips and categorize the performance as follows:  
- If actual trips are greater than target trips, mark it as "Above Target".  
- If actual trips are less than or equal to target trips, mark it as "Below Target".  

Additionally, calculate the % difference between actual and target trips to quantify the performance gap.  

Fields:  
1. City_name  
2. month_name  
3. actual_trips  
4. target_trips  
5. performance_status  
6. %_difference  
*/
-- SQL Code :-
-- Require Data Tables : 
select * from dim_city;

select * from fact_trips;

select * from monthly_target_trips;

WITH monthly_city_actual_trips AS (
    SELECT 
        TO_CHAR(ft.date, 'Month') AS month_name,
        cd.city_name,
        COUNT(ft.trip_id) AS actual_trips
    FROM dim_city AS cd
    INNER JOIN fact_trips AS ft 
        ON cd.city_id = ft.city_id
    GROUP BY TO_CHAR(ft.date, 'Month'), cd.city_name 
    ORDER BY TO_CHAR(ft.date, 'Month') ASC, cd.city_name ASC
),
monthly_city_target_trips AS (
    SELECT 
        TO_CHAR(mtt.month, 'Month') AS month_name,
        cd.city_name,
        mtt.total_target_trips AS target_trips
    FROM monthly_target_trips AS mtt
    INNER JOIN dim_city AS cd 
        ON mtt.city_id = cd.city_id
    ORDER BY TO_CHAR(mtt.month, 'Month') ASC, cd.city_name ASC
)

SELECT 
    mcat.month_name,
    mcat.city_name,
    mcat.actual_trips,
    mctt.target_trips,
    CASE 
        WHEN mcat.actual_trips > mctt.target_trips THEN 'Above Target'
        WHEN mcat.actual_trips = mctt.target_trips THEN 'On Target'
        ELSE 'Below Target'
    END AS performance_status,
    CAST(
        ROUND(
            CASE 
                WHEN mctt.target_trips = 0 THEN 0
                ELSE ((mcat.actual_trips - mctt.target_trips)::NUMERIC / mctt.target_trips::NUMERIC) * 100 
            END, 
            2
        ) AS TEXT
    ) || ' %' AS percentage_difference
FROM monthly_city_actual_trips AS mcat
INNER JOIN monthly_city_target_trips AS mctt 
    ON mcat.city_name = mctt.city_name 
    AND mcat.month_name = mctt.month_name
ORDER BY mcat.month_name ASC, mcat.city_name ASC;
	 
/*
Business Request - 3: City-Level Repeat Passenger Trip Frequency Report

Generate a report that shows the percentage distribution of repeat passengers by the number of trips they have taken in each city. 
Calculate the percentage of repeat passengers who took 2 trips, 3 trips, and so on, up to 10 trips.
Each column should represent a trip count category, displaying the percentage of repeat passengers who fall into that category out of the total repeat passengers for that city.
This report will help identify cities with high repeat trip frequency, which can indicate strong customer loyalty or frequent usage patterns.

Fields:  
1. city_name  
2. 2-Trips  
3. 3-Trips  
4. 4-Trips  
5. 5-Trips  
6. 6-Trips  
7. 7-Trips  
8. 8-Trips  
9. 9-Trips  
10. 10-Trips
*/

-- SQL Code :-
-- Require Data Tables : 
select * from dim_repeat_trip_distribution;

select * from dim_city;

select
    cd.city_name,
    cast(round((sum(case when drtd.trip_count = '2-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "2-Trips",
    cast(round((sum(case when drtd.trip_count = '3-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "3-Trips",
    cast(round((sum(case when drtd.trip_count = '4-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "4-Trips",
	cast(round((sum(case when drtd.trip_count = '5-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "5-Trips",
	cast(round((sum(case when drtd.trip_count = '6-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "6-Trips",
	cast(round((sum(case when drtd.trip_count = '7-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "7-Trips",
	cast(round((sum(case when drtd.trip_count = '8-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "8-Trips",
	cast(round((sum(case when drtd.trip_count = '9-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "9-Trips",
	cast(round((sum(case when drtd.trip_count = '10-Trips' then drtd.repeat_passenger_count else 0 end )::numeric/sum(drtd.repeat_passenger_count)::numeric)*100 , 2) as text) || ' %' as "10-Trips"
from dim_repeat_trip_distribution as drtd
inner join dim_city as cd on cd.city_id = drtd.city_id
group by cd.city_name
order by cd.city_name asc;

/*
Business Request - 4: Identify Cities with Highest and Lowest Total New Passengers

Generate a report that calculates the total new passengers for each city and ranks them based on this value. 
Identify the top 3 cities with the highest number of new passengers as well as the bottom 3 cities with the lowest number of new passengers, 
categorising them as "Top 3" or "Bottom 3" accordingly.

Fields  
1. city_name  
2. total_new_passengers  
3. city_category ("Top 3" or "Bottom 3")
*/

--Solution: -

select * from dim_city;

select * from fact_passenger_summary;

select
    t1.city_name,
	t1.total_new_passengers,
	'Top-3' as city_category
from (select
		     cd.city_name,
			 sum(fps.new_passengers) as total_new_passengers,
			 dense_rank() over(order by sum(fps.new_passengers) desc) as passengers_rank
		from fact_passenger_summary as fps
		inner join dim_city as cd  on fps.city_id = cd.city_id
		group by cd.city_name) as t1
where t1.passengers_rank <= 3
union
select
    t2.city_name,
	t2.total_new_passengers,
	'Bottom-3' as city_category
from (select
		     cd.city_name,
			 sum(fps.new_passengers) as total_new_passengers,
			 dense_rank() over(order by sum(fps.new_passengers) asc) as passengers_rank
		from fact_passenger_summary as fps
		inner join dim_city as cd  on fps.city_id = cd.city_id
		group by cd.city_name) as t2
where t2.passengers_rank <= 3 ;


/*
Business Request - 5: Identify Month with Highest Revenue for Each City

Generate a report that identifies the month with the highest revenue for each city. 
For each city, display the month_name, the revenue amount for that month, 
and the percentage contribution of that month's revenue to the city's total revenue.

Fields  
1. city_name  
2. highest_revenue_month  
3. revenue  
4. percentage_contribution (%)  
*/
-- SQL Code : -
-- Required Data Tables
select * from dim_city;

select * from fact_trips;

with city_revenue as (
select
    cd.city_name,
	sum(ft.fare_amount) as total_revenue
from dim_city as cd
inner join fact_trips as ft on cd.city_id = ft.city_id	
group by cd.city_name
order by cd.city_name asc
)

select
     t.city_name,
	 t.month_name as highest_revenue_month ,
	 t.revenue,
	 cast(round((t.revenue::numeric / cr.total_revenue::numeric)*100,2) as text) || ' %' as percentage_distribution
from (select
     cd.city_name,
	 to_char(ft.date , 'Month') as month_name,
	 sum(ft.fare_amount) as revenue,
	 dense_rank() over(partition by cd.city_name order by sum(ft.fare_amount) desc) as revenue_rank
from dim_city as cd
inner join fact_trips as ft on cd.city_id = ft.city_id
group by cd.city_name , to_char(ft.date , 'Month')
order by cd.city_name asc ) as t
inner join city_revenue as cr on cr.city_name = t.city_name and t.revenue_rank = 1
order by t.city_name asc;

/*
Business Request - 6: Repeat Passenger Rate Analysis**

Generate a report that calculates two metrics:

1. Monthly Repeat Passenger Rate: Calculate the repeat passenger rate for each city and month by comparing the number of repeat passengers to the total passengers.
2. City-wide Repeat Passenger Rate: Calculate the overall repeat passenger rate for each city, considering all passengers across months.

These metrics will provide insights into monthly repeat trends as well as the overall repeat behavior for each city.

Fields  
1. city_name  
2. month  
3. total_passengers  
4. repeat_passengers  
5. monthly_repeat_passenger_rate (%): Repeat passenger rate at the city and month level  
6. city_repeat_passenger_rate (%): Overall repeat passenger rate for each city, aggregated across months  
*/

--Solution :- 

select * from dim_city;

select * from fact_passenger_summary;

select
    cd.city_name,
	to_char(fps.month , 'Month') as month_name,
	fps.total_passengers,
	fps.repeat_passengers,
	cast(round((fps.repeat_passengers::numeric / fps.total_passengers::numeric)*100,2) as text) || ' %' as monthly_repeat_passenger_rate
from fact_passenger_summary as fps
inner join dim_city as cd on cd.city_id = fps.city_id
order by cd.city_name asc, fps.month  asc;

-----------------------------------------------------------------------------------------

select
    cd.city_name,
	cast(round((sum(fps.repeat_passengers)::numeric / sum(fps.total_passengers)::numeric)*100 , 2) as text) || ' %' as city_repeat_passenger_rate 
from dim_city as cd
inner join fact_passenger_summary as fps on cd.city_id = fps.city_id
group by cd.city_name
order by cd.city_name asc;
	
	



	 













