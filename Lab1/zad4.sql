with view1 as(
SELECT orders_d.[order_id]
      ,pizzas.price * orders_d.quantity as total_price
      ,orders.date as order_date
      ,month(orders.date) as date_m
  FROM [order_details] as orders_d
  JOIN orders as orders on orders.order_id = orders_d.order_id
  JOIN pizzas as pizzas on pizzas.pizza_id = orders_d.pizza_id),

  view2 as(
  select avg(total_price) as monthly_avg, date_m
  from view1
  group by date_m)


  SELECT view1.order_id
        ,view1.total_price
        ,monthly_avg
        ,view1.order_date
  FROM view1 
  JOIN view2 on view2.date_m = view1.date_m