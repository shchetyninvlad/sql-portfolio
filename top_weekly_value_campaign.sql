--  Task: Top Weekly Value Campaign (Facebook + Google)
--  Description: Finds the single (week, campaign) with the highest total value across FB + Google.

WITH all_ads AS (
  SELECT DATE(DATE_TRUNC(FBADS.ad_date, WEEK)) AS week_start,
         FC.campaign_name,
         FBADS.value
  FROM facebook_ads_basic_daily FBADS
  LEFT JOIN facebook_campaign FC ON FC.campaign_id = FBADS.campaign_id
  WHERE FBADS.ad_date IS NOT NULL

  UNION ALL

  SELECT DATE(DATE_TRUNC(GADS.ad_date, WEEK)) AS week_start,
         GADS.campaign_name,
         GADS.value
  FROM google_ads_basic_daily GADS
)

SELECT
  week_start,
  campaign_name,
  SUM(value) AS total_value
FROM all_ads
GROUP BY 1, 2
ORDER BY total_value DESC
LIMIT 1;
