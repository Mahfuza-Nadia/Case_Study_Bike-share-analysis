The original bike-share trip data is not included in this repository because of its large file size. The analysis uses 12 months of Divvy bike-share trip data covering July 2025 to June 2026. Link: https://divvy-tripdata.s3.amazonaws.com/index.html
# Data

## Dataset

This project uses publicly available Chicago Divvy bike-share trip data covering **July 2025 through June 2026**.

The dataset contains individual bike trips and includes variables such as:

* Ride start and end timestamps
* Start and end station IDs and names
* Rider membership type
* Bike type
* Other trip-level information

The 12 monthly datasets were combined into a single dataset containing **5,932,349 rides** for the analysis.

## Raw Data

The original monthly CSV files are **not included in this repository because of their large file size**.

The analysis was conducted using the original monthly datasets after importing and combining them in Microsoft Access.

The SQL queries used for the analysis are available in:

`../sql/analysis_queries.sql`

The complete analytical results are available in:

`../report/Case Study Report_Bike_Share_Analysis.pdf`
