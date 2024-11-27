using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;

namespace myproject.Presentation.ViewComponents
{
    public class CategoriesViewComponent : ViewComponent
    {
        private ICategoryService _categoryService;

        public CategoriesViewComponent(ICategoryService categoryService)
        {
            this._categoryService = categoryService;
        }

        public IViewComponentResult Invoke()
        {
            if (RouteData.Values["category"] != null)
                ViewBag.SelectedCategory = RouteData?.Values["category"];
            
            var categories = _categoryService.GetAll();
            return View(categories);
        }
    }
}
