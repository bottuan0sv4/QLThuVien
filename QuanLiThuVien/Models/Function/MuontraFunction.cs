using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLiThuVien.Models.Entities;
namespace QuanLiThuVien.Models.Function
{
    public class MuontraFunction
    {
        private QuanLiThuVienDb db;
        public MuontraFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public IQueryable<MuonTra> Muontras
        {
            get { return db.MuonTras; }
        }
        public int Insert(MuonTra order)
        {
            db.MuonTras.Add(order);
            db.SaveChanges();
            return order.MuontraID;
        }
    }
}