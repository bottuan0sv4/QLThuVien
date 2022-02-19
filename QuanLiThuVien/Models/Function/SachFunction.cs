using QuanLiThuVien.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.Function
{
    public class SachFunction
    {
        private QuanLiThuVienDb db;
        public SachFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public List<Sach> AllBooks()
        {
            return db.Saches.SqlQuery("AllBook").ToList();
        }
        public List<Sach> GetSachs()
        {
            return db.Saches.ToList();
        }
        //get sach for slide
        public List<Sach> SachChoSlide(int top)
        {
            return db.Saches.Where(x => x.Namxuatban < 2020).Take(top).ToList();
        }
        //
        public List<Sach> SachMoi(DateTime dateTime)
        {
            return db.Saches.Where(x => x.Namxuatban >= 1999).ToList();
        }

        //Lay top cac cuon sach muon nhieu
        public List<Sach> SachMuonNhieu(int top)
        {
            SqlParameter[] sqlParameters =
            {
                new SqlParameter("@Top", top)
            };
            return db.Saches.SqlQuery("SachDuocMuon @Top", sqlParameters).ToList();
        }
        public List<Sach> SachSXAZ()
        {
            var links = from l in db.Saches select l;
            links = links.OrderBy(s => s.Tensach);
            return links.ToList();
        }
        public Sach FindEntity(int ID_SP)
        {
            Sach dbEntry = db.Saches.Find(ID_SP);
            return dbEntry;
        }
        public int Insert(Sach model)
        {
            Sach dbEntry = db.Saches.Find(model.SachID);
            if (dbEntry != null)
            {
                return -1;

            }
            db.Saches.Add(model);
            db.SaveChanges();
            return model.SachID;
        }
        public int Update(Sach model)
        {
            Sach dbEntry = db.Saches.Find(model.SachID);
            if (dbEntry == null)
            {
                return -1;
            }
            dbEntry.SachID = model.SachID;
            dbEntry.TacgiaID = model.TacgiaID;
            dbEntry.TheloaiID = model.TheloaiID;
            dbEntry.NhaxuatbanID = model.NhaxuatbanID;
            dbEntry.Tensach = model.Tensach;
            dbEntry.Namxuatban = model.Namxuatban;
            dbEntry.ImgLink = model.ImgLink;
            
            db.SaveChanges();
            return model.SachID;
        }
        public int Delete(Sach model)
        {
            Sach dbEntry = db.Saches.Find(model.SachID);
            if (dbEntry != null)
            {
                db.Saches.Remove(dbEntry);
                db.SaveChanges();
            }
            return model.SachID;
        }
    }
}