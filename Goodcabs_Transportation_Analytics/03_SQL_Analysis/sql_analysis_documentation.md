# Goodcabs | SQL Ad-Hoc Business Analysis Documentation

## 1. Overview

This document explains the SQL-based Ad-Hoc Business Analysis performed for the Goodcabs Transportation & Mobility Analytics Project.

The analysis uses SQL to evaluate operational performance, passenger acquisition, repeat passenger behaviour, revenue distribution, and monthly trip target achievement across Goodcabs' 10 tier-2 cities.

**Analysis Period:** January–June 2026 (H1 2026)

**SQL Environment:** PostgreSQL

**Primary Deliverable:** Six business requests producing seven analytical report outputs.

---

## 2. Database Tables Used

The analysis uses the following database tables:

| Table Name | Purpose |
|---|---|
| `dim_city` | Contains city-level information and city identifiers. |
| `fact_trips` | Contains trip-level information, including trip IDs, dates, fares, and travel distances. |
| `monthly_target_trips` | Stores monthly trip targets for each city. |
| `dim_repeat_trip_distribution` | Contains repeat passenger distribution by trip frequency and city. |
| `fact_passenger_summary` | Contains monthly passenger acquisition, total passengers, and repeat passenger information. |

---

## 3. SQL Business Analysis

### Business Request 01: City-Level Trip and Fare Summary

**Business Objective**

Evaluate trip volume and fare performance across cities to understand each city's contribution to overall trip activity.

**SQL Approach**

- Join `dim_city` with `fact_trips` using `city_id`.
- Calculate total trips using `COUNT(trip_id)`.
- Calculate average fare per kilometre using total fare divided by total distance travelled.
- Calculate average fare per trip.
- Calculate each city's percentage contribution to overall trip volume.
- Group results by city.

**Key SQL Concepts**
- INNER JOIN
- COUNT(), SUM()
- GROUP BY
- ROUND()
- Subquery
- Type Casting

**Expected Output**

| Field | Description |
|---|---|
| city_name | City name |
| total_trips | Total completed trips |
| avg_fare_per_km | Average fare per kilometre |
| avg_fare_per_trip | Average fare per trip |
| %_contribution | City's share of overall trips |

**Business Relevance**

Helps identify high-volume and low-volume cities and compare fare performance across the operating network.

---

### Business Request 02: Monthly City-Level Trips Target Performance

**Business Objective**

Evaluate monthly trip performance against predefined city-level targets and identify performance gaps.

**SQL Approach**

- Join `dim_city`, `fact_trips`, and `monthly_target_trips`.
- Use Common Table Expressions (CTEs) to calculate actual and target trips separately.
- Compare actual trips with target trips.
- Apply CASE statements to classify performance.
- Calculate the percentage difference between actual and target trips.

**Performance Classification**

| Condition | Performance Status |
|---|---|
| Actual Trips > Target Trips | Above Target |
| Actual Trips = Target Trips | On Target |
| Actual Trips < Target Trips | Below Target |

**Key SQL Concepts**
- Common Table Expressions (CTEs)
- INNER JOIN
- TO_CHAR()
- CASE WHEN
- COUNT()
- Percentage Variance Calculation

**Expected Output**

| Field | Description |
|---|---|
| city_name | City name |
| month_name | Reporting month |
| actual_trips | Actual completed trips |
| target_trips | Monthly target trips |
| performance_status | Target achievement category |
| percentage_difference | Percentage variance against target |

**Business Relevance**

Helps city operations teams identify underperforming months and prioritize operational improvements to achieve trip targets.

---

### Business Request 03: City-Level Repeat Passenger Trip Frequency

**Business Objective**

Understand repeat passenger usage patterns by measuring the percentage distribution of repeat passengers across different trip-frequency categories.

**SQL Approach**

- Join `dim_repeat_trip_distribution` with `dim_city`.
- Use conditional aggregation with CASE statements.
- Calculate the percentage contribution of each trip-frequency category.
- Group the results by city.

**Trip Frequency Categories**

2-Trips, 3-Trips, 4-Trips, 5-Trips, 6-Trips, 7-Trips, 8-Trips, 9-Trips, and 10-Trips.

**Key SQL Concepts**
- INNER JOIN
- CASE WHEN
- Conditional Aggregation
- SUM()
- GROUP BY
- Percentage Distribution

**Expected Output**

| Field | Description |
|---|---|
| city_name | City name |
| 2-Trips to 10-Trips | Percentage of repeat passengers in each trip-frequency category |

**Business Relevance**

Helps identify cities with stronger repeat passenger usage and understand the frequency of customer engagement.

---

### Business Request 04: Identify Cities with Highest and Lowest New Passengers

**Business Objective**

Identify the top three and bottom three cities based on total new passenger acquisition.

**SQL Approach**

- Join `fact_passenger_summary` with `dim_city`.
- Aggregate new passengers using SUM().
- Apply DENSE_RANK() to rank cities by new passenger volume.
- Use descending order to identify the top three cities.
- Use ascending order to identify the bottom three cities.
- Combine both results using UNION.

**Key SQL Concepts**
- INNER JOIN
- SUM()
- DENSE_RANK()
- Window Functions
- Subqueries
- UNION

**Expected Output**

| Field | Description |
|---|---|
| city_name | City name |
| total_new_passengers | Total newly acquired passengers |
| city_category | Top-3 or Bottom-3 |

**Business Relevance**

Helps identify strong and weak passenger acquisition markets and supports city-level marketing budget allocation.

---

### Business Request 05: Identify the Month with Highest Revenue for Each City

**Business Objective**

Identify the highest revenue-generating month for each city and measure its contribution to the city's overall revenue.

