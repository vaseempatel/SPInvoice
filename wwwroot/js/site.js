// Barcode scanners commonly act as keyboards: focus the barcode field, scan, then press Enter.
// Avoid placing raw scanner input into HTML. Product selection is resolved by the invoice form.
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("input[type=date]").forEach(el => {
    if (!el.value && el.dataset.today === "true") el.value = new Date().toISOString().slice(0,10);
  });
});
