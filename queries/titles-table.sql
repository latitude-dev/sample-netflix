select title,
       description,
       release_year,
       runtime,
       type,
       imdb_score
from { ref('titles') }
limit 10