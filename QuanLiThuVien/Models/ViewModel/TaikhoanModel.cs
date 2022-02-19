using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLiThuVien.Models.ViewModel
{
    public class TaikhoanModel
    {
        [Display(Name = "Tên độc giả")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên người dùng muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string tentk { get; set; }

        [Display(Name = "Tên đăng nhập")]
        [RegularExpression(@"^[A-Za-z][A-Za-z0-9]*$", ErrorMessage = "Tên tài khoản không chứa kí tự đặc biệt")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên tài khoản muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập vào mật khẩu muốn đăng ký")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string password { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("password", ErrorMessage = "Xác nhận mật khẩu không đúng")]
        [Required(ErrorMessage = "Vui lòng nhập vào mật khẩu muốn đăng ký")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string ConfirmPass { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên Mail muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào đúng mail xxx@xmail.com ...")]
        public string mail { get; set; }

        [Display(Name = "Số điện thoại")]
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "Số điện thoại chỉ chứa số")]
        [Required(ErrorMessage = "Vui lòng nhập vào số điện thoại muốn đăng kí")]
        [StringLength(12, MinimumLength = 8, ErrorMessage = "Vui lòng nhập vào đúng số điện thoại")]
        public string phone { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên địa chỉ muốn đăng kí")]
        [StringLength(200, MinimumLength = 15, ErrorMessage = "Vui lòng nhập vào địa chỉ cụ thể")]
        public string diachi { get; set; }
    }
}