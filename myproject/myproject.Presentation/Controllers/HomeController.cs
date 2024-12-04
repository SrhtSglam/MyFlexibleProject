using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;
using myproject.Data.Abstract;
using myproject.Entities;
using myproject.Presentation.Models;
using myproject.Presentation.Services;

namespace myproject.Presentation.Controllers
{
    // localhost:5000/home
    public class HomeController : Controller
    {
        private readonly IProductService _productService;
        private readonly LanguageService _localization;
        private CarouselSettings carouselSettings;
        public string currentCulture;

        public HomeController(IProductService productService, LanguageService localization)
        {
            _productService = productService;
            _localization = localization;
        }

        public IActionResult Index()
        {
            carouselSettings = new CarouselSettings();
            var CarouselSettings = new CarouselSettings
            {
                IsCarousel = true,
                CarouselHeaderLine = new List<CarouselHeaderLine>(){
                        new CarouselHeaderLine(){CarouselImageUrl = "wp1.jpg", CarouselHeader = "Header 0", CarouselLine = "Line0"}, //Carousel minimum 1 değer verilmeli, default değer almaz ise patlıyor.
                        // new CarouselHeaderLine(){CarouselImageUrl = "wp1.jpg", CarouselHeader = "Header 1", CarouselLine = "Line1"},
                        // new CarouselHeaderLine(){CarouselImageUrl = "wp2.jpg", CarouselHeader = "Header 2", CarouselLine = "Line2"},
                        // new CarouselHeaderLine(){CarouselImageUrl = "wp1.jpg", CarouselHeader = "Header 3", CarouselLine = "Line3"},
                        // new CarouselHeaderLine(){CarouselImageUrl = "wp2.jpg", CarouselHeader = "Header 4", CarouselLine = "Line4"},
                        // new CarouselHeaderLine(){CarouselImageUrl = "wp1.jpg", CarouselHeader = "Header 5", CarouselLine = "Line5"}
                    }
            };
            var productViewModel = new ProductListViewModel
            {
                Products = _productService.GetHomePageProducts()
            };

            var homemodel = new HomeModel{
                CarouselSettings = CarouselSettings,
                ProductListViewModel = productViewModel
            };



            return View(homemodel);
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }
    }

}