# Cyclistic Bike-Share Analysis

## Portfolio Case Study

This project analyzes Chicago's bike-share usage patterns to understand how **casual riders and annual members differ in their riding behavior**.

The analysis examines ride duration, day of the week, time of day, monthly and seasonal patterns, bike type, and station location. The objective is to identify behavioral differences that can inform the understanding of potential opportunities for membership marketing.

> **Note:** This is an independent portfolio case study based on the Cyclistic/Divvy bike-share dataset. It does not represent work conducted for Cyclistic.

---

## Business Question

**How do casual riders and annual members differ in their bike-share usage patterns, and what behavioral differences may be relevant to membership marketing?**

---

## Dataset

The analysis uses **12 months of Chicago bike-share trip data**, covering:

**July 2025 – June 2026**

The dataset contains **5,932,349 rides** after combining the monthly datasets.

### Rider groups

* **Casual riders:** 2,116,634 rides (35.7%)
* **Annual members:** 3,815,715 rides (64.3%)

The original trip data were obtained from the publicly available Divvy/Cyclistic bike-share data. The raw monthly files are not included in this repository because of their large size.

---

## Tools Used

* **Microsoft Access / SQL** — data import, combination, cleaning checks, and analysis
* **Tableau Desktop** — data visualization and dashboard development
* **Tableau Public** — interactive dashboard
* **Microsoft Word / PDF** — analytical report
* **GitHub** — project documentation and portfolio presentation

---

## Analysis Process

The analysis followed these main stages:

1. Combined 12 monthly trip datasets into a single analytical dataset.
2. Checked the data structure and key variables.
3. Compared casual and member ride volumes.
4. Analyzed ride-duration differences.
5. Examined riding patterns by day of the week.
6. Examined hourly riding patterns.
7. Investigated monthly and seasonal variation.
8. Compared classic and electric bike usage.
9. Examined station-level riding patterns using station IDs.
10. Developed visualizations and an interactive Tableau dashboard.
11. Interpreted the behavioral differences between casual riders and members.

---

## Key Findings

### 1. Casual riders take longer rides

Casual riders had an average ride duration of **21.73 minutes**, compared with **12.46 minutes** for members.

This means casual rides were approximately **74% longer on average**.

The difference was also visible in the duration distribution:

* **26.03%** of casual rides lasted 20 minutes or longer, compared with **14.16%** of member rides.
* **14.44%** of casual rides lasted 30 minutes or longer, compared with **5.49%** of member rides.

The difference was particularly pronounced for classic-bike rides, where average duration was **39.62 minutes for casual riders** compared with **15.18 minutes for members**.

---

### 2. Casual riding is more concentrated on weekends

Saturday and Sunday accounted for **37.53% of casual riders' trips**, compared with **23.31% of member trips**.

Saturday alone represented:

* **21.09%** of casual rides
* **12.67%** of member rides

This indicates a substantially greater concentration of casual riding toward the weekend.

---

### 3. Casual and member riders have different hourly patterns

Members showed stronger concentration during traditional morning and evening peak periods.

Between **06:00 and 09:00**:

* Casual riders: **10.80%** of their rides
* Members: **20.43%**

Casual riding became relatively more prominent during the afternoon and late evening. Casual riders represented **42.07% of all rides at 14:00**, rising to **44.19% at 22:00** and **47.73% at 23:00**.

The pattern suggests that casual usage is less concentrated around the early-morning commuting period and relatively more prominent later in the day.

---

### 4. Casual riding shows stronger seasonal concentration

Casual ride volume was highly seasonal.

Casual rides peaked at **337,878 in August 2025** and fell to **24,740 in January 2026**.

Activity then increased substantially toward the warmer months, reaching **308,485 rides in June 2026**.

Member riding followed the same broad seasonal pattern but remained less concentrated than casual riding.

The results show that the timing of riding activity is an important consideration when examining the casual-rider segment. However, the analysis does **not** establish why seasonal variation occurs or whether seasonal marketing would increase membership conversion.

---

