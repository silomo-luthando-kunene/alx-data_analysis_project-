-- Number of people per town
SELECT
    md_water_services.employee.town_name,
    COUNT(md_water_services.employee.employee_name) AS number_per_town
FROM
    md_water_services.employee
GROUP BY
	md_water_services.employee.town_name;
    
-- Number of hospital record visits per employee assigned ID
-- COLUMNS: assigned_employee_id AND visit_count
SELECT
    md_water_services.visits.assigned_employee_id,
	COUNT(md_water_services.visits.visit_count) AS total_number_of_visits_per_employee
FROM 
	md_water_services.visits
GROUP BY 
    md_water_services.visits.assigned_employee_id
    LIMIT 4;

-- Columns with names, email addresses and phone numbers for our top 4 employees_ids
-- Show results of employee visits per employee id - top 4 
-- assigned_employee_id (top 4): 1099, 3708, 2033, 3420 Descedning Order.
SELECT
    md_water_services.employee.email,
    md_water_services.employee.phone_number,
    md_water_services.employee.employee_name,
    md_water_services.employee.assigned_employee_id,
    md_water_services.visits.assigned_employee_id,
    COUNT(*) AS total_number_of_visits_per_employee
FROM
    md_water_services.visits
JOIN
    md_water_services.employee ON md_water_services.visits.assigned_employee_id = md_water_services.employee.assigned_employee_id  -- Join on matching ID
GROUP BY
    md_water_services.visits.assigned_employee_id
/*HAVING
    total_number_of_visits_per_employee IN (1099, 2033, 3708)*/
ORDER BY
    total_number_of_visits_per_employee ASC  -- Optional: Order by total visits (descending);