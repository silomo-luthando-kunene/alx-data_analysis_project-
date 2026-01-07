SELECT * FROM md_water_services.water_source;
/*
1. How many people did we survey in total?
2. How many wells, taps and rivers are there?
3. How many people share particular types of water sources on average?
4. How many people are getting water from each type of source?
*/
-- 1. How many people did we survey in total?
SELECT 
	SUM(number_of_people_served) AS total_served
FROM 
	md_water_services.water_source;    
-- 2. How many wells, taps and rivers are there?
SELECT 
    type_of_water_source,
    COUNT(type_of_water_source) AS number_of_water_source
FROM 
	md_water_services.water_source
GROUP BY 
	type_of_water_source
ORDER BY
	number_of_water_source DESC;
-- 3. How many people share particular types of water sources on average?
SELECT 
	type_of_water_source,
    SUM(number_of_people_served) AS total_served,
	ROUND(AVG(number_of_people_served),0) AS avg_per_water_source
FROM 
	md_water_services.water_source
GROUP BY 
	type_of_water_source
ORDER BY
	avg_per_water_source DESC;
-- 4. How many people are getting water from each type of source?
SELECT 
	type_of_water_source,
    SUM(number_of_people_served) AS total_served,
    ROUND(SUM(number_of_people_served) / 270000, 0) AS percentage_total_served
FROM 
	md_water_services.water_source
GROUP BY 
	type_of_water_source
ORDER BY
	total_served DESC;
-- 