using System.Linq;
using Microsoft.EntityFrameworkCore;
using myproject.Data.Abstract;
using myproject.Entities;

namespace myproject.Data.Concrete.EfCore
{
    public class EfCoreCartRepository : EfCoreGenericRepository<Cart, ShopContext>, ICartRepository
    {
        public void DeleteFromCart(int cartId, int productId)
        {
           using(var context = new ShopContext())
           {
               var cmd = @"delete from CartItems where CartId=@p0 and ProductId=@p1";
               context.Database.ExecuteSqlRaw(cmd,cartId,productId);
           }
        }

        public Cart GetByUserId(string userId)
        {
            using(var context=new ShopContext())
            {
                return context.Cart
                            .Include(i=>i.CartItems)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault(i=>i.UserId==userId);
            }
        }

        public override void Update(Cart entity)
        {
            using (var context = new ShopContext())
            {
               context.Cart.Update(entity);
               context.SaveChanges();
            }
        } 
    }
}