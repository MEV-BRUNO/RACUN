using System.Linq;
using System.Web.Mvc;
using Racun.DbCtx;

namespace Racun.Controllers
{
    public class CompanyDataController : Controller
    {
        private readonly DatabaseContext _dbContext = new DatabaseContext();
        
        // GET
        public ActionResult Edit()
        {
            var companyId = MySession.CurrentUser.id_poduzece;
            var company = _dbContext.companies.First(c => c.id_poduzece == companyId);
            return View(company);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(FormCollection collection)
        {
            
            var companyId = MySession.CurrentUser.id_poduzece;
            var company = _dbContext.companies.First(c => c.id_poduzece == companyId);

            company.naziv = collection["companyName"];
            company.adresa = collection["address"];
            company.grad = collection["town"];
            company.drzava = collection["country"];
            company.tel = collection["phone"];
            company.mob = collection["cellphone"];
            company.email = collection["email"];
            company.oib = collection["oib"];
            company.odgovorna_osoba = collection["personInCharge"];
            company.ziro_racun = collection["bankAccount"];
            company.banka = collection["bank"];
            company.pdv = float.Parse(collection["tax"]);
            company.biljeska = collection["note"];
            company.pecat = collection["stamp"];
            
            
            _dbContext.SaveChanges();
            
            return View(company);
        }
    }
}