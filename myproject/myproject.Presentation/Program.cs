using System.Globalization;
using System.Reflection;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Options;
using myproject.Business.Abstract;
using myproject.Business.Concrete;
using myproject.Data.Abstract;
using myproject.Data.Concrete.EfCore;
using myproject.Presentation.EmailServices;
using myproject.Presentation.Identity;
using myproject.Presentation.Services;
using static myproject.Presentation.Services.LanguageService;

var builder = WebApplication.CreateBuilder(args);

#region Language 
    builder.Services.AddSingleton<LanguageService>();
    builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");
    builder.Services.AddMvc().AddViewLocalization().AddDataAnnotationsLocalization(options => 
        options.DataAnnotationLocalizerProvider = (type, factory) =>{
            var assemblyName = new AssemblyName(typeof(SharedResource).GetTypeInfo().Assembly.FullName);
            return factory.Create(nameof(SharedResource), assemblyName.Name);
        }
    );

    builder.Services.Configure<RequestLocalizationOptions>(options =>
    {
        var supportCultures = new List<CultureInfo>
        {
            new CultureInfo("en-US"),
            new CultureInfo("tr-TR"),
        };

        options.DefaultRequestCulture = new RequestCulture(culture: "tr-TR", uiCulture: "tr-TR");
        options.SupportedCultures = supportCultures;
        options.SupportedUICultures = supportCultures;
        options.RequestCultureProviders.Insert(0, new QueryStringRequestCultureProvider());
    });
#endregion

var connectionString = builder.Configuration.GetConnectionString("Default");

builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddIdentity<User, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationContext>()
    .AddDefaultTokenProviders();

System.Net.ServicePointManager.ServerCertificateValidationCallback +=
    (sender, certificate, chain, sslPolicyErrors) => true;

// Configure Identity options
builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequiredLength = 6;
    options.Password.RequireNonAlphanumeric = true;

    options.Lockout.MaxFailedAccessAttempts = 5;
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
    options.Lockout.AllowedForNewUsers = true;

    options.User.RequireUniqueEmail = true;
    options.SignIn.RequireConfirmedEmail = true;
    options.SignIn.RequireConfirmedPhoneNumber = false;
});

// Configure application cookie
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/account/login";
    options.LogoutPath = "/account/logout";
    options.AccessDeniedPath = "/account/accessdenied";
    options.SlidingExpiration = true;
    options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    options.Cookie = new CookieBuilder
    {
        HttpOnly = true,
        Name = ".myproject.Security.Cookie",
        SameSite = SameSiteMode.Strict
    };
});

// Add services for repositories and managers
builder.Services.AddScoped<ICategoryRepository, EfCoreCategoryRepository>();
builder.Services.AddScoped<ISubCategoryRepository, EfCoreSubCategoryRepository>();
builder.Services.AddScoped<IProductRepository, EfCoreProductRepository>();
builder.Services.AddScoped<ICartRepository, EfCoreCartRepository>();

builder.Services.AddScoped<IProductService, ProductManager>();
builder.Services.AddScoped<ICategoryService, CategoryManager>();
builder.Services.AddScoped<ISubCategoryService, SubCategoryManager>();
builder.Services.AddScoped<ICartService, CartManager>();

builder.Services.AddScoped<IEmailSender, SmtpEmailSender>(i =>
    new SmtpEmailSender(
        builder.Configuration["EmailSender:Host"],
        builder.Configuration.GetValue<int>("EmailSender:Port"),
        builder.Configuration.GetValue<bool>("EmailSender:EnableSSL"),
        builder.Configuration["EmailSender:UserName"],
        builder.Configuration["EmailSender:Password"]));

// Add MVC services
builder.Services.AddControllersWithViews();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    SeedDatabase.Seed();
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseStaticFiles();
app.UseHttpsRedirection();
app.UseRequestLocalization(app.Services.GetRequiredService<IOptions<RequestLocalizationOptions>>().Value);

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

