using System.Collections.Generic;

namespace myproject.Entities
{
    public class Product
    {
        public int ProductId { get; set; }  
        public string Company { get; set; }       
        public string Name { get; set; }       
        public string Url { get; set; }       
        public decimal? Price { get; set; } 
        public string Description { get; set; }

        public bool IsApproved { get; set; }
        public bool IsHome { get; set; }
        public List<ProductCategory> ProductCategories { get; set; }
        public List<ProductImage> ProductImages { get; set; }
    }
}