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
        public ActionResult Index()
{
    return View("Index", Receipt);
}
        