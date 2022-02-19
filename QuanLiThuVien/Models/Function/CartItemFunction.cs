using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLiThuVien.Models.Entities;
namespace QuanLiThuVien.Models.Function
{
    public class CartItemFunction
    {
        private QuanLiThuVienDb db = null;
        public CartItemFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public Sach ViewDetail(long id)
        {
            return db.Saches.Find(id);
        }
        public int Insert(MuonTra model)
        {
            db.MuonTras.Add(model);
            db.SaveChanges();
            return model.MuontraID;
        }
        public Sach FindEntity(int ID_SP)
        {
            Sach dbEntry = db.Saches.Find(ID_SP);
            return dbEntry;
        }
    }
}