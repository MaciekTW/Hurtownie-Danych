select month_of_year,
	[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]
from 
(
select 
      [SalesTerritoryKey]
      ,[SalesAmount]
	  ,month([OrderDate]) as month_of_year
  from [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where year([OrderDate]) = 2011
) as SourceTable
pivot
(
 sum([SalesAmount])
  for [SalesTerritoryKey] IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10])
) as PivotTable
order by month_of_year