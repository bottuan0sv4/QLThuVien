using QuanLiThuVien.Models.Function;
using QuanLiThuVien.Models.ViewModel;
using QuanLiThuVien.Models.Entities;
using QuanLiThuVien.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace QuanLiThuVien.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var list = new List<CartItemModel>();
            var cart =(Cart)Session[CartSession];
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return View(list);
        }
        public ActionResult DatHangThanhCong()
        {
            return View();
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
        [ChildActionOnly]
        public PartialViewResult HeaderTop()
        {
            var cart = (Cart)Session[CommonConstant.CartSession];
            var list = new List<CartItemModel>();
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return PartialView(list);
        }
        [ChildActionOnly]
        public PartialViewResult HeaderMid()
        {
            var cart = (Cart)Session[CommonConstant.CartSession];
            var list = new List<CartItemModel>();
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return PartialView(list);
        }
        /*public ActionResult dIndex()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }*/
        public ActionResult AddItem(int sachID, int Quantity)
        {
            var sanpham = new CartItemFunction().ViewDetail(sachID);
            var cart =  (Cart)Session[CartSession];
            if (cart != null)
            {
                cart.AddItem(sanpham, 1);
                
                Session[CartSession] = cart;
            }
            else
            {
                cart = new Cart();
                cart.AddItem(sanpham, 1);
                
                Session[CartSession] = cart;
            }
            return RedirectToAction("Index", "Cart");
        }
        public RedirectToRouteResult XoaKhoiGio(int sachID)
        {
            var product = new SachFunction().FindEntity(sachID); ;
            var cart = (Cart)Session[CartSession];
            if (cart != null)
            {
                cart.RemoveLine(product);
                //Gán vào session
                Session[CartSession] = cart;
            }
            //var cart =(Cart)Session[CartSession];
            //if (cart != null)
            //{
            //    var list = cart.Lines.ToList();
            //    CartItemModel itemXoa = list.FirstOrDefault(m => m.sach.SachID == sachID);
            //    if (itemXoa != null)
            //    {
            //        list.Remove(itemXoa);
            //    }
            //    Session[CartSession] = list;
            //}
            // List<CartItemModel> giohang = Session["CartSession"] as List<CartItemModel>;
            return RedirectToAction("Index", "Cart");
        }
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItemModel>>(cartModel);
            var sessionCart = (Cart)Session[CartSession];

            foreach (var item in sessionCart.Lines)
            {
                var jsonItem = jsonCart.FirstOrDefault(x => x.sach.SachID == item.sach.SachID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult ShowInfo()
        {
            var cart = (Cart)Session[CommonConstant.CartSession];
            var list = new List<CartItemModel>();
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return PartialView(list);
        }
        [HttpPost]
        public ActionResult Payment()
        {
            try
            {
                var cart = (Cart)Session[CartSession];
                foreach (var item in cart.Lines)
                {
                    var obj = new MuonTra();
                    obj.SachID = item.sach.SachID;
                    obj.soluong = item.Quantity;
                    obj.Ngaymuon = DateTime.Now;
                    obj.Ngaytra = DateTime.Now.AddMonths(2);
                    obj.ThethuvienID = new TaiKhoanFunction().GetId(CommonConstant.USERNAME.username);
                    obj.Datra = false;
                    var id = new MuontraFunction().Insert(obj);
                }
                Session["CartSession"] = null;
            }
            catch (Exception ex)
            {
                //ghi log
                return RedirectToAction("/Loi");
            }
            return RedirectToAction("DatHangThanhCong", "Cart");
        }

    }
}