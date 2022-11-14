 create view zad5 as
 select OrganizationKey
		,sum(Amount) as SumAmount
 from [AdventureWorksDW2019].[dbo].[FactFinance]
 where year(date) = 2012
 group by OrganizationKey;


SELECT 
      zad.[OrganizationKey]
	  ,zad.SumAmount
	  ,PERCENT_RANK() over(order by SumAmount) as PercentRank
  from zad5 zad
  join [AdventureWorksDW2019].[dbo].[DimOrganization] dim on zad.[OrganizationKey] = dim.[OrganizationKey]
  order by dim.[OrganizationKey]