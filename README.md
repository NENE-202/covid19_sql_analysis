# COVID-19 SQL Data Analysis (PostgreSQL)

## 📌 Project Overview
This project analyzes global COVID-19 data using PostgreSQL.
The focus was on data cleaning, handling missing values, and
writing analytical SQL queries.

## 🧰 Tools Used
- PostgreSQL 17
- pgAdmin 4
- SQL

## 📊 Dataset
Source: Our World in Data (OWID) COVID-19 Dataset

## 🧹 Data Cleaning Steps
- Converted text-based dates to DATE format
- Converted numeric fields stored as text
- Handled missing values using NULLIF and COALESCE
- Created a clean analytical table from raw data

  ## 🖼️ SQL Query Execution Evidence

Below are screenshots showing SQL queries executed in pgAdmin
and their corresponding outputs.

![Create Table](screenshots/create_varchar_sql.png)
![Data Cleaning](screenshots/convert_text_to_date_numeric.png)
![Global Case Trend](screenshots/new_case_trend_over_time.png)
![Top 10 Countries](screenshots/top_10_countries_cases.png)


## 🔍 Analysis Performed
- Global daily COVID-19 case trends
- Top countries by total cases
- Aggregated worldwide statistics

## 🚀 Author
Esther Oziowuh Emmanuel  
Aspiring Data Analyst | SQL • Python • Excel  
LinkedIn: https://www.linkedin.com/in/oziowuh-emmanuel-654034292/
