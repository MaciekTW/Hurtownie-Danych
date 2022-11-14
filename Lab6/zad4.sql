SELECT 
      OrganizationKey
      ,DepartmentGroupKey
      ,sum(Amount)
  FROM [AdventureWorksDW2019].[dbo].[FactFinance]
  group by cube( OrganizationKey,DepartmentGroupKey)
  order by OrganizationKey