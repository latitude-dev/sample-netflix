select *
from "gld_titles"
{% if params.start_year and params.end_year %}
    where release_year between {{ params.start_year }} and {{ params.end_year }}
{% endif %}