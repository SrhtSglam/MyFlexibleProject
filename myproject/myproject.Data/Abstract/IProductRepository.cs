using System.Collections.Generic;
using myproject.Entities;

namespace myproject.Data.Abstract
{
    public interface IProductRepository: IRepository<Product>
    {
       Product GetProductDetails(string url);
       Product GetByIdWithCategories(int id);
       Product GetByIdWithSubCategories(int id);
       List<Product> GetProductsByCategory(string name,int page,int pageSize);
       List<Product> GetProductsBySubCategory(string name,int page,int pageSize);
       List<Product> GetSearchResult(string searchString);
       List<Product> GetHomePageProducts();
       int GetCountByCategory(string category);
       int GetCountBySubCategory(string subcategory);
       void Update(Product entity, int[] categoryIds);
    }
}