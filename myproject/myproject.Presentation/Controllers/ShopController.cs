using System.CodeDom.Compiler;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;
using myproject.Data.Concrete.EfCore;
using myproject.Entities;
using myproject.Presentation.Models;

namespace myproject.Presentation.Controllers
{
    public class ShopController:Controller
    {
        private IProductService _productService;
        public ShopController(IProductService productService)
        {
            this._productService=productService;
        }

        // localhost/products/telefon?page=1
        public IActionResult List(string subcategory,int page=1)
        {
            const int pageSize=8;
            var productViewModel = new ProductListViewModel()
            {
                PageInfo = new PageInfo()
                {
                    TotalItems = _productService.GetCountBySubCategory(subcategory),
                    CurrentPage = page,
                    ItemsPerPage = pageSize,
                    CurrentCategory = subcategory
                },
                Products = _productService.GetProductsBySubCategory(subcategory,page,pageSize)
            };

            return View(productViewModel);
        }

        public IActionResult Details(string url)
        {
            if (url==null)
            {
                return NotFound();
            }
            Product product = _productService.GetProductDetails(url);
            // List<ProductDetail> productDetails = GetProductDetails(1);

            if(product==null)
            {
                return NotFound();
            }
            return View(new ProductDetailModel{
                Product = product,
                // ProductDetails = productDetails,
                Categories = product.ProductCategories.Select(i=>i.Category).ToList(),
                SubCategories = product.ProductCategories.Select(i=>i.SubCategory).ToList()
            });
        }

        // private List<ProductDetail> GetProductDetails(int id){
        //     using(var context = new ShopContext()){
        //         return context.ProductDetails.Where(i=>i.ProductId == id).ToList();
        //     }
        // }

        public IActionResult Search(string q)
        {
            var productViewModel = new ProductListViewModel()
            {
                Products = _productService.GetSearchResult(q)
            };

            return View(productViewModel);
        }
    }
}