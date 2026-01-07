-- CREATE Project Progress Table 
CREATE TABLE Project_progress (
	Project_id SERIAL PRIMARY KEY,
/* Project_id −− Unique key for sources in case we visit the same
source more than once in the future.
*/
	source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
/* source_id −− Each of the sources we want to improve should exist,
and should refer to the source table. This ensures data integrity.
*/
	Address VARCHAR(50), /* Street address */
	Town VARCHAR(30),
	Province VARCHAR(30),
	Source_type VARCHAR(50),
	Improvement VARCHAR(50), /* What the engineers should do at that place */
	Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
/* Source_status −− We want to limit the type of information engineers can give us, so we
limit Source_status.
− By DEFAULT all projects are in the "Backlog" which is like a TODO list.
− CHECK() ensures only those three options will be accepted. This helps to maintain clean data.
*/
	Date_of_completion DATE, /* Engineers will add this the day the source has been upgraded. */
	Comments TEXT /* Engineers can leave comments. We use a TEXT type that has no limit on char length */
);

-- Joining tables Visits, Location and Well Pollution to the Project Process table
SELECT
	md_water_services.location.address,
	md_water_services.location.town_name,
	md_water_services.location.province_name,
	md_water_services.water_source.source_id,
	water_source.type_of_water_source,
	md_water_services.well_pollution.results,
    md_water_services.visits.visit_count,
    md_water_services.visits.time_in_queue
FROM
	md_water_services.water_source
LEFT JOIN
	md_water_services.well_pollution 
ON 
	md_water_services.water_source.source_id = md_water_services.well_pollution.source_id
INNER JOIN
	md_water_services.visits 
ON 
	md_water_services.water_source.source_id = md_water_services.visits.source_id
INNER JOIN
	md_water_services.location 
ON 
	md_water_services.location.location_id = md_water_services.visits.location_id
WHERE
    md_water_services.visits.visit_count = 1
    AND (
        (md_water_services.water_source.type_of_water_source = 'shared_tap' AND md_water_services.visits.time_in_queue > 30)
        OR (md_water_services.water_source.type_of_water_source = 'well' AND md_water_services.well_pollution.results != 'Clean')
        OR md_water_services.water_source.type_of_water_source IN ('tap_in_home_broken', 'river')
    )
LIMIT 
	100000;
  
-- Updating the Project Progress Table with Improvements Column
INSERT INTO Project_progress (
    source_id,
    Address,
    Town,
    Province,
    Source_type,
    Improvement,
    Source_status
)
SELECT
    md_water_services.water_source.source_id,
    md_water_services.location.address,
    md_water_services.location.town_name,
    md_water_services.location.province_name,
    md_water_services.water_source.type_of_water_source,
    CASE
        WHEN md_water_services.well_pollution.results = 'Contaminated: Biological' THEN 'Install UV filter'
        WHEN md_water_services.well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO filter'
        WHEN md_water_services.water_source.type_of_water_source = 'river' THEN 'Drill well'
        WHEN md_water_services.water_source.type_of_water_source IN ('shared_tap' , 'tap_in_home') THEN CONCAT("Install ", FLOOR(md_water_services.visits.time_in_queue/30), " taps nearby")
        WHEN md_water_services.water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
        ELSE NULL
    END AS Improvement,
    'Backlog' AS Source_status
FROM
    md_water_services.water_source
LEFT JOIN
    md_water_services.well_pollution
ON
    md_water_services.water_source.source_id = md_water_services.well_pollution.source_id
INNER JOIN
    md_water_services.visits
ON
    md_water_services.water_source.source_id = md_water_services.visits.source_id
INNER JOIN
    md_water_services.location
ON
    md_water_services.location.location_id = md_water_services.visits.location_id
WHERE
    md_water_services.visits.visit_count = 1
    AND (
        (md_water_services.water_source.type_of_water_source = 'shared_tap' AND md_water_services.visits.time_in_queue > 30)
        OR (md_water_services.water_source.type_of_water_source = 'well' AND md_water_services.well_pollution.results != 'Clean')
        OR md_water_services.water_source.type_of_water_source IN ('tap_in_home_broken', 'river')
    )
LIMIT
    100000;
    
-- Updating Improvement Table case by case
