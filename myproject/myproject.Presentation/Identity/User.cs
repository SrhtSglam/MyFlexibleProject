using Microsoft.AspNetCore.Identity;
using myproject.Entities;

namespace myproject.Presentation.Identity
{
    public class User: IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}