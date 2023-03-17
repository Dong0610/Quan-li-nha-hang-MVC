using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Quan_li_nha_hang_MVC.Models
{
    public class CustomOder
    {
        public string ID_Buffe { get; set; }
        public string TenBF { get; set; }
        public double GiaBF { get; set; }
        public int SoLuong { get; set; }
        public string Image { get; set; }
        public CustomOder(string iD_Buffe, string tenBF, double giaBF, int soLuong, string image)
        {
            ID_Buffe = iD_Buffe;
            TenBF = tenBF;
            GiaBF = giaBF;
            SoLuong = soLuong;
            Image = image;
        }
        public CustomOder()
        {
        }
    }
    public static class CustomOderSer{
        private static List<CustomOder> KhoiTaoList= new List<CustomOder>();
        public static List<CustomOder> DanhSachOder()
        {
            return KhoiTaoList;
        }
        public static void ThemMon(CustomOder o)
        {
            KhoiTaoList.Add(o);
        }
        public static void XoaMon(string o)
        {
            if (KhoiTaoList.Count == 1)
            {
                KhoiTaoList = new List<CustomOder>() ;
            }
            else
            {
                foreach (CustomOder o2 in KhoiTaoList.ToList())
                {
                    if (o2.ID_Buffe == o)
                    {
                        KhoiTaoList.Remove(o2);
                    }
                }
            }
        }
        public static  void XoaTatCa()
        {
            KhoiTaoList= new List<CustomOder>();
        }
    }
}