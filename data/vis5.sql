SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSales

FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC


SELECT TOP 10
    LEFT(p.Name, CHARINDEX(',', p.Name + ',') - 1) AS ProductModel,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSales

FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY LEFT(p.Name, CHARINDEX(',', p.Name + ',') - 1)
ORDER BY TotalSales DESC;


SELECT TOP 10
    LEFT(p.Name, CHARINDEX(',', p.Name + ',') - 1) AS ProductModel,
    pc.Name AS CategoryName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSales

FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY
    LEFT(p.Name, CHARINDEX(',', p.Name + ',') - 1),
    pc.Name
ORDER BY TotalSales DESC;