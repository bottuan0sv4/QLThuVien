using QuanLiThuVien.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.Function
{
    public class TheLoaiFunction
    {
        private QuanLiThuVienDb db;
        public TheLoaiFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public List<TheLoai> GetTheLoais()
        {
            return db.TheLoais.ToList();
        }
        public IQueryable<TheLoai> TLs
        {
            get { return db.TheLoais; }
        }
        public int GetById(string name)
        {
            return db.TheLoais.SingleOrDefault(x => x.Tentheloai == name).TheloaiID;
        }
    }
}