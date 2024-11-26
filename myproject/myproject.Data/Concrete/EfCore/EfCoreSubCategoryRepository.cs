using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using myproject.Data.Abstract;
using myproject.Entities;

namespace myproject.Data.Concrete.EfCore
{
    public class EfCoreSubCategoryRepository : EfCoreGenericRepository<SubCategory, ShopContext>, ISubCategoryRepository
    {
        public void DeleteFromSubCategory(int productId, int subCategoryId)
        {
            using(var context = new ShopContext())
            {
                var cmd = "delete from productcategory where ProductId=@p0 and SubCategoryId=@p1";
                context.Database.ExecuteSqlRaw(cmd,productId,subCategoryId);
            }
        }

        public SubCategory GetByIdWithProducts(int subCategoryId)
        {
            using(var context = new ShopContext())
            {
                return context.SubCategories
                            .Where(i=>i.SubCategoryId==subCategoryId)
                            .Include(i=>i.ProductCategories)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault();
            }
        }


        public SubCategory GetByIdWithProducts()
        {
            using(var context = new ShopContext())
            {
                return context.SubCategories
                            .Where(i=>i.SubCategoryId!=0)
                            .Include(i=>i.ProductCategories)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault();
            }
        }



    }
}