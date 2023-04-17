<div id="user-content-toc">
  <ul>
    <summary><h1 style="display: inline-block;">Week 2</h1></summary>
  </ul>
</div>

### Part 1. Models

---

### Q&A

#### 1. What is our user repeat rate?

Answer: **79.8387%** or, if rounded with no remainder, **80%**.

###### Repeat Rate = Users who purchased 2 or more times / users who purchased

<details>
  
<summary>Query</summary>
  
</br>
  
```sql
with 

  user_orders as (

    select
      user_id,
      count(distinct order_id) as count_orders,
      iff(count_orders > 1, true, false) as is_returning_user
    
    from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders
    
    group by 1
    order by 1 asc

  )

select
  count(distinct user_id) as count_users,
  count(distinct iff(is_returning_user, user_id, null)) as count_returning_users,
  div0(count_returning_users, count_users) * 100 as rate_repeat,
  round(rate_repeat, 0) as rate_repeat_rounded_0
  
from user_orders
```
  
</details>

<details>
  
<summary>Result</summary>
  
</br>
  
| COUNT_USERS | COUNT_RETURNING_USERS | RATE_REPEAT | RATE_REPEAT_ROUNDED_0 |
| ----------- | --------------------- | ----------- | --------------------- |
| 124         | 99                    | 79.8387     | 80                    |
  
</details>

#### 2. What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

There are 4 hypotesis I have generated on indicators of users who will likely purchase again.
- Delivery time
- Some product which makes great experience
- Discounts and promotions
- Products variety

If I had more data I would look into:
- Quality of the product: if we had systems like Trustpilot or Zendesk we could analyse data on customer feedback regarding our products;
- Competitors' Prices: if there was an additional dataset on competotors with similar product portfolio we could compare our products pricewise and see how often the products with less competitive offer is ordered;
- Web analytics: to analyse overall shopping experience, clicks to purchase steps, loading times of the pages, quality of the content;
- Social media engagement and CRM: how we engage existing users, build relationship with the customers, what we offer and how we encourage to make another purchase.


#### 3. What are daily page views by product? Daily orders by product? What’s getting a lot of traffic, but maybe not converting into purchases

#

### Creating Marts Folder

#### [• Marts Folder with Business Units](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts)

#

### Intermediate and Dim/Fact Models

#### • [Product](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/product)
#### • [Core](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/core)
#### • [Marketing](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/marketing)

#

---

### Product Mart

#### • Page Views Events

### Core Mart

#### • Fact Orders
#### • Dim Products
#### • Dim Users

### Marketing Mart

#### • Fact User Order

### Visual representation of DAGs from dbt docs

#

#### 4. When was their first order? Last order? How many orders have they made? Total spend?

### Part 2. Tests

---

### Part 3. Snapshots

---
