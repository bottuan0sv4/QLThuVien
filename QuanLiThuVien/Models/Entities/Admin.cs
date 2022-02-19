namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Admin")]
    public partial class Admin
    {
        public int id { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [StringLength(50)]
        public string pass { get; set; }
    }
}
