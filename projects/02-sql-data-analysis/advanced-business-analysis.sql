/*
    ErenShop — İleri Seviye SQL İş ve Veri Analizi
    Veritabanı: Microsoft SQL Server / ErenShopDB

    Amaç:
    - SQL tekniklerini gerçek iş sorularına bağlamak
    - Satış, müşteri, ürün, stok ve ödeme performansını analiz etmek
    - Veri kalitesi ve mutabakat kontrolleri yapmak

    Not:
    - Sentetik eğitim verisi kullanır.
    - Gelir sorgularında başarılı ödeme kaydı bulunan siparişler esas alınır.
    - Finansal karşılaştırmalarda 0,01 TL tolerans kullanılır.
*/

USE ErenShopDB;
GO
SET NOCOUNT ON;

-- ============================================================
-- SQL-01 | Yönetici KPI özeti
-- İş sorusu: Gelir, sipariş, ortalama sepet ve müşteri görünümü nedir?
-- ============================================================
WITH PaidOrders AS (
    SELECT o.Id, o.CustomerId, o.TotalAmount
    FROM Orders o
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
), PaidUnits AS (
    SELECT SUM(oi.Quantity) AS UnitsSold
    FROM OrderItems oi
    INNER JOIN PaidOrders po ON po.Id = oi.OrderId
)
SELECT
    COUNT(*)                                                   AS PaidOrderCount,
    COUNT(DISTINCT po.CustomerId)                              AS PurchasingCustomerCount,
    CAST(SUM(po.TotalAmount) AS DECIMAL(18,2))                 AS TotalRevenue,
    CAST(AVG(po.TotalAmount) AS DECIMAL(18,2))                 AS AverageOrderValue,
    CAST(MAX(pu.UnitsSold) AS INT)                             AS UnitsSold
FROM PaidOrders po
CROSS JOIN PaidUnits pu;

-- ============================================================
-- SQL-02 | Aylık satış trendi
-- İş sorusu: Gelir ve sipariş hacmi aylara göre nasıl değişiyor?
-- ============================================================
WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(YEAR(o.CreatedAt), MONTH(o.CreatedAt), 1) AS SalesMonth,
        COUNT(DISTINCT o.Id) AS OrderCount,
        SUM(o.TotalAmount) AS Revenue
    FROM Orders o
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
    GROUP BY DATEFROMPARTS(YEAR(o.CreatedAt), MONTH(o.CreatedAt), 1)
)
SELECT SalesMonth, OrderCount, CAST(Revenue AS DECIMAL(18,2)) AS Revenue
FROM MonthlySales
ORDER BY SalesMonth;

-- ============================================================
-- SQL-03 | Aylık gelir değişimi (LAG)
-- İş sorusu: Bir önceki aya göre büyüme/düşüş oranı nedir?
-- ============================================================
WITH MonthlyRevenue AS (
    SELECT
        DATEFROMPARTS(YEAR(o.CreatedAt), MONTH(o.CreatedAt), 1) AS SalesMonth,
        SUM(o.TotalAmount) AS Revenue
    FROM Orders o
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
    GROUP BY DATEFROMPARTS(YEAR(o.CreatedAt), MONTH(o.CreatedAt), 1)
), Trend AS (
    SELECT
        SalesMonth,
        Revenue,
        LAG(Revenue) OVER (ORDER BY SalesMonth) AS PreviousMonthRevenue
    FROM MonthlyRevenue
)
SELECT
    SalesMonth,
    CAST(Revenue AS DECIMAL(18,2)) AS Revenue,
    CAST(PreviousMonthRevenue AS DECIMAL(18,2)) AS PreviousMonthRevenue,
    CAST(100.0 * (Revenue - PreviousMonthRevenue)
         / NULLIF(PreviousMonthRevenue, 0) AS DECIMAL(10,2)) AS GrowthPercent
FROM Trend
ORDER BY SalesMonth;

