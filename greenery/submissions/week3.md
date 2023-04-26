<div id="user-content-toc">
  <ul>
    <summary><h1 style="display: inline-block;">Week 3</h1></summary>
  </ul>
</div>

### Part 1. Create new models to answer the questions

---

#### 1. What is our overall conversion rate?

**62.4567%** or, if rounded with no remainder, **62%**.

<details>
  
<summary>Query</summary>
  
</br>
  
```sql
select
  count(distinct session_id) as count_sessions,
  count(distinct iff(checkout_events >0, session_id, null)) as count_sessions_checkout, 
  count_sessions / count_sessions_checkout * 100 as rate_conversion,
  round(rate_conversion, 0) as rate_conversion_rounded_0

from dev_db.dbt_pavelfilatovpaltacom.f_sessions
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| COUNT_SESSIONS | COUNT_SESSIONS_CHECKOUT | RATE_CONVERSION | RATE_CONVERSION_ROUNDED_0  |
| -------------- | ----------------------- | --------------- | -------------------------- |
| 578            | 361                     | 62.4567         | 62                         |

  
</details>


#### 2. What is our conversion rate by product?

<details>
  
<summary>Query</summary>
  
</br>
  
```sql
select
  pv.product,
  count(distinct pv.session_id) as count_sessions,
  count(distinct iff(s.checkout_events > 0, s.session_id, null)) as count_sessions_checkout,
  concat(round(count_sessions_checkout / count_sessions * 100, 0), ' %') as rate_conversion
  

from dev_db.dbt_pavelfilatovpaltacom.f_page_views as pv
left join dev_db.dbt_pavelfilatovpaltacom.f_sessions as s
  on pv.session_id = s.session_id

group by 1
order by 4 desc
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| PRODUCT              | COUNT_SESSIONS | COUNT_SESSIONS_CHECKOUT | RATE_CONVERSION |
|----------------------|----------------|-------------------------|-----------------|
| Fiddle Leaf Fig      | 56             | 50                      | 89%             |
| String of pearls     | 64             | 57                      | 89%             |
| Monstera             | 49             | 43                      | 88%             |
| ZZ Plant             | 63             | 55                      | 87%             |
| Cactus               | 55             | 47                      | 85%             |
| Bamboo               | 67             | 56                      | 84%             |
| Calathea Makoyana    | 53             | 44                      | 83%             |
| Spider Plant         | 59             | 49                      | 83%             |
| Majesty Palm         | 67             | 55                      | 82%             |
| Ponytail Palm        | 70             | 55                      | 79%             |
| Dragon Tree          | 62             | 49                      | 79%             |
| Arrow Head           | 63             | 50                      | 79%             |
| Money Tree           | 56             | 44                      | 79%             |
| Rubber Plant         | 54             | 42                      | 78%             |
| Snake Plant          | 73             | 56                      | 77%             |
| Devil's Ivy          | 45             | 34                      | 76%             |
| Bird of Paradise     | 60             | 45                      | 75%             |
| Pilea Peperomioides  | 59             | 44                      | 75%             |
| Philodendron         | 62             | 46                      | 74%             |
| Angel Wings Begonia  | 61             | 45                      | 74%             |
| Pothos               | 61             | 45                      | 74%             |
| Birds Nest Fern      | 78             | 57                      | 73%             |
| Orchid               | 75             | 55                      | 73%             |
| Peace Lily           | 66             | 48                      | 73%             |
| Pink Anthurium       | 74             | 54                      | 73%             |
| Ficus                | 68             | 49                      | 72%             |
| Boston Fern          | 63             | 45                      | 71%             |
| Jade Plant           | 46             | 32                      | 70%             |
| Alocasia Polly       | 51             | 34                      | 67%             |
| Aloe Vera            | 65             | 43                      | 66%             |


  
</details>

#### 3. Question to think about: Why might certain products be converting at higher/lower rates than others? We don't actually have data to properly dig into this, but we can make some hypotheses.

- appealing design, photos and descriptions of a product

- ratins and reviews, external and on the website

- product availability

- price/value rate as well as competitors' prices

- promocodes for certain products

- shipping, guarantee and return policies

- order appearance in catalogue layout

- advertising, posts in social media and influencers promotions

- overall hype over a certain product


### Part 2. dbt Macros. 

---

### Part 3. Granting permissions. 

---

### Part 4. dbt Packages. 

---

### Part 5. Improved a DAG. 

---

### Part 6. dbt Snapshots. 

---
