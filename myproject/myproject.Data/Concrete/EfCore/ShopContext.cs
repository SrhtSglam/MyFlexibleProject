using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.FileProviders;
using System.Runtime.InteropServices;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.VisualBasic;
using myproject.Entities;
using System.Diagnostics;

namespace myproject.Data.Concrete.EfCore
{
    public class ShopContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductDetail> ProductDetails { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<Orders> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();
            var dbtypenum = configuration.GetSection("DatabaseSettings:DbTypeNum").Value;
            if (dbtypenum == "1")
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("Default"));
            else if (dbtypenum == "2")
                optionsBuilder.UseSqlite(configuration.GetConnectionString("Sqlite"));
            else{
                Console.WriteLine("Hata");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductCategory>()
                .HasKey(c => new { c.CategoryId, c.ProductId, c.SubCategoryId });

            modelBuilder.Entity<ProductDetail>()
                .HasKey(i => i.Id);

            // modelBuilder.Entity<Product>()
            //             .HasMany(i => i.ProductDetails) 
            //             .WithOne(pd => pd.Product)         
            //             .HasForeignKey(pd => pd.ProductId);

            // modelBuilder.Entity<Product>() //Tablo olarak belirtir
            // .ToTable("Products");

            base.OnModelCreating(modelBuilder);
        }


    }
}