#Analysis
#descriptive statistics 
#ride counts by member casual
SELECT member_casual, 
COUNT (*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY member_casual
#casual riders took 1264023 rides while annual members took 1989594 rides

#average ride length by member type
SELECT member_casual,
AVG(ride_length) as avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY member_casual
#casual riders rode for 38 minutes on average and annual members rode for 15 minutes on average

#min ride length
SELECT 
min(ride_length) as min_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data1`
GROUP BY member_casual
#min ride length is 1 minute

#max ride length
SELECT 
max(ride_length) as max_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
#max ride length is 1440 minutes


#analyzing rideable type and member type
SELECT rideable_type, member_casual,
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY rideable_type, member_casual


#analyzing weekly usage patterns
#week day and ride count
SELECT member_casual,week_day,
COUNT(*) AS ride_count 
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY member_casual,week_day

#week day and avg ride length
SELECT member_casual,week_day,
AVG(ride_length) AS avg_ride_length 
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2` 
GROUP BY member_casual,week_day


#analyzing hourly usage patterns
#hour and ride count
SELECT member_casual,hour, 
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2` 
GROUP BY hour, member_casual

#hour and avg ride length
SELECT member_casual,hour, 
AVG(ride_length) AS avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2` 
GROUP BY hour, member_casual


#analyzing monthly usage patterns
#month and ride count
SELECT member_casual,month,
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY month,member_casual

#month and avg ride length
SELECT member_casual,month, 
AVG(ride_length) AS avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2` 
GROUP BY hour, member_casual

#analyzing day type
#day type and ride count
SELECT member_casual,day_type,
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY day_type,member_casual

# day type and avg ride length
SELECT member_casual, day_type,
AVG(ride_length) AS avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY day_type,member_casual

#analyzing patterns by stations
# top 5 start stations and ride count
SELECT start_station_name,
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY start_station_name
ORDER BY ride_count DESC LIMIT 5 

#top 5 start stations and avg ride length
SELECT start_station_name,
AVG(ride_length) AS avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY start_station_name
ORDER BY avg_ride_length DESC LIMIT 5 

# top 5 end stations and ride count
SELECT end_station_name,
COUNT(*) AS ride_count
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY end_station_name
ORDER BY avg_ride_length DESC LIMIT 5 


#top 5 end stations and avg ride length
SELECT end_station_name,
AVG(ride_length) AS avg_ride_length
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY end_station_name
ORDER BY avg_ride_length DESC LIMIT 5

#avg lat and long of start stations 
SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY start_station_name, member_casual

#avg lat and long of end stations
SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `case-study-419113.tripdata2020_case_study.final_joined_data2`
GROUP BY end_station_name, member_casual;

