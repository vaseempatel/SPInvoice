using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Controllers;

//[Authorize]
public class ProductsController : Controller
{
    private readonly AppDbContext _db;
    public ProductsController(AppDbContext db) => _db = db;
    public async Task<IActionResult> Index(string? q) {
        var query = _db.Products.AsQueryable();
        if (!string.IsNullOrWhiteSpace(q)) query = query.Where(p => p.Name.Contains(q) || p.Sku.Contains(q) || (p.Barcode != null && p.Barcode.Contains(q)));
        ViewBag.Query = q;
        return View(await query.OrderBy(p => p.Name).ToListAsync());
    }
  //  [Authorize(Roles="Admin,Manager,Purchase")]
    public IActionResult Create() => View(new ProductVm());
[HttpPost]//, ValidateAntiForgeryToken, Authorize(Roles="Admin,Manager,Purchase")]
    public async Task<IActionResult> Create(ProductVm vm) {
        if (!ModelState.IsValid) return View(vm);
        if (await _db.Products.AnyAsync(p => p.Sku == vm.Sku || (vm.Barcode != null && p.Barcode == vm.Barcode))) {
            ModelState.AddModelError("", "SKU or barcode already exists."); return View(vm);
        }
        _db.Products.Add(new Product { Sku=vm.Sku.Trim(), Name=vm.Name.Trim(), Barcode=vm.Barcode, Unit=vm.Unit, HsnCode=vm.HsnCode, GstRate=vm.GstRate, CostPrice=vm.CostPrice, UnitPrice=vm.UnitPrice, ReorderLevel=vm.ReorderLevel });
        await _db.SaveChangesAsync(); return RedirectToAction(nameof(Index));
    }
}
