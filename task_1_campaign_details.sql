-- Task 1: Daily Aggregates by Platform (Facebook vs Google)
-- Goal: для КОЖНОЇ дати показати середні, максимальні та мінімальні витрати
--          окремо для Facebook і Google в одній таблиці.
--
-- Tables:
--   - public.facebook_ads_basic_daily  (fields: ad_date, spend, ...)
--   - public.google_ads_basic_daily    (fields: ad_date, spend, ...)
--
-- Tool: DBeaver (SQL)
-- Period: усі наявні дати (за потреби додай WHERE для фільтра)

WITH src AS (
  SELECT
    FB.ad_date,
    'Facebook Ads' AS media_source,
    FB.spend
  FROM facebook_ads_basic_daily FB

  UNION ALL

  SELECT
    G.ad_date,
    'Google Ads'  AS media_source,
    G.spend
  FROM google_ads_basic_daily G
)
SELECT
  ad_date,
  media_source,
  AVG(spend) AS avg_spend,
  MAX(spend) AS max_spend,
  MIN(spend) AS min_spend
FROM src
GROUP BY ad_date, media_source
ORDER BY ad_date, media_source;
