-- Task 2: Top-5 Days by Overall ROMI (Facebook + Google)
-- Goal:
--   Find the 5 calendar days with the highest overall ROMI using combined data
--   from Facebook and Google ad platforms.
--
-- Metric:
--   ROMI (%) = (SUM(value) / SUM(spend)) * 100
--   (days with zero total spend are excluded)
--
-- Tables:
--   - public.facebook_ads_basic_daily  (ad_date, spend, value, ...)
--   - public.google_ads_basic_daily    (ad_date, spend, value, ...)
--
-- Tool: DBeaver / PostgreSQL

WITH all_ads AS (
  SELECT
    FBADS.ad_date,
    FBADS.spend,
    FBADS.value
  FROM facebook_ads_basic_daily FBADS

  UNION ALL

  SELECT
    GADS.ad_date,
    GADS.spend
    ,GADS.value
  FROM google_ads_basic_daily GADS
)
SELECT
  ad_date,
  ROUND((SUM(value)::numeric / SUM(spend)) * 100, 2) AS romi_percent
FROM all_ads
GROUP BY ad_date
HAVING SUM(spend) > 0
ORDER BY romi_percent DESC
LIMIT 5;
