-- Chechking if the appending formula 
SELECT 
     CONCAT(LOWER(REPLACE(employee_name, '.', '.')), '@ndogowater.gov') AS new_mail
FROM md_water_services.employee;

-- Changing a column in a table 
UPDATE md_water_services.employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ',', '.')), '@ndogowater.gov');

-- Seeing the data
SELECT * 
FROM md_water_services.employee;

-- Checking the length of characters in column
SELECT
	LENGTH(phone_number)
FROM md_water_services.employee;

-- Removing characters from a column
UPDATE md_water_services.employee
SET phone_number = REPLACE(phone_number, ' ', '');
SELECT 
	LENGTH (phone_number)
FROM md_water_services.employee;

-- Show Table
SELECT *
FROM md_water_services.employee;