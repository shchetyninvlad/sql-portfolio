-- 📊 Task 2: Data Preparation for BI Reporting
-- 🧠 Description:
--   This query prepares aggregated advertising data from both Facebook and Google
--   to identify the top 5 days with the highest ROMI (Return on Marketing Investment).
--   The results can be used as a data source for BI tools like Looker Studio or Power BI.
--
-- 📂 Tables:
--   - public.facebook_ads_basic_daily
--   - public.google_ads_basic_daily
--
-- 📈 Metrics:
--   - ROMI (%) = (SUM(value) / SUM(spend)) * 100
--
-- 🛠️ Tools used: BigQuery, Google Analytics 4
-- 📅 Period: All available data (can be filtered further if needed)

WITH all_ads AS (
    SELECT
        FBADS.ad_date,
        FBADS.spend,
        FBADS.value
    FROM facebook_ads_basic_daily FBADS

    UNION ALL

    SELECT
        GADS.ad_date,
        GADS.spend,
        GADS.value
    FROM google_ads_basic_daily GADS
)

SELECT
    ad_date,
    (SUM(value) / SUM(spend)::FLOAT) * 100 AS romi
FROM all_ads
GROUP BY ad_date
HAVING SUM(spend) != 0
ORDER BY romi DESC
LIMIT 5;
