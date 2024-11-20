using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using myproject.Data.Abstract;
using myproject.Entities;

namespace myproject.Data.Concrete.EfCore
{
    public class EfCoreCategoryRepository : EfCoreGenericRepository<Category, ShopContext>, ICategoryRepository
    {
        public void DeleteFromCategory(int productId, int categoryId)
        {
            using(var context = new ShopContext())
            {
                var cmd = "delete from productcategory where ProductId=@p0 and CategoryId=@p1";
                context.Database.ExecuteSqlRaw(cmd,productId,categoryId);
            }
        }

        public Category GetByIdWithProducts(int categoryId)
        {
            using(var context = new ShopContext())
            {
                return context.Categories
                            .Where(i=>i.CategoryId==categoryId)
                            .Include(i=>i.ProductCategories)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault();
            }
        }


        public Category GetByIdWithProducts()
        {
            using(var context = new ShopContext())
            {
                return context.Categories
                            .Where(i=>i.CategoryId!=0)
                            .Include(i=>i.ProductCategories)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault();
            }
        }



    }
}