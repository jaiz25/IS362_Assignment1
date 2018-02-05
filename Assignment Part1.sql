-- Part 1
-- 1.  How many airplanes have listed speeds? What is the minimum listed
--     speed and maximum listed speed?

SELECT COUNT(speed), MIN(speed), MAX(speed)
FROM planes
WHERE speed IS NOT NULL;

-- 2. What is the total distance flown by all of the planes in
--    January 2013?  What is the total distance flown by all of
--    the planes in January 2013 where the tailnum is missing?

SELECT SUM(distance)
FROM flights
WHERE year = 2013 and month = 1;

SELECT SUM(distance)
FROM flights
WHERE year = 2013 and month = 1 and tailnum IS NULL;

-- 3. What is the total distance flown for all planes on July 5,
--    2013 grouped by aircraft manufacturer?

-- INNER JOIN

SELECT SUM(flights.distance), planes.manufacturer
FROM flights INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = 2013 and flights.month = 7 and flights.day = 5
GROUP BY planes.manufacturer ASC;

-- LEFT OUTER JOIN

SELECT SUM(flights.distance), planes.manufacturer
FROM flights LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = 2013 and flights.month = 7 and flights.day = 5
GROUP BY planes.manufacturer ASC;

-- How do your results compare?
-- The left outer join result had an additional row added.  An inner join finds
-- and returns matching data from tables, while an outer join finds and returns
-- matching data and some dissmilar data from tables.

-- 4. Write and answer at least one question of your own choosing that joins
--    information from at least three of the tables in the flights database.

-- Which airline flew the most from JFK with a turbo-jet engine?

SELECT COUNT(flights.origin), airlines.name
FROM flights INNER JOIN airlines
ON flights.carrier = airlines.carrier
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.origin = 'JFK' and planes.engine = 'Turbo-jet'
GROUP BY airlines.name ASC

-- Answer:  Delta Air Lines Inc.
