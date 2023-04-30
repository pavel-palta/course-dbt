<div id="user-content-toc">
  <ul>
    <summary><h1 style="display: inline-block;">Week 4</h1></summary>
  </ul>
</div>

### Part 1. dbt Snapshots

---

#### 1. Which products had their inventory change from week 3 to week 4?

#### 2. Which products had the most fluctuations in inventory?

#### 3. Did we have any items go out of stock in the last 3 weeks?

### Part 2. Modeling

---

#### 1. How are our users moving through the product funnel?

Additional models I created to answer this question is

#### 2. Which steps in the funnel have largest drop off points?

Additional models I created to answer this question is

#### 3. Exposure on my product analytics model:

dashboard on Sigma is here sigma workbook

### Part 3. Reflections

---

#### 1. Some things I might do differently / recommend my organization which is using dbt based on learning from the course.

- **dbt Snapshots** and **dbt Seeds** are very powerful features in the right hands, I think there are many good use-cases to review on where we can apply these in our organisation;

- The project structure which has been proposed in this course with **staging** & **intermediate** models is very thought through and represent a good practice on working with sources and sharing them further across the models, it does allow the analytics developers to write DRY code and define the data once, then reuse the logic;

- The documentation on **dbt Packages** and **dbt Macros** as well as **predefined tests** is another powerful thing we could pay attention to more, why would one want to write the same things similar across many organisations from scratch if the community has already defined them well;

- And last but not least, another cool feature important for the final users is **sources freshness** metadata: it is an often asked question "how fresh is the data, when was this dashboard last updated?". There was a demo from my manager they brougt to us from a conference where one organisation uses this as a dashboard element — would be nice to bring this as a feature to our project.

#### 2. How I would go about setting up a production/scheduled dbt run of my project in an ideal state.

- First I would gather all the seeds, snapshots and models which run on **table** or **incremental** materialization types and divide them on datagroups depending on how ofthen they can be updated, then I'd add business line to them and get a matrix like so (of course according with business SLAs but below is just an example):

Each matrix cell would represent a separate archestrator task with its own cron.

| Update frequency    | Core                | Logistics           | Marketing           | Product             |
|---------------------|---------------------|---------------------|---------------------|---------------------|
| Hourly              | f_orders            | f_delayed_orders    | -                   | f_sessions          |
| Every 4 hours       | -                   | sst_products        | f_orders_promo      | f_page_views        |
| Daily               | d_products, d_users | d_inventory         | -                   | d_product_funnels   |
| Weekly              | -                   | d_addresses         | d_promos            | -                   |
| Monthly             | -                   | seed_states         | -                   | -                   |

- I have been working with Airflow for around 5 years already and I think it's a nice opensource (yay) library to schedule the task runs. Perhaps there are better alternatives but I haven't tried them so I would stick with Airflow at first or might consider other task-managers if I had such opportunity;

- As mentioned on the first bullet of this question I'd collect matadata on freshness of each model in a table which later can be used on a dashboard for the business to keep the hand on pulse.
