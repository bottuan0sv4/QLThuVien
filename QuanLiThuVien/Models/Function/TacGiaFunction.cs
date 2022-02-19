using QuanLiThuVien.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.Function
{
    public class TacGiaFunction
    {
        private QuanLiThuVienDb db;
        public TacGiaFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public List<TacGia> GetTacGias()
        {
            return db.TacGias.ToList();
        }
        public IQueryable<TacGia> TGs
        {
            get { return db.TacGias; }
        }
        public int GetById(string name)
        {
            return db.TacGias.SingleOrDefault(x => x.Tentacgia == name).TacgiaID;
        }
    }
}