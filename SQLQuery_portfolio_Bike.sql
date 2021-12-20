--CREATE TABLE dbo.Duration  
--    (startDate datetime2, endDate datetime2);  
    
--INSERT INTO dbo.Duration(startDate, endDate)  
--    VALUES ('2007-05-06 12:10:09', '2007-05-07 12:10:09');  
    
--SELECT DATEDIFF(day, startDate, endDate) AS 'Duration'  
--    FROM dbo.Duration;  
-- Returns: 1

------------------------

SELECT DATEDIFF(MINUTE, started_at, ended_at) AS Duration_in_minutes  
FROM [dbo].[202004-divvy-tripdata];

-------------------------
-- SET DATEFIRST to U.S. English default value of 7.  
SET DATEFIRST 1;  
  
SELECT DATEPART(DW, started_at) as Day_of_week FROM [dbo].[202004-divvy-tripdata]; 

--------------------------
-- How to drop a column in an existing table

ALTER TABLE [dbo].[202004-divvy-tripdata] DROP COLUMN Duration_in_minutes;

--------------------------

ALTER TABLE [dbo].[202004-divvy-tripdata] ADD Duration_in_minutes INT NULL;

-----------
-- Added duration in mins for each trip

UPDATE [dbo].[202004-divvy-tripdata]
SET Duration_in_minutes = DATEDIFF(MINUTE, started_at, ended_at) FROM [dbo].[202004-divvy-tripdata]

--------------------------------

ALTER TABLE [dbo].[202004-divvy-tripdata] ADD Day_of_week INT;

---------------------------------
-- Sunday begins at '1'

UPDATE [dbo].[202004-divvy-tripdata]
SET Day_of_week = DATEPART(DW, started_at) FROM [dbo].[202004-divvy-tripdata]; 

---------------------------------
---------------------------------

-- Total avg ride time for members in mins

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member';
 
---------------------------------
-- Total avg ride time for casual in mins

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual';



-- Total sum ride time for members in mins

SELECT SUM(Duration_in_minutes) AS 'Total sum member ride time in mins'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member';


-- Total sum ride time for casual in mins

SELECT SUM(Duration_in_minutes) AS 'Total sum casual ride time in mins'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual';


---------------------------------
-- Total avg ride time for members riders in mins for Mondays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Mondays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 2;


---------------------------------
-- Total avg ride time for casual riders in mins for Mondays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Mondays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 2;

---------------------------------
-- Total avg ride time for members riders in mins for Tuesdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Tuesdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 3;


---------------------------------
-- Total avg ride time for casual riders in mins for Tuesdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Tuesdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 3;


---------------------------------
-- Total avg ride time for members riders in mins for Wednesdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Wednesdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 4;


---------------------------------
-- Total avg ride time for casual riders in mins for Wednesdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Wednesdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 4;


---------------------------------
-- Total avg ride time for members riders in mins for Thursdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Thursdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 5;


---------------------------------
-- Total avg ride time for casual riders in mins for Thursdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Thursdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 5;

---------------------------------
-- Total avg ride time for members riders in mins for Fridays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Fridays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 6;


---------------------------------
-- Total avg ride time for casual riders in mins for Fridays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Fridays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 6;

---------------------------------
-- Total avg ride time for members riders in mins for Saturdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Saturdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 7;


---------------------------------
-- Total avg ride time for casual riders in mins for Saturdays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Saturdays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 7;

---------------------------------
-- Total avg ride time for members riders in mins for Sundays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average member ride time in mins on Sundays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'member' and Day_of_week = 1;


---------------------------------
-- Total avg ride time for casual riders in mins for Sundays (Sunday is "1")

SELECT AVG(Duration_in_minutes) AS 'Total average casual ride time in mins on Sundays'
FROM [dbo].[202004-divvy-tripdata] 
WHERE member_casual = 'casual' and Day_of_week = 1;