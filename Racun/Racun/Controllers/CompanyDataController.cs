using System.Web.Mvc;

namespace Racun.Controllers
{
    public class CompanyDataController : Controller
    {
        // GET
        public ActionResult Edit()
        {
            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(FormCollection collection)
        {
            return View();
        }
    }
}