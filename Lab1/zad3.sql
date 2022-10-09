with view1 as(
SELECT orders_d.[order_details_id]
      ,orders_d.[order_id]
      ,pizzas.price * orders_d.quantity as total
  FROM [order_details] as orders_d
  JOIN orders as orders on orders.order_id = orders_d.order_id
  JOIN pizzas as pizzas on pizzas.pizza_id = orders_d.pizza_id
  WHERE orders.date LIKE '2015-02-%')

  SELECT TOP(10)
  rank () over (
  order by total desc)
        ,[total]
        ,[order_id]
  FROM view1