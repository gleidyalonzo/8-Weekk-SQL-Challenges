-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Create the table
CREATE TABLE TemperatureRecords (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

-- Insert the records
INSERT INTO TemperatureRecords (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

-- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

--Return the result table in any order.

SELECT t1.id
FROM TemperatureRecords t1
WHERE t1.temperature > (
    SELECT t2.temperature
    FROM TemperatureRecords t2
    WHERE t2.recordDate = DATE_SUB(t1.recordDate, INTERVAL 1 DAY)
);