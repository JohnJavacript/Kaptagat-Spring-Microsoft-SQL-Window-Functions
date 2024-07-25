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