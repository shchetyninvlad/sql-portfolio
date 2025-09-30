WITH all_ads AS(
	SELECT date(date_trunc('week', FBADS.ad_date)) AS week_start
		, FC.campaign_name
		, FBADS.value
	FROM facebook_ads_basic_daily FBADS
	LEFT JOIN facebook_campaign FC ON FC.campaign_id = FBADS.campaign_id
	WHERE FBADS.ad_date IS NOT NULL
	
	UNION ALL
	
	SELECT date(date_trunc('week', GADS.ad_date)) AS week_start
		, GADS.campaign_name 
		, GADS.value
	FROM google_ads_basic_daily GADS
)

SELECT week_start
	, campaign_name
	, SUM(value) AS total_value
FROM all_ads
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1
;
