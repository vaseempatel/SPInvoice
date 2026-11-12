using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Controllers;

//[Authorize]
public class PartiesController : Controller
{
    private readonly AppDbContext _db;
    public PartiesController(AppDbContext db) => _db = db;
    public async Task<IActionResult> Index(PartyType? type) {
        ViewBag.Type = type;
        return View(await _db.Parties.Where(p => type == null || p.Type == type).OrderBy(p => p.Name).ToListAsync());
    }
   // [Authorize(Roles="Admin,Manager,Purchase,Sales")]
    public IActionResult Create(PartyType type = PartyType.Customer) => View(new PartyVm { Type=type });
 [HttpPost]//, ValidateAntiForgeryToken, Authorize(Roles="Admin,Manager,Purchase,Sales")]
    public async Task<IActionResult> Create(PartyVm vm) {
        if (!ModelState.IsValid) return View(vm);
        _db.Parties.Add(new Party { Type=vm.Type, Name=vm.Name.Trim(), Gstin=vm.Gstin, StateCode=vm.StateCode, Address=vm.Address, Phone=vm.Phone, Email=vm.Email, OpeningBalance=vm.OpeningBalance });
        await _db.SaveChangesAsync(); return RedirectToAction(nameof(Index), new { type=vm.Type });
    }
}
