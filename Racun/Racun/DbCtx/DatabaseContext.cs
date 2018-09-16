using System.Data.Entity;
using System.Web.Services.Description;
using Racun.Models;

namespace Racun.DbCtx
{
    public class DatabaseContext: DbContext

    {
        public DbSet<User> users { get; set; }
        
        public DbSet<Company> companies { get; set; }
        
        //public DbSet<Service> services { get; set; }

    }
}