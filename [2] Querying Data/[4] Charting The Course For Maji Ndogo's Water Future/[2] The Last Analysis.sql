-- Common Table Expression: Province Totals to return people served per province per water source
WITH province_totals AS (-- This CTE calculates the population of each province
	SELECT
		province_name,
		SUM(people_served) AS total_ppl_serv
	FROM
		combined_analysis_table
	GROUP BY
		province_name
)
SELECT
	ct.province_name,
-- These case statements create columns for each type of source.
-- The results are aggregated and percentages are calculated

	ROUND((SUM(CASE WHEN source_type = 'river'
	THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS river,
	ROUND((SUM(CASE WHEN source_type = 'shared_tap'
	THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS shared_tap,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
	THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
	THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home_broken,
	ROUND((SUM(CASE WHEN source_type = 'well'
	THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS well
FROM
	combined_analysis_table ct
JOIN
	province_totals pt 
ON 
	ct.province_name = pt.province_name
GROUP BY
	ct.province_name
ORDER BY
	ct.province_name;
    
-- CALLING THE CTE
SELECT
	*
FROM
	province_totals;

-- Aggregating Results by TOWN
WITH town_totals AS (/* This CTE calculates the population of each town
−− Since there are two Harare towns, we have to group by province_name and town_name*/
	SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
	FROM combined_analysis_table
	GROUP BY province_name,town_name
)
SELECT
	ct.province_name,
	ct.town_name,
	ROUND((SUM(CASE WHEN source_type = 'river'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
	ROUND((SUM(CASE WHEN source_type = 'shared_tap'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
	ROUND((SUM(CASE WHEN source_type = 'well'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM
	combined_analysis_table ct
JOIN /* Since the town names are not unique, we have to join on a composite key*/
	town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY /* We group by province first, then by town.*/
	ct.province_name,
	ct.town_name
ORDER BY
	ct.town_name;

-- cREATE tOWN aGGREGATED wATER aCCESS sURVEY

CREATE TEMPORARY TABLE town_aggregated_water_access
WITH town_totals AS (/* This CTE calculates the population of each town
−− Since there are two Harare towns, we have to group by province_name and town_name*/
	SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
	FROM combined_analysis_table
	GROUP BY province_name,town_name
)
SELECT
	ct.province_name,
	ct.town_name,
	ROUND((SUM(CASE WHEN source_type = 'river'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
	ROUND((SUM(CASE WHEN source_type = 'shared_tap'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
	ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
	ROUND((SUM(CASE WHEN source_type = 'well'
	THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM
	combined_analysis_table ct
JOIN /* Since the town names are not unique, we have to join on a composite key*/
	town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY /* We group by province first, then by town.*/
	ct.province_name,
	ct.town_name
ORDER BY
	ct.town_name
    AND river DESC;

-- Call Temp Table with river column DESC    
SELECT
	*
FROM
	town_aggregated_water_access
ORDER BY
	river DESC;
    
-- data sorted by province name
SELECT
	*
FROM
	town_aggregated_water_access
ORDER BY
	province_name ASC;
    
-- which town has the highest ratio of people who have taps, but have no running water?
SELECT
	province_name,
	town_name,
	ROUND(tap_in_home_broken / (tap_in_home_broken + tap_in_home) *
	100,0) AS Pct_broken_taps
FROM
	town_aggregated_water_access
ORDER BY
	town_name ASC;
    
-- 