### 5. Bike type provides a smaller distinction between the groups

Both rider groups predominantly used electric bikes:

* Casual riders: **70.00% electric**
* Members: **66.32% electric**

The difference was only **3.68 percentage points**.

Therefore, bike type does not distinguish the two groups as strongly as ride duration, day of week, time of day, or season.

---

### 6. Casual riding is concentrated around particular station locations

Several high-use casual starting stations were located around lakefront, recreational, cultural, or major attraction-oriented areas.

Examples include:

* Navy Pier
* Millennium Park
* Shedd Aquarium
* Field Museum
* Montrose Harbor
* Dusable Harbor
* DuSable Lake Shore Dr & Monroe St
* Theater on the Lake

The top 10 casual starting stations accounted for approximately **9.42% of all casual rides**, compared with **5.08% for the top 10 member starting stations**.

Several stations also had particularly high casual shares. For example:

* Shedd Aquarium: **81.98% casual**
* Field Museum: **81.09% casual**
* DuSable Lake Shore Dr & Monroe St: **78.97% casual**
* Streeter Dr & Grand Ave: **77.50% casual**

These results indicate greater spatial concentration among casual riders. However, station data alone do not establish the purpose of individual trips or demonstrate that casual riders are tourists.

---

## Overall Behavioral Pattern

Taken together, the analysis identifies several consistent differences between the two rider groups.

**Casual riders** tend to:

* Take longer rides
* Ride more heavily on weekends
* Show relatively stronger afternoon and late-evening usage
* Exhibit greater seasonal concentration
* Have more concentrated usage at several lakefront, recreational, cultural, and attraction-oriented stations

**Annual members** tend to:

* Take shorter rides
* Have relatively greater weekday usage
* Show stronger morning and evening peak usage
* Have a more even distribution of rides across the year
* Use a less concentrated set of high-use stations

The strongest behavioral differences were found in **ride duration, day of week, time of day, seasonal concentration, and station location**. Bike type provided useful descriptive information, but the relatively small difference in electric-bike usage made it a less important distinguishing characteristic for the business question.

---

## Tableau Dashboard

The project includes an interactive Tableau dashboard presenting the main findings visually.

**Interactive Tableau Public Dashboard:**
https://public.tableau.com/views/Case_Study_Rider-Behavior-Analysis/RiderBehaviorDashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

The Tableau workbook is also included in this repository:

`images/Case_Study_Rider-Behavior-Analysis.twbx`

---

## Project Files

| File / Folder | Description                                             |
| ------------- | ------------------------------------------------------- |
| `report/`     | Full analytical report in PDF format                    |
| `sql/`        | SQL queries used for data preparation and analysis      |
| `tableau/`    | Tableau workbook (`.twbx`)                              |
| `images/`     | Dashboard and visualization images                      |
| `data/`       | Information about the source data and data availability |

### Full Report

The detailed analysis, methodology, results, and visualizations are available in:

`report/Case Study Report_Bike_Share_Analysis.pdf`

---

## Limitations

Several limitations should be considered when interpreting the analysis:

* The analysis covers **July 2025 through June 2026**, rather than a longer historical period.
* The raw monthly datasets are not included in this repository because of their large file size.
* Missing station information limits some station-level analysis.
* Station location and riding patterns do not directly identify the purpose of an individual trip.
* The analysis identifies behavioral associations and patterns but does not establish causal relationships.
* The analysis does not directly measure whether a particular marketing intervention would result in membership conversion.

---

## Conclusion

The analysis shows clear behavioral differences between casual riders and annual members across several dimensions of bike-share usage. The most notable differences concern **ride duration, weekly timing, hourly usage, seasonal concentration, and station location**.

These findings provide a descriptive basis for considering how membership marketing could be aligned with the observed behavior of casual riders. Further analysis would be required to determine which specific marketing interventions would be effective in converting casual riders into annual members.

---

## Author

This project was completed as an independent data-analysis portfolio case study as part of the **Google Data Analytics Professional Certificate** learning process.
