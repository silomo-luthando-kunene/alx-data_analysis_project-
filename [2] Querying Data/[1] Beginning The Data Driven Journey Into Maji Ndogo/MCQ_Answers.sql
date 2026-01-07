-- Question 1
SELECT *
FROM md_water_services.employee
WHERE employee_name = 'Bello Azibo';
-- Question 2
SELECT *
FROM md_water_services.employee
WHERE position LIKE 'Micro%';
-- Question 3
SELECT *
FROM md_water_services.water_source
WHERE number_of_people_served >= 3998;
-- Question 4
SELECT *
FROM md_water_services.data_dictionary
WHERE column_name = 'pop_n';
SELECT *
FROM md_water_services.global_water_access
WHERE name LIKE '%NDOGO';
-- Question 5
SELECT *
FROM md_water_services.employee
WHERE position = 'Civil Engineer' AND (province_name = 'Dahabu' OR address LIKE '%Avenue%');
-- Question 6
-- The employee’s phone number contained the digits 86 or 11.  The employee’s last name started with either an A or an M.  The employee was a Field Surveyor.
SELECT *
FROM md_water_services.employee
WHERE (phone_number LIKE '%86%' OR phone_number LIKE '%11%')
OR (employee_name LIKE 'A%' OR employee_name LIKE 'M%')
AND position = 'Field Surveyor';
-- Question 7
SELECT *
FROM md_water_services.well_pollution
WHERE description LIKE 'Clean_%' OR results = 'Clean' AND biological < 0.01; 
-- Question 8
SELECT * 
FROM md_water_services.water_quality 
WHERE visit_count >= 2 AND subjective_quality_score = 10;
-- Question 9 
CREATE TABLE md_water_services.employee_copy
AS (
     SELECT * 
     FROM md_water_services.employee
	);
-- Changing values in the copy of the employee table
UPDATE md_water_services.employee_copy
SET phone_number = '+99643864786'
WHERE employee_name = 'Bello Azibo';
-- Question 10
SELECT * 
FROM md_water_services.well_pollution
WHERE description
IN ('Parasite: Cryptosporidium', 'biologically contaminated')
OR (results = 'Clean' AND biological > 0.01);