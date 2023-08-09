-- create database cars;

use cars;
show tables;

select * from cars_data;

desc cars_data;

-- read the cars data

select *
from cars_data;

-- total count of cars in the data

select count(*) as total_cars
from cars_data;

-- How many cars will be available in 2023?

select *
from cars_data
where year=2023;

select count(*)
from cars_data
where year=2023;

-- How many cars would be available in 2020,2021,2022

select year , count(*) as total_car
from cars_data
where year in (2020,2021,2022)
group by year;

-- To print the total cars of all years.

select year,count(*) as total
from cars_data
group by year;

-- How many diesel cars will be there in 2020

select year,count(*) as total_count
from cars_data
where fuel="Diesel" and year=2020
group by year;

-- How many Petrol cars will be there in 2020

select year,count(*) as total_count
from cars_data
where fuel="Petrol" and year=2020
group by year;

-- Group all the cars based on fuel type based on year

select distinct fuel
from cars_data;

select year,count(*) as count1
from cars_data
where fuel="Petrol"
group by year;

select year,count(*) as count1
from cars_data
where fuel="Diesel"
group by year;

select year,count(*) as count1
from cars_data
where fuel="Electric"
group by year;

select year,count(*) as count1
from cars_data
where fuel="CNG"
group by year;

select year,count(*) as count1
from cars_data
where fuel="PNG"
group by year;

-- Which year had more than other cars?

select * from cars_data;

select year,count(*) as count2
from cars_data
group by year
having count2>100;

select year,count(*) as count2
from cars_data
group by year
having count2<100;

-- car count list between 2015 and 2023

select count(*) as total_count
from cars_data
where year between 2015 and 2023;

-- car details between 2015 and 2023

select * 
from cars_data
where year between 2015 and 2023;
