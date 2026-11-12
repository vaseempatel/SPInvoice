using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Controllers;

public class AccountController : Controller
{
    private readonly SignInManager<AppUser> _signIn;
    public AccountController(SignInManager<AppUser> signIn) => _signIn = signIn;
    [HttpGet] public IActionResult Login(string? returnUrl = null) => View(new LoginVm());
    [HttpPost, ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginVm vm, string? returnUrl = null)
    {
        if (!ModelState.IsValid) return View(vm);
        var result = await _signIn.PasswordSignInAsync(vm.Email, vm.Password, vm.RememberMe, lockoutOnFailure: true);
        if (result.Succeeded) return LocalRedirect(Url.IsLocalUrl(returnUrl) ? returnUrl! : "/");
        ModelState.AddModelError("", "Invalid login attempt. Check your credentials or contact the administrator.");
        return View(vm);
    }
    [HttpPost, ValidateAntiForgeryToken] public async Task<IActionResult> Logout()
    {
        await _signIn.SignOutAsync();
        return RedirectToAction("Login");
    }
    public IActionResult AccessDenied() => View();
}
