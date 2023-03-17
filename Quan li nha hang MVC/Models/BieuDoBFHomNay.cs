using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quan_li_nha_hang_MVC.Models
{
    public class BieuDoBFHomNay
    {
        public string TenCot { get; set; }
        public int SoLuong { get; set; }
        public BieuDoBFHomNay(string tencot, int soLuong)
        {
            TenCot = tencot;
            SoLuong = soLuong;
        }
    }
}