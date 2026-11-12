using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace PurchaseSalesInventory.Models;

public class AppUser : IdentityUser
{
    [MaxLength(120)] public string FullName { get; set; } = "";
}

public class Product
{
    public int Id { get; set; }
    [Required, MaxLength(40)] public string Sku { get; set; } = "";
    [Required, MaxLength(160)] public string Name { get; set; } = "";
    [MaxLength(80)] public string? Barcode { get; set; }
    [MaxLength(30)] public string Unit { get; set; } = "pcs";
    [MaxLength(20)] public string HsnCode { get; set; } = "";
    public decimal GstRate { get; set; } = 18m;
    public decimal CGstRate { get; set; } = 18m;
    public decimal IGstRate { get; set; } = 18m;
    public decimal CostPrice { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal StockQty { get; set; }
    public decimal ReorderLevel { get; set; } = 5;
    public bool IsActive { get; set; } = true;
}

public enum PartyType { Supplier = 1, Customer = 2 }
public class Party
{
    public int Id { get; set; }
    public PartyType Type { get; set; }
    [Required, MaxLength(160)] public string Name { get; set; } = "";
    [MaxLength(15)] public string? Gstin { get; set; }
    [MaxLength(2)] public string StateCode { get; set; } = "27";
    [MaxLength(250)] public string Address { get; set; } = "";
    [MaxLength(20)] public string Phone { get; set; } = "";
    [MaxLength(160)] public string Email { get; set; } = "";
    public decimal OpeningBalance { get; set; }
}

public abstract class InvoiceBase
{
    public int Id { get; set; }
    [Required, MaxLength(40)] public string InvoiceNo { get; set; } = "";
    public DateTime InvoiceDate { get; set; } = DateTime.Today;
    public int PartyId { get; set; }
    public Party? Party { get; set; }
    public decimal SubTotal { get; set; }
    public decimal Cgst { get; set; }
    public decimal Sgst { get; set; }
    public decimal Igst { get; set; }
    public decimal GrandTotal { get; set; }
    [MaxLength(500)] public string? Notes { get; set; }
    [MaxLength(450)] public string CreatedBy { get; set; } = "";
}
public class PurchaseInvoice : InvoiceBase
{
    public List<PurchaseInvoiceLine> Lines { get; set; } = new();
}
public class PurchaseInvoiceLine
{
    public int Id { get; set; }
    public int PurchaseInvoiceId { get; set; }
    public PurchaseInvoice? PurchaseInvoice { get; set; }
    public int ProductId { get; set; }
    public Product? Product { get; set; }
    public decimal Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal GstRate { get; set; }
    public decimal LineTotal { get; set; }
}
public class SalesInvoice : InvoiceBase
{
    public List<SalesInvoiceLine> Lines { get; set; } = new();
}
public class SalesInvoiceLine
{
    public int Id { get; set; }
    public int SalesInvoiceId { get; set; }
    public SalesInvoice? SalesInvoice { get; set; }
    public int ProductId { get; set; }
    public Product? Product { get; set; }
    public decimal Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal CostPriceAtSale { get; set; }
    public decimal GstRate { get; set; }
    public decimal LineTotal { get; set; }
}
public class StockMovement
{
    public int Id { get; set; }
    public int ProductId { get; set; }
    public Product? Product { get; set; }
    public DateTime OccurredAt { get; set; } = DateTime.UtcNow;
    public decimal QuantityDelta { get; set; }
    [MaxLength(30)] public string SourceType { get; set; } = "";
    public int SourceId { get; set; }
    [MaxLength(450)] public string UserName { get; set; } = "";
}
