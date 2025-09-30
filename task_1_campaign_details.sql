-- 📊 Task 1: Campaign Performance Analysis
-- 🧠 Description:
--   This query analyzes aggregated ad spend metrics (average, maximum, and minimum)
--   for both Facebook and Google advertising platforms from the ads_analysis_goit_course database.
--   It provides a quick comparison of key spending statistics across platforms.
--
-- 📂 Tables:
--   - public.facebook_ads_basic_daily
--   - public.google_ads_basic_daily
--
-- 📈 Metrics:
--   - avg_spend: average daily ad spend
--   - max_spend: highest daily ad spend
--   - min_spend: lowest daily ad spend
--
-- 🛠️ Tool used: DBeaver

SELECT 
    'Facebook Ads' AS media_source,
    AVG(spend) AS avg_spend,
    MAX(spend) AS max_spend,
    MIN(spend) AS min_spend
FROM facebook_ads_basic_daily 

UNION ALL

SELECT 
    'Google Ads' AS media_source,
    AVG(spend) AS avg_spend,
    MAX(spend) AS max_spend,
    MIN(spend) AS min_spend
FROM google_ads_basic_daily;
