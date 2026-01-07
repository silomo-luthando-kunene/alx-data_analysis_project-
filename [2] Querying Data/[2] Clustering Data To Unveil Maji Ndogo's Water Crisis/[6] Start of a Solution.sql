SELECT
    type_of_water_source,
    SUM(number_of_people_served) AS total_served,
    RANK() OVER (ORDER BY SUM(number_of_people_served) DESC) AS ranked_by_population
FROM
    md_water_services.water_source
GROUP BY
    type_of_water_source
ORDER BY
    ranked_by_population ASC;
/*
So create a query to do this, and keep these requirements in mind:
1. The sources within each type should be assigned a rank.
2. Limit the results to only improvable sources.
3. Think about how to partition, filter and order the results set.
4. Order the results to see the top of the list.
*/
SELECT 
	source_id,
    type_of_water_source,
    number_of_people_served,
    RANK() OVER (ORDER BY number_of_people_served DESC) AS priority_rank
FROM 
	md_water_services.water_source
GROUP BY
    source_id
ORDER BY
	number_of_people_served DESC;