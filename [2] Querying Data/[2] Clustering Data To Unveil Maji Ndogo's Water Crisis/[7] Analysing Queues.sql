/*
Ok, these are some of the things I think are worth looking at:
1. How long did the survey take?
2. What is the average total queue time for water?
3. What is the average queue time on different days?
4. How can we communicate this information efficiently?
*/
-- 1. How long did the survey take?
SELECT
    MAX(time_of_record) AS last_day,
	MIN(time_of_record) AS first_day,
	TIMESTAMPDIFF(DAY, MIN(time_of_record), MAX(time_of_record)) AS time_period
FROM 
	md_water_services.visits;
-- 2. What is the average total queue time for water?
SELECT 
	MIN(time_in_queue) AS min_waiting_time,
    MAX(time_in_queue) AS max_waiting_time,
    ROUND(AVG(NULLIF(time_in_queue, 0)), 0) AS avg_waiting_time
FROM 
	md_water_services.visits;
-- 3. What is the average queue time on different days?
SELECT 
	DAYNAME(TIMESTAMP(time_of_record)) AS day_of_week,
    ROUND(AVG(IFNULL(time_in_queue, 0)),0) AS avg_queue_time
FROM 
	md_water_services.visits
GROUP BY 
	day_of_week
ORDER BY
	avg_queue_time DESC;
-- 4. How can we communicate this information efficiently?
SELECT
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
ROUND(AVG(
	CASE
	WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
	ELSE NULL
END
	),0) AS Sunday,
-- Monday
ROUND(AVG(
	CASE
	WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
	ELSE NULL
END
	),0) AS Monday
-- Tuesday
-- Wednesday
FROM
	visits
WHERE
	time_in_queue != 0 -- this excludes other sources with 0 queue times
GROUP BY
	hour_of_day
ORDER BY
	hour_of_day;
-- 
SELECT
    TIME_FORMAT(TIME(time_of_record), '%H:%i') AS hour_of_day,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue ELSE NULL END), 0) AS Sunday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue ELSE NULL END), 0) AS Monday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue ELSE NULL END), 0) AS Tuesday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue ELSE NULL END), 0) AS Wednesday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue ELSE NULL END), 0) AS Thursday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue ELSE NULL END), 0) AS Friday,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue ELSE NULL END), 0) AS Saturday
FROM
    visits
WHERE
    time_in_queue != 0
GROUP BY
    hour_of_day
ORDER BY
    hour_of_day;
/*Use the pivot table we created to answer the following question. What are the average queue times for the following times?
1. Saturday from 12:00 to 13:00
2. Tuesday from 18:00 to 19:00
3. Sunday from 09:00 to 10:00
*/ 
SELECT
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Sunday' AND HOUR(time_of_record) BETWEEN 9 AND 10 THEN time_in_queue ELSE NULL END), 0) AS Sunday_09_10,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Tuesday' AND HOUR(time_of_record) BETWEEN 18 AND 19 THEN time_in_queue ELSE NULL END), 0) AS Tuesday_18_19,
    ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Saturday' AND HOUR(time_of_record) BETWEEN 12 AND 13 THEN time_in_queue ELSE NULL END), 0) AS Saturday_12_13
FROM
    visits
WHERE
    time_in_queue != 0;