with view1 as(
SELECT order_d.[order_details_id]
      ,order_d.[order_id]
      ,order_d.[pizza_id]
      ,order_d.[quantity]
      ,pizzas.price * order_d.quantity total_price
      ,orders.date as order_date
  FROM [dbo].[order_details] as order_d
  JOIN orders as orders on orders.order_id = order_d.order_id
  JOIN pizzas as pizzas on pizzas.pizza_id = order_d.pizza_id
  WHERE orders.date = '2015-02-18')

  select avg(total_price) as avg_price, order_date
  from view1
  group by order_date