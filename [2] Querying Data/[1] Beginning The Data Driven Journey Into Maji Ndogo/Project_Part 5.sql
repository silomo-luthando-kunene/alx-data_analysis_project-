-- Task 1 
SELECT * 
FROM md_water_services.well_pollution
WHERE biological > 0.01 AND results = 'Clean' -- AND description LIKE 'Clean Bacteria:%'
LIMIT 5;
-- Task 2
SELECT * 
FROM md_water_services.well_pollution
WHERE biological > 0.01 AND results = 'Clean' AND description LIKE 'Clean%';

-- Task 3: Changing description and results columns for rows that are clean but biologically unclean for all biologica . 0.01
UPDATE md_water_services.well_pollution
SET description = 'Bacteria: Giardia Lamblia', results = 'Contaminated: Biological'
WHERE description = 'Clean Bacteria: Giardia Lamblia' AND results = 'Clean' AND biological > 0.01;

UPDATE md_water_services.well_pollution
SET description = 'Bacteria: E Coli',
    results = 'Contaminated: Biological'
WHERE description = 'Clean Bacteria: E. coli'
AND results = 'Clean'
AND biological > 0.01;

-- Task 4: 