-- select all data set --
  SELECT *

  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']

-- This can show how the total sales amount accumulates over time --
SELECT TOP (1000) [Order Numer]
      ,[Quantity]
      ,[ Unit Price ]
      ,[ Total Amount ]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Year of Transaction]
      ,[Product Type]
      ,[Product Code]
      ,[Customer Name]
      ,[Customer ID]
      ,[Transaction ID],
	  SUM([ Total Amount ]) OVER (ORDER BY [Transaction Date]) AS RunningTotalAmount 
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']

--  This will rank sales by the total amount within each year. --
  SELECT TOP (1000) [Order Numer]
      ,[Quantity]
      ,[ Unit Price ]
      ,[ Total Amount ]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Year of Transaction]
      ,[Product Type]
      ,[Product Code]
      ,[Customer Name]
      ,[Customer ID]
      ,[Transaction ID],
	 RANK() OVER (PARTITION BY [Year of Transaction] ORDER BY [ Total Amount ] DESC) AS SalesRank
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']


--- This provides the average sales amount for each product type. 
  SELECT TOP (1000) [Order Numer]
      ,[Quantity]
      ,[ Unit Price ]
      ,[ Total Amount ]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Year of Transaction]
      ,[Product Type]
      ,[Product Code]
      ,[Customer Name]
      ,[Customer ID]
      ,[Transaction ID],
	   AVG([ Total Amount ]) OVER (PARTITION BY [Product Type]) AS AvgSalesByProductType
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']


-- This provides the total and average sales amount for each customer
  SELECT TOP (1000) [Order Numer]
      ,[Quantity]
      ,[ Unit Price ]
      ,[ Total Amount ]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Year of Transaction]
      ,[Product Type]
      ,[Product Code]
      ,[Customer Name]
      ,[Customer ID]
      ,[Transaction ID],
 SUM([ Total Amount ]) OVER (PARTITION BY [Customer ID]) AS TotalSalesByCustomer,
    AVG([ Total Amount ]) OVER (PARTITION BY [Customer ID]) AS AvgSalesByCustomer
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']

-- Difference from Previous Transaction Amount:
  SELECT TOP (1000) [Order Numer]
      ,[Quantity]
      ,[ Unit Price ]
      ,[ Total Amount ]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Year of Transaction]
      ,[Product Type]
      ,[Product Code]
      ,[Customer Name]
      ,[Customer ID]
      ,[Transaction ID],
  [ Total Amount ] - LAG([ Total Amount ], 1, 0) OVER (ORDER BY [Transaction Date]) AS DifferenceFromPreviousTransaction
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$']