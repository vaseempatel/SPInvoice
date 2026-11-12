using Microsoft.AspNetCore.Identity;
using PurchaseSalesInventory.Models;

namespace PurchaseSalesInventory.Data;

public static class SeedData
{
    public static async Task InitializeAsync(IServiceProvider sp, IConfiguration config)
    {
        var roles = new[] { "Admin", "Manager", "Sales", "Purchase", "Viewer" };
        var roleManager = sp.GetRequiredService<RoleManager<IdentityRole>>();
        foreach (var role in roles)
            if (!await roleManager.RoleExistsAsync(role))
                await roleManager.CreateAsync(new IdentityRole(role));

        var users = sp.GetRequiredService<UserManager<AppUser>>();
        var email = config["Seed:AdminEmail"] ?? "admin@example.com";
        var password = config["Seed:AdminPassword"] ?? "ChangeThis-Admin123!";
        var admin = await users.FindByEmailAsync(email);
        if (admin == null)
        {
            admin = new AppUser { UserName = email, Email = email, EmailConfirmed = true, FullName = "System Administrator" };
            var result = await users.CreateAsync(admin, password);
            if (result.Succeeded) await users.AddToRoleAsync(admin, "Admin");
        }
    }
}
