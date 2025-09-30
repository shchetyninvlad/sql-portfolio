--Напиши запит, який поверне назву та тривалість найдовшого безперервного (щоденного) показу adset_name (разом з Google та Facebook)
WITH all_ads AS(
	SELECT ad_date
		, adset_name
	FROM facebook_ads_basic_daily FBADS
	LEFT JOIN facebook_adset FA ON FA.adset_id  = FBADS.adset_id
	WHERE FBADS.ad_date IS NOT NULL
UNION ALL
	SELECT ad_date
		, adset_name
	FROM google_ads_basic_daily GADS
),
-- Надаємо 
ranked_ads AS (
	SELECT *
		, ad_date - row_number() OVER (PARTITION BY adset_name ORDER BY ad_date)* INTERVAL '1 day' AS grp
	FROM all_ads
),

group_ads AS (
	SELECT adset_name
	  , grp
	  , MIN(ad_date) AS start_date
	  , MAX(ad_date) AS end_date
	  , COUNT(*) AS run_length
	FROM ranked_ads
	GROUP BY 1,2 
	ORDER BY run_length DESC
)
 
SELECT adset_name
 	, run_length
FROM group_ads
LIMIT 1;
