SELECT
  created_at AS "Created At",
  email AS "Email",
  first_name AS "First Name",
  last_name AS "Last Name",
  company_name AS "Company Name",
  job_position AS "Position",
  total_users AS "Total Users",
  workspace_name AS "Workspace Name"
FROM
  {{ref('events_enriched')}} AS lp1
order by created_at desc