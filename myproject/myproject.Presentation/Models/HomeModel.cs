using System;
using System.Collections.Generic;
using myproject.Entities;

namespace myproject.Presentation.Models
{
    public class HomeModel{
        public PageInfo PageInfo { get; set; }
        public ProductListViewModel ProductListViewModel { get; set; }
        public CarouselSettings CarouselSettings { get; set; }
    }
}