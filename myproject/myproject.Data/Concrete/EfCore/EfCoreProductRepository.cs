using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using Microsoft.EntityFrameworkCore;
using myproject.Data.Abstract;
using myproject.Entities;

namespace myproject.Data.Concrete.EfCore
{
    public class EfCoreProductRepository :
        EfCoreGenericRepository<Product, ShopContext>, IProductRepository
    {
        public Product GetByIdWithCategories(int id)
        {
            using(var context = new ShopContext())
            {
                return context.Products
                                .Where(i=>i.ProductId == id)
                                .Include(i=>i.ProductCategories)
                                .ThenInclude(i=>i.Category)
                                .FirstOrDefault();
            }
        }

        public Product GetByIdWithSubCategories(int id)
        {
            using(var context = new ShopContext())
            {
                return context.Products
                                .Where(i=>i.ProductId == id)
                                .Include(i=>i.ProductCategories)
                                .ThenInclude(i=>i.SubCategory)
                                .FirstOrDefault();
            }
        }

        public int GetCountByCategory(string category)
        {
           using (var context = new ShopContext())
            {
                var products = context.Products.Where(i=>i.IsApproved).AsQueryable();

                if(!string.IsNullOrEmpty(category))
                {
                    products = products
                                    .Include(i=>i.ProductCategories)
                                    .ThenInclude(i=>i.Category)
                                    .Where(i=>i.ProductCategories.Any(a=>a.Category.Url == category));
                }

                return products.Count();
            }
        }

        public int GetCountBySubCategory(string subcategory)
        {
           using (var context = new ShopContext())
            {
                var products = context.Products.Where(i=>i.IsApproved).AsQueryable();

                if(!string.IsNullOrEmpty(subcategory))
                {
                    products = products
                                    .Include(i=>i.ProductCategories)
                                    .ThenInclude(i=>i.SubCategory)
                                    .Where(i=>i.ProductCategories.Any(a=>a.SubCategory.Url == subcategory));
                }

                return products.Count();
            }
        }


        public List<Product> GetHomePageProducts()
        {
            using (var context = new ShopContext())
            {
                return context.Products
                    .Where(i=>i.IsApproved && i.IsHome).Include(i => i.ProductImages).ToList();
            }
        }
        public Product GetProductDetails(string url)
        {
            using (var context = new ShopContext())
            {
                var product = context.Products
                                .Where(i=>i.Url==url)
                                .Include(i=>i.ProductCategories)
                                .ThenInclude(i=>i.Category)
                                .Include(i=>i.ProductImages)
                                // .Join(context.ProductDetails, j=> j.ProductId, x=> x.ProductId, (j, x) => new{j, x})
                                .FirstOrDefault();

                return product;
            }
        }
        public List<Product> GetProductsByCategory(string name,int page,int pageSize)
        {
            using (var context = new ShopContext())
            {
                var products = context.Products
                    .Where(i=>i.IsApproved)
                    .AsQueryable();

                if(!string.IsNullOrEmpty(name))
                {
                    products = products
                                    .Include(i=>i.ProductCategories)
                                    .ThenInclude(i=>i.Category)
                                    .Where(i=>i.ProductCategories.Any(a=>a.Category.Url == name));
                }

                return products.Skip((page-1)*pageSize).Take(pageSize).ToList();
            }
        }
        public List<Product> GetProductsBySubCategory(string name,int page,int pageSize)
        {
            using (var context = new ShopContext())
            {
                var products = context.Products
                    .Where(i=>i.IsApproved)
                    .Include(i=>i.ProductImages)
                    .AsQueryable();

                if(!string.IsNullOrEmpty(name))
                {
                    products = products
                                    .Include(i=>i.ProductCategories)
                                    .ThenInclude(i=>i.SubCategory)
                                    .Where(i=>i.ProductCategories.Any(a=>a.SubCategory.Url == name));
                }

                return products.Skip((page-1)*pageSize).Take(pageSize).ToList();
            }
        }

        public List<Product> GetSearchResult(string searchString)
        {
            using (var context = new ShopContext())
            {
                var products = context
                    .Products
                    .Where(i=>i.IsApproved && (i.Name.ToLower().Contains(searchString.ToLower()) || i.Description.ToLower().Contains(searchString.ToLower()) || 
                    i.Company.ToLower().Contains(searchString.ToLower()) || i.Description.ToLower().Contains(searchString.ToLower()))).Include(i=>i.ProductImages)
                    .AsQueryable();

                return products.ToList();
            }
        }

        public void Update(Product entity, int[] categoryIds)
        {
            using(var context = new ShopContext())
            {
                var product = context.Products
                                    .Include(i=>i.ProductCategories)
                                    .FirstOrDefault(i=>i.ProductId==entity.ProductId);


                if(product!=null)
                {
                    product.Name = entity.Name;
                    product.Price = entity.Price;
                    product.Description=entity.Description;
                    product.Url =entity.Url;
                    product.IsApproved=entity.IsApproved;
                    product.IsHome=entity.IsHome;

                    product.ProductCategories = categoryIds.Select(catid=>new ProductCategory()
                    {
                        ProductId=entity.ProductId,
                        CategoryId = catid
                    }).ToList();

                    context.SaveChanges();
                }
            }
        }
    }
}