-- ============================================================
-- SQL-04 | Kategori performansı
-- İş sorusu: Hangi kategori daha fazla gelir ve adet üretiyor?
-- ============================================================
SELECT
    c.Name AS CategoryName,
    COUNT(DISTINCT o.Id) AS OrderCount,
    SUM(oi.Quantity) AS UnitsSold,
    CAST(SUM(oi.TotalPrice) AS DECIMAL(18,2)) AS Revenue,
    CAST(AVG(oi.UnitPrice) AS DECIMAL(18,2)) AS AverageSellingPrice
FROM Categories c
INNER JOIN Products p ON p.CategoryId = c.Id
INNER JOIN OrderItems oi ON oi.ProductId = p.Id
INNER JOIN Orders o ON o.Id = oi.OrderId
WHERE EXISTS (
    SELECT 1 FROM Payments pay
    WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
)
GROUP BY c.Id, c.Name
ORDER BY Revenue DESC;

-- ============================================================
-- SQL-05 | Kategori içinde ürün sıralaması
-- İş sorusu: Her kategorinin en güçlü üç ürünü hangileri?
-- ============================================================
WITH ProductSales AS (
    SELECT
        c.Name AS CategoryName,
        p.Id AS ProductId,
        p.Name AS ProductName,
        SUM(oi.Quantity) AS UnitsSold,
        SUM(oi.TotalPrice) AS Revenue
    FROM Categories c
    INNER JOIN Products p ON p.CategoryId = c.Id
    INNER JOIN OrderItems oi ON oi.ProductId = p.Id
    INNER JOIN Orders o ON o.Id = oi.OrderId
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
    GROUP BY c.Name, p.Id, p.Name
), RankedProducts AS (
    SELECT *,
        RANK() OVER (PARTITION BY CategoryName ORDER BY Revenue DESC) AS RevenueRank
    FROM ProductSales
)
SELECT CategoryName, ProductName, UnitsSold,
       CAST(Revenue AS DECIMAL(18,2)) AS Revenue, RevenueRank
FROM RankedProducts
WHERE RevenueRank <= 3
ORDER BY CategoryName, RevenueRank;

-- ============================================================
-- SQL-06 | Ürün gelir payı ve kümülatif katkı
-- İş sorusu: Gelirin büyük kısmını hangi ürünler oluşturuyor?
-- ============================================================
WITH ProductRevenue AS (
    SELECT p.Id, p.Name, SUM(oi.TotalPrice) AS Revenue
    FROM Products p
    INNER JOIN OrderItems oi ON oi.ProductId = p.Id
    INNER JOIN Orders o ON o.Id = oi.OrderId
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
    GROUP BY p.Id, p.Name
), Contribution AS (
    SELECT
        Name,
        Revenue,
        100.0 * Revenue / NULLIF(SUM(Revenue) OVER (), 0) AS RevenueShare,
        100.0 * SUM(Revenue) OVER (ORDER BY Revenue DESC ROWS UNBOUNDED PRECEDING)
              / NULLIF(SUM(Revenue) OVER (), 0) AS CumulativeShare
    FROM ProductRevenue
)
SELECT Name AS ProductName,
       CAST(Revenue AS DECIMAL(18,2)) AS Revenue,
       CAST(RevenueShare AS DECIMAL(10,2)) AS RevenueSharePercent,
       CAST(CumulativeShare AS DECIMAL(10,2)) AS CumulativeSharePercent
FROM Contribution
ORDER BY Revenue DESC;

-- ============================================================
-- SQL-07 | Müşteri 360: recency, frequency, monetary
-- ============================================================
SELECT
    c.Id AS CustomerId,
    c.FirstName + N' ' + c.LastName AS CustomerName,
    c.Email,
    MAX(o.CreatedAt) AS LastOrderDate,
    DATEDIFF(DAY, MAX(o.CreatedAt), GETDATE()) AS DaysSinceLastOrder,
    COUNT(DISTINCT o.Id) AS OrderFrequency,
    CAST(COALESCE(SUM(o.TotalAmount), 0) AS DECIMAL(18,2)) AS MonetaryValue
FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.Id
    AND EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
WHERE c.IsActive = 1
GROUP BY c.Id, c.FirstName, c.LastName, c.Email
ORDER BY MonetaryValue DESC;

