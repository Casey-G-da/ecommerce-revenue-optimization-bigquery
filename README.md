# E-Commerce Revenue Optimization (BigQuery + Looker Studio)

## Overview
This project analyzes e-commerce performance using the **Google Analytics Sample Dataset** in **BigQuery**.  
Goal: identify which **marketing channels, devices, and regions** drive the most revenue and conversion, and present the insights in an executive-ready dashboard.

## Business Questions
- Which acquisition channels generate the most revenue?
- Which channels are most efficient (revenue per session)?
- Does device type (desktop vs mobile) impact conversion?
- Which countries contribute most revenue?
- How do revenue and conversion trend over time?

## Dataset
- Source: BigQuery Public Data — `bigquery-public-data.google_analytics_sample.ga_sessions_*`

## Data Modeling (BigQuery)
A modeled KPI table was created for dashboarding:

`cour32651.Portfolio.channel_device_kpis`

Key fields:
- `session_date`, `medium`, `source`, `device`, `country`
- `sessions`, `transactions`, `revenue_usd`
- `conv_rate`, `revenue_per_session`

## Dashboard
**Looker Studio Dashboard (Viewer Link):**  
https://lookerstudio.google.com/s/g7Nmbkkp3FA

## Key Results (Summary)
- Total revenue, sessions, transactions, and conversion rate are tracked with a date filter.
- Channel performance is compared by **total revenue** and **revenue per session** (efficiency).
- Device performance highlights desktop vs mobile differences in revenue and conversion.
- Geographic heatmap shows revenue concentration by country.

## Screenshots
### Full Dashboard Overview
![Dashboard Overview](Dashboard/looker_dashboard.png)

## SQL Files
- `sql/01_build_table.sql` — builds the modeled KPI table
- `sql/02_channel_device_summary.sql` — channel/device performance summary
- `sql/03_weekly_trend.sql` — weekly trend of revenue and conversion

## Tools Used
- BigQuery (SQL)
- Looker Studio (dashboard)
- GitHub (portfolio documentation)
