namespace myproject.Entities
{
    public class OrderItem
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public Orders Orders { get; set;}

        public int ProductId { get; set; }
        public Product Product { get; set; }

        public double Price { get; set; }
        public int Quantity { get; set; }
    }

}