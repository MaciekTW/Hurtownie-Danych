SELECT 
      OrganizationKey
      ,DepartmentGroupKey
      ,sum(Amount)
	  FROM [AdventureWorksDW2019].[dbo].[FactFinance]
	  group by rollup( OrganizationKey,DepartmentGroupKey)
	  order by OrganizationKey