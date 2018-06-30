using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Microsoft.Ajax.Utilities;
using Racun.DbCtx;
using Racun.Models;

namespace Racun.Controllers
{
    public class MySession
    {

        private static readonly DatabaseContext _dbContext = new DatabaseContext();
        public static User CurrentUser
        {
            get
            {
                var userId = HttpContext.Current.Session["user_id"];
    
                if (userId != null)
                {
                    var uID = (int)userId;
                    var user =_dbContext.users.SingleOrDefault(u => u.id_korisnik == uID);
                    return user;
                }

                return null;
            }
        }
        
        
    }
    
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
            var email = collection["email"];
            var password = collection["password"];
            var user =_dbContext.users.SingleOrDefault(u => u.email == email && u.lozinka == password);
            if (user==null)
            {
                ModelState.AddModelError("email", "Korisnik ne postoji ili je lozinka pogrešna.");
                return View();
            }
            
            
            Session["user_id"] = user.id_korisnik;
            Session.Timeout = 120;
            return RedirectToAction("Edit", "CompanyData");
        }

        public ActionResult Register()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(FormCollection collection)
        {                
            var name = collection["name"];
            var surname = collection["surname"];
            var email = collection["email"];
            var password = collection["password"];
            var passwordRepeat = collection["passwordRepeat"];

            if (!password.Equals(passwordRepeat))
            {
                ModelState.AddModelError("password", "Lozinka se ne poklapa");
                return View();
            }
            
            var company = new Company {naziv = name+" "+surname+" Company"};
            _dbContext.companies.Add(company);
            _dbContext.SaveChanges();

            var user = new User
            {
                id_poduzece = company.id_poduzece,
                ime_prezime = name+" "+surname,
                email = email,
                licenca_datum_trajanja_pristupa = DateTime.Today,
                lozinka = password,
                vrsta = "homo sapiens",
                aktivan = true,
                aktiv_link = "huh"
            };

            _dbContext.users.Add(user);
            _dbContext.SaveChanges();

            return RedirectToAction("Login");
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