using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;

namespace PurchaseSalesInventory.Services;

public class ReportService
{
    private readonly AppDbContext _db;
    public ReportService(AppDbContext db) => _db = db;

    public async Task<object> SummaryAsync(DateTime from, DateTime to)
    {
        var sales = await _db.SalesInvoices.Where(x => x.InvoiceDate >= from && x.InvoiceDate < to.AddDays(1)).SumAsync(x => (decimal?)x.SubTotal) ?? 0;
        var purchases = await _db.PurchaseInvoices.Where(x => x.InvoiceDate >= from && x.InvoiceDate < to.AddDays(1)).SumAsync(x => (decimal?)x.SubTotal) ?? 0;
        var cogs = await _db.SalesInvoiceLines.Where(x => x.SalesInvoice != null && x.SalesInvoice.InvoiceDate >= from && x.SalesInvoice.InvoiceDate < to.AddDays(1))
            .SumAsync(x => (decimal?)(x.Quantity * x.CostPriceAtSale)) ?? 0;
        var salesTax = await _db.SalesInvoices.Where(x => x.InvoiceDate >= from && x.InvoiceDate < to.AddDays(1)).SumAsync(x => (decimal?)(x.Cgst+x.Sgst+x.Igst)) ?? 0;
        var purchaseTax = await _db.PurchaseInvoices.Where(x => x.InvoiceDate >= from && x.InvoiceDate < to.AddDays(1)).SumAsync(x => (decimal?)(x.Cgst+x.Sgst+x.Igst)) ?? 0;
        return new { From = from.Date, To = to.Date, SalesTaxable = sales, PurchasesTaxable = purchases, CostOfGoodsSold = cogs, GrossProfit = sales-cogs, salesTax, purchaseTax };
    }
}
