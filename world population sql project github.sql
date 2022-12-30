-- creating world_population data base
create database world_population;
use world_population;
drop table if exists population;
-- creating a table population
create table population(
county_rank int,
cca varchar(8),
country varchar(30),
capital varchar(30),
continent varchar(30),
population_2022 int,
population_2020 int,
population_2015 int,
population_2010 int,
population_2000 int,
population_1990 int,
population_1980 int,
population_1970 int,
area float,
density float,
growth_rate float,
population_percentage float
);
use world_population;
-- displaying all details of the population table
select* from population;
-- country and its rank in world population
select country,county_rank from population;
-- top 3 highly populated countries
select country,population_percentage from population
order by population_percentage desc
limit 3;
-- continent wise population percentage
select continent, sum(population_percentage)from population
group by (continent)
order by sum(population_percentage) desc;
-- population percentage of each country
select area,county_rank,country, population_percentage from population
order by population_percentage desc;
-- analysis to establish the area impacts the population growth rate
select area,growth_rate,country from population
order by area desc;
-- data analysis to establish if there is a relation between the area and country rank
select county_rank,country,area from population
order by county_rank;
-- highest population increase percentage from 2020 to 2022
select country,population_2020,population_2022,((population_2022-population_2020)/population_2020)*100 as pop_increase from population
order by pop_increase desc;
-- top 5 countries with highest growth rate
select county_rank,country,growth_rate from population
order by growth_rate desc
limit 5;
-- Top 10 countries where population is more than 100 million in 2022
use world_population;
select country,population_2022 from population
where population_2022>=100000000
order by population_2022 desc
limit 10;
-- country with lowest population
select country,population_2022 as country_lowest_population from population 
where population_2022<=810
order by population_2022 desc;
-- country wise percentage change analysis from 1970 to 2010
select country, ((population_1980-population_1970)/population_1970)*100 as pop_incrse1970to1980,
((population_1990-population_1980)/population_1980)*100 as pop_incrse1980to1990,
((population_2000-population_1990)/population_1990)*100 as pop_incrse1990to2000,
((population_2010-population_2000)/population_2000)*100 as pop_incrse2000to2010
from population;

