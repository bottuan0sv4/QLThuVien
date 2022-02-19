using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.ViewModel
{
    public class SachDAO
    {
        public int SachID { get; set; }

        public string Tensach { get; set; }

        public string ImgLink { get; set; }

        public string TenTacgia { get; set; }

        public string TenTheloai { get; set; }

        public string TenNhaxuatban { get; set; }

        public int? Namxuatban { get; set; }
    }
}
