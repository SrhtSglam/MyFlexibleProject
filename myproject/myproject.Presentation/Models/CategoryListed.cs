using myproject.Entities;

namespace myproject.Presentation.Models
{
    public class CategoryListed
{
    public List<Category> Category { get; set; }
    public Dictionary<int, List<SubCategory>> CategorySubCategories { get; set; }
}
}