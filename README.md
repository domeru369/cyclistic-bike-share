# Cyclistic bike share case study - How does a bike-share navigate speedy success?

# About the company
Launched in 2016, Cyclistic's bike-share program has become a success story in Chicago. The program boasts a large fleet (5,824 bikes) with convenient features like geotracking and a network of 692 stations for easy pick-up and drop-off.While initial marketing focused on general awareness, Cyclistic now seeks to optimize its strategy. Data shows that annual members are more profitable for Cyclistic compared to casual riders (single-ride/day pass users).The existing pricing structure offers flexibility, but converting casual riders to annual memberships is crucial for future growth. Cyclistic plans to leverage historical bike trip data to identify trends and develop effective marketing strategies focused on converting casual riders into annual members.

# Scenerio
I am assuming the role of a junior data analyst working on the marketing analyst team at Cyclistic, a bike-sharecompany in Chicago. Lily Moreno, the director of marketing, believes the key lies in maximizing the number of annual memberships.  Our marketing analyst team is committed to understanding the usage patterns of both casual riders (single-trip/day pass users) and annual members. This crucial data will fuel the development of a targeted marketing strategy aimed at converting casual riders into loyal annual members. Securing executive approval hinges on presenting compelling data insights and professional data visualizations. By analyzing historical bike trip data, we can uncover the unique ways each user group interacts with Cyclistic.

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
Moreno has assigned me the first question to answer: How do annual members and casualriders use Cyclistic bikes differently?

# 2. Prepare
I will use  the Cyclistic’s historical trip data to analyze and identify trends. The 12 months of 2020 Cyclistic trip data can be downloaded [here](https://divvy-tripdata.s3.amazonaws.com/index.html)  The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement) This is public data that I can use to explore how different customer types are using Cyclistic bikes. Due to Data-privacy issues, using riders’ personally identifiable information is prohibited. This means that I am unable to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

## Limitations of the Data
* The data lacks crucial demographic information like age, occupation, country and gender.
* The data was collected 4 years ago in 2020.

# 3. Process
* I used all the variables because they are all important for analysis.
* I chose SQL in performing analysis because Cyclistic has a vast amount of historical bike trip data. I chose the 2020 data and I have to merge all data from January to December which will sum up to million of rows. SQL is optimized for handling large datasets efficiently.
* I chose Tableau for visualizations because Tableau excels at creating interactive visualizations. I can filter data, drill down into details, and see trends dynamically.

### Data type conversion
* The first step I took was to check if all data types are consistent to enable efficient merging. I noticed that the December data had an inconsistent data type so I had to change the start and end station id column from string to interger. [Data type conversion](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20type%20conversion.sql)

### Data Merging 
* I merged all the data from quarter 1 to december 2020 using union all. [Data merging](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/data%20merging.sql)

### Data Exploration Analysis (EDA)
* I performed EDA in order to understand the data better. [EDA](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/Data%20Exploration%20Analysis(EDA).sql)
* There are 3,541,683 rows
* This table shows the data columns and data types [table](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/info.%20schema.csv)
* I checked the ride ID column to confirm if all ride IDS have the same character length and i found out that almost all the ride IDs have a length of 16 except 2401
* The next step I took was to check for duplicate rows and 213 rows had duplicates
* There are 3 rideable types, electric bikes, classic bikes and docked bikes
* There are 913 start and end stations.
* There are two types of riders; causal riders and annual members.
* This table shows that start station,end station,end lat and end log has null values and the remaining columns has none. [table](https://github.com/domeru369/cyclistic-bike-share-case-study/blob/main/sql%20extracted%20tables%20and%20tableau%20visualizations/null%20values.csv)
* 2861 rides are longer than a day and 76372 are less than a minute.
