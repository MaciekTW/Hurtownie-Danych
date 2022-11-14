SELECT 
      zad.[OrganizationKey]
	  ,zad.SumAmount
	  ,percent_rank() over(order by SumAmount) as PercentRank
	  ,stdev(SumAmount) over(order by zad.[OrganizationKey]) as Std
  from zad5 zad
  join [AdventureWorksDW2019].[dbo].[DimOrganization] dim on zad.[OrganizationKey] = dim.[OrganizationKey]
  order by dim.[OrganizationKey]