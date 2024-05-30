select release_year,
       count(distinct id) as count_total,
       count(distinct case when type='SHOW' then id else null end) as count_shows,
       count(distinct case when type='MOVIE' then id else null end) as count_movies,
from { ref('titles') }
group by 1
order by 1 asc