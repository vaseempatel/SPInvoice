using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace PurchaseSalesInventory.Controllers;

//[Authorize]
public class InvoicesPdfController : Controller
{
    private readonly AppDbContext _db; private readonly IConfiguration _config;
    public InvoicesPdfController(AppDbContext db, IConfiguration config) { _db=db; _config=config; }
    //[Authorize(Roles="Admin,Manager,Sales,Viewer")]
    public async Task<IActionResult> Sales(int id) {
        var inv=await _db.SalesInvoices.Include(x=>x.Party).Include(x=>x.Lines).ThenInclude(x=>x.Product).FirstOrDefaultAsync(x=>x.Id==id);
        if(inv==null) return NotFound();
        var bytes=Document.Create(container => {
            container.Page(page => {
                page.Margin(32); page.Size(PageSizes.A4); page.DefaultTextStyle(x=>x.FontSize(10));
                page.Header().Column(c=> { c.Item().Text(_config["Business:Name"] ?? "Business").FontSize(20).Bold(); c.Item().Text(_config["Business:Address"] ?? ""); c.Item().Text($"GSTIN: {_config["Business:Gstin"]}"); c.Item().Text("TAX INVOICE").FontSize(16).Bold(); });
                page.Content().PaddingVertical(12).Column(col=> {
                    col.Item().Text($"Invoice: {inv.InvoiceNo}    Date: {inv.InvoiceDate:dd-MM-yyyy}").Bold();
                    col.Item().Text($"Customer: {inv.Party?.Name}"); col.Item().Text($"GSTIN: {inv.Party?.Gstin}    State code: {inv.Party?.StateCode}");
                    col.Item().PaddingTop(12).Table(t=> {
                        t.ColumnsDefinition(c=> { c.RelativeColumn(4); c.RelativeColumn(1); c.RelativeColumn(1.5f); c.RelativeColumn(1.5f); });
                        t.Header(h=> { h.Cell().Element(Cell).Text("Product"); h.Cell().Element(Cell).Text("Qty"); h.Cell().Element(Cell).Text("Rate"); h.Cell().Element(Cell).Text("Taxable"); });
                        foreach(var l in inv.Lines) { t.Cell().Element(Cell).Text(l.Product?.Name ?? ""); t.Cell().Element(Cell).Text(l.Quantity.ToString("0.###")); t.Cell().Element(Cell).Text(l.UnitPrice.ToString("N2")); t.Cell().Element(Cell).Text((l.Quantity*l.UnitPrice).ToString("N2")); }
                        static IContainer Cell(IContainer c)=>c.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).Padding(5);
                    });
                    col.Item().AlignRight().PaddingTop(10).Text($"Taxable: ₹{inv.SubTotal:N2}");
                    col.Item().AlignRight().Text($"CGST: ₹{inv.Cgst:N2}");
                    col.Item().AlignRight().Text($"SGST: ₹{inv.Sgst:N2}");
                    col.Item().AlignRight().Text($"IGST: ₹{inv.Igst:N2}");
                    col.Item().AlignRight().Text($"Grand Total: ₹{inv.GrandTotal:N2}").FontSize(14).Bold();
                    if(!string.IsNullOrWhiteSpace(inv.Notes)) col.Item().PaddingTop(10).Text($"Notes: {inv.Notes}");
                });
                page.Footer().AlignCenter().Text("Computer-generated invoice");
            });
        }).GeneratePdf();
        return File(bytes,"application/pdf",$"{inv.InvoiceNo}.pdf");
    }
}
