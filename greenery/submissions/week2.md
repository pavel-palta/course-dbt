<div id="user-content-toc">
  <ul>
    <summary><h1 style="display: inline-block;">Week 2</h1></summary>
  </ul>
</div>

### Part 1. Models

---

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

#

#### 2. What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

###### This is a hypothetical question vs. something we can analyze in our Greenery data set. Think about what exploratory analysis you would do to approach this question.

Some hypothetical indicators of a user who will likely purchase again:
- The deliveries come in time, within estimated delivery time;
- The user has a promocode (though, in our dataset we can only see if the promocode was used).

Some hypothetical indicators of a user who will likely NOT purchase again:
- The product which the user wants to order is not in the inventory;
- The deliveries come with delays, after estimated delivery time.

If I had more data I would look into:
- Quality of the product: if we had systems like Trustpilot or Zendesk we could analyse data on customer feedback regarding our products;
- Competitors' Prices: if there was an additional dataset on competotors with similar product portfolio we could compare our products pricewise;
- Social media engagement and CRM: how we engage existing users, build relationship with the customers, what we offer and how we encourage to make another purchase.

#

#### 3. Creating Marts Folder

• [Marts Folder with Business Units](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts)

#

#### 4. Intermediate and Dim/Fact Models

• [Product](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/product)

• [Core](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/core)

• [Marketing](https://github.com/pavel-palta/course-dbt/tree/main/greenery/models/marts/marketing)

#

#### 5. The product mart could contain a model like fact_page_views which contains all page view events from greenery’s events data

###### We might want to know how different products perform. What are daily page views by product? Daily orders by product? What’s getting a lot of traffic, but maybe not converting into purchases?

#

#### 6. For example, some “core” datasets could include fact_orders, dim_products, and dim_users

#

#### 7. Core datasets could include fact_orders, dim_products, and dim_users

#

#### 8. The marketing mart could contain a model like user_order_facts which contains order information at the user level

###### For those who are less familiar with e-commerce and marketing, we might want to dig into users — when was their first order? Last order? How many orders have they made? Total spend? We might want to dig into our biggest customers and look at trends. As a simple but important model, we can connect user and order data to make querying data about a user easier for stakeholders

#

#### 9. Explain the product mart models you added. Why did you organize the models in the way you did?

#

#### 10. Use the dbt docs to visualize your model DAGs to ensure the model layers make sense

---

### Part 2. Tests

---

### Part 3. Snapshots
