CREATE TABLE md_water_services.well_pollution_copy
AS (
     SELECT * 
     FROM md_water_services.well_pollution
	);

-- Show Created Table 
SELECT *
FROM md_water_services.well_pollution_copy;

-- Update Description and Results columns

UPDATE md_water_services.well_pollution_copy
SET description = 'Bacteria: Giardia Lamblia', results = 'Contaminated: Biological'
WHERE description = 'Clean Bacteria: Giardia Lamblia' AND results = 'Clean' AND biological > 0.01;

UPDATE md_water_services.well_pollution_copy
SET description = 'Bacteria: E Coli',
    results = 'Contaminated: Biological'
WHERE description = 'Clean Bacteria: E. coli'
AND results = 'Clean'
AND biological > 0.01;
