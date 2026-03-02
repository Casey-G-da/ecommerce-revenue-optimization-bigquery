SELECT
  medium,
  source,
  device,
  SUM(sessions) AS sessions,
  SUM(transactions) AS transactions,
  ROUND(SUM(revenue_usd),2) AS revenue_usd,
  ROUND(SUM(transactions)/SUM(sessions),4) AS conv_rate,
  ROUND(SUM(revenue_usd)/SUM(sessions),2) AS revenue_per_session
FROM `cour32651.Portfolio.channel_device_kpis`
GROUP BY medium, source, device
HAVING sessions > 500
ORDER BY revenue_per_session DESC
LIMIT 20;
