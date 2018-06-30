using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Racun.DbCtx;
using Racun.Models;

namespace Racun.Controllers
{
    public class AuthController : Controller
    {
        
        private readonly DatabaseContext _dbContext = new DatabaseContext();
        
        public ActionResult Login()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(FormCollection collection)
        {
            return View();
        }

        public ActionResult Register()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(FormCollection collection)
        {                
            var company = new Company {naziv = "Test company"};
            _dbContext.companies.Add(company);
            _dbContext.SaveChanges();
            
            var user = new User
            {
                id_poduzece = company.id_poduzece,
                ime_prezime = "Tvrtko Tvrtkic",
                email = "tvrtko@example.com",
                licenca_datum_trajanja_pristupa = DateTime.Today,
                lozinka = "lozinka",
                vrsta = "homo sapiens",
                aktivan = true,
                aktiv_link = "huh"
            };

            _dbContext.users.Add(user);
            _dbContext.SaveChanges();

            return View();
        }

        public ActionResult ForgotPassword()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ForgotPassword(FormCollection collection)
        {
            return View();
        }
    }
}