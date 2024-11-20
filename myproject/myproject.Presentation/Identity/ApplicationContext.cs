using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace myproject.Presentation.Identity
{
    public class ApplicationContext: IdentityDbContext<User>
    {

        // private readonly IConfiguration _configuration;
        public ApplicationContext(DbContextOptions<ApplicationContext> options):base(options)
        {
            // _configuration = configuration;
            
        }
    }
}