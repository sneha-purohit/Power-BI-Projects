# Project Overview

This project demonstrates a data loading and visualization workflow involving Python, MySQL, and Power BI. The main goal was to visualize data in Power BI, but there were some challenges with directly importing the CSV file into Power BI. To overcome these issues, a multi-step process was implemented as described below.

## Workflow Steps

### 1. Initial Attempt: Loading CSV into Power BI

- **Goal:** Import a CSV file directly into Power BI for data analysis and visualization.
- **Issue:** The CSV file was not loading properly into Power BI, possibly due to formatting issues, data inconsistencies, or size limitations.

### 2. Using Python and MySQL as an Intermediary

#### a. Reading the CSV in Python

- **Approach:** Utilized Python with the `csv` module to read the CSV data.
- **Reasoning:** Python provides powerful tools to clean, preprocess, and handle data types or anomalies that may cause issues in Power BI.

#### b. Loading Data into MySQL

- **Process:** After reading and possibly cleaning the data in Python, used the `mysql.connector` library to connect to a MySQL database and upload the data to a new table.
- **Benefits:** MySQL offers robust data storage and querying capabilities, making it easier to manage and manipulate the data before visualization.

#### c. Running SQL Queries

- **Usage:** Wrote SQL queries in MySQL to further process, filter, or aggregate the data as needed before importing it into Power BI.

### 3. Connecting Power BI to MySQL

- **Final Step:** Connected Power BI to the MySQL database and imported the processed data for visualization and analysis.
- **Advantage:** This approach ensures that the data is clean, consistent, and ready for reporting in Power BI.

## Technologies Used

- **Python**: For reading, cleaning, and loading CSV data (using `csv` and `mysql.connector` modules).
- **MySQL**: As a relational database to store and query the data.
- **Power BI**: For data visualization and analysis.

## Summary

By using Python and MySQL as intermediaries, the project successfully overcame the limitations of directly loading the CSV file into Power BI. This workflow ensures greater flexibility and control over the data preparation process, resulting in more reliable and insightful visualizations in Power BI.


