select clean_countries[1] as main_country,
       count(*) as count,
       sum(case when type = 'MOVIE' then 1 else null end) as movies,
       sum(case when type = 'SHOW' then 1 else null end) as shows
from {{ ref('titles') }}
where clean_countries[1] != ''
group by 1
order by 2 desc
limit 20