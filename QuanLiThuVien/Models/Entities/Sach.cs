namespace QuanLiThuVien.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sach")]
    public partial class Sach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sach()
        {
            MuonTras = new HashSet<MuonTra>();
        }

        public int SachID { get; set; }

        [StringLength(50)]
        public string Tensach { get; set; }

        [StringLength(100)]
        public string ImgLink { get; set; }

        public int? TacgiaID { get; set; }

        public int? TheloaiID { get; set; }

        public int? NhaxuatbanID { get; set; }

        public int? Namxuatban { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MuonTra> MuonTras { get; set; }

        public virtual NhaXuatBan NhaXuatBan { get; set; }

        public virtual TacGia TacGia { get; set; }

        public virtual TheLoai TheLoai { get; set; }
    }
}
