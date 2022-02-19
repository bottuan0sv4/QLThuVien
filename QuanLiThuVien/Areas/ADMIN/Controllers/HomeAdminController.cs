using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLiThuVien.Models.Function;
namespace QuanLiThuVien.Areas.ADMIN.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: ADMIN/Home
        public ActionResult Index()
        {
            ViewBag.SLKH = new AdminFunction().SL_KH();
            ViewBag.SLSP = new AdminFunction().SL_SP();
            return View();
        }
        [ChildActionOnly]
        public PartialViewResult Header()
        {
            return PartialView();
        }
    }
}