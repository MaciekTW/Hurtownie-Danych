use lab5;


select date,order_details.pizza_id,carrier_id, state_id,sum(CAST(price as REAL)) as accumulated_price from order_details join orders on orders.customer_id = order_details.order_id 
																join customers2 on orders.customer_id = customers2.id 
																join pizzas on order_details.pizza_id = pizzas.pizza_id  
																group by date, order_details.pizza_id,carrier_id, state_id;