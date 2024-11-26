using System.Collections.Generic;
using myproject.Entities;

namespace myproject.Presentation.Models
{
    public class ProductDetailModel
    {
        public Product Product { get; set; }
        public List<Category> Categories { get; set; }
        public List<SubCategory> SubCategories { get; set; }
    }
}