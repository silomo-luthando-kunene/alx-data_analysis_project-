-- Part 3: Unpack the visits to the water source

-- Part 1
SELECT * 
FROM md_water_services.visits
WHERE time_in_queue > 500

-- Part 2
SELECT * 
FROM md_water_services.visits
WHERE time_in_queue = 0

-- Part 2
SELECT * 
FROM md_water_services.water_source
WHERE source_id IN ('KiRu28935224', 'AkLu01628224', 'AkRu05234224', 'KiRu28520224', 'HaZa21742224', 'AmDa12214224');