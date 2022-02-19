namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MuonTra")]
    public partial class MuonTra
    {
        public int MuontraID { get; set; }

        public int? NhanvienmuonID { get; set; }

        public int? NhanvientraID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngaymuon { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngaytra { get; set; }

        public int? ThethuvienID { get; set; }

        public int? SachID { get; set; }

        [StringLength(50)]
        public string Ghichu { get; set; }

        public bool? Datra { get; set; }

        public int? soluong { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual NhanVien NhanVien1 { get; set; }

        public virtual Sach Sach { get; set; }

        public virtual TheThuVien TheThuVien { get; set; }
    }
}
