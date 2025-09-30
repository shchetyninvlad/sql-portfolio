# sql-portfolio
My SQL queries from data analytics projects
###  Task 1 – Daily Aggregates by Platform
Повертає для **кожної дати** агрегати витрат окремо для Facebook та Google:
- `avg_spend` (середнє)
- `max_spend` (максимум)
- `min_spend` (мінімум)

**Групування:** `ad_date`, `media_source`  
**Таблиці:** `facebook_ads_basic_daily`, `google_ads_basic_daily`

[📁 View SQL](./task_1_daily_platform_aggregates.sql)

###  Task 2 – Top-5 Days by Overall ROMI
Aggregates **Facebook + Google** ads data to find the **five days** with the highest ROMI.

**Metric**
- `ROMI (%) = (SUM(value) / SUM(spend)) * 100`
- Days with `SUM(spend) = 0` are excluded

**Output**
- `ad_date`
- `romi_percent`

[📁 View SQL](./task_2_top5_romi_days.sql)

###  Task 3 – Highest Weekly Total Value by Campaign
Повертає (тиждень, кампанію) з найбільшим сумарним **weekly value** з урахуванням Facebook + Google.

**Вивід**
- `week_start`
- `campaign_name`
- `total_value`

[📁 View SQL](./task_3_top_weekly_value_campaign.sql)

###  Task 4 – Max Month-over-Month Reach Increase
Знаходить (місяць, кампанію) з найбільшим **абсолютним** приростом охоплення (MoM) з урахуванням **Facebook + Google**.

**Логіка**
- Агрегує `reach` по `month_start` і `campaign_name`
- Обчислює приріст: `diff_reach = sum_reach - LAG(sum_reach)`
- Повертає один топ-результат

**Вивід**
- `month_start`
- `campaign_name`
- `max_reach_increase`

[📁 View SQL](./task_4_max_monthly_reach_increase.sql)

###  Task 5 – Longest Continuous Daily Run by Ad Set
Знаходить **adset_name** з найтривалішим безперервним (щоденним) показом, об’єднавши дані **Facebook + Google**.

**Підхід (gaps & islands):**
- Об’єднання дат показів по `adset_name`
- Групування послідовних днів через `ad_date - ROW_NUMBER()*1 day`
- Підрахунок довжини серії (`run_length`) та вибір максимуму

**Вивід**
- `adset_name`
- `run_length` (кількість днів)

[📁 View SQL](./task_5_longest_daily_adset_run.sql)



