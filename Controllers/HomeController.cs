using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;

namespace PurchaseSalesInventory.Controllers;

//[Authorize]
public class HomeController : Controller
{
    private readonly AppDbContext _db;
    public HomeController(AppDbContext db) => _db = db;
    public async Task<IActionResult> Index()
    {
        ViewBag.ProductCount = await _db.Products.CountAsync(p => p.IsActive);
        ViewBag.StockValue = await _db.Products.SumAsync(p => (decimal?)(p.StockQty*p.CostPrice)) ?? 0;
        ViewBag.PurchaseTotal = await _db.PurchaseInvoices.Where(x => x.InvoiceDate.Month == DateTime.Today.Month && x.InvoiceDate.Year == DateTime.Today.Year).SumAsync(x => (decimal?)x.GrandTotal) ?? 0;
        ViewBag.SalesTotal = await _db.SalesInvoices.Where(x => x.InvoiceDate.Month == DateTime.Today.Month && x.InvoiceDate.Year == DateTime.Today.Year).SumAsync(x => (decimal?)x.GrandTotal) ?? 0;
        ViewBag.LowStock = await _db.Products.CountAsync(p => p.IsActive && p.StockQty <= p.ReorderLevel);
        return View();
    }
}
