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
using QuanLiThuVien.Models.ViewModel;
using QuanLiThuVien.Models.Common;

namespace QuanLiThuVien.Controllers
{
    public class SanphamController : Controller
    {
        private QuanLiThuVienDb db = new QuanLiThuVienDb();
        // GET: Sanpham
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SPView(string keyword, int? page)
        {
            ViewBag.ListTheLoai = new TheLoaiFunction().GetTheLoais();
            ViewBag.ListNXB = new NhaXuatBanFunction().GetNhaXuatBans();
            ViewBag.ListTacGia = new TacGiaFunction().GetTacGias();
            ViewBag.AllBooks = new SachFunction().AllBooks();

            var sp = db.Saches.Where(p => p.SachID != null).OrderBy(p => p.SachID).ToList();

            if (!string.IsNullOrEmpty(keyword) && !string.IsNullOrWhiteSpace(keyword))
            {
                sp = sp.Where(p => !string.IsNullOrEmpty(p.Tensach) && p.Tensach.ToLower().Contains(keyword.ToLower()))
                    .ToList();
            }
            return View(sp.OrderBy(n => n.SachID).ToPagedList(page ??1,5));
            ;
            // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            //if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            //var links = (from l in db.Saches select l).OrderBy(x => x.SachID);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            //int pageSize = 5;

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            //var model = db.Saches.OrderBy(m => m.SachID).ToPagedList(page ?? 1, 5);
            //return View(model);
            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            //return View(links.ToPagedList(pageNumber, pageSize));
        }

        [ChildActionOnly]
        public ActionResult Danhmuc()
        {
            ViewBag.ListTheLoai = new TheLoaiFunction().GetTheLoais();
            ViewBag.ListNXB = new NhaXuatBanFunction().GetNhaXuatBans();
            ViewBag.ListTacGia = new TacGiaFunction().GetTacGias();
            return PartialView();
        }
        public ActionResult Chitietsanpham(int id)
        {
            var model = db.Saches.Where(x => x.SachID == id).FirstOrDefault();
            return View(model);
        }
        public PartialViewResult Sanphamlienquan(int id)
        {
            var sp = (from a in db.Saches
                      where (a.SachID == id)
                      select a).FirstOrDefault();
            var model = (from a in db.Saches
                         where (a.TacgiaID == sp.TacgiaID && a.SachID != sp.SachID)
                         select a).OrderByDescending(r => r.SachID).Take(4);
            return PartialView(model);
        }
        public ActionResult KQTimKiem(string keyword, int? page)
        {
            ViewBag.ListTheLoai = new TheLoaiFunction().GetTheLoais();
            ViewBag.ListNXB = new NhaXuatBanFunction().GetNhaXuatBans();
            ViewBag.ListTacGia = new TacGiaFunction().GetTacGias();
            ViewBag.AllBooks = new SachFunction().AllBooks();

            var sp = db.Saches.Where(p => p.SachID != null).OrderBy(p => p.SachID).ToList();

            if (!string.IsNullOrEmpty(keyword) && !string.IsNullOrWhiteSpace(keyword))
            {
                sp = sp.Where(p => !string.IsNullOrEmpty(p.Tensach) && p.Tensach.ToLower().Contains(keyword.ToLower()))
                    .ToList();
            }
            return View(sp.OrderBy(n => n.SachID).ToPagedList(page ?? 1, 10));
        }
        public ActionResult TimkiemtheoTacgia(int id)
        {
            QuanLiThuVienDb context = new QuanLiThuVienDb();
            TacGia tg = context.TacGias.Find(id);
            if (tg != null)
            {
                ViewBag.Tentacgia = tg.Tentacgia;
            }
            var sp = db.Saches.Where(p => p.TacgiaID==id);
            return View(sp);
        }
        public ActionResult TimkiemtheoTheloai(int id)
        {
            QuanLiThuVienDb context = new QuanLiThuVienDb();
            TheLoai tg = context.TheLoais.Find(id);
            if (tg != null)
            {
                ViewBag.Tentheloai = tg.Tentheloai;
            }
            var sp = db.Saches.Where(p => p.TheloaiID == id);
            return View(sp);
        }
        public ActionResult TimkiemtheoNXB(int id)
        {
            QuanLiThuVienDb context = new QuanLiThuVienDb();
            NhaXuatBan tg = context.NhaXuatBans.Find(id);
            if (tg != null)
            {
                ViewBag.TenNXB = tg.TenNXB;
            }
            var sp = db.Saches.Where(p => p.NhaxuatbanID == id);
            return View(sp);
        }
        private const string CartSession = "CartSession";

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
            return RedirectToAction("SPView");
        }
    }
    
}