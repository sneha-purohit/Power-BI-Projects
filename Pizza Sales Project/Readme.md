# Project Overview

This project demonstrates a complete data workflow starting from loading a CSV file into a MySQL database, performing data validation and queries, and finally visualizing the results using Power BI.

## Steps Involved

### 1. Loading CSV Data into MySQL

- The raw data was provided in CSV format.
- Data was imported into a MySQL database using the **Table Data Import Wizard** in MySQL Workbench.  
  *Alternatively, data can be imported using SQL commands such as `LOAD DATA INFILE` or other command-line tools.*
- Table structure was designed to fit the CSV schema.

### 2. Data Validation & Querying

- Several SQL queries were executed to:
  - Explore and understand the data.
  - Clean and validate the dataset (e.g., checking for duplicates, null values, data type mismatches).
  - Generate summary statistics or insights as required.

### 3. Connecting MySQL to Power BI

- Power BI was connected to the MySQL database using the MySQL connector.
- The validated data was imported directly into Power BI for visualization.

### 4. Dashboard Creation in Power BI

- An interactive dashboard was created to visualize key metrics and insights derived from the data.
- The dashboard includes various charts, tables, and filters to allow users to explore the data.

## How to Reproduce

1. **Load Data:**
   - Import the CSV file into a MySQL database using the Table Data Import Wizard or SQL commands like `LOAD DATA INFILE`.
2. **Validate Data:**
   - Run provided SQL queries for validation and data cleaning.
3. **Connect to Power BI:**
   - Use the MySQL connector in Power BI to import the processed data.
4. **Build Dashboard:**
   - Use Power BI visualization tools to create dashboards and reports as per your analysis needs.

## Files Included

- SQL scripts for data import and validation 
- Power BI dashboard file (.pbix) 
- Sample CSV file 

## Requirements

- MySQL Database
- Power BI Desktop
- CSV file (source data)

## Notes

- Ensure MySQL server is accessible from Power BI.
- Customize the dashboard according to the specific analysis or requirements.

---

Feel free to add more details or specific instructions as per your project.
