create schema cars;
use cars ;
select * from cars.`car dekh`;
SELECT * FROM cars.`car dekho`;
-- the manager asked the employee the total number of data (cars) -- 
select count(*) from  cars.`car dekho`;
-- the manager asked the employee how many cars are available in 2023--
select count(*) from cars.`car dekho` where year = 2023;
-- the manager asked the employee how many cars are available in 2020 2021 2022--
select count(*) from cars.`car dekho` where year = 2020 or year= 2021
or year = 2022;
-- group by-- 
select count(*) from cars.`car dekho`where year in (2020,2021,2022)
group by year;
-- client asked me to print the total of all cars by year, I don't want to see all the detail--
select year , count(*) from cars.`car dekho` group by year;
-- client asked to car dealer how many deisel cars will be there in 2020?--
select count(*) from cars.`car dekho` where year=2020 and fuel= "DIESEL";
-- client requested car dealer how many perol cars will bw there in the year 2020 ?--
select count(*) from cars.`car dekho` where year= 2020 and fuel= "Petrol" ;
-- the manager told the employee to give a print to all the fuel cars('petrol','deisel' and'cng') come by year --
select year ,count(*) from cars.`car dekho` where fuel ="CNG" group by year;
select year ,count(*) from cars.`car dekho` where fuel ="Petrol" group by year;
select year ,count(*) from cars.`car dekho` where fuel ="Dielsel" group by year;
-- manager said that there were more than 100 cars in a year , which year has more than 100 cars?--
select year, count(*) from cars.`car dekho` group by year having count(*) > 100 ;
select year , count(*) from cars.`car dekho` group by year having count(*) >100;
-- the manager asked the employee to show all cars count details between 2015 and 2023; we need a complete list --
select count(*) from cars.`car dekho` where year>=2015;
-- or -- 
select count(*) from cars.`car dekho` where year between 2015 and 2023;
-- the manager said the employee all car details between 2015 to 2023 . we need complete list--
select * from cars.`car dekho` where year between 2015 and 2023 group by year ;

        -- END--