**SQL Approach**

- Join `dim_city` with `fact_trips`.
- Use a CTE to calculate total revenue for each city.
- Aggregate monthly revenue using SUM(fare_amount).
- Apply DENSE_RANK() partitioned by city.
- Rank monthly revenue in descending order.
- Select the highest revenue month for each city.
- Calculate its percentage contribution to total city revenue.

**Key SQL Concepts**
- Common Table Expressions (CTEs)
- INNER JOIN
- SUM()
- TO_CHAR()
- DENSE_RANK()
- PARTITION BY
- Percentage Contribution

**Expected Output**

| Field | Description |
|---|---|
| city_name | City name |
| highest_revenue_month | Month generating the highest revenue |
| revenue | Revenue generated during that month |
| percentage_contribution | Share of the city's total revenue |

**Business Relevance**

Helps identify revenue-generating months and understand monthly revenue concentration across cities.

---

### Business Request 06: Repeat Passenger Rate (RPR%) Analysis

**Business Objective**

Evaluate repeat passenger behaviour through monthly and overall city-level Repeat Passenger Rate (RPR%).

**SQL Approach**

The analysis generates two separate reports.

**A. Monthly City-Level Repeat Passenger Rate**

- Join `fact_passenger_summary` with `dim_city`.
- Retrieve monthly total passengers and repeat passengers.
- Calculate monthly RPR% by dividing repeat passengers by total passengers.
- Group and order results by city and month.

**B. Overall City-Level Repeat Passenger Rate**

- Aggregate total passengers and repeat passengers for each city.
- Calculate overall RPR% using aggregated passenger counts.
- Group results by city.

**RPR% Formula**

Repeat Passenger Rate:

RPR% = (Repeat Passengers / Total Passengers) × 100

**Key SQL Concepts**
- INNER JOIN
- SUM()
- GROUP BY
- ORDER BY
- ROUND()
- Type Casting
- Percentage Calculation

**Expected Output**

**Report A: Monthly RPR Analysis**

| Field | Description |
|---|---|
| city_name | City name |
| month_name | Reporting month |
| total_passengers | Total passengers |
| repeat_passengers | Repeat passengers |
| monthly_repeat_passenger_rate | Monthly RPR% |

**Report B: City-Level RPR Analysis**

| Field | Description |
|---|---|
| city_name | City name |
| city_repeat_passenger_rate | Overall city-level RPR% |

**Business Relevance**

Helps identify differences in passenger retention across cities and months, supporting targeted customer retention strategies.

---

## 4. SQL Concepts Applied

The following SQL concepts were used throughout the business analysis:

| SQL Concept | Application |
|---|---|
| INNER JOIN | Combining dimension and fact tables |
| GROUP BY | Aggregating city-level and monthly metrics |
| ORDER BY | Organizing analytical results |
| CTEs | Structuring multi-step analytical queries |
| CASE WHEN | Conditional classification and aggregation |
| DENSE_RANK() | Ranking cities and monthly revenue |
| PARTITION BY | Ranking revenue independently for each city |
| UNION | Combining top and bottom city results |
| Subqueries | Calculating overall totals and intermediate results |
| Aggregate Functions | Calculating trips, revenue, fares, and passengers |
| Type Casting | Handling decimal calculations |
| TO_CHAR() | Formatting dates into month names |

---

## 5. Business Analysis Coverage

The six business requests address the following transportation and mobility business areas:

| Business Area | Analytical Focus | Business Application |
|---|---|---|
| Trip Performance | City-level trip volume | Operational performance monitoring |
| Fare Performance | Average fare per trip and kilometre | Pricing efficiency analysis |
| Target Achievement | Actual vs. target trips | Operational improvement |
| Passenger Acquisition | New passenger distribution | Acquisition strategy |
| Passenger Retention | Monthly and city-level RPR% | Retention strategy |
| Passenger Engagement | Repeat trip frequency | Customer loyalty analysis |
| Revenue Performance | Highest revenue month | Revenue planning |

---

## 6. Analytical Outputs

The SQL analysis produces seven report outputs:

1. City-Level Trip and Fare Summary Report.
2. Monthly City-Level Trips Target Performance Report.
3. City-Level Repeat Passenger Trip Frequency Report.
4. Highest and Lowest New Passenger Cities Report.
5. City-Level Highest Revenue Month Report.
6. Monthly City-Level Repeat Passenger Rate Report.
7. Overall City-Level Repeat Passenger Rate Report.

These reports are exported as CSV files and organized in the project's `04_AdHoc_Reports/` directory.

---

## 7. Important Implementation Notes

- The SQL script uses PostgreSQL-specific syntax, including `TO_CHAR()`, `::NUMERIC`, and type casting.
- Percentage calculations are rounded to two decimal places and formatted as text with a percentage symbol.
- `DENSE_RANK()` can return more than three cities or months when ranking ties occur.
- The trip-frequency report calculates percentages using the sum of repeat passenger counts across the available frequency categories.
- The monthly and overall RPR calculations use passenger counts aggregated at their respective reporting levels.
- The monthly target query classifies equal actual and target trips as "On Target", consistent with the implemented SQL.
- Month names are used for sorting in certain queries. Chronological month ordering should be validated when consuming the outputs.

## 8. Conclusion

The SQL Ad-Hoc Business Analysis provides a structured approach to evaluating Goodcabs' H1 2026 operational and passenger performance.

The analytical outputs support city-level performance monitoring, passenger acquisition and retention analysis, revenue evaluation, and monthly target assessment.

These SQL reports also establish a foundation for the Power BI dashboard, enabling business stakeholders to monitor key transportation performance indicators and make data-driven operational and marketing decisions.