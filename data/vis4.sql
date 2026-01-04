SELECT * FROM Sales.SalesOrderHeader

SELECT
    YEAR(OrderDate) AS OrderYear,
    SUM(TotalDue) AS TotalSales,
    COUNT(SalesOrderId) AS OrderCount

FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear ASC

SELECT
    MAX(OrderDate) AS SenasteOrderdatum
FROM Sales.SalesOrderHeader;

SELECT
    YEAR(OrderDate) AS OrderYear,
    COUNT(DISTINCT FORMAT(OrderDate, 'yyyy-MM')) AS NumberOfMonths
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;