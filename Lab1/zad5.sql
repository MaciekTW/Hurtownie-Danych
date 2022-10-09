with view1 as(
SELECT left(orders.time,2) as order_h
  FROM [order_details] as orders_d
  JOIN orders as orders on orders.order_id = orders_d.order_id
  WHERE orders.date LIKE '2015-01-01')

select order_h, count(*) as amount from view1 group by order_h order by order_h