-- ============================================================
-- SQL-08 | İş kurallı müşteri segmentasyonu
-- ============================================================
WITH CustomerMetrics AS (
    SELECT
        c.Id,
        c.FirstName + N' ' + c.LastName AS CustomerName,
        COUNT(DISTINCT o.Id) AS OrderCount,
        COALESCE(SUM(o.TotalAmount), 0) AS TotalSpent,
        DATEDIFF(DAY, MAX(o.CreatedAt), GETDATE()) AS RecencyDays
    FROM Customers c
    LEFT JOIN Orders o ON o.CustomerId = c.Id
        AND EXISTS (
            SELECT 1 FROM Payments pay
            WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
        )
    WHERE c.IsActive = 1
    GROUP BY c.Id, c.FirstName, c.LastName
)
SELECT *,
    CASE
        WHEN OrderCount >= 5 AND TotalSpent >= 5000 THEN N'Şampiyon'
        WHEN OrderCount >= 3 THEN N'Sadık Müşteri'
        WHEN OrderCount = 1 AND RecencyDays <= 30 THEN N'Yeni Müşteri'
        WHEN OrderCount > 0 AND RecencyDays > 90 THEN N'Risk Altında'
        WHEN OrderCount = 0 THEN N'Henüz Satın Almamış'
        ELSE N'Gelişen Müşteri'
    END AS CustomerSegment
FROM CustomerMetrics
ORDER BY TotalSpent DESC;

-- ============================================================
-- SQL-09 | Tekrar satın alma oranı
-- ============================================================
WITH CustomerOrders AS (
    SELECT CustomerId, COUNT(*) AS OrderCount
    FROM Orders o
    WHERE EXISTS (
        SELECT 1 FROM Payments pay
        WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
    )
    GROUP BY CustomerId
)
SELECT
    COUNT(*) AS PurchasingCustomers,
    SUM(CASE WHEN OrderCount >= 2 THEN 1 ELSE 0 END) AS RepeatCustomers,
    CAST(100.0 * SUM(CASE WHEN OrderCount >= 2 THEN 1 ELSE 0 END)
         / NULLIF(COUNT(*), 0) AS DECIMAL(10,2)) AS RepeatCustomerRate
FROM CustomerOrders;

-- ============================================================
-- SQL-10 | Sipariş statüsü dağılımı
-- ============================================================
SELECT
    Status,
    COUNT(*) AS OrderCount,
    CAST(100.0 * COUNT(*) / NULLIF(SUM(COUNT(*)) OVER (), 0)
         AS DECIMAL(10,2)) AS SharePercent,
    CAST(SUM(TotalAmount) AS DECIMAL(18,2)) AS OrderValue
FROM Orders
GROUP BY Status
ORDER BY OrderCount DESC;

-- ============================================================
-- SQL-11 | Ödeme yöntemi başarı oranı
-- ============================================================
SELECT
    PaymentType,
    COUNT(*) AS AttemptCount,
    SUM(CASE WHEN IsSuccessful = 1 THEN 1 ELSE 0 END) AS SuccessfulCount,
    CAST(100.0 * SUM(CASE WHEN IsSuccessful = 1 THEN 1 ELSE 0 END)
         / NULLIF(COUNT(*), 0) AS DECIMAL(10,2)) AS SuccessRate,
    CAST(SUM(CASE WHEN IsSuccessful = 1 THEN Amount ELSE 0 END)
         AS DECIMAL(18,2)) AS SuccessfulAmount
FROM Payments
GROUP BY PaymentType
ORDER BY SuccessRate DESC, AttemptCount DESC;

