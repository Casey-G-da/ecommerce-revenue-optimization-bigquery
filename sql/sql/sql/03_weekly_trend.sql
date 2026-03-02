SELECT
  DATE_TRUNC(session_date, WEEK(MONDAY)) AS week_start,
  SUM(sessions) AS sessions,
  SUM(transactions) AS transactions,
  ROUND(SUM(revenue_usd),2) AS revenue_usd,
  ROUND(SUM(transactions)/SUM(sessions),4) AS conv_rate
FROM `cour32651.Portfolio.channel_device_kpis`
GROUP BY week_start
ORDER BY week_start; 
