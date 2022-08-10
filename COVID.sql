-- LET'S START BY FILTERING THE DATA TO SHOW ONLY MEXICO INFORMATION

SELECT *
FROM bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' LIMIT 1000


-- IN ORDER TO FIGURED OUT HOW UPDATED IS THIS DATABASE, LET'S SORT THE DATA BY DATE

SELECT *
FROM bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico'
ORDER BY date DESC LIMIT 1000

-- LET'S START BY SEEING HOW DOES THE DEATH AND CONFIRMED CASES HAS EVOLVED SINCE THE PANDEMIC STARTED 

SELECT 
date,
SUM(new_confirmed) AS total_confirmed, 
SUM(cumulative_confirmed) AS total_cumulative_confirmed,
SUM(new_deceased) AS total_deceased,
SUM(cumulative_deceased) AS total_cumulative_deceased
FROM
bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' 
GROUP BY date
ORDER BY date DESC;

-- NOW WE ANALIZE HOW DOES COVID AFFECTS MALE AND FEMALE HUMANS AND IF IT DIFFERENCIATES

SELECT
AVG(new_confirmed_male) AS avg_new_confirmed_male,
AVG(new_confirmed_female) AS avg_new_confirmed_female,
AVG(new_deceased_male) AS avg_new_deceased_male,
AVG(new_deceased_female) AS avg_new_deceased_female
FROM
bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' 


-- WE SEE COVID AFFECTS MORE MEN THAN WOWEN HOWEVER MEN TENDS TO SURVIVED THE AFFECTION SLIGHTLY MORE THAN WOMEN

-- NOW LET'S CONTINUE BY ANALYZING HOW DOES COVID AFFECTS BY GROUP AGES 

SELECT
AVG(new_confirmed_age_0) AS avg_new_confirmed_age_0,
AVG(new_confirmed_age_1) AS avg_new_confirmed_age_1,
AVG(new_confirmed_age_2) AS avg_new_confirmed_age_2,
AVG(new_confirmed_age_3) AS avg_new_confirmed_age_3,
AVG(new_confirmed_age_4) AS avg_new_confirmed_age_4,
AVG(new_confirmed_age_5) AS avg_new_confirmed_age_5,
AVG(new_confirmed_age_6) AS avg_new_confirmed_age_6,
AVG(new_confirmed_age_7) AS avg_new_confirmed_age_7,
AVG(new_confirmed_age_8) AS avg_new_confirmed_age_8,
AVG(new_confirmed_age_9) AS avg_new_confirmed_age_9,
AVG(new_deceased_age_0) AS avg_new_deceased_age_0,
AVG(new_deceased_age_1) AS avg_new_deceased_age_1,
AVG(new_deceased_age_2) AS avg_new_deceased_age_2,
AVG(new_deceased_age_3) AS avg_new_deceased_age_3,
AVG(new_deceased_age_4) AS avg_new_deceased_age_4,
AVG(new_deceased_age_5) AS avg_new_deceased_age_5,
AVG(new_deceased_age_6) AS avg_new_deceased_age_6,
AVG(new_deceased_age_7) AS avg_new_deceased_age_7,
AVG(new_deceased_age_8) AS avg_new_deceased_age_8,
AVG(new_deceased_age_9) AS avg_new_deceased_age_9
FROM
bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' 

-- AS WE SEE PEOPLE STARTING 20 YEARS AND UP TO 59 TEND TO HAVE MOST OF THE INFECTIONS REGISTERED
-- HOWEVER WE NOTICE YOUNGER PEOPLE HAS THE MINIMUM DECEASED IN AVERAGE 



-- BUT WHAT IF WE INVOLVED VACCINES?


SELECT 
date,
SUM(new_confirmed) AS total_confirmed, 
SUM(cumulative_confirmed) AS total_cumulative_confirmed,
SUM(new_deceased) AS total_deceased,
SUM(cumulative_deceased) AS total_cumulative_deceased,
SUM(new_persons_vaccinated) AS total_new_persons_vaccinated,
SUM(cumulative_persons_vaccinated) AS total_cumulative_persons_vaccinated,
SUM(new_persons_fully_vaccinated) AS total_new_persons_fully_vaccinated,
SUM(cumulative_persons_fully_vaccinated) AS total_cumulative_persons_fully_vaccinated
FROM
bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' 
GROUP BY date
ORDER BY date DESC;

-- AS SOON AS VACCINES START TO BE APPLIED, WE SEE A DECREASE IN CONFIRMED CASES AND DECEASES 


-- OTHER METRIC WE CAN TAKE A LOOK IS PATIENTS IN HOSPITALS AND INTENSIVE CARE

SELECT 
date,
SUM(new_confirmed) AS total_confirmed, 
SUM(cumulative_confirmed) AS total_cumulative_confirmed,
SUM(new_deceased) AS total_deceased,
SUM(cumulative_deceased) AS total_cumulative_deceased,
SUM(new_persons_vaccinated) AS total_new_persons_vaccinated,
SUM(cumulative_persons_vaccinated) AS total_cumulative_persons_vaccinated,
SUM(new_persons_fully_vaccinated) AS total_new_persons_fully_vaccinated,
SUM(cumulative_persons_fully_vaccinated) AS total_cumulative_persons_fully_vaccinated,
SUM(new_hospitalized_patients) AS total_new_hospitalized_patients,
SUM(cumulative_hospitalized_patients) AS total_cumulative_hospitalized_patients,
SUM(new_hospitalized_patients_male) AS total_new_hospitalized_patients_male,
SUM(new_hospitalized_patients_female) AS total_new_hospitalized_patients_female,
SUM(new_intensive_care_patients) AS total_new_intensive_care_patients,
SUM(cumulative_intensive_care_patients) AS total_cumulative_intensive_care_patients,
SUM(new_hospitalized_patients_female) AS total_new_hospitalized_patients_female
FROM 
bigquery-public-data.covid19_open_data.covid19_open_data
WHERE country_name = 'Mexico' 
GROUP BY date
ORDER BY date DESC;

-- NOW LET'S TAKE A BREAK AND VISUALIZE ALL THIS DATA FOR FURTHER ANALYSIS 