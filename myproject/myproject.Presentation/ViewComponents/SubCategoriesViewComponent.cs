using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;

namespace myproject.Presentation.ViewComponents
{
    public class SubCategoriesViewComponent:ViewComponent
    {
        private ISubCategoryService _subCategoryService;
        public SubCategoriesViewComponent(ISubCategoryService subCategoryService)
        {
            this._subCategoryService=subCategoryService;
        }
        public IViewComponentResult Invoke(int categoryId)
        {
            categoryId = 100;
            if (RouteData.Values["subcategory"]!=null)
                ViewBag.SelectedSubCategory = RouteData?.Values["subcategory"];

            // var subcategories = _subCategoryService.GetByCategoryId(categoryId);

            return View(_subCategoryService.GetAll());
        }
    }
}