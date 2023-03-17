using Microsoft.Ajax.Utilities;
using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Quan_li_nha_hang_MVC.Service
{
    public static class HoaDonService
    {
        private static List<tblMatHang> ListHangThem = new List<tblMatHang>();
        static DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        public static void HuyTaoHD()
        {
            ListHangThem.Clear();
        }
        public static void ThemSp(tblMatHang model)
        {
            bool isct = false;
            foreach (tblMatHang tbl in ListHangThem)
            {
                if (tbl.ID_Hang == model.ID_Hang)
                {
                    isct = true;
                }
            }
            if (isct)
            {
                foreach (tblMatHang val in ListHangThem)
                {
                    if (model.ID_Hang == val.ID_Hang)
                    {
                        val.SoLuong = val.SoLuong + model.SoLuong;
                    }
                }
            }
            else
            {
                var spt = new tblMatHang();
                foreach (tblMatHang mh in db.tblMatHang.ToList())
                {
                    if (mh.ID_Hang == model.ID_Hang)
                    {
                        spt.ID_Hang = mh.ID_Hang;
                        spt.TenHang = mh.TenHang;
                        spt.SoLuong = model.SoLuong;
                        spt.ID_LoaiH = model.ID_LoaiH;
                        spt.MucGia = mh.MucGia;
                        spt.DonViTon = mh.DonViTon;
                        spt.ID_NCC = model.ID_NCC;
                    }
                }
                ListHangThem.Add(spt);
            }
        }
        public static List<tblMatHang> SuaSlMH(string id, float sl)
        {
            foreach (tblMatHang mh in ListHangThem)
            {
                if (mh.ID_Hang == id)
                {
                    mh.SoLuong = sl;
                }
            }
            return ListHangThem;
        }
        public static List<tblMatHang> AllPrAdd() { return ListHangThem; }
        public static void XoaMatHang(string idh)
        {
            foreach (tblMatHang mh in ListHangThem)
            {
                if (mh.ID_Hang == idh)
                {
                    ListHangThem.Remove(mh);
                    break;
                }
            }
        }
        public static int LuuHoaDonDT(tblHDNhapHang model)
        {
            string datetd = model.NgayDat;
            string datenx = model.NgayDao;
            string query = "INSERT INTO dbo.tblHDNhapHang(SoHieuHD,NgayDat,NgayDao,ThanhTien,ID_NV,DuyetHD) VALUES (N'" + model.SoHieuHD + "','" + datetd + "','" + datenx + "',0.0,1,0)";
            int noOfRowInserted = 0;
            try
            {
                noOfRowInserted = db.Database.ExecuteSqlCommand(query);
            }
            catch (SqlException e)
            {
                noOfRowInserted = 0;
                Console.WriteLine(e.Message);
            }
            double tongtien = 0;
            if (noOfRowInserted > 0)
            {
                foreach (tblMatHang mh in ListHangThem)
                {
                    string query2 = "INSERT INTO dbo.tblChiTietHDNH (ID_HDNH,ID_Hang,SoLuong,DuyetH) VALUES (N'" + model.SoHieuHD + "','" + mh.ID_Hang + "', " + mh.SoLuong.ToString().Replace(",", ".") + ",0)";
                    int insct = db.Database.ExecuteSqlCommand(query2);
                    tongtien += mh.SoLuong * mh.MucGia;
                }
                db.Database.ExecuteSqlCommand("UPDATE dbo.tblHDNhapHang SET ThanhTien=" + tongtien + " WHERE SoHieuHD='" + model.SoHieuHD + "'");
            }
            return noOfRowInserted;
        }
        private static string FomatDate(DateTime? date)
        {
            return (date?.Year + "-" + date?.Month + "-" + date?.Date).ToString();
        }

        
        public static object ListHoaDon()
        {
            var listhd = db.DanhSachHoaDon.ToList();
            return listhd;
        }
        public static DanhSachHoaDon HoaDonTheoMa(string id)
        {
            DanhSachHoaDon ds = db.DanhSachHoaDon.SqlQuery("Select * from DanhSachHoaDon where SoHieuHD='" + id + "'").FirstOrDefault();
            return ds;
        }
        public static object ChitetHD(string id)
        {
            return (object)db.DsHangTheoHD(id);
        }
        public static string DuyetHSanPham(string idhd, string idh, double soluong)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var isuccess = "";
                try
                {
                    string xetsl = "UPDATE dbo.tblMatHang SET SoLuong = SoLuong+" + soluong + " WHERE ID_Hang='" + idh + "'";
                    db.Database.ExecuteSqlCommand(xetsl);
                    string query = "UPDATE tblChiTietHDNH SET DuyetH =1,SoLuong=" + soluong + " WHERE ID_HDNH='" + idhd + "' AND ID_Hang='" + idh + "'";
                    string qrtongt = "SELECT SUM(ct.SoLuong*MucGia) FROM dbo.tblChiTietHDNH AS ct INNER JOIN dbo.tblMatHang ON tblMatHang.ID_Hang = ct.ID_Hang WHERE ID_HDNH='" + idhd + "'";
                    double tongtien = db.Database.SqlQuery<double>(qrtongt).FirstOrDefault();

                    isuccess = db.Database.ExecuteSqlCommand(query).ToString();
                    int str = db.Database.ExecuteSqlCommand("UPDATE dbo.tblHDNhapHang SET ThanhTien=" + tongtien + " WHERE SoHieuHD='" + idhd + "'");
                }
                catch (SqlException ex)
                {
                    isuccess = ex.Message;
                }
                return isuccess;
            }
        }
        internal static string XoaHoaDon(string idhd)
        {
            string query = "EXEC dbo.XoaHoaDonTheoMa @mahd='" + idhd + "'";
            string value = "";
            try
            {
                value = db.Database.SqlQuery<string>(query).FirstOrDefault().ToString();
                if (value == "ERROR")
                {
                    return "Chỉ quản lí mới có thể xóa hóa đơn này";
                }
                else
                {
                    db.Database.ExecuteSqlCommand("DELETE FROM dbo.tblChiTietHDNH WHERE ID_HDNH='" + value + "'");
                    db.Database.ExecuteSqlCommand("DELETE FROM dbo.tblHDNhapHang WHERE SoHieuHD='" + value + "'");
                    return "1";
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                return ex.Message;
            }
        }
        internal static bool DuyetTatCaSP(string idhd)
        {
            int isallsp = db.Database.ExecuteSqlCommand("UPDATE dbo.tblChiTietHDNH SET DuyetH=1 WHERE ID_HDNH='" + idhd + "'");
            if (isallsp > 0)
            {
                string qrtongt = "SELECT SUM(ct.SoLuong*MucGia) FROM dbo.tblChiTietHDNH AS ct INNER JOIN dbo.tblMatHang ON tblMatHang.ID_Hang = ct.ID_Hang WHERE ID_HDNH='" + idhd + "'";
                double tongtien = db.Database.SqlQuery<double>(qrtongt).FirstOrDefault();
                int str = db.Database.ExecuteSqlCommand("UPDATE dbo.tblHDNhapHang SET ThanhTien=" + tongtien + " WHERE SoHieuHD='" + idhd + "'");
                db.Database.ExecuteSqlCommand("UPDATE dbo.tblHDNhapHang SET DuyetHD=1 WHERE SoHieuHD='" + idhd + "'");
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}