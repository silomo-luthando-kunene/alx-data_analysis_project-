-- Showing t location and score columns
SELECT 
	location_id,
    true_water_source_score
FROM 
md_water_services.auditor_report
ORDER BY 
	location_id ASC;
    
-- Joining tables: visits and auditor_report on location_id
SELECT
auditor_report.location_id AS audit_location,
auditor_report.true_water_source_score,
visits.location_id AS visit_location,
visits.record_id
FROM
auditor_report
JOIN visits ON auditor_report.location_id = visits.location_id AND visits.visit_count = 1
ORDER BY
	audit_location ASC
LIMIT 10000;
-- Add visits table water quality table

SELECT
    auditor_report.location_id AS location_id,
    auditor_report.true_water_source_score AS auditor_score,
	    visits.record_id,
    water_quality.subjective_quality_score AS surveyor_score
FROM
    auditor_report
JOIN visits ON auditor_report.location_id = visits.location_id
JOIN water_quality ON visits.record_id = water_quality.record_id
WHERE 
	auditor_report.true_water_source_score <> water_quality.subjective_quality_score AND
	visits.visit_count = 1

LIMIT 10000;