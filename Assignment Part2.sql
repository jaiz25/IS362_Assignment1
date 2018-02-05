-- Part 2
-- Average monthly departure delay across the 3 NY airports

SELECT month, AVG(dep_delay)
FROM flights
WHERE origin = 'JFK' or origin = 'LGA' or origin = 'EWR'
GROUP BY month ASC;
