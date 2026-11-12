using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PurchaseSalesInventory.Data;
using PurchaseSalesInventory.Services;
using System.Text;

namespace PurchaseSalesInventory.Controllers;

//[Authorize(Roles="Admin,Manager,Viewer")]
public class ReportsController : Controller
{
    private readonly ReportService _reports; private readonly AppDbContext _db;
    public ReportsController(ReportService reports, AppDbContext db) { _reports=reports; _db=db; }
    public async Task<IActionResult> Index(DateTime? from, DateTime? to) {
        ViewBag.From=(from ?? new DateTime(DateTime.Today.Year,DateTime.Today.Month,1)).ToString("yyyy-MM-dd");
        ViewBag.To=(to ?? DateTime.Today).ToString("yyyy-MM-dd");
        ViewBag.Summary=await _reports.SummaryAsync(from ?? new DateTime(DateTime.Today.Year,DateTime.Today.Month,1), to ?? DateTime.Today);
        return View();
    }
    public async Task<IActionResult> Csv(DateTime? from, DateTime? to) {
        var start=from ?? new DateTime(DateTime.Today.Year,DateTime.Today.Month,1); var end=to ?? DateTime.Today;
        var rows=await _db.SalesInvoices.Include(x=>x.Party).Where(x=>x.InvoiceDate>=start && x.InvoiceDate<end.AddDays(1)).OrderBy(x=>x.InvoiceDate).ToListAsync();
        var sb=new StringBuilder("Invoice No,Date,Customer,Taxable Value,CGST,SGST,IGST,Total\\r\\n");
        foreach(var r in rows) sb.AppendLine($"{CsvQ(r.InvoiceNo)},{r.InvoiceDate:yyyy-MM-dd},{CsvQ(r.Party?.Name ?? "")},{r.SubTotal},{r.Cgst},{r.Sgst},{r.Igst},{r.GrandTotal}");
        return File(Encoding.UTF8.GetBytes(sb.ToString()),"text/csv",$"sales-report-{start:yyyyMMdd}-{end:yyyyMMdd}.csv");
    }
    private static string CsvQ(string s) => "\"" + s.Replace("\"","\"\"") + "\"";
}
