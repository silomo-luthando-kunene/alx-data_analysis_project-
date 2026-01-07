-- Employee Error Count
With error_count AS (
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
	error_count
GROUP BY 
	employee
ORDER BY
	employee ASC
LIMIT 10000;

-- Average mistakes per employee  avg_error_count_per_empl,
With error_count AS (
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
     COUNT(*) AS employee_count,
    AVG(COUNT(*)) OVER () AS avg_employee_count
FROM
    error_count
GROUP BY
    employee
ORDER BY
    employee ASC
LIMIT 10000;

-- . Finaly we have to compare each employee's error_count with avg_error_count_per_empl
With suspect_list AS (
	SELECT
		auditor_report.location_id AS location_id,
		auditor_report.true_water_source_score AS auditor_score,
		visits.record_id,
		water_quality.subjective_quality_score AS surveyor_score,
		visits.assigned_employee_id AS employee_id,
		employee.employee_name AS employee,
        auditor_report.statements AS statements
    
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
	COUNT(*) AS employee_count,
    AVG(COUNT(*)) OVER () AS avg_employee_count
FROM
    suspect_list
GROUP BY
    employee
ORDER BY
    employee_count DESC
LIMIT 10000;

-- Changing Incorrect Reords into a VIEW
CREATE VIEW incorrect_records AS (
	SELECT
		auditor_report.location_id AS location_id,
		auditor_report.true_water_source_score AS auditor_score,
		visits.record_id,
		water_quality.subjective_quality_score AS surveyor_score,
		visits.assigned_employee_id AS employee_id,
		employee.employee_name AS employee,
		auditor_report.statements AS statements
	FROM
		auditor_report

	JOIN visits ON auditor_report.location_id = visits.location_id
	JOIN water_quality ON visits.record_id = water_quality.record_id
	JOIN employee ON visits.assigned_employee_id = employee.assigned_employee_id

	WHERE 
		auditor_report.true_water_source_score <> water_quality.subjective_quality_score AND
		visits.visit_count = 1
);

SELECT 
	*
FROM 
	incorrect_records;
    
-- Next, we convert the query error_count, we made earlier, into a CTE
CREATE VIEW error_count AS
WITH error_count AS (
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
    COUNT(*) AS employee_count,
    AVG(COUNT(*)) OVER () AS average_mistakes
FROM
    error_count
GROUP BY
    employee
ORDER BY
    employee ASC;
-- Call CTE function
SELECT 
* 
FROM 
	error_count
ORDER BY
	employee_count DESC
LIMIT 
	5;
-- First, convert the suspect_list to a CTE, so we can use it to filter the records from these four employees
WITH suspect_list AS (
    SELECT
        auditor_report.location_id AS location_id,
        auditor_report.true_water_source_score AS auditor_score,
        visits.record_id,
        water_quality.subjective_quality_score AS surveyor_score,
        visits.assigned_employee_id AS employee_id,
        employee.employee_name AS employee,
        auditor_report.statements AS statements
    FROM
        auditor_report
    JOIN visits ON auditor_report.location_id = visits.location_id
    JOIN water_quality ON visits.record_id = water_quality.record_id
    JOIN employee ON visits.assigned_employee_id = employee.assigned_employee_id
    WHERE
        auditor_report.true_water_source_score <> water_quality.subjective_quality_score AND
        visits.visit_count = 1
),
result_set AS (
    SELECT
        employee,
        COUNT(*) AS employee_count,
        AVG(COUNT(*)) OVER () AS avg_employee_count
    FROM
        suspect_list
    GROUP BY
        employee
    ORDER BY
        employee_count DESC
    LIMIT 5
)
SELECT * FROM result_set;

-- Add statements to the column of the incorrect_records table
SELECT 
	employee,
    location_id,
    statements
FROM 
	incorrect_records
ORDER BY
	employee ASC;
    
-- CODE FROM MAJI NDOGO Exercise_Last Part

WITH error_count AS ( -- This CTE calculates the number of mistakes each employee made
	SELECT
		employee,
		COUNT(employee) AS employee_count
	FROM
		incorrect_records
	
/* Incorrect_records is a view that joins the audit report to the database
for records where the auditor and
employees scores are different */
	
    GROUP BY
		employee),
		suspect_list AS (-- This CTE SELECTS the employees with above−average mistakes
	SELECT
		employee,
		employee_count
	FROM
		error_count
	WHERE
		employee_count > (SELECT AVG(employee_count) FROM error_count))
-- This query filters all of the records where the "corrupt" employees gathered data.
SELECT
	employee,
	location_id,
	statements
FROM
	incorrect_records
WHERE
	employee IN (SELECT employee FROM suspect_list)
    AND 
    statements LIKE '%Suspicion colored villagers%'
ORDER BY 
	location_id ASC;