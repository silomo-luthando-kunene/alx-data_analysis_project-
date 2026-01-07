-- Part 2: Dive Into The Water Source

-- Task 1
SELECT* 
FROM md_water_services.data_dictionary
WHERE column_name = 'type_of_water_source'; -- or 'source_id' 

-- Task 2
SELECT DISTINCT type_of_water_source
FROM md_water_services.water_source
 
 -- Task 3
 