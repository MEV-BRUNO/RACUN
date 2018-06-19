using System.Data.Entity;
using Racun.Models;

namespace Racun.DbCtx
{
    public class DatabaseContext: DbContext

    {
        public DbSet<User> users { get; set; }
        
        public DbSet<Company> companies { get; set; }
    }
}