CREATE OR REPLACE TABLE `cour32651.Portfolio.channel_device_kpis` AS
WITH base AS (
  SELECT
    PARSE_DATE('%Y%m%d', date) AS session_date,
    trafficSource.medium AS medium,
    trafficSource.source AS source,
    device.deviceCategory AS device,
    geoNetwork.country AS country,
    CONCAT(fullVisitorId, CAST(visitId AS STRING)) AS session_id,
    IFNULL(totals.transactions, 0) AS transactions,
    IFNULL(totals.totalTransactionRevenue, 0) / 1e6 AS revenue_usd
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
)
SELECT
  session_date,
  medium,
  source,
  device,
  country,
  COUNT(DISTINCT session_id) AS sessions,
  SUM(transactions) AS transactions,
  ROUND(SUM(revenue_usd), 2) AS revenue_usd,
  ROUND(SUM(transactions) / COUNT(DISTINCT session_id), 4) AS conv_rate,
  ROUND(SUM(revenue_usd) / COUNT(DISTINCT session_id), 2) AS revenue_per_session
FROM base
GROUP BY session_date, medium, source, device, country;
