namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class NhanVien_History
    {
        [Key]
        public int ID_Change { get; set; }

        public int IDnhanvien { get; set; }

        [Required]
        [StringLength(50)]
        public string Tennhanvien { get; set; }

        [Required]
        [StringLength(50)]
        public string Diachi { get; set; }

        [Required]
        [StringLength(10)]
        public string SDT { get; set; }

        public DateTime Updated_at { get; set; }

        [Required]
        [StringLength(10)]
        public string Operation { get; set; }
    }
}
