use projektMTProd;


select
	[date]
	,avg(amount) over (order by [fDate] rows between 5 preceding and current row ) as Avg_amount
from Fact_sales;



select fMonth,
	[113],[972],[360],[700],[556],[291]
from 
(
select 
      [customer_idkey]
      ,[amount]
	,month(fDate) as fMonth
  from Fact_sales
) as SourceTable
pivot
(
 sum(amount)
  for [customer_idkey] IN ([113],[972],[360],[700],[556],[291])
) as PivotTable


select carrier,
	[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] 
from 
(
select 
      month(fDate) as fMonth
      ,[amount]
	, carrier_name as carrier
  from Fact_sales
  join Carriers on Carriers.carrier_id = Fact_sales.carrier_idkey
) as SourceTable
pivot
(
	sum(amount)
  for fMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
) as PivotTable




