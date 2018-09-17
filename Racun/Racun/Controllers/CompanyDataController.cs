using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Linq;
using System.Web.Mvc;
using Racun.DbCtx;
using Racun.Models;

namespace Racun.Controllers
{
    public class CompanyDataController : Controller
    {
        private readonly DatabaseContext _dbContext = new DatabaseContext();

        // GET
        public ActionResult Index()
        {
            List<Company> companies = _dbContext.companies.ToList();
            return View("Index", companies);
        }


        // GET
        public ActionResult New()
        {
            var company = new Company();
            return View(company);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult New(FormCollection collection)
        {
            var company = new Company
            {
                naziv = collection["companyName"],
                adresa = collection["address"],
                grad = collection["town"],
                drzava = collection["country"],
                tel = collection["phone"],
                mob = collection["cellphone"],
                email = collection["email"],
                oib = collection["oib"],
                odgovorna_osoba = collection["personInCharge"],
                ziro_racun = collection["bankAccount"],
                banka = collection["bank"],
                pdv = float.Parse(collection["tax"]) / 100,
                biljeska = collection["note"],
                pecat = collection["stamp"]
            };

            _dbContext.companies.Add(company);
            try
            {
                _dbContext.SaveChanges();
            }
            catch
            {
                TempData["msg"] = "<script>alert('" + "Poduzeće s ovim emailom već postoji!" + "');</script>";
                company.pdv = company.pdv * 100;
                return View(company);
            }
            return RedirectToAction("Index");
        }

        // GET
        public ActionResult Edit(int id)
        {
            var companyId = id;
            var company = _dbContext.companies.First(c => c.id_poduzece == companyId);
            return View(company);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(FormCollection collection)
        {
            var companyId = int.Parse(collection["id_company"]);
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
            company.pdv = float.Parse(collection["tax"]) / 100;
            company.biljeska = collection["note"];
            company.pecat = collection["stamp"];
            try
            {
                _dbContext.SaveChanges();
            }
            catch
            {
                TempData["msg"] = "<script>alert('" + "Poduzeće s ovim emailom već postoji!" + "');</script>";
                return View(company);
            }

            return RedirectToAction("Index");
        }

        // GET
        public ActionResult Delete(int id)
        {
            var companyId = id;
            var company = _dbContext.companies.First(c => c.id_poduzece == companyId);
            _dbContext.companies.Remove(company);
            try
            {
                _dbContext.SaveChanges();
            }
            catch
            {
                TempData["msg"] = "<script>alert('" + "Nije moguće obrisati poduzeće!" + "');</script>";
            }
            return RedirectToAction("Index");
        }
    }
}