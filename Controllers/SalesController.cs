using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using PurchaseSalesInventory.Models;
using PurchaseSalesInventory.Services;

namespace PurchaseSalesInventory.Controllers;

//[Authorize(Roles="Admin,Manager,Sales")]
public class SalesController : Controller
{
    private readonly AppDbContext _db; private readonly InvoiceService _service;
    public SalesController(AppDbContext db, InvoiceService service) { _db=db; _service=service; }
    public async Task<IActionResult> Index() => View(await _db.SalesInvoices.Include(x=>x.Party).OrderByDescending(x=>x.InvoiceDate).Take(300).ToListAsync());
    public async Task<IActionResult> Create() {
        ViewBag.Parties=await _db.Parties.Where(p=>p.Type==PartyType.Customer).OrderBy(p=>p.Name).ToListAsync();
        ViewBag.Products=await _db.Products.Where(p=>p.IsActive).OrderBy(p=>p.Name).ToListAsync();
        return View(new InvoiceCreateVm());
    }
    [HttpPost, ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(InvoiceCreateVm vm) {
        try { var invoice=await _service.CreateSalesAsync(vm, User.Identity?.Name ?? "unknown"); return RedirectToAction("Details", new { id=invoice.Id }); }
        catch(Exception ex) when(ex is InvalidOperationException || ex is DbUpdateException) {
            ModelState.AddModelError("", ex is DbUpdateException ? "Could not save invoice. Please check data and retry." : ex.Message);
            ViewBag.Parties=await _db.Parties.Where(p=>p.Type==PartyType.Customer).ToListAsync();
            ViewBag.Products=await _db.Products.Where(p=>p.IsActive).ToListAsync();
            return View(vm);
        }
    }
    public async Task<IActionResult> Details(int id) {
        var inv=await _db.SalesInvoices.Include(x=>x.Party).Include(x=>x.Lines).ThenInclude(x=>x.Product).FirstOrDefaultAsync(x=>x.Id==id);
        return inv==null?NotFound():View(inv);
    }
}
