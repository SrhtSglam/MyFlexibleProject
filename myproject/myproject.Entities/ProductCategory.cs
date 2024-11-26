namespace myproject.Entities
{
    public class ProductCategory
    {
        public int CategoryId { get; set; }
        public Category Category { get; set; }
        public int SubCategoryId { get; set; }
        public SubCategory SubCategory { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set; }
    }
}