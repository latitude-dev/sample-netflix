with t1 as (
    select clean_countries[1] as country, count(*) as count
    from { ref('titles') }
    where clean_countries[1] != ''
    group by 1
    order by 2 desc
    limit 10
)
select *
from t1
order by 2 asc