#region Define Routes
    app.MapControllerRoute(
        name: "checkout",
        pattern: "checkout",
        defaults: new { controller = "Cart", action = "Checkout" }
    );

    app.MapControllerRoute(
        name: "cart",
        pattern: "cart",
        defaults: new { controller = "Cart", action = "Index" }
    );

    app.MapControllerRoute(
        name: "order",
        pattern: "order",
        defaults: new { controller = "Order", action = "Index" }
    );

    app.MapControllerRoute(
        name: "accountmanage",
        pattern: "account/manage",
        defaults: new { controller = "Account", action = "Manage" }
    );

    // app.MapControllerRoute(
    //     name: "adminuseredit",
    //     pattern: "admin/user/{id?}",
    //     defaults: new { controller = "Admin", action = "UserEdit" }
    // );

    app.MapControllerRoute(
        name: "adminusers",
        pattern: "admin/userlist",
        defaults: new { controller = "Admin", action = "UserList" }
    );

    // app.MapControllerRoute(
    //     name: "adminroles",
    //     pattern: "admin/rolelist",
    //     defaults: new { controller = "Admin", action = "RoleList" }
    // );

    // app.MapControllerRoute(
    //     name: "adminrolecreate",
    //     pattern: "admin/rolecreate",
    //     defaults: new { controller = "Admin", action = "RoleCreate" }
    // );

    // app.MapControllerRoute(
    //     name: "adminroleedit",
    //     pattern: "admin/role/{id?}",
    //     defaults: new { controller = "Admin", action = "RoleEdit" }
    // );

    app.MapControllerRoute(
        name: "adminproducts",
        pattern: "admin/products",
        defaults: new { controller = "Admin", action = "ProductList" }
    );

    // app.MapControllerRoute(
    //     name: "adminproductcreate",
    //     pattern: "admin/products/create",
    //     defaults: new { controller = "Admin", action = "ProductCreate" }
    // );

    // app.MapControllerRoute(
    //     name: "adminproductedit",
    //     pattern: "admin/products/{id?}",
    //     defaults: new { controller = "Admin", action = "ProductEdit" }
    // );

    app.MapControllerRoute(
        name: "admincategories",
        pattern: "admin/categories",
        defaults: new { controller = "Admin", action = "CategoryList" }
    );

    // app.MapControllerRoute(
    //     name: "admincategorycreate",
    //     pattern: "admin/categories/create",
    //     defaults: new { controller = "Admin", action = "CategoryCreate" }
    // );

    // app.MapControllerRoute(
    //     name: "admincategoryedit",
    //     pattern: "admin/categories/{id?}",
    //     defaults: new { controller = "Admin", action = "CategoryEdit" }
    // );

    app.MapControllerRoute(
        name: "admindashboard",
        pattern: "admin/dashboard",
        defaults: new { controller = "Admin", action = "Dashboard"}
    );

    app.MapControllerRoute(
        name: "adminwebmanager",
        pattern: "admin/webmanager",
        defaults: new { controller = "Admin", action = "WebManager"}
    );

    // localhost/search
    app.MapControllerRoute(
        name: "search",
        pattern: "search",
        defaults: new { controller = "Shop", action = "search" }
    );

    app.MapControllerRoute(
        name: "productdetails",
        pattern: "{url}",
        defaults: new { controller = "Shop", action = "details" }
    );

    app.MapControllerRoute(
        name: "products",
        pattern: "products/{subcategory?}",
        defaults: new { controller = "Shop", action = "list" }
    );

    app.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}"
    );
#endregion

#region SeedIdentity Data
    using (var scope = app.Services.CreateScope())
    {
        var userManager = scope.ServiceProvider.GetRequiredService<UserManager<User>>();
        var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
        var configuration = app.Configuration;
        SeedIdentity.Seed(userManager, roleManager, configuration).Wait();
    }
#endregion

app.Run();
