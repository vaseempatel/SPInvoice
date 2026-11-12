using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Services;

public class InvoiceService
{
    private readonly AppDbContext _db;
    private readonly IConfiguration _config;
    public InvoiceService(AppDbContext db, IConfiguration config) { _db = db; _config = config; }

    public async Task<PurchaseInvoice> CreatePurchaseAsync(InvoiceCreateVm vm, string user)
    {
        ValidateLines(vm);
        await using var tx = await _db.Database.BeginTransactionAsync();
        var party = await _db.Parties.SingleOrDefaultAsync(p => p.Id == vm.PartyId && p.Type == PartyType.Supplier)
            ?? throw new InvalidOperationException("Select a valid supplier.");
        var ids = vm.Lines.Select(l => l.ProductId).Distinct().ToList();
        var products = await _db.Products.Where(p => ids.Contains(p.Id) && p.IsActive).ToDictionaryAsync(p => p.Id);
        if (products.Count != ids.Count) throw new InvalidOperationException("One or more products are unavailable.");
        var invoice = new PurchaseInvoice {
            InvoiceNo = $"PUR-{DateTime.UtcNow:yyyyMMddHHmmss}-{Random.Shared.Next(100,999)}",
            InvoiceDate = vm.InvoiceDate, PartyId = party.Id, Notes = vm.Notes, CreatedBy = user
        };
        foreach (var line in vm.Lines)
        {
            var p = products[line.ProductId];
            var price = line.UnitPrice ?? p.CostPrice;
            if (price < 0) throw new InvalidOperationException("Price cannot be negative.");
            var taxable = decimal.Round(line.Quantity * price, 2);
            var tax = decimal.Round(taxable * p.GstRate / 100m, 2);
            invoice.SubTotal += taxable;
            if (IsInterState(party.StateCode)) invoice.Igst += tax;
            else { invoice.Cgst += decimal.Round(tax / 2m, 2); invoice.Sgst += tax - decimal.Round(tax / 2m, 2); }
            invoice.Lines.Add(new PurchaseInvoiceLine { ProductId = p.Id, Quantity = line.Quantity, UnitPrice = price, GstRate = p.GstRate, LineTotal = taxable + tax });
            p.StockQty += line.Quantity;
            p.CostPrice = price;
            _db.StockMovements.Add(new StockMovement { ProductId = p.Id, QuantityDelta = line.Quantity, SourceType = "Purchase", UserName = user });
        }
        invoice.GrandTotal = invoice.SubTotal + invoice.Cgst + invoice.Sgst + invoice.Igst;
        _db.PurchaseInvoices.Add(invoice);
        await _db.SaveChangesAsync();
        foreach (var m in _db.ChangeTracker.Entries<StockMovement>().Where(e => e.State == EntityState.Added))
            if (m.Entity.SourceType == "Purchase" && m.Entity.SourceId == 0) m.Entity.SourceId = invoice.Id;
        await _db.SaveChangesAsync();
        await tx.CommitAsync();
        return invoice;
    }

    public async Task<SalesInvoice> CreateSalesAsync(InvoiceCreateVm vm, string user)
    {
        ValidateLines(vm);
        await using var tx = await _db.Database.BeginTransactionAsync(System.Data.IsolationLevel.Serializable);
        var party = await _db.Parties.SingleOrDefaultAsync(p => p.Id == vm.PartyId && p.Type == PartyType.Customer)
            ?? throw new InvalidOperationException("Select a valid customer.");
        var ids = vm.Lines.Select(l => l.ProductId).Distinct().ToList();
        var products = await _db.Products.Where(p => ids.Contains(p.Id) && p.IsActive).ToDictionaryAsync(p => p.Id);
        if (products.Count != ids.Count) throw new InvalidOperationException("One or more products are unavailable.");
        foreach (var group in vm.Lines.GroupBy(x => x.ProductId))
            if (products[group.Key].StockQty < group.Sum(x => x.Quantity))
                throw new InvalidOperationException($"Insufficient stock for {products[group.Key].Name}.");
        var invoice = new SalesInvoice {
            InvoiceNo = $"SAL-{DateTime.UtcNow:yyyyMMddHHmmss}-{Random.Shared.Next(100,999)}",
            InvoiceDate = vm.InvoiceDate, PartyId = party.Id, Notes = vm.Notes, CreatedBy = user
        };
        foreach (var line in vm.Lines)
        {
            var p = products[line.ProductId];
            var price = line.UnitPrice ?? p.UnitPrice;
            if (price < 0) throw new InvalidOperationException("Price cannot be negative.");
            var taxable = decimal.Round(line.Quantity * price, 2);
            var tax = decimal.Round(taxable * p.GstRate / 100m, 2);
            invoice.SubTotal += taxable;
            if (IsInterState(party.StateCode)) invoice.Igst += tax;
            else { invoice.Cgst += decimal.Round(tax / 2m, 2); invoice.Sgst += tax - decimal.Round(tax / 2m, 2); }
            invoice.Lines.Add(new SalesInvoiceLine { ProductId = p.Id, Quantity = line.Quantity, UnitPrice = price, CostPriceAtSale = p.CostPrice, GstRate = p.GstRate, LineTotal = taxable + tax });
            p.StockQty -= line.Quantity;
            _db.StockMovements.Add(new StockMovement { ProductId = p.Id, QuantityDelta = -line.Quantity, SourceType = "Sale", UserName = user });
        }
        invoice.GrandTotal = invoice.SubTotal + invoice.Cgst + invoice.Sgst + invoice.Igst;
        _db.SalesInvoices.Add(invoice);
        await _db.SaveChangesAsync();
        foreach (var m in _db.ChangeTracker.Entries<StockMovement>().Where(e => e.State == EntityState.Added))
            if (m.Entity.SourceType == "Sale" && m.Entity.SourceId == 0) m.Entity.SourceId = invoice.Id;
        await _db.SaveChangesAsync();
        await tx.CommitAsync();
        return invoice;
    }

    private static void ValidateLines(InvoiceCreateVm vm)
    {
        if (vm.Lines == null || vm.Lines.Count == 0) throw new InvalidOperationException("Add at least one invoice line.");
        if (vm.Lines.Any(x => x.ProductId <= 0 || x.Quantity <= 0)) throw new InvalidOperationException("Every line needs a product and quantity greater than zero.");
    }
    private bool IsInterState(string? partyState) =>
        !string.Equals(partyState?.Trim(), _config["Business:StateCode"]?.Trim(), StringComparison.OrdinalIgnoreCase);
}
