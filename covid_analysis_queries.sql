SELECT COUNT(*)
FROM covid_raw;

SELECT *
FROM covid_raw
LIMIT 5;

DROP TABLE IF EXISTS covid_data;

CREATE TABLE covid_data (
    iso_code VARCHAR(10),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    total_cases NUMERIC,
    new_cases NUMERIC,
    total_deaths NUMERIC,
    new_deaths NUMERIC,
    population NUMERIC,
    total_vaccinations NUMERIC,
    people_fully_vaccinated NUMERIC
);


DROP TABLE IF EXISTS covid_data

--CONVERT TEXT TO DATE NUMERIC CONVERT TEXT TO NUMBER

INSERT INTO covid_data (
    iso_code, continent, location, date, total_cases, new_cases,
    total_deaths, new_deaths, population, total_vaccinations, people_fully_vaccinated
)
SELECT
    iso_code,
    continent,
    location,
    TO_DATE(date, 'DD/MM/YYYY') AS date,
    CASE WHEN total_cases='' THEN NULL ELSE total_cases::NUMERIC END,
    CASE WHEN new_cases='' THEN NULL ELSE new_cases::NUMERIC END,
    CASE WHEN total_deaths='' THEN NULL ELSE total_deaths::NUMERIC END,
    CASE WHEN new_deaths='' THEN NULL ELSE new_deaths::NUMERIC END,
    CASE WHEN population='' THEN NULL ELSE population::NUMERIC END,
    CASE WHEN total_vaccinations='' THEN NULL ELSE total_vaccinations::NUMERIC END,
    CASE WHEN people_fully_vaccinated='' THEN NULL ELSE people_fully_vaccinated::NUMERIC END
FROM covid_raw;

SELECT COUNT(*) FROM covid_data; 
SELECT date, location, total_cases, total_deaths
FROM covid_data
LIMIT 10;

---TOTAL CASES AND DEATHS WORLD WIDE 
SELECT
SUM(total_cases) AS total_cases_worldwide,
SUM(total_deaths) AS total_deaths_worldwide
FROM covid_data;

--TOP 10 COUNTRIES BY TOTAL CASES
SELECT
    location,
    SUM(total_cases) AS total_cases
FROM covid_data 
GROUP BY location
ORDER BY total_cases DESC
LIMIT 10;

--TOP 10 COUNTRIES BY TOTAL DEATH
SELECT 
location,
SUM(total_deaths) AS total_deaths
FROM covid_data
GROUP BY location
ORDER BY total_deaths DESC
LIMIT 10;

--NEW CASE TREND OVER TIME(GLOBAL)
SELECT 
date,
SUM(new_cases) AS new_cases_worldwide
FROM covid_data
GROUP BY date
ORDER BY date
LIMIT 10;

--COUNTRY SPECIFIC TREND
SELECT 
date,
new_cases,
new_deaths,
total_cases,
total_deaths
FROM covid_data
WHERE location ='Morocco'
ORDER BY date;


