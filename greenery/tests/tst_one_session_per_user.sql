select
  session_id,
  count(distinct user_id) as users

from {{ ref('stg_postgres__events') }}

group by 1

having users > 1