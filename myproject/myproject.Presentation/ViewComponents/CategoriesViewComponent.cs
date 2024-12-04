using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;
using myproject.Data.Concrete.EfCore;
using myproject.Entities;
using myproject.Presentation.Models;

namespace myproject.Presentation.ViewComponents
{
    public class CategoriesViewComponent : ViewComponent
    {
        private ICategoryService _categoryService;
        private ISubCategoryService _subCategoryService;

        public CategoriesViewComponent(ICategoryService categoryService, ISubCategoryService subCategoryService)
        {
            this._categoryService = categoryService;
            this._subCategoryService = subCategoryService;
        }

        public IViewComponentResult Invoke()
        {
            if (RouteData.Values["subcategory"] != null)
                ViewBag.SelectedCategory = RouteData?.Values["subcategory"];

            var categories = _categoryService.GetAll();
            var categorySubCategories = new Dictionary<int, List<SubCategory>>();

            foreach (var category in categories)
            {
                var subCategories = GetSubCategoriesByCategoryId(category.CategoryId);
                categorySubCategories[category.CategoryId] = subCategories;
            }

            var model = new CategoryListed()
            {
                Category = categories,
                CategorySubCategories = categorySubCategories
            };

            return View(model);
        }

        public List<SubCategory> GetSubCategoriesByCategoryId(int categoryId)
        {
            using (var context = new ShopContext())
            {
                return context.SubCategories
                            .Where(sc => sc.ProductCategories.Any(pc => pc.CategoryId == categoryId))
                            .ToList();
            }
        }
    }
}
