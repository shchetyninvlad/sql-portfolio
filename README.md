# sql-portfolio
My SQL queries from data analytics projects
###  Task 1 – Campaign Performance Analysis

This query calculates aggregated ad spend metrics for both **Facebook** and **Google** campaigns.  
It returns the average, maximum, and minimum daily spending per platform, allowing quick comparison of advertising cost dynamics.

**Tables used:**  
- `facebook_ads_basic_daily`  
- `google_ads_basic_daily`

**Key metrics:**  
- `avg_spend` – average daily ad spend  
- `max_spend` – highest daily ad spend  
- `min_spend` – lowest daily ad spend  

📁 [View SQL file](./task_1_campaign_details.sql)

###  Task 2 – Data Preparation for BI Reporting

This query aggregates advertising performance data from both **Facebook** and **Google** to find the **top 5 days** with the highest ROMI (Return on Marketing Investment).  
It’s designed for further use in **BI systems** like Looker Studio or Power BI and demonstrates data preparation skills with **BigQuery**.

**Metric calculated:**  
- `ROMI (%) = (SUM(value) / SUM(spend)) * 100`

**What it does:**  
- Combines Facebook and Google ads data into a single dataset  
- Aggregates spend and revenue per day  
- Calculates daily ROMI  
- Returns the top 5 days with the highest ROMI

📁 [View SQL file](./task_2_bi_data_preparation.sql)

Highest Weekly Value Campaign
Finds the (week, campaign) with the **maximum total value** across Facebook + Google.

[📁 View SQL](./top_weekly_value_campaign.sql)

