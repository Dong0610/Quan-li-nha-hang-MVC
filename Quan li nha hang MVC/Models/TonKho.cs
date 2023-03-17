using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quan_li_nha_hang_MVC.Models
{
    public class TonKho
    {
        public string IdMH { get; set; }
        public string TenH { get; set; }
        public string DonViTon { get; set; }

        public string NhaCC { get; set; }
        public float SoLuong { get; set; }
        public string Ghichu { get; set; }
        public string KhuVuc { get; set; }

        public TonKho(string idMH, string tenH, string donViTon, string nhaCC, float soLuong, string ghichu, string khuVuc)
        {
            IdMH = idMH;
            TenH = tenH;
            DonViTon = donViTon;
            NhaCC = nhaCC;
            SoLuong = soLuong;
            Ghichu = ghichu;
            KhuVuc = khuVuc;
        }
    }

    public static class TonKhoSER{
        private static List<TonKho> KhoiTaoList = new List<TonKho>();
        public static List<TonKho> DanhSachTonKho()
        {
            return KhoiTaoList;
        }
        static int val = 0;
        public static void ThemMon(TonKho o)
        {
            val++;
            KhoiTaoList.Add(o);
            Console.WriteLine(val);
        }
        public static void XoaMon(string o)
        {
            if (KhoiTaoList.Count == 1)
            {
                KhoiTaoList = new List<TonKho>();
            }
            else
            {
                foreach (TonKho o2 in KhoiTaoList.ToList())
                {
                    if (o2.IdMH == o)
                    {
                        KhoiTaoList.Remove(o2);
                    }
                }
            }
        }
        public static void XoaTatCa()
        {
            KhoiTaoList = new List<TonKho>();
        }


    }

}