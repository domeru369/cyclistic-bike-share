#convert string data type to interger 
#arrange the column names exactly how it is in the other datasets

SELECT
    ride_id,rideable_type,started_at,ended_at,start_station_name,
    SAFE_CAST(start_station_id AS INT64) AS start_station_id,
    end_station_name,
    SAFE_CAST(end_station_id AS INT64) AS end_station_id,
    start_lat,start_lng,end_lat,end_lng,member_casual,
FROM
    `case-study-419113.tripdata2020_case_study.trip_data_2020-12`
        
