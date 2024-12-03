using System.Linq;
using Microsoft.EntityFrameworkCore;
using myproject.Entities;

namespace myproject.Data.Concrete.EfCore
{
    public static class SeedDatabase
    {
        public static void Seed()
        {
            var context = new ShopContext();

            if (context.Database.GetPendingMigrations().Count() == 0)
            {
                if (context.Categories.Count() == 0)
                {
                    context.Categories.AddRange(Categories);
                }

                if (context.Products.Count() == 0)
                {
                    context.Products.AddRange(Products);
                    context.AddRange(ProductCategories);
                }
            }
            context.SaveChanges();
        }

        private static Category[] Categories = {
            new Category(){Name="Aksiyon",Url="aksiyon"},
            new Category(){Name="Macera",Url="macera"},
            new Category(){Name="Tarih",Url="tarih"},
            new Category(){Name="Edebi",Url="edebi"}
        };

        private static Product[] Products = {
            new Product(){Name="1984",Url="1984",Price=45,Description="George Orwellin distopik romanı totaliter bir rejimin baskıcı dünyasında bireyselliğin kayboluşunu anlatıyor", IsApproved=true, IsHome=true},
            new Product(){Name="Savaş ve Barış",Url="savas-ve-baris",Price=80,Description="Leo Tolstoyun epik eseri Napolyon savaşları döneminde Rus aristokrasisinin yaşamını ve değişimini ele alıyor", IsApproved=true, IsHome=true},
            new Product(){Name="Küçük Prens",Url="kucuk-prens",Price=30,Description="Antoine de Saint-Exuperynin çocuk kalbiyle yazılmış bu masal büyüklere yönelik derin yaşam dersleri sunuyor", IsApproved=true, IsHome=true},
            new Product(){Name="Suç ve Ceza",Url="suc-ve-ceza",Price=50,Description="Fyodor Dostoyevskinin bu romanı bir cinayetin ardından gelen içsel çatışmayı ve ahlaki sorgulamayı ele alıyor", IsApproved=true, IsHome=true},
            new Product(){Name="Simyacı",Url="simyaci",Price=35,Description="Paulo Coelhonun bu eseri kendi hayallerinin peşinden koşmayı ve kişisel efsaneyi bulmayı anlatıyor", IsApproved=true, IsHome=true},
        };

        private static ProductCategory[] ProductCategories={
            new ProductCategory(){Product=Products[0],Category=Categories[4]},
            new ProductCategory(){Product=Products[1],Category=Categories[3]},
            new ProductCategory(){Product=Products[2],Category=Categories[4]},
            new ProductCategory(){Product=Products[3],Category=Categories[4]},
            new ProductCategory(){Product=Products[4],Category=Categories[4]},
            // new ProductCategory(){Product=Products[],Category=Categories[4]},
            // new ProductCategory(){Product=Products[3],Category=Categories[4]},
            // new ProductCategory(){Product=Products[3],Category=Categories[3]},
            // new ProductCategory(){Product=Products[3],Category=Categories[4]},
            // new ProductCategory(){Product=Products[3],Category=Categories[3]},
        };
    }
}