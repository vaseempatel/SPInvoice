-- Companion SQL schema overview. Prefer EF Core migrations as the source of truth.
-- Run against a new database; ASP.NET Identity tables are created by EF migrations.
CREATE TABLE dbo.Products (
    Id int IDENTITY PRIMARY KEY, Sku nvarchar(40) NOT NULL UNIQUE,
    Name nvarchar(160) NOT NULL, Barcode nvarchar(80) NULL,
    Unit nvarchar(30) NOT NULL DEFAULT 'pcs', HsnCode nvarchar(20) NOT NULL DEFAULT '',
    GstRate decimal(5,2) NOT NULL DEFAULT 18, CostPrice decimal(18,2) NOT NULL DEFAULT 0,
    UnitPrice decimal(18,2) NOT NULL DEFAULT 0, StockQty decimal(18,3) NOT NULL DEFAULT 0,
    ReorderLevel decimal(18,3) NOT NULL DEFAULT 5, IsActive bit NOT NULL DEFAULT 1
);
CREATE UNIQUE INDEX UX_Products_Barcode ON dbo.Products(Barcode) WHERE Barcode IS NOT NULL;
CREATE TABLE dbo.Parties (
    Id int IDENTITY PRIMARY KEY, Type int NOT NULL, Name nvarchar(160) NOT NULL,
    Gstin nvarchar(15) NULL, StateCode nvarchar(2) NOT NULL DEFAULT '27',
    Address nvarchar(250) NOT NULL DEFAULT '', Phone nvarchar(20) NOT NULL DEFAULT '',
    Email nvarchar(160) NOT NULL DEFAULT '', OpeningBalance decimal(18,2) NOT NULL DEFAULT 0
);
-- PurchaseInvoices / SalesInvoices contain InvoiceNo, InvoiceDate, PartyId, SubTotal,
-- Cgst, Sgst, Igst, GrandTotal, Notes, CreatedBy.
-- PurchaseInvoiceLines / SalesInvoiceLines contain ProductId, Quantity, UnitPrice,
-- GstRate, LineTotal; sales lines additionally snapshot CostPriceAtSale.
-- StockMovements records quantity deltas and source invoice references.
-- Generate exact FK/index definitions with: dotnet ef migrations add InitialCreate
