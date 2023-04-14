## Week 1
#### 1. How many users do we have?

Answer: **130 users**.

<details>
  
<summary>Query</summary>
  
</br>
  
```
select
  count(distinct user_id) as count_users

from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__users
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| COUNT_USERS |
| ----------- | 
| 130         | 
  
</details>

</br>

#### 2. On average, how many orders do we receive per hour?

Answer: **7.520833 orders** or, if rounded with no remainder, **8 orders**.

<details>
  
<summary>Query</summary>
  
</br>
  
```
with 
  
  orders_hourly as (

    select
      date_trunc(hour, created_at) as created_hour,
      count(distinct order_id) as count_orders
    
    from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders
    
    group by 1
    order by 1 desc

  )

select
  avg(count_orders) as average_orders_hourly,
  round(average_orders_hourly, 0) as average_orders_hourly_rounded_0

from orders_hourly
```
  
</details>

<details>
  
</br>
  
<summary>Result</summary>
  
| AVERAGE_ORDERS_HOURLY       | AVERAGE_ORDERS_HOURLY_ROUNDED_0 |
| --------------------------- | ------------------------------- |
| 7.520833                    | 8                               |
  
</details>

</br>

#### 3. On average, how long does an order take from being placed to being delivered?
Answer: **336252 seconds**. It is **3 days**, **21 hour**, **24 minutes**, **12 seconds** from being placed to being delivered

<details>
  
<summary>Query</summary>
  
</br>
  
```
with 
  
  orders_extended as (

    select
      *,
      timediff(second, created_at, delivered_at) as diff_c_d_seconds
    
    from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders

  )

select
  round(avg(diff_c_d_seconds), 0) as average_diff_c_d_seconds,
  floor(average_diff_c_d_seconds / 86400) as average_diff_c_d_full_days,
  floor((average_diff_c_d_seconds % 86400) / 3600) as average_diff_c_d_full_hours,
  floor((average_diff_c_d_seconds % 3600) / 60) as average_diff_c_d_full_minutes,
  (average_diff_c_d_seconds % 60) as average_diff_c_d_full_seconds

from orders_extended
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| AVERAGE_DIFF_C_D_SECONDS | AVERAGE_DIFF_C_D_FULL_DAYS | AVERAGE_DIFF_C_D_FULL_HOURS | AVERAGE_DIFF_C_D_FULL_MINUTES | AVERAGE_DIFF_C_D_FULL_SECONDS |
| ------------------------ | -------------------------- | --------------------------- | ----------------------------- | ----------------------------- |
| 336252                   | 3                          | 21                          | 24                            | 12                            |
  
</details>

</br>

#### 4. How many users have only made one purchase? Two purchases? Three+ purchases?

Answer: **25 users** with **1 purchase**, **28 users** with **2 purchases** and **71 user** with **3+ purchases**.

<details>
  
<summary>Query</summary>
  
</br>
  
```
with 

  user_orders as (

    select
      user_id,
      count(distinct order_id) as count_orders
    
    from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders
    
    group by 1
    order by 1 asc

  )

select
  case count_orders
    when 1 then 1
    when 2 then 2
    else 3
  end as cohort_orders,
  count(distinct user_id) as count_users
  
from user_orders

group by 1
order by 1 asc
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| COHORT_ORDERS | COUNT_USERS |
| ------------- | ----------- |
| 1             | 25          |
| 2             | 28          |
| 3             | 71          |
  
</details>

</br>

#### 5. On average, how many unique sessions do we have per hour?

Answer: **16.327586 sessions** or, if rounded with no remainder, **16 sessions**.

<details>
  
<summary>Query</summary>

</br>
  
```
with 

  events_hourly as (

    select
      date_trunc(hour, created_at) as created_hour,
      count(distinct event_id) as count_events,
      count(distinct session_id) as count_sessions
    
    from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__events
    
    group by 1
    order by 1 desc

  )

select
  avg(count_sessions) as average_sessions_hourly,
  round(average_sessions_hourly, 0) as average_sessions_hourly_rounded_0

from events_hourly
```
  
</details>

<details>
  
<summary>Result</summary>

</br>
  
| AVERAGE_SESSIONS_HOURLY       | AVERAGE_SESSIONS_HOURLY_ROUNDED_0 |
| ----------------------------- | --------------------------------- |
| 16.327586                     | 16                                |
  
</details>
