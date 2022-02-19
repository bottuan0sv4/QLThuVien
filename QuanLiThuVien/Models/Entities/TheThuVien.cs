namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TheThuVien")]
    public partial class TheThuVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TheThuVien()
        {
            DocGias = new HashSet<DocGia>();
            MuonTras = new HashSet<MuonTra>();
        }

        public int ThethuvienID { get; set; }

        public int? NhanvienID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngaytaothe { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngayhethan { get; set; }

        public int? Solangiahan { get; set; }

        public bool? Trangthai { get; set; }

        [StringLength(50)]
        public string username { get; set; }

        [StringLength(50)]
        public string password { get; set; }

        [StringLength(50)]
        public string tentk { get; set; }

        [StringLength(12)]
        public string sdt { get; set; }

        [StringLength(50)]
        public string mail { get; set; }

        [StringLength(200)]
        public string diachi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DocGia> DocGias { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MuonTra> MuonTras { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