-- ============================================================
-- SQL-12 | Satış hızına göre stok riski
-- Son 30 günlük satış adedi ve mevcut stok birlikte değerlendirilir.
-- ============================================================
WITH Sales30Days AS (
    SELECT oi.ProductId, SUM(oi.Quantity) AS UnitsSold30Days
    FROM OrderItems oi
    INNER JOIN Orders o ON o.Id = oi.OrderId
    WHERE o.CreatedAt >= DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
      AND EXISTS (
          SELECT 1 FROM Payments pay
          WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
      )
    GROUP BY oi.ProductId
)
SELECT
    p.Id,
    p.Name AS ProductName,
    c.Name AS CategoryName,
    p.Stock,
    COALESCE(s.UnitsSold30Days, 0) AS UnitsSold30Days,
    CASE
        WHEN p.Stock = 0 THEN N'Tükendi — acil'
        WHEN p.Stock <= 5 AND COALESCE(s.UnitsSold30Days, 0) > 0 THEN N'Kritik — hızlı satıyor'
        WHEN p.Stock <= 10 THEN N'Düşük stok'
        WHEN COALESCE(s.UnitsSold30Days, 0) = 0 THEN N'Hareketsiz stok'
        ELSE N'Normal'
    END AS ReplenishmentPriority
FROM Products p
INNER JOIN Categories c ON c.Id = p.CategoryId
LEFT JOIN Sales30Days s ON s.ProductId = p.Id
WHERE p.IsActive = 1
ORDER BY
    CASE WHEN p.Stock = 0 THEN 1 WHEN p.Stock <= 5 THEN 2 WHEN p.Stock <= 10 THEN 3 ELSE 4 END,
    UnitsSold30Days DESC;

-- ============================================================
-- SQL-13 | Hiç satılmayan aktif ürünler
-- ============================================================
SELECT p.Id, p.Name AS ProductName, c.Name AS CategoryName, p.Price, p.Stock
FROM Products p
INNER JOIN Categories c ON c.Id = p.CategoryId
WHERE p.IsActive = 1
  AND NOT EXISTS (
      SELECT 1
      FROM OrderItems oi
      INNER JOIN Orders o ON o.Id = oi.OrderId
      WHERE oi.ProductId = p.Id
        AND EXISTS (
            SELECT 1 FROM Payments pay
            WHERE pay.OrderId = o.Id AND pay.IsSuccessful = 1
        )
  )
ORDER BY p.Stock * p.Price DESC;

-- ============================================================
-- SQL-14 | Sipariş başlığı–kalem toplamı mutabakatı
-- ============================================================
WITH ItemTotals AS (
    SELECT OrderId, SUM(TotalPrice) AS CalculatedItemTotal
    FROM OrderItems
    GROUP BY OrderId
)
SELECT
    o.Id, o.OrderNumber, o.TotalAmount,
    COALESCE(i.CalculatedItemTotal, 0) AS CalculatedItemTotal,
    o.TotalAmount - COALESCE(i.CalculatedItemTotal, 0) AS Difference,
    CASE
        WHEN ABS(o.TotalAmount - COALESCE(i.CalculatedItemTotal, 0)) <= 0.01
            THEN N'Tutarlı'
        ELSE N'İncelenmeli'
    END AS ReconciliationStatus
FROM Orders o
LEFT JOIN ItemTotals i ON i.OrderId = o.Id
WHERE ABS(o.TotalAmount - COALESCE(i.CalculatedItemTotal, 0)) > 0.01
ORDER BY ABS(o.TotalAmount - COALESCE(i.CalculatedItemTotal, 0)) DESC;

-- ============================================================
-- SQL-15 | Sipariş–başarılı ödeme tutarı mutabakatı
-- ============================================================
WITH SuccessfulPayments AS (
    SELECT OrderId, SUM(Amount) AS PaidAmount
    FROM Payments
    WHERE IsSuccessful = 1
    GROUP BY OrderId
)
SELECT
    o.Id, o.OrderNumber, o.Status, o.TotalAmount,
    COALESCE(p.PaidAmount, 0) AS PaidAmount,
    o.TotalAmount - COALESCE(p.PaidAmount, 0) AS Difference
FROM Orders o
LEFT JOIN SuccessfulPayments p ON p.OrderId = o.Id
WHERE (o.Status IN (N'Paid', N'Processing', N'Shipped', N'Delivered')
       OR p.PaidAmount IS NOT NULL)
  AND ABS(o.TotalAmount - COALESCE(p.PaidAmount, 0)) > 0.01
ORDER BY ABS(o.TotalAmount - COALESCE(p.PaidAmount, 0)) DESC;

