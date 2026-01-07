-- Join Tables Visits and Location and Water Source
SELECT 
location.town_name,
location.province_name,
visits.visit_count,
visits.location_id,
water_source.type_of_water_source,
water_source.number_of_people_served,
location.location_type, 
visits.time_in_queue
FROM
	visits
JOIN 
	location 
ON 
	location.location_id = visits.location_id
JOIN
	water_source
ON
	water_source.source_id = visits.source_id
WHERE 
	visits.visit_count = 1
ORDER BY 
	location_id ASC
LIMIT 
	10000;
-- ! Now we need to grab the results from the well_pollution table
SELECT
water_source.type_of_water_source,
location.town_name,
location.province_name,
location.location_type,
water_source.number_of_people_served,
visits.time_in_queue,
well_pollution.results
FROM
visits
LEFT JOIN
well_pollution
ON well_pollution.source_id = visits.source_id
INNER JOIN
location
ON location.location_id = visits.location_id
INNER JOIN
water_source
ON water_source.source_id = visits.source_id
WHERE
visits.visit_count = 1;

--   CREATE a VIEW: Combined Analysis Table
CREATE VIEW combined_analysis_table AS

/* This view assembles data from different tables into one to simplify analysis*/

	SELECT
		water_source.type_of_water_source AS source_type,
		location.town_name,
		location.province_name,
		location.location_type,
		water_source.number_of_people_served AS people_served,
		visits.time_in_queue,
		well_pollution.results
	FROM
		visits
LEFT JOIN
	well_pollution
ON 
	well_pollution.source_id = visits.source_id
INNER JOIN
	location
ON 
	location.location_id = visits.location_id
INNER JOIN
	water_source
ON 
	water_source.source_id = visits.source_id
WHERE
visits.visit_count = 1;
 
 -- Call combined_analysis_table VIEW
 SELECT 
	*
 FROM 
	combined_analysis_table;