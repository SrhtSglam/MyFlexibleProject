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
        public IViewComponentResult Invoke()
        {
            if (RouteData.Values["subcategory"]!=null)
                ViewBag.SelectedSubCategory = RouteData?.Values["subcategory"];
                
            return View(_subCategoryService.GetAll());
        }
    }
}