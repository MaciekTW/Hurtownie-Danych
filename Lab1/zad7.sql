with view1 as(
SELECT pizzas.size as size
  FROM [order_details] as orders_d
  JOIN orders as orders on orders.order_id = orders_d.order_id
  JOIN pizzas as pizzas on pizzas.pizza_id = orders_d.pizza_id
  WHERE orders.date BETWEEN '2015-02-01' AND '2015-03-31')


select size, count(*) as sold from view1 group by size order by sold desc