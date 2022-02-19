using QuanLiThuVien.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.Function
{
    public class NhaXuatBanFunction
    {
        private QuanLiThuVienDb db;
        public NhaXuatBanFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public List<NhaXuatBan> GetNhaXuatBans()
        {
            return db.NhaXuatBans.ToList();
        }
        public IQueryable<NhaXuatBan> NXBs
        {
            get { return db.NhaXuatBans; }
        }
        public int GetById(string name)
        {
            return db.NhaXuatBans.SingleOrDefault(x => x.TenNXB == name).NhaxuatbanID;
        }
    }
}