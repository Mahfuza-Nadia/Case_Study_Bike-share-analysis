-- ============================================================
-- CYCLISTIC BIKE-SHARE ANALYSIS
-- Analysis Queries
-- Data period: July 2025 - June 2026
-- Tool: Microsoft Access
-- ============================================================


-- ============================================================
-- 1. COMBINING MONTHLY DATASETS
-- ============================================================

-- Purpose:
-- Combine the 12 monthly tables into one dataset for analysis.

INSERT INTO Cyclistic_Trips
SELECT *
FROM Cyclistic_Aug2025;

-- The same structure was used for the remaining monthly tables.
-- The final combined dataset is qry_All_Rides.


-- ============================================================
-- 2. BASIC DATASET CHECKS
-- ============================================================

-- Total number of rides

SELECT
    Count(*) AS Total_Rides
FROM Cyclistic_Trips;


-- ============================================================
-- 3. MEMBERSHIP COMPOSITION
-- ============================================================

-- Purpose:
-- Determine the number of rides made by Casual and Member riders.

SELECT
    member_casual,
    Count(*) AS NumberOfRides
FROM qry_All_Rides
GROUP BY member_casual;


-- ============================================================
-- 4. RIDE DURATION
-- ============================================================

-- Average ride duration by membership type

SELECT 
    member_casual,
    Count(*) AS NumberOfRides,
    Avg(
        DateDiff(
            "s",
            CDate(Left(started_at, 19)),
            CDate(Left(ended_at, 19))
        )
    ) / 60 AS AvgRideMinutes
FROM qry_All_Rides
GROUP BY member_casual;


-- Ride-duration distribution

SELECT
    member_casual,
    IIf(
        DateDiff("s", CDate(Left(started_at,19)),
        CDate(Left(ended_at,19))) / 60 < 10,
        "Under 10 min",
        IIf(
            DateDiff("s", CDate(Left(started_at,19)),
            CDate(Left(ended_at,19))) / 60 < 20,
            "10–19 min",
            IIf(
                DateDiff("s", CDate(Left(started_at,19)),
                CDate(Left(ended_at,19))) / 60 < 30,
                "20–29 min",
                IIf(
                    DateDiff("s", CDate(Left(started_at,19)),
                    CDate(Left(ended_at,19))) / 60 < 60,
                    "30–59 min",
                    "60+ min"
                )
            )
        )
    ) AS Duration_Group,
    Count(*) AS Number_of_Rides
FROM qry_All_Rides
GROUP BY
    member_casual,
    IIf(
        DateDiff("s", CDate(Left(started_at,19)),
        CDate(Left(ended_at,19))) / 60 < 10,
        "Under 10 min",
        IIf(
            DateDiff("s", CDate(Left(started_at,19)),
            CDate(Left(ended_at,19))) / 60 < 20,
            "10–19 min",
            IIf(
                DateDiff("s", CDate(Left(started_at,19)),
                CDate(Left(ended_at,19))) / 60 < 30,
                "20–29 min",
                IIf(
                    DateDiff("s", CDate(Left(started_at,19)),
                    CDate(Left(ended_at,19))) / 60 < 60,
                    "30–59 min",
                    "60+ min"
                )
            )
        )
    );


-- ============================================================
-- 5. DAY AND TIME PATTERNS
-- ============================================================

-- Rides by day of week

SELECT
    member_casual,
    Weekday(CDate(Left(started_at, 19)), 2) AS DayNumber,
    Format(CDate(Left(started_at, 19)), "dddd") AS DayName,
    Count(*) AS NumberOfRides
FROM qry_All_Rides
GROUP BY
    member_casual,
    Weekday(CDate(Left(started_at, 19)), 2),
    Format(CDate(Left(started_at, 19)), "dddd")
ORDER BY
    member_casual,
    Weekday(CDate(Left(started_at, 19)), 2);


-- Rides by hour

SELECT
    member_casual,
    Hour(CDate(Left(started_at, 19))) AS RideHour,
    Count(*) AS NumberOfRides
FROM qry_All_Rides
GROUP BY
    member_casual,
    Hour(CDate(Left(started_at, 19)))
ORDER BY
    member_casual,
    Hour(CDate(Left(started_at, 19)));


-- ============================================================
-- 6. MONTHLY PATTERNS
-- ============================================================

