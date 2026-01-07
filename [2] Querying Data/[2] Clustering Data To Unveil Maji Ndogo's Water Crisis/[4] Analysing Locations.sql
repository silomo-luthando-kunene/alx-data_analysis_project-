SELECT * 
FROM md_water_services.location;

-- Number of records per town
SELECT 
	town_name,
    COUNT(location_id) AS record_per_town
FROM 
	md_water_services.location	
GROUP BY
	town_name
ORDER BY 
	record_per_town DESC;
-- Number of records per province
SELECT 
	province_name,
    COUNT(location_id) AS records_per_province
FROM 
	md_water_services.location
GROUP BY
	province_name
ORDER BY 
	records_per_province DESC;
--  records per province and towns
SELECT 
	province_name,
    town_name,
    COUNT(location_id) AS records_per_town
FROM 
	md_water_services.location
GROUP BY 
	province_name, town_name
ORDER BY 
	province_name, town_name DESC;
-- Number of records per location type
SELECT
	location_type,
    COUNT(location_id) AS num_sources
FROM 
	md_water_services.location
GROUP BY 
	location_type
ORDER BY 
	location_type ASC;
-- Percentage of Location Types
SELECT 
23740 / (15910 + 23740) * 100 AS Rural_Percentage,
15910 / (15910 + 23740) * 100 AS Urban_Percentage;
SELECT
    employee_name,
    town_name,
    province_name,
    RANK() OVER (PARTITION BY town_name ORDER BY employee_name) AS number_of_people
FROM
    md_water_services.employee
WHERE
	town_name = 'Harare';
	-- town_name = 'Harare';