create view zad1  AS
SELECT [OrderDate] 
	   ,sum([SalesAmount]) as Sales
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  group by [OrderDate];

select
	[OrderDate] 
	,Sales
	,avg(Sales) over (order by [OrderDate] rows between 3 preceding and current row ) as Avg_sales
from zad1