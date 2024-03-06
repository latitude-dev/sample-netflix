select title,
       description,
       release_year,
       runtime,
       type,
       imdb_score,
       main_country
from { ref('titles/titles') }
limit 100