-- ============================================================
-- SQL-16 | Bir müşteride birden fazla aktif sepet kontrolü
-- ============================================================
SELECT
    c.CustomerId,
    cu.FirstName + N' ' + cu.LastName AS CustomerName,
    COUNT(*) AS ActiveCartCount
FROM Carts c
INNER JOIN Customers cu ON cu.Id = c.CustomerId
WHERE c.IsActive = 1
GROUP BY c.CustomerId, cu.FirstName, cu.LastName
HAVING COUNT(*) > 1;

-- ============================================================
-- SQL-17 | Ana veri kalite kontrolleri
-- ============================================================
SELECT N'Negatif veya sıfır ürün fiyatı' AS CheckName, COUNT(*) AS IssueCount
FROM Products WHERE Price <= 0
UNION ALL
SELECT N'Negatif ürün stoğu', COUNT(*) FROM Products WHERE Stock < 0
UNION ALL
SELECT N'Geçersiz sepet adedi', COUNT(*) FROM CartItems WHERE Quantity <= 0
UNION ALL
SELECT N'Geçersiz sipariş kalemi adedi', COUNT(*) FROM OrderItems WHERE Quantity <= 0
UNION ALL
SELECT N'Sipariş kalemi hesaplama farkı', COUNT(*)
FROM OrderItems WHERE ABS(TotalPrice - (Quantity * UnitPrice)) > 0.01
UNION ALL
SELECT N'Başarılı ödemede eksik işlem kodu', COUNT(*)
FROM Payments WHERE IsSuccessful = 1 AND NULLIF(LTRIM(RTRIM(TransactionCode)), N'') IS NULL;

-- ============================================================
-- SQL-18 | Yetim kayıt kontrolü (FK olsa da bağımsız audit kontrolü)
-- ============================================================
SELECT N'Ürünsüz sipariş kalemi' AS CheckName, COUNT(*) AS IssueCount
FROM OrderItems oi LEFT JOIN Products p ON p.Id = oi.ProductId
WHERE p.Id IS NULL
UNION ALL
SELECT N'Siparişsiz sipariş kalemi', COUNT(*)
FROM OrderItems oi LEFT JOIN Orders o ON o.Id = oi.OrderId
WHERE o.Id IS NULL
UNION ALL
SELECT N'Siparişsiz ödeme', COUNT(*)
FROM Payments pay LEFT JOIN Orders o ON o.Id = pay.OrderId
WHERE o.Id IS NULL;

-- ============================================================
-- SQL-19 | Güvenli soft-delete şablonu
-- Güvenlik için yorum satırındadır. Test ortamında ProductId değiştirilerek
-- ayrı çalıştırılmalı; önce ROLLBACK ile doğrulanmalıdır.
-- ============================================================
/*
DECLARE @ProductId INT = 20;

BEGIN TRY
    BEGIN TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Products WHERE Id = @ProductId)
        THROW 50001, N'Ürün bulunamadı.', 1;

    UPDATE Products
    SET IsActive = 0,
        UpdatedAt = GETDATE()
    WHERE Id = @ProductId AND IsActive = 1;

    IF @@ROWCOUNT = 0
        THROW 50002, N'Ürün zaten pasif.', 1;

    -- İlk doğrulamada COMMIT yerine ROLLBACK kullanılmalıdır.
    ROLLBACK TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
*/

-- ============================================================
-- SQL-20 | Performans için önerilen indeksler
-- Üretimde eklemeden önce execution plan ve kullanım sıklığı incelenmelidir.
-- ============================================================
-- CREATE INDEX IX_Orders_CreatedAt_Status
--     ON Orders (CreatedAt, Status)
--     INCLUDE (CustomerId, TotalAmount);

-- CREATE INDEX IX_OrderItems_ProductId_OrderId
--     ON OrderItems (ProductId, OrderId)
--     INCLUDE (Quantity, UnitPrice, TotalPrice);

-- CREATE INDEX IX_Payments_OrderId_IsSuccessful
--     ON Payments (OrderId, IsSuccessful)
--     INCLUDE (PaymentType, Amount, CreatedAt);

-- CREATE INDEX IX_Products_CategoryId_IsActive
--     ON Products (CategoryId, IsActive)
--     INCLUDE (Name, Price, Stock);
