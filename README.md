# Cyclistic bike share case study - How does a bike-share navigate speedy success?

# About the company
Launched in 2016, Cyclistic's bike-share program has become a success story in Chicago. The program boasts a large fleet (5,824 bikes) with convenient features like geotracking and a network of 692 stations for easy pick-up and drop-off.While initial marketing focused on general awareness, Cyclistic now seeks to optimize its strategy. Data shows that annual members are more profitable for Cyclistic compared to casual riders (single-ride/day pass users).The existing pricing structure offers flexibility, but converting casual riders to annual memberships is crucial for future growth. Cyclistic plans to leverage historical bike trip data to identify trends and develop effective marketing strategies focused on converting casual riders into annual members.

# Scenerio
I am assuming the role of a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. Lily Moreno, the director of marketing, believes the key lies in maximizing the number of annual memberships.  Our marketing analyst team is committed to understanding the usage patterns of both casual riders (single-trip/day pass users) and annual members. This crucial data will fuel the development of a targeted marketing strategy aimed at converting casual riders into loyal annual members. Securing executive approval hinges on presenting compelling data insights and professional data visualizations. By analyzing historical bike trip data, we can uncover the unique ways each user group interacts with Cyclistic.

# Business Task 
* Analysis of historical bike trip data to understand usage patterns and motivations of both casual riders and annual members.
* Gain and leverage insights to create targeted marketing campaigns using digital media.
* Presentation of findings and recommendations to the Cyclistic executive team.

# Data Analysis Process
I will follow the 6 steps of the data analysis process - Ask, Prepare, Process, Analyize, Share and Act.
# 1. Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

# 2. Prepare
I will use  the Cyclistic’s historical trip data to analyze and identify trends. The 12 months of 2020 Cyclistic trip data can be downloaded [here](https://divvy-tripdata.s3.amazonaws.com/index.html)  The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement) This is public data that I can use to explore how different customer types are using Cyclistic bikes. Due to Data-privacy issues, using riders’ personally identifiable information is prohibited. This means that I am unable to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### Limitations of the Data
* The data lacks crucial demographic information like age, occupation and gender.
* The data was collected 4 years ago in 2020.

# 3. Process
* I used all the variables because they are all important for analysis.
* I chose BigQuery in performing analysis because Cyclistic has a vast amount of historical bike trip data. I chose the 2020 data and I have to merge all data from January to December which will sum up to million of rows. BigQuery is optimized for handling large datasets efficiently.
* I chose Tableau for visualizations because Tableau excels at creating interactive visualizations. I can filter data, drill down into details, and see trends dynamically.

### Data type conversion
* The first step I took was to check if all data types are consistent to enable efficient manipulation. I noticed that the December data had an inconsistent data type so I had to change the start and end station id column from string to interger. [Data type conversion](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20type%20conversion.sql)

### Data Merging 
* I merged all the data from Quarter 1 to December 2020 using union all. [Data merging](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20merging.sql)

### Data Exploration Analysis (EDA)
* I performed EDA in order to gain a deep understanding of the data. [EDA](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/Data%20Exploration%20Analysis(EDA).sql)
* There are 3,541,683 rows
* This table shows the data columns and data types [table](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/info.%20schema.csv)
* I checked the ride ID column to confirm if all ride IDS have the same character length and I found out that almost all the ride IDs have a length of 16 except 2401.
* The next step I took was to check for duplicate rows and 213 rows had duplicates.
* There are 3 rideable types, electric bikes, classic bikes and docked bikes.
* There are 913 start and end stations.
* There are two types of riders; causal riders and annual members.
* This table shows that start station,end station,end lat and end log has null values and the remaining columns has none. [table](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/null%20values.csv)
* 2861 rides are longer than a day and 76372 are less than a minute.

### Data cleaning
* I cleaned the data which ensures data accuracy, leading to more reliable insights. [data cleaning](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20cleaning.sql)
* I extracted the ride length by subtracting the time the ride started from the time the ride ended.
* I extracted the hour the ride started, the day name, day type(weekend and weekday) and month of each ride.
* I joined these extracted data with the merged data with ride id being the primary key.
* I filtered the data by removing all null values, ride length longer than a day and lesser than a minute, duplicate rows and ride IDs that are not 16 characters long.
* After all these cleaning, there are 3,253,617 rows remaining meaning 288,036 rows were removed. 

# 4. Analyze
* I analyized number of rides, average ride length, week day, day type, hour, month, and station location broken down by each member type. [Analysis](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20analysis.sql)
* Using tableau, I created visualizations to analyze the data. For an interactive experience in tableau, [click here](https://public.tableau.com/app/profile/amanda.egega/viz/Bikesharevisualization/bikesharestory#1)

### Total rides and total average ride length
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/number%20of%20rides%20%26%20ride%20length.png)

* We see more rides from annual members (1,989,549) than casual riders (1,264,033).
* On average, casual rider trips last longer (38 minutes) than annual member trips (15.27 minutes).

### Bike types
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/bike%20type.png)

