SELECT
  COUNT(DISTINCT e.user_id) AS unique_users,
  COUNT(DISTINCT e.workspace_id) AS unique_workspaces,
  c.total_users,
  c.total_workspaces,
  ROUND((COUNT(DISTINCT e.user_id) / c.total_users)::numeric * 100.0, 2)::float AS user_ratio_percentage,
  ROUND((COUNT(DISTINCT e.workspace_id) / c.total_workspaces)::numeric * 100.0, 2)::float AS workspace_ratio_percentage,
FROM
  {{ref('events_enriched')}} AS e
CROSS JOIN
  (SELECT
     SUM(total_users) AS total_users,
     SUM(total_workspaces) AS total_workspaces
   FROM
     (
        SELECT
            COUNT(DISTINCT u.id) AS total_users,
            COUNT(DISTINCT u.workspace_id) AS total_workspaces
        FROM {{ref('base/users')}} AS u
        where u.activated_ever = 1
      )) AS c
GROUP BY
  c.total_users,
  c.total_workspaces