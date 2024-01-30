with lp1 as (
  select * from {{ref('base/events')}}
  where event_type like '%ProfilingCreated%'
),
lp2 as (
  select * from {{ref('base/users')}}
  where activated_ever = 1
),
lp3 as (
  select * from {{ref('base/workspaces')}}
),
SELECT
  lp1.*,
  lp2.email,
  lp2.first_name,
  lp2.last_name,
  lp2.company_name,
  lp2.job_position,
  lp2.job_category,
  lp2.role,
  lp3.total_users,
  lp3.name AS workspace_name,
  lp3.staff,
  lp3.paid
FROM
  {{$1}} AS lp1
JOIN
  {{$2}} AS lp2
  ON lp1.user_id = lp2.id
JOIN
  {{$3}} AS lp3
  ON lp1.workspace_id = lp3.workspace_id;