*Docked bikes are clearly the most popular option for both member types, followed by classic bikes.

### Breakdown by hour
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/hour.png)

* Rides for both annual and casual members go up in the evening (3pm-7pm) and peak at 5pm. There are much fewer rides at night (2am-4am).
* Average ride length is longer at night (1am-3am) and shorter in the mornings (6am-7am) for both member types.

### Breakdown by week day
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/week%20day.png)

* Casual riders take the most rides on Saturdays and the least on Tuesdays. Annual members, however, ride the most on Wednesdays and the least on Sundays.
* Both casual and annual members enjoy the longest rides on Sundays and Saturdays, with the average ride length gradually decreasing throughout the week, reaching a low point on weekdays. However, as the weekend approaches, the average ride length starts to increase again.

### Breakdown by day type
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/day%20type.png)

* The number of rides on weekday is more than on the weekend for both member types.
* Both member types have longer average ride length on weekend than weekday.

### Breakdown by month
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/month.png)

* Both casual and annual members rides hit their highest point in the summer (August) and drops significantly during winter (December) and they follow the same trend with average ride length.

### Station locations
![image](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/station%20locations.png)

* Casual Riders favor Streeter Dr & Grand Ave as their go-to starting and ending point for bike rides while annual members prefer Clark St & Elm St as their primary station for both starting and ending their rides.
* Casual Riders opt for Racine Ave & 65th St when embarking on longer bike trips while annual members choose Summit Ave & 86th Str as their starting point for rides that tend to be longer in duration.
* The interactive maps shows the names of each start and end locations, the start and end longitude/latitude and the number of rides associated with them.

# 5. Share
## Key findings

### Ridership Analysis:

* Membership Breakdown: There are significantly more annual members (1,989,549 rides) than casual riders (1,264,033 rides). This indicates a healthy ridership base, but there's an opportunity to attract more casual riders to become annual members.
* Ride Length: Interestingly, casual riders have a longer average ride length (38 minutes) compared to annual members (15.27 minutes). This suggests casual riders might be using the bikes for leisure or longer commutes, while annual members might be using them for shorter trips.
* Bike Type: Docked bikes are the most popular choice for both member types, while classic bikes are the least used. This suggests convenience and ease of use are crucial factors for riders.
  

### Usage Patterns:

#### Day of the Week:
* Casual Riders: Likely use Cyclistic primarily for leisure activities on weekends. This explains the increase in rides on Saturdays and Sundays, followed by a decline during the workweek.
* Annual Members: Their peak ridership on weekdays suggests they might use Cyclistic more for commuting to work or school. The weekend reduction in rides for annual members further strengthens this theory.
  
####  Time of Day: 
* The number of rides increases for both member types in the evening (3pm-7pm), peaking at 5pm. Conversely, rides decrease at night (2am-4am). This implies a common evening commute pattern and potentially lower nighttime usage. Both member types experience longer average rides at night (1am-3am) and shorter rides in the morning (6am-7am). This might indicate leisure rides at night and quicker commutes in the mornings.
  
#### Seasonality: 
* Summer: Warmer weather entices both casual and annual riders to use the bikes more frequently, with both member types taking longer rides from July to September.
* Winter: Colder temperatures discourage ridership overall, with both member types opting for shorter trips during the fall and winter months(October to February)


### Start & End Stations:

* Popular Stations: Casual riders most frequently use starting and ending stations close to leisure parks like the Millennium Park station and the Streeter Dr & Grand Ave which is situated near the Jane Addams Memorial Park. This confirms casual riders using cylistic for mostly leisure activities.
* Annual members: favor stations close to residential and commercial buildings like Clark St & Elm St and Wells St and Concord Ln for both start and end points confirming that they use Cyclistic more for work. 
* Ride Length and Stations: Racine Ave & 65th St is the most popular start station and Hubbard St bike checkpoint is the most popular end point for longer casual rider trips. * * * * Annual members: Leramie Ave $ Kinzie Str is the most popular start station and Asland Ave and 78th St is the most popular end station for annual members with longer rides. 

# 6. Act 
## Recommendations

* Targeted Marketing Campaigns: Develop targeted marketing campaigns based on member type and usage patterns.
* Casual Riders: Highlight the convenience and cost-effectiveness of annual memberships for frequent riders, especially those taking longer trips. Promote leisure riding opportunities during weekends and summer months.
* Annual Members: Offer incentives for increased ridership, like discounts or rewards programs. Promote weekday riding during off-peak hours to spread usage more evenly.
* Seasonal Promotions: Offer special promotions or discounts on annual memberships during peak ridership months (summer) to capitalize on higher ridership interest.
* Weekend Discounts: Consider offering discounted rates for annual memberships activated on weekends, which aligns with casual riders' peak usage days.
* Improved Bike Options: While docked bikes are popular, explore expanding options with electric bikes or other features that might appeal to casual riders, especially for longer trips.
* Station Optimization: Ensure popular start and end stations, particularly those associated with longer rides (e.g., Racine Ave & 65th St), are well-maintained and have sufficient bikes available.
  




