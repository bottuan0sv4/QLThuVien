using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLiThuVien.Models.Entities;

namespace QuanLiThuVien.Models.Function
{
    public class TaiKhoanFunction
    {
        private QuanLiThuVienDb db;
        public TaiKhoanFunction()
        {
            db = new QuanLiThuVienDb();
        }
        public IQueryable<TheThuVien> THETHUVIENs
        {
            get { return db.TheThuViens; }
        }
        public int Insert(TheThuVien model)
        {
            db.TheThuViens.Add(model);
            db.SaveChanges();
            return model.ThethuvienID;
        }
        public int Update(TheThuVien model)
        {
            TheThuVien dbEntry = db.TheThuViens.Find(model.ThethuvienID);
            if (dbEntry == null)
            {
                return 0;
            }
            dbEntry.username = model.username;
            dbEntry.password = model.password;
            dbEntry.tentk = model.tentk;
            dbEntry.sdt = model.sdt;
            dbEntry.mail = model.mail;
            dbEntry.diachi = model.diachi;
            db.SaveChanges();
            return 1;
        }
        public int Delete(TheThuVien model)
        {
            TheThuVien dbEntry = db.TheThuViens.Find(model.ThethuvienID);
            if (dbEntry == null)
            {
                return 0;
            }
            db.TheThuViens.Remove(dbEntry);
            db.SaveChanges();
            return 1;
        }
        
        public int Login(string userName, string passWord)
        {
            var result = db.TheThuViens.FirstOrDefault(x => x.username == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.password == passWord)
                    return 1;
                else return 0;
            }
        }/*
        public TAIKHOAN FindEntity(int ID_TK)
        {
            TAIKHOAN dbEntry = context.TAIKHOANs.Find(ID_TK);
            return dbEntry;
        }*/
        public TheThuVien GetById(string userName)
        {
            return db.TheThuViens.SingleOrDefault(x => x.username == userName);
        }
        public int GetId(string userName)
        {
            return db.TheThuViens.SingleOrDefault(x => x.username == userName).ThethuvienID;
        }
        public bool CheckUsername(string username)
        {
            return db.TheThuViens.Count(x => x.username == username) > 0;
        }
        public bool CheckMail(string mail)
        {
            return db.TheThuViens.Count(x => x.mail == mail) > 0;
        }

    }
}