SELECT
    member_casual,
    Month(CDate(Left(started_at, 19))) AS MonthNumber,
    Format(CDate(Left(started_at, 19)), "mmmm") AS MonthName,
    Count(*) AS NumberOfRides
FROM qry_All_Rides
GROUP BY
    member_casual,
    Month(CDate(Left(started_at, 19))),
    Format(CDate(Left(started_at, 19)), "mmmm")
ORDER BY
    member_casual,
    Month(CDate(Left(started_at, 19)));


-- ============================================================
-- 7. BIKE TYPE
-- ============================================================

SELECT
    member_casual,
    rideable_type,
    Count(*) AS NumberOfRides
FROM qry_All_Rides
GROUP BY
    member_casual,
    rideable_type
ORDER BY
    member_casual,
    rideable_type;


-- ============================================================
-- 8. STATION DATA QUALITY
-- ============================================================

-- Check whether station IDs are associated with multiple
-- station names.

SELECT
    start_station_id,
    Count(*) AS Number_of_Different_Names
FROM
    (
        SELECT
            start_station_id,
            start_station_name
        FROM qry_All_Rides
        WHERE start_station_id Is Not Null
        GROUP BY
            start_station_id,
            start_station_name
    ) AS StationNames
GROUP BY
    start_station_id
HAVING
    Count(*) > 1
ORDER BY
    Count(*) DESC;


-- Rides with missing start station IDs

SELECT
    Count(*) AS Missing_Station_ID_Rides
FROM qry_All_Rides
WHERE start_station_id Is Null;


-- Check whether missing IDs still have station names

SELECT
    IIf(
        start_station_name Is Null,
        "No Station Name",
        "Station Name Present"
    ) AS Station_Name_Status,
    Count(*) AS Number_of_Rides
FROM qry_All_Rides
WHERE start_station_id Is Null
GROUP BY
    IIf(
        start_station_name Is Null,
        "No Station Name",
        "Station Name Present"
    );


-- Membership composition of rides with missing station IDs

SELECT
    member_casual,
    Count(*) AS Number_of_Rides,
    Round(
        Count(*) / 1257513 * 100,
        2
    ) AS Percent_of_Missing_Station_Rides
FROM qry_All_Rides
WHERE start_station_id Is Null
GROUP BY member_casual;


-- ============================================================
-- 9. STATION-LEVEL ANALYSIS
-- ============================================================

-- Start station analysis using station IDs.
-- Minimum threshold: 500 rides.

SELECT
    start_station_id,
    Max(start_station_name) AS Station_Name,
    Sum(IIf(member_casual="casual",1,0)) AS Casual_Rides,
    Count(*) AS Total_Rides,
    Round(
        Sum(IIf(member_casual="casual",1,0)) / Count(*) * 100,
        2
    ) AS Casual_Percent
FROM qry_All_Rides
WHERE start_station_id Is Not Null
GROUP BY start_station_id
HAVING Count(*) >= 500
ORDER BY
    Sum(IIf(member_casual="casual",1,0)) DESC;


-- Top 20 starting stations by number of casual rides

SELECT TOP 20
    start_station_id,
    Max(start_station_name) AS Station_Name,
    Sum(IIf(member_casual="casual",1,0)) AS Casual_Rides,
    Count(*) AS Total_Rides,
    Round(
        Sum(IIf(member_casual="casual",1,0)) / Count(*) * 100,
        2
    ) AS Casual_Percent
FROM qry_All_Rides
WHERE start_station_id Is Not Null
GROUP BY start_station_id
HAVING Count(*) >= 500
ORDER BY
    Sum(IIf(member_casual="casual",1,0)) DESC;


-- Top 20 stations by casual-rider percentage
-- Minimum threshold: 500 rides.

SELECT TOP 20
    start_station_id,
    Max(start_station_name) AS Station_Name,
    Sum(IIf(member_casual="casual",1,0)) AS Casual_Rides,
    Count(*) AS Total_Rides,
    Round(
        Sum(IIf(member_casual="casual",1,0)) / Count(*) * 100,
        2
    ) AS Casual_Percent
FROM qry_All_Rides
WHERE start_station_id Is Not Null
GROUP BY start_station_id
HAVING Count(*) >= 500
ORDER BY
    Sum(IIf(member_casual="casual",1,0)) / Count(*) DESC;