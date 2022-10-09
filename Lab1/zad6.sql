with view1 as(
SELECT pizza_types.name as pizza_name
      ,pizza_types.category as category
  FROM [order_details] as orders_d
  JOIN orders as orders on orders.order_id = orders_d.order_id
  JOIN pizzas as pizzas on pizzas.pizza_id = orders_d.pizza_id
  JOIN pizza_types as pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
  WHERE orders.date LIKE '2015-01-%')


select pizza_name, category, count(*) as sold from view1 group by pizza_name, category order by sold desc