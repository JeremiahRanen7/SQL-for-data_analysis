use cars;

-- read all the data
select * from cars_data;

-- to perform safe updates in sql

SET SQL_SAFE_UPDATES = 0;

-- total number of cars by year
select year, count(*) as total_count
from cars_data
group by year
order by year asc;

-- range of years present in dataset
select distinct year
from cars_data;

-- total number of cars by year
select count(*) as total_count,year
from cars_data
group by year
order by total_count asc;


select year,min(total_count) as minimum_count
from 
(select year,count(*) as total_count
from cars_data
group by year) as min_carcounts
group by year;

-- this statement above is not necessary as we can use the offset function:

-- maximum count of cars
select count(*) as total_count
from cars_data
group by year
order by total_count desc
limit 1;

select count(*) as total_count
from cars_data
group by year
order by total_count asc
limit 1;

select * from
(select Name,count(*) as total_count
from cars_data
group by year,Name
order by total_count desc
limit 1) as details;

select year,count(*) as total_count
from cars_data
group by year
order by total_count
limit 1;

-- average cars sold


select distinct year from cars_data;

-- total number of cars from 2013 to 2023
select sum(total_count) as total from
(
select count(*) as total_count
from cars_data
where year between 2013 and 2023
group by year) as total_counts;


-- total number of cars from 2003 to 2013
select sum(total_count) as total from
(
select count(*) as total_count
from cars_data
where year between 2003 and 2013
group by year) as total_counts;

-- total number of cars from 1993 to 2003
select sum(total_count) as total from
(
select count(*) as total_count
from cars_data
where year between 1993 and 2003
group by year) as total_counts;

SELECT year, SUM(total_count) AS total
FROM (
    SELECT year, COUNT(*) AS total_count
    FROM cars_data
    WHERE year BETWEEN 2013 AND 2023
    GROUP BY year

    UNION ALL

    SELECT year, COUNT(*) AS total_count
    FROM cars_data
    WHERE year BETWEEN 2003 AND 2013
    GROUP BY year

    UNION ALL

    SELECT year, COUNT(*) AS total_count
    FROM cars_data
    WHERE year BETWEEN 1993 AND 2003
    GROUP BY year
) AS combined_counts
GROUP BY year;

-- range of years with respect to count of cars
SELECT 
    CONCAT(start_year, '-', end_year) AS year_range,
    SUM(total_count) AS total_cars
FROM (
    SELECT
        FLOOR((year - 1) / 10) * 10 + 1 AS start_year,
        FLOOR((year - 1) / 10) * 10 + 10 AS end_year,
        COUNT(*) AS total_count
    FROM cars_data
    WHERE year BETWEEN 1993 AND 2023
    GROUP BY start_year, end_year
) AS year_ranges
GROUP BY start_year, end_year
ORDER BY start_year;

select year,count(*) as total_count
from cars_data
group by year;

select avg(total_count) from(
select year,count(*) as total_count
from cars_data
group by year) as average_cars;

-- maximum selling price for a car from 1993-2023
select max(selling_price) as max_price
from cars_data;

select *
from cars_data
where selling_price=10000000;

-- minimum selling price for a car from 1993-2023
select min(selling_price) as min_price
from cars_data;

select *
from cars_data
where selling_price=29999;

-- average selling price for a car from 1993-2023
select avg(selling_price) as avg_price
from cars_data;

-- select Name,min(selling_price) as min_price
-- from cars_data
-- group by Name;

-- select Name,min(min_price)
-- from(
/*select Name, min(selling_price) as min_price
from cars_data
group by Name) as min_details;

SELECT Name, MIN(min_price) as overall_min_price
FROM (
    SELECT Name, MIN(selling_price) as min_price
    FROM cars_data
    GROUP BY Name
) AS min_details
LIMIT 0, 1000;*/

-- distribution of cars by fuel
select fuel,count(*) as total_count
from cars_data
group by fuel;

-- distribution of price and count of that price with respect to fuel
select selling_price,fuel,count(*) as total_count
from cars_data
group by selling_price,fuel
order by selling_price;

-- maximum price from each fuel type

select max(selling_price),fuel from(
select selling_price,fuel,count(*) as total_count
from cars_data
group by selling_price,fuel
order by selling_price) as fuelXprice
group by fuel;

-- select *
-- from cars_data
-- where selling_price=29999;

select *
from cars_data
where selling_price=2650000;

-- distribution of cars based on transmission
select count(*) as total_count , transmission
from cars_data
group by transmission;

select distinct transmission from cars_data;

select ltrim(transmission)  as trimmed_transmission
from cars_data;

update cars_data
set transmission=ltrim(transmission);

select distinct transmission from cars_data;

-- maximum price of each car present in each category of transmission
select max(selling_price) as max_price,transmission from(
select transmission,selling_price,count(*) as total_count
from cars_data
group by transmission,selling_price) as details
group by transmission;

-- distribution of cars based on kilometres driven
select count(*) as total_count,km_driven
from cars_data
group by km_driven
order by km_driven;

SELECT
    AVG(selling_price) AS average_price,
    MIN(selling_price) AS min_price,
    MAX(selling_price) AS max_price,
    AVG(km_driven) AS average_km_driven,
    MIN(km_driven) AS min_km_driven,
    MAX(km_driven) AS max_km_driven
FROM cars_data;

--  average price based ranges of kilometres_driven
SELECT
    FLOOR(km_driven / 10000) * 10000 AS km_range_start,
    FLOOR(km_driven / 10000) * 10000 + 9999 AS km_range_end,
    AVG(selling_price) AS average_price
FROM cars_data
GROUP BY km_range_start, km_range_end
ORDER BY km_range_start;

select distinct seller_type
from cars_data;

-- distribution of cars based on seller_type

select seller_type,count(*) as total_count
from cars_data
group by seller_type;

-- maximum price based on each seller_type

select seller_type,max(selling_price)
from cars_data
group by seller_type;


















