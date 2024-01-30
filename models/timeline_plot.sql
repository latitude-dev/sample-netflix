SELECT
  DATE_TRUNC('week', l1.created_at) AS period,
  COUNT(*) AS count
FROM
  {{ref('events_enriched')}} AS l1
GROUP BY
  DATE_TRUNC('week', l1.created_at)
ORDER BY
  period;