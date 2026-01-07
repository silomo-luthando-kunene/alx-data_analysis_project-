SELECT CONCAT(day(time_of_record), " ", monthname(time_of_record), " ", year(time_of_record)) FROM md_water_services.visits;
SELECT CONCAT(day(time_of_record), " ", month(time_of_record), " ", year(time_of_record)) FROM md_water_services.visits;
SELECT day(time_of_record), monthname(time_of_record), year(time_of_record) FROM visits;
SELECT CONCAT(monthname(time_of_record), " ", day(time_of_record), ", ", year(time_of_record)) FROM visits;