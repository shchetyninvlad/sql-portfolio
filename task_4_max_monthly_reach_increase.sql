--Знайди кампанію, що мала найбільший приріст у охопленні місяць-до місяця.
WITH all_ads AS(
	SELECT date(date_trunc('month', FBADS.ad_date)) AS month_start
		, FC.campaign_name
		, FBADS.reach
	FROM facebook_ads_basic_daily FBADS
	LEFT JOIN facebook_campaign FC ON FC.campaign_id = FBADS.campaign_id
	WHERE FBADS.ad_date IS NOT NULL
	
	UNION ALL
	
	SELECT date(date_trunc('month', GADS.ad_date)) AS month_start
		, GADS.campaign_name 
		, GADS.reach
	FROM google_ads_basic_daily GADS
),

-- Сумма охоплення (FB+Google) по місяцям 
agg_reach AS (
	SELECT month_start
		, campaign_name 
		, SUM(reach) AS sum_reach
	FROM all_ads
	GROUP BY 1,2
),
--Пошук різниці з попереднім місяцем 
diff_reach AS (
	SELECT *
		, lag(sum_reach, 1) OVER (PARTITION BY campaign_name ORDER BY month_start) AS prev_reach
		, sum_reach - (lag(sum_reach, 1) OVER (PARTITION BY campaign_name ORDER BY month_start)) AS diff_reach
	FROM agg_reach
)
--Пошук компаній з найбільшим приростом охоплення місяць до місяця
SELECT  month_start
	, campaign_name
	, diff_reach AS max_reach_increase
FROM diff_reach
WHERE diff_reach IS NOT NULL
ORDER BY 3 DESC
LIMIT 1;
