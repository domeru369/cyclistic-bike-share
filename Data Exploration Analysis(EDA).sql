#data exploration

#checking the number of rows in the data
SELECT 
    COUNT (*)
FROM `case-study-419113.tripdata2020_case_study.merged_data`
#there are 3,541,683 rows


#to check all columns data types
SELECT 
    column_name,data_type
FROM `tripdata2020_case_study`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'merged_data'


#since ride id is a unique column we need to check if the lengths are consistent
SELECT 
    LENGTH(ride_id) AS length_ride_id
FROM `case-study-419113.tripdata2020_case_study.merged_data`  
#most of ride ids are 16  

#to check the ones that are not 16 
SELECT 
   COUNT(ride_id)
FROM
    `case-study-419113.tripdata2020_case_study.merged_data`
WHERE 
    LENGTH(ride_id) != 16
#there are 2401 ride ids that are not 16  



#check for duplicate rows
#to get distinct rides 
SELECT
    COUNT(DISTINCT ride_id) AS num_of_rides 
FROM 
    `case-study-419113.tripdata2020_case_study.merged_data`
#there are 3,541,470 distinct rides

#subtraction
SELECT 
    COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM 
    `case-study-419113.tripdata2020_case_study.merged_data`    
#there are 213 duplicate rows 

#to get distinct rideable types
SELECT rideable_type,
    COUNT(DISTINCT rideable_type) AS num_of_rideabletypes
FROM `case-study-419113.tripdata2020_case_study.merged_data`
GROUP BY rideable_type  
#there are 3 unique rideable types 

#to get distinct start stations
SELECT
    COUNT(DISTINCT start_station_id) AS num_of_start_stations
FROM `case-study-419113.tripdata2020_case_study.merged_data` 
#there are 931 start stations

#to get distinct end stations
SELECT
    COUNT(DISTINCT end_station_id) AS num_of_end_stations
FROM `case-study-419113.tripdata2020_case_study.merged_data` 
#there are 931 end stations

#to get distinct riders
SELECT member_casual,
    COUNT(DISTINCT member_casual) AS num_of_rider_types
FROM `case-study-419113.tripdata2020_case_study.merged_data`
GROUP BY member_casual 
#there are 2 types of riders; casual and member


#checking for number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) AS ride_id,
 COUNT(*) - COUNT(rideable_type) AS rideable_type,
 COUNT(*) - COUNT(started_at) AS started_at,
 COUNT(*) - COUNT(ended_at) AS ended_at,
 COUNT(*) - COUNT(start_station_name) AS start_station_name,
 COUNT(*) - COUNT(start_station_id) AS start_station_id,
 COUNT(*) - COUNT(end_station_name) AS end_station_name,
 COUNT(*) - COUNT(end_station_id) AS end_station_id,
 COUNT(*) - COUNT(start_lat) AS start_lat,
 COUNT(*) - COUNT(start_lng) AS start_lng,
 COUNT(*) - COUNT(end_lat) AS end_lat,
 COUNT(*) - COUNT(end_lng) AS end_lng,
 COUNT(*) - COUNT(member_casual) AS member_casual
FROM `case-study-419113.tripdata2020_case_study.merged_data`


#to get rides longer than a day
SELECT COUNT(*) AS longer_than_a_day
FROM `case-study-419113.tripdata2020_case_study.merged_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;
#2861 rides are longer than a day 


#to get rides less than a minute
SELECT COUNT(*) AS less_than_a_minute
FROM `case-study-419113.tripdata2020_case_study.merged_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1;
#there are 76372 rides less than a minute 



