select title,
       description,
       release_year,
       runtime,
       type,
       imdb_score
from { ref('titles/titles') }
limit 100