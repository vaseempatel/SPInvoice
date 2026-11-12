using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Data;

public class AppDbContext : IdentityDbContext<AppUser>
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Party> Parties => Set<Party>();
    public DbSet<PurchaseInvoice> PurchaseInvoices => Set<PurchaseInvoice>();
    public DbSet<PurchaseInvoiceLine> PurchaseInvoiceLines => Set<PurchaseInvoiceLine>();
    public DbSet<SalesInvoice> SalesInvoices => Set<SalesInvoice>();
    public DbSet<SalesInvoiceLine> SalesInvoiceLines => Set<SalesInvoiceLine>();
    public DbSet<StockMovement> StockMovements => Set<StockMovement>();

    protected override void OnModelCreating(ModelBuilder b)
    {
        base.OnModelCreating(b);
        b.Entity<Product>().HasIndex(x => x.Sku).IsUnique();
        b.Entity<Product>().HasIndex(x => x.Barcode).IsUnique().HasFilter("[Barcode] IS NOT NULL");
        b.Entity<Product>().Property(x => x.UnitPrice).HasPrecision(18,2);
        b.Entity<Product>().Property(x => x.CostPrice).HasPrecision(18,2);
        b.Entity<Product>().Property(x => x.StockQty).HasPrecision(18,3);
        b.Entity<Product>().Property(x => x.ReorderLevel).HasPrecision(18,3);
        b.Entity<Product>().Property(x => x.GstRate).HasPrecision(5,2);
        b.Entity<Party>().HasIndex(x => new { x.Name, x.Type });
        b.Entity<PurchaseInvoice>().HasIndex(x => x.InvoiceNo).IsUnique();
        b.Entity<SalesInvoice>().HasIndex(x => x.InvoiceNo).IsUnique();
        foreach (var t in new[] { typeof(PurchaseInvoice), typeof(SalesInvoice) })
        {
            b.Entity(t).Property("SubTotal").HasPrecision(18,2);
            b.Entity(t).Property("Cgst").HasPrecision(18,2);
            b.Entity(t).Property("Sgst").HasPrecision(18,2);
            b.Entity(t).Property("Igst").HasPrecision(18,2);
            b.Entity(t).Property("GrandTotal").HasPrecision(18,2);
        }
        b.Entity<PurchaseInvoiceLine>().Property(x => x.Quantity).HasPrecision(18,3);
        b.Entity<PurchaseInvoiceLine>().Property(x => x.UnitPrice).HasPrecision(18,2);
        b.Entity<PurchaseInvoiceLine>().Property(x => x.GstRate).HasPrecision(5,2);
        b.Entity<PurchaseInvoiceLine>().Property(x => x.LineTotal).HasPrecision(18,2);
        b.Entity<SalesInvoiceLine>().Property(x => x.Quantity).HasPrecision(18,3);
        b.Entity<SalesInvoiceLine>().Property(x => x.UnitPrice).HasPrecision(18,2);
        b.Entity<SalesInvoiceLine>().Property(x => x.CostPriceAtSale).HasPrecision(18,2);
        b.Entity<SalesInvoiceLine>().Property(x => x.GstRate).HasPrecision(5,2);
        b.Entity<SalesInvoiceLine>().Property(x => x.LineTotal).HasPrecision(18,2);
        b.Entity<StockMovement>().Property(x => x.QuantityDelta).HasPrecision(18,3);
    }
}
