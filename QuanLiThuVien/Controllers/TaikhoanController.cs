using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using QuanLiThuVien.Models.ViewModel;
using QuanLiThuVien.Models.Common;
using QuanLiThuVien.Models.Entities;
using QuanLiThuVien.Models.Function;
using System.Linq;
using QuanLiThuVien.Models;

namespace QuanLiThuVien.Controllers
{
    public class TaikhoanController : Controller
    {
        // GET: Taikhoan
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Dangki()
        {
            return View();
        }
        public ActionResult Dangnhap()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(TaikhoanModel model)
        {
            if (ModelState.IsValid)
            {
                var KT = new TaiKhoanFunction();
                if (KT.CheckUsername(model.username))
                {
                    ModelState.AddModelError("", "Tài khoản đã tồn tại");
                }
                else
                if (KT.CheckMail(model.mail))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var user = new TheThuVien();
                    user.username = model.username;
                    user.password = model.password;
                    user.tentk = model.tentk;
                    user.sdt = model.phone;
                    user.diachi = model.diachi;
                    user.mail = model.mail;
                    user.Ngaytaothe = DateTime.Now;
                    user.Trangthai = true;
                    user.Ngayhethan = DateTime.Now.AddYears(2);
                    var result = KT.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng kí thành công !!!";
                        model = new TaikhoanModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng kí không thành công");
                    }
                }
            }
            return View(model);
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session[CommonConstant.USER_SESSION] = null;
            Session[CommonConstant.CartSession] = null;
            CommonConstant.USERNAME = null;
            return Redirect("/");
        }
        [HttpPost]
        public ActionResult Login(TaikhoanLoginModel model)
        {
            if (ModelState.IsValid)
            {
                var KT = new TaiKhoanFunction();
                var result = KT.Login(model.username, model.password);
                if (result == 1)
                {
                    var user = KT.GetById(model.username);
                    var usersession = new TaikhoanLoginModel();
                    usersession.username = user.username;
                    usersession.password = user.password;
                    Session.Add(CommonConstant.USER_SESSION, usersession);
                    CommonConstant.USERNAME = usersession;
                    return Redirect("/");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
            }
            return View(model);
        }
        /*[ChildActionOnly]
        public PartialViewResult HeaderTop()
        {
            var cart = Session[CommonConstant.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return PartialView(list);
        }*/
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