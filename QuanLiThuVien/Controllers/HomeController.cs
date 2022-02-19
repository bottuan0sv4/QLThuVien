using QuanLiThuVien.Models.Entities;
using QuanLiThuVien.Models.Function;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using QuanLiThuVien.Models.Common;
using QuanLiThuVien.Models.ViewModel;

namespace QuanLiThuVien.Controllers
{
    public class HomeController : Controller
    {
        private QuanLiThuVienDb db = new QuanLiThuVienDb();
        public ActionResult Index()
        {
            var model = new SachFunction().SachChoSlide(2);
            ViewBag.SachMoi = new SachFunction().SachMoi(new DateTime(2020, 1, 1));
            ViewBag.SachMuonNhieu = new SachFunction().SachMuonNhieu(5);
            ViewBag.AllBooks = new SachFunction().AllBooks();
            return View(model);
        }
        //Menu
        [ChildActionOnly]
        public ActionResult Menu()
        { 
            ViewBag.ListTheLoai = new TheLoaiFunction().GetTheLoais();
            ViewBag.ListNXB = new NhaXuatBanFunction().GetNhaXuatBans();
            ViewBag.ListTacGia = new TacGiaFunction().GetTacGias();
            return PartialView();
        }
        [ChildActionOnly]
        public PartialViewResult HeaderTop()
        {

            return PartialView();
        }
        public PartialViewResult HeaderMid()
        {

            return PartialView();
        }
        [ChildActionOnly]
        public PartialViewResult ShowCart()
        {
            var cart = (Cart)Session[CommonConstant.CartSession];
            var list = new List<CartItemModel>();
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return PartialView(list);
        }
        private const string CartSession = "CartSession";
        public RedirectToRouteResult XoaKhoiGio(int sachID)
        {
            var cart = (Cart)Session[CartSession];
            if (cart != null)
            {
                var list = cart.Lines.ToList();
                CartItemModel itemXoa = list.FirstOrDefault(m => m.sach.SachID == sachID);
                if (itemXoa != null)
                {
                    list.Remove(itemXoa);
                }
                Session[CartSession] = list;
            }
            // List<CartItemModel> giohang = Session["CartSession"] as List<CartItemModel>;
            return RedirectToAction("Index");
        }

    }
}