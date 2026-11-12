using System.ComponentModel.DataAnnotations;

namespace PurchaseSalesInventory.Models;

public class LoginVm
{
    [Required, EmailAddress] public string Email { get; set; } = "";
    [Required, DataType(DataType.Password)] public string Password { get; set; } = "";
    public bool RememberMe { get; set; }
}
public class InvoiceCreateVm
{
    [Required] public int PartyId { get; set; }
    public DateTime InvoiceDate { get; set; } = DateTime.Today;
    public string? Notes { get; set; }
    [Required] public List<InvoiceLineVm> Lines { get; set; } = new();
}
public class InvoiceLineVm
{
    public int ProductId { get; set; }
    public decimal Quantity { get; set; }
    public decimal? UnitPrice { get; set; }
}
public class ProductVm
{
    public int Id { get; set; }
    [Required] public string Sku { get; set; } = "";
    [Required] public string Name { get; set; } = "";
    public string? Barcode { get; set; }
    public string Unit { get; set; } = "pcs";
    public string HsnCode { get; set; } = "";
    public decimal GstRate { get; set; } = 18;
    public decimal CostPrice { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal StockQty { get; set; }
    public decimal ReorderLevel { get; set; } = 5;
}
public class PartyVm
{
    public int Id { get; set; }
    public PartyType Type { get; set; }
    [Required] public string Name { get; set; } = "";
    public string? Gstin { get; set; }
    public string StateCode { get; set; } = "27";
    public string Address { get; set; } = "";
    public string Phone { get; set; } = "";
    public string Email { get; set; } = "";
    public decimal OpeningBalance { get; set; }
}
