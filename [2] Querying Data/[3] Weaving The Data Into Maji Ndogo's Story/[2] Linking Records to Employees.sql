SELECT
    auditor_report.location_id AS location_id,
    auditor_report.true_water_source_score AS auditor_score,
	visits.record_id,
    water_quality.subjective_quality_score AS surveyor_score,
	visits.assigned_employee_id AS employee_id,
	employee.employee_name AS employee
    
FROM
    auditor_report

JOIN visits ON auditor_report.location_id = visits.location_id
JOIN water_quality ON visits.record_id = water_quality.record_id
JOIN employee ON visits.assigned_employee_id = employee.assigned_employee_id

WHERE 
	auditor_report.true_water_source_score <> water_quality.subjective_quality_score AND
	visits.visit_count = 1

LIMIT 10000;

-- COmmon Table Expression for this query
With incorrect_records AS (
	SELECT
		auditor_report.location_id AS location_id,
		auditor_report.true_water_source_score AS auditor_score,
		visits.record_id,
		water_quality.subjective_quality_score AS surveyor_score,
		visits.assigned_employee_id AS employee_id,
		employee.employee_name AS employee
    
	FROM
		auditor_report

	JOIN visits ON auditor_report.location_id = visits.location_id
	JOIN water_quality ON visits.record_id = water_quality.record_id
	JOIN employee ON visits.assigned_employee_id = employee.assigned_employee_id

	WHERE 
		auditor_report.true_water_source_score <> water_quality.subjective_quality_score AND
		visits.visit_count = 1
)
SELECT 
	employee,
    COUNT(employee) AS employee_count

FROM 
	incorrect_records
GROUP BY 
	employee
ORDER BY
	employee_count DESC
LIMIT 10000;

