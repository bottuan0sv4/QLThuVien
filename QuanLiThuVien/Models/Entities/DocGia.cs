namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DocGia")]
    public partial class DocGia
    {
        public int DocgiaID { get; set; }

        [StringLength(50)]
        public string Tendocgia { get; set; }

        public int? ThethuvienID { get; set; }

        [StringLength(11)]
        public string SDT { get; set; }

        [StringLength(100)]
        public string Diachi { get; set; }

        [StringLength(50)]
        public string mail { get; set; }

        public virtual TheThuVien TheThuVien { get; set; }
    }
}
