[**Power BI Dashboard**](https://app.powerbi.com/view?r=eyJrIjoiOGFkZDc1NjQtYzU4ZC00NzI2LTkwM2UtNDNkY2E0NDIwNTYzIiwidCI6ImJmOGY3NjI3LTQ2MmQtNGFhMC1iMWVlLWNhMzc5ZDlhZTA3OCJ9&pageName=c1d6ea400634a9cbbb20) | [**Video Presentation**](YOUR_YOUTUBE_VIDEO_LINK_HERE)

# Goodcabs | Transportation & Mobility Business Analytics

**An end-to-end business analytics project focused on operational performance, passenger acquisition, retention, and revenue analysis across 10 tier-2 cities in India.**

## Project Overview

Goodcabs is a cab service company operating across 10 tier-2 cities in India. Its business model focuses on supporting local drivers by providing sustainable earning opportunities in their hometowns while delivering quality service to passengers.

This project analyzes Goodcabs' **H1 2026 historical data (January–June 2026)** to evaluate operational performance against predefined business targets, identify performance gaps, and generate actionable recommendations.

The engagement is structured as a **Proof of Concept (POC)** to validate the analytical approach before integrating the dashboard with the company's live data pipeline.

## Business Problem Statement

Goodcabs identified four major business challenges:

1. **City Performance:** Lack of visibility into which cities are outperforming or underperforming against business targets.
2. **Passenger Retention:** Inconsistent Repeat Passenger Rates (RPR%) across cities, with limited understanding of the underlying factors.
3. **Target Achievement:** Approximately 4 out of 10 cities are missing their monthly trip targets.
4. **Marketing Budget Allocation:** Insufficient visibility into new and repeat passenger contributions, making acquisition and retention budget allocation difficult.

## Project Objectives

- Evaluate city-level and monthly operational performance against business targets.
- Analyze passenger acquisition and repeat passenger retention.
- Identify variations in Repeat Passenger Rate across cities.
- Assess trip volume, revenue, fare, and passenger performance.
- Identify underperforming cities and recommend improvement opportunities.
- Develop reusable SQL reports for monthly business monitoring.
- Build an interactive Power BI dashboard for business stakeholders.
- Present actionable insights and recommendations to support business planning.

## Technology Stack

| Technology | Application |
|---|---|
| SQL | Ad-Hoc Business Analysis and Data Exploration |
| PostgreSQL | Relational Database and Query Execution |
| Microsoft Power BI | Interactive Dashboard Development |
| Power Query | Data Transformation and Preparation |
| DAX | Measures, KPIs, and Business Calculations |
| Microsoft PowerPoint | Business Presentation |
| CSV | Analytical Report Exports |

## SQL Ad-Hoc Business Analysis

Six primary business requests were addressed, producing seven analytical report outputs.

| # | Business Analysis | Business Purpose |
|---|---|---|
| 01 | City-Level Trip and Fare Summary | Evaluate trip volume and fare performance across cities. |
| 02 | Monthly City-Level Trips Target Performance | Compare actual trips against monthly targets. |
| 03 | City-Level Repeat Passenger Trip Frequency | Understand repeat passenger usage patterns. |
| 04 | Highest and Lowest New Passenger Cities | Evaluate passenger acquisition performance. |
| 05 | City-Level Highest Revenue Month | Identify each city's highest revenue-generating month. |
| 06 | Repeat Passenger Rate Analysis | Evaluate monthly and overall passenger retention. |

**SQL Concepts Applied:**

- Joins and Aggregations
- Common Table Expressions (CTEs)
- Subqueries
- CASE WHEN Statements
- Window Functions
- DENSE_RANK()
- PARTITION BY
- Conditional Aggregation
- Percentage and Variance Calculations

## Power BI Dashboard

The Power BI dashboard provides an interactive view of Goodcabs' transportation and mobility business performance.

**Key Analytical Areas:**

- Overall Business Performance
- City-Level Operational Performance
- Trip and Revenue Analysis
- Passenger Acquisition
- Repeat Passenger Retention
- Monthly Target Achievement

**Dashboard Access:** [View Interactive Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOGFkZDc1NjQtYzU4ZC00NzI2LTkwM2UtNDNkY2E0NDIwNTYzIiwidCI6ImJmOGY3NjI3LTQ2MmQtNGFhMC1iMWVlLWNhMzc5ZDlhZTA3OCJ9&pageName=c1d6ea400634a9cbbb20)

## Key Business Metrics

| Metric | Business Purpose |
|---|---|
| Total Trips | Measure overall trip activity. |
| Total Revenue | Evaluate revenue generation. |
| Average Fare per Trip | Understand average passenger spending per trip. |
| Average Fare per KM | Evaluate fare efficiency against distance. |
| New Passengers | Monitor passenger acquisition. |
| Repeat Passengers | Measure returning passenger activity. |
| Repeat Passenger Rate (RPR%) | Evaluate passenger retention. |
| Target Achievement % | Monitor actual trips against planned targets. |

## Project Deliverables

| Deliverable | Description |
|---|---|
| SQL Analysis | SQL solutions for six primary business requests. |
| CSV Reports | Seven analytical reports generated from SQL queries. |
| Power BI Dashboard | Interactive operational performance dashboard. |
| Dashboard Mockup | Dashboard design reference. |
| User Guide | Documentation explaining dashboard navigation and usage. |
| Business Presentation | Summary of findings and business recommendations. |
| Project Documentation | Project overview, SQL documentation, and supporting references. |

## Project Structure

```text
Goodcabs_Transportation_Analytics/
│
├── README.md
│
├── 01_Project_Overview/
│   └── project_introduction.md
│
├── 02_Dashboard_Preview/
│   ├── goodcabs_dashboard_mockup.pdf
│   └── goodcabs_operational_dashboard_export.pdf
│
├── 03_SQL_Analysis/
│   ├── goodcabs_sql_adhoc_analysis.sql
│   └── sql_analysis_documentation.md
│
├── 04_AdHoc_Reports/
│   └── CSV_Reports/
│       └── [7 Analytical CSV Reports]
│
├── 05_Dashboard_Documentation/
│   └── goodcabs_dashboard_user_guide.pdf
│
├── 06_Project_Presentation/
│   └── goodcabs_project_presentation.pptx
│
├── 07_Brand_Assets/
│   └── goodcabs_brand_logo.png
│
└── 08_Project_References/
    └── goodcabs_dataset_metadata.txt
```

## Business Value

The analysis supports Goodcabs in:

- Identifying cities requiring operational improvement.
- Understanding passenger acquisition and retention patterns.
- Evaluating monthly trip target achievement.
- Identifying revenue performance variations across cities.
- Supporting data-driven marketing budget allocation.
- Establishing a foundation for continuous business performance monitoring.

## Confidentiality Notice

This project was developed using confidential Goodcabs business data provided for the analytics engagement.

The original raw datasets and Power BI development file (`.pbix`) are not included in this public project repository due to confidentiality restrictions.

Only materials approved for public sharing are made available.

## Project Information

| Attribute | Details |
|---|---|
| Project | Goodcabs Transportation & Mobility Analytics |
| Engagement Type | Proof of Concept (POC) |
| Analysis Period | January–June 2026 |
| Geographic Coverage | 10 Tier-2 Cities, India |
| Domain | Transportation & Mobility |
| Primary Tools | SQL and Microsoft Power BI |
| Project Category | Business Intelligence & Data Analytics |

---

## Acknowledgements

I would like to express my sincere gratitude to the entire **Codebasics team** for providing the opportunity to participate in **The AI-Era Analyst at AtliQ: Data Analyst Virtual Internship**.

Special thanks to **Hemanand Vadivel** and **Dhaval Patel** for their valuable guidance, practical learning resources, and insights throughout this learning journey.

This virtual internship provided an opportunity to apply SQL, Power BI, and business analytics concepts to a real-world transportation and mobility business scenario.

Thank you to the entire Codebasics team for creating this valuable learning experience and helping aspiring Data Analysts develop industry-relevant analytical skills.

## Connect With Me

I am continuously learning and building projects in Data Analytics, Business Intelligence, and Data Visualization.

- **Email:** [Email Address](mailto:biswajitsasmal.data@gmail.com)
- **LinkedIn:** [Connect with me](https://www.linkedin.com/in/biswajitsasmal)

---

### Thank You!

Thank you for taking the time to explore my Goodcabs Transportation & Mobility Analytics Project.

**Keep Learning. Keep Building. Keep Growing.**

**Goodcabs | Turning Transportation Data into Business Insights.**