using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.ViewModel
{
    public class TaikhoanLoginModel
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Bạn phải nhập tài khoản")]
        public string username { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Bạn phải nhập mật khẩu")]
        public string password { get; set; }
    }
}