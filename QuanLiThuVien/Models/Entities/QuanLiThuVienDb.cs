using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QuanLiThuVien.Models.Entities
{
    public partial class QuanLiThuVienDb : DbContext
    {
        public QuanLiThuVienDb()
            : base("name=QuanLiThuVienDb")
        {
        }

        public virtual DbSet<DocGia> DocGias { get; set; }
        public virtual DbSet<MuonTra> MuonTras { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<NhanVien_History> NhanVien_History { get; set; }
        public virtual DbSet<NhaXuatBan> NhaXuatBans { get; set; }
        public virtual DbSet<Sach> Saches { get; set; }
        public virtual DbSet<TacGia> TacGias { get; set; }
        public virtual DbSet<TheLoai> TheLoais { get; set; }
        public virtual DbSet<TheThuVien> TheThuViens { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DocGia>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.mail)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.MuonTras)
                .WithOptional(e => e.NhanVien)
                .HasForeignKey(e => e.NhanvienmuonID);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.MuonTras1)
                .WithOptional(e => e.NhanVien1)
                .HasForeignKey(e => e.NhanvientraID);

            modelBuilder.Entity<NhanVien_History>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien_History>()
                .Property(e => e.Operation)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhaXuatBan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.ImgLink)
                .IsUnicode(false);

            modelBuilder.Entity<TheThuVien>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<TheThuVien>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<TheThuVien>()
                .Property(e => e.sdt)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TheThuVien>()
                .Property(e => e.mail)
                .IsUnicode(false);
        }
    }
}
