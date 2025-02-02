--  Calculate the total, count, and average sales amount by customer-- 

  SELECT TOP (1000) 
    [Order Numer],
    [Quantity],
    [ Unit Price ],
    [ Total Amount ],
    [Transaction Date],
    [Shipping Status],
    [Year of Transaction],
    [Product Type],
    [Product Code],
    [Customer Name],
    [Customer ID],
    [Transaction ID],
    SUM([ Total Amount ]) OVER (PARTITION BY [Customer ID]) AS TotalSalesByCustomer,
    COUNT([Transaction ID]) OVER (PARTITION BY [Customer ID]) AS CountSalesByCustomer,
    AVG([ Total Amount ]) OVER (PARTITION BY [Customer ID]) AS AvgSalesByCustomer
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$'];

--- Rank the transactions for each customer by transaction amount. --- 

 SELECT TOP (1000) 
    [Order Numer],
    [Quantity],
    [ Unit Price ],
    [ Total Amount ],
    [Transaction Date],
    [Shipping Status],
    [Year of Transaction],
    [Product Type],
    [Product Code],
    [Customer Name],
    [Customer ID],
    [Transaction ID],
    ROW_NUMBER() OVER (PARTITION BY [Customer ID] ORDER BY [ Total Amount ]
 DESC) AS RowNumberByCustomer,
   RANK() OVER (PARTITION BY [Customer ID] ORDER BY [ Total Amount ]
 DESC) AS RankByCustomer,
  DENSE_RANK() OVER (PARTITION BY [Customer ID] ORDER BY [ Total Amount ]
 DESC) AS DenseRankByCustomer
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$'];


--  Divide the transactions into 4 quartiles for each customer based on transaction amount. --
  SELECT TOP (1000) 
    [Order Numer],
    [Quantity],
    [ Unit Price ],
    [ Total Amount ],
    [Transaction Date],
    [Shipping Status],
    [Year of Transaction],
    [Product Type],
    [Product Code],
    [Customer Name],
    [Customer ID],
    [Transaction ID],
   NTILE(4) OVER (PARTITION BY [Customer ID] ORDER BY  [ Total Amount ]DESC) AS QuartileByCustomer
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$'];


--- Get the previous and next transaction amounts for each customer. ---
  SELECT TOP (1000) 
    [Order Numer],
    [Quantity],
    [ Unit Price ],
    [ Total Amount ],
    [Transaction Date],
    [Shipping Status],
    [Year of Transaction],
    [Product Type],
    [Product Code],
    [Customer Name],
    [Customer ID],
    [Transaction ID],
 LAG([ Total Amount ], 1, 0) OVER (PARTITION BY [Customer ID] ORDER BY [Transaction Date]) AS PreviousTransactionAmount,
    LEAD([ Total Amount ], 1, 0) OVER (PARTITION BY [Customer ID] ORDER BY [Transaction Date]) AS NextTransactionAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Datasets$'];
