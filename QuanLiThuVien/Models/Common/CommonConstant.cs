using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLiThuVien.Models.ViewModel;
namespace QuanLiThuVien.Models.Common
{
    public class CommonConstant
    {
        public static string USER_SESSION = "USER_SESSION";
        public static string ADMIN_SESSION = "ADMIN_SESSION";
        public static string SESSION_CREDENTIALS = "SESSION_CREDENTIALS";
        public static string CartSession = "CartSession";
        public static TaikhoanLoginModel USERNAME;

        public static string CurrentCulture { set; get; }
    }
}