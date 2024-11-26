using System.Collections.Generic;
using myproject.Business.Abstract;
using myproject.Data.Abstract;
using myproject.Data.Concrete.EfCore;
using myproject.Entities;

namespace myproject.Business.Concrete
{
    public class ProductManager : IProductService
    {
        private IProductRepository _productRepository;
        public ProductManager(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public bool Create(Product entity)
        {
            if(Validation(entity))
            {       
                _productRepository.Create(entity);
                return true;
            }
            return false;
        }

        public void Delete(Product entity)
        {
            // iş kuralları
            _productRepository.Delete(entity);
        }

        public List<Product> GetAll()
        {            
            return _productRepository.GetAll();
        }

        public Product GetById(int id)
        {
            return _productRepository.GetById(id);
        }

        public Product GetByIdWithCategories(int id)
        {
            return _productRepository.GetByIdWithCategories(id);
        }

        public Product GetByIdWithSubCategories(int id)
        {
            return _productRepository.GetByIdWithSubCategories(id);
        }

        public int GetCountByCategory(string category)
        {
            return _productRepository.GetCountByCategory(category);
        }

        public int GetCountBySubCategory(string category)
        {
            return _productRepository.GetCountBySubCategory(category);
        }

        public List<Product> GetHomePageProducts()
        {
           return _productRepository.GetHomePageProducts();
        }

        public Product GetProductDetails(string url)
        {
            return _productRepository.GetProductDetails(url);
        }

        public List<Product> GetProductsByCategory(string name,int page,int pageSize)
        {
            return _productRepository.GetProductsByCategory(name,page,pageSize);
        }

        public List<Product> GetProductsBySubCategory(string name,int page,int pageSize)
        {
            return _productRepository.GetProductsBySubCategory(name,page,pageSize);
        }

        public List<Product> GetSearchResult(string searchString)
        {
           return _productRepository.GetSearchResult(searchString);
        }

        public void Update(Product entity)
        {            
            _productRepository.Update(entity);
        }

        public bool Update(Product entity, int[] categoryIds)
        {
            if(Validation(entity))
            {
                if(categoryIds.Length==0)
                {
                    ErrorMessage += "Ürün için en az bir kategori seçmelisiniz.";
                    return false;
                }
                 _productRepository.Update(entity,categoryIds);
                return true;
            }
            return false;          
        }

        public string ErrorMessage { get; set; }

        public bool Validation(Product entity)
        {
            var isValid = true;

            if(string.IsNullOrEmpty(entity.Name))
            {
                ErrorMessage += "ürün ismi girmelisiniz.\n";
                isValid=false;
            }

            if(entity.Price<0)
            {
                ErrorMessage += "ürün fiyatı negatif olamaz.\n";
                isValid=false;
            }

            return isValid;
        }
    }
}