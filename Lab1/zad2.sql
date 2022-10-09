with view1 as(
SELECT order_d.[order_details_id]
      ,order_d.[order_id]
      ,order_d.[pizza_id]
      ,orders.date as order_date
  FROM [dbo].[order_details] as order_d
  JOIN orders as orders on orders.order_id = order_d.order_id
  WHERE orders.date LIKE '2015-02-%')

  select STRING_AGG(order_id, ', '), order_date
  from view1
  WHERE pizza_id NOT LIKE 'hawaiian%'
  group by order_date