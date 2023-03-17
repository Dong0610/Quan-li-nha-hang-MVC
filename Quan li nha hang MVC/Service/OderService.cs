using Microsoft.SqlServer.Server;
using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static Microsoft.IO.RecyclableMemoryStreamManager;
using System.Xml.Linq;
using System.Web.Mvc;
namespace Quan_li_nha_hang_MVC.Service
{
    public static class OderService
    {
        private static DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        [SqlTrigger(Name = @"DoAnQuanLiNH", Target = "[dbo].[tblHDOder]", Event = "FOR INSERT")]
        public static string XacNhanOder(string ten, string phone, string giovao, string ngay, string sokhach, string note, string maban)
        {
            try
            {
                string query = "INSERT INTO dbo.tblHDOder(TenKH,SoDT,NgayVao,GioVao,GioRa,SoKhach,ID_NV,ID_Ban," +
                 "Thue,TongTien,TTThanhToan,GhiChu)VALUES" +
                 "(N'" + ten + "',N'" + phone + "',N'" + ngay + "',N'" + giovao + "',N'" + 0 + "',N'" + sokhach + "', 1,  '" + maban + "', 1.1,0,2,N'" + note + "') ";
                int reslt = db.Database.ExecuteSqlCommand(query);
                DateTime now = new DateTime();
                string timeOd = now.Hour.ToString() + ":" + now.Minute.ToString();
                string findId = "SELECT ID_HDOder FROM dbo.tblHDOder WHERE ID_Ban='" + maban + "' AND ID_NV=1 AND TenKH=N'" + ten + "' AND SoDT = '" + phone + "' AND NgayVao='" + ngay.Replace("-", "/") + "'";
                int idhd = db.Database.SqlQuery<int>(findId).FirstOrDefault();
                if (reslt == 1)
                {
                    double tongtien = 0;
                    foreach (CustomOder cus in CustomOderSer.DanhSachOder().ToList())
                    {
                        string themstr = "INSERT INTO dbo.tblChiTietOderBuffet(ID_HDOder,ID_Buffet,SoLuong,GioOder)VALUES(   " + idhd + ", '" + cus.ID_Buffe + "'," + cus.SoLuong + ",'" + timeOd + "' )";
                        db.Database.ExecuteSqlCommand(themstr);
                        tongtien += cus.SoLuong * cus.GiaBF;
                    }
                    CustomOderSer.XoaTatCa();
                    string themgd = "INSERT INTO dbo.tblGiaoDich(TenGD,ThoiGianGD,ID_HD_Oder,ID_NVMo,ID_NVDo,TinhTrang,HinhThucTT,PhiDV,TienBanDau,TienCuoi,GhiChu)" +
                  " VALUES ( N'Hóa đơn thanh toán ',DEFAULT,'" + idhd + "', '" + 1 + "','" + 1 + "',1,N'',0," + tongtien + ", DEFAULT,N'Giao dịch thanh toán khách hàng')";
                    db.Database.ExecuteSqlCommand(themgd);
                    db.Database.ExecuteSqlCommand("UPDATE dbo.tblBanNH SET TinhTrang=1 WHERE ID_Ban='" + maban + "'");
                }
                return reslt.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static void PhachThemSuat(string id)
        {
            try
            {
                using (var dbs = new DoAnQuanLiNHEntities())
                {
                    foreach (CustomOder cs in CustomOderSer.DanhSachOder().ToList())
                    {
                        db.ThemSuatBF(Int32.Parse(id), cs.ID_Buffe, Double.Parse(cs.SoLuong.ToString()), "0:00");
                    }
                    CustomOderSer.XoaTatCa();
                }
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
        internal static string ThanhToanBill(string mahd, string tongtien, string hinhtttoan, string giora, string madg, string tiencuoi, string phidv, string gc)
        {
            try
            {
                string query = "UPDATE dbo.tblHDOder SET TTThanhToan =1 , TongTien=" + tongtien + ", GioRa='" + giora + "' WHERE ID_HDOder =" + mahd;
                int reslt = db.Database.ExecuteSqlCommand(query);
                if (reslt == 1)
                {
                    string mab = db.Database.SqlQuery<string>("SELECT ID_Ban FROM dbo.tblHDOder WHERE ID_HDOder="+mahd).FirstOrDefault();
                    string trb = "UPDATE dbo.tblBanNH SET TinhTrang=0 WHERE ID_Ban='"+mab+"'";
                    db.Database.ExecuteSqlCommand(trb);
                    string donggd = "";
                    if (madg == "0")
                    {
                        donggd = "UPDATE dbo.tblGiaoDich SET TinhTrang =0,HinhThucTT=N'" + hinhtttoan + "',PhiDV=" + phidv + ",TienCuoi=" + tiencuoi + "  WHERE ID_HD_Oder=" + mahd;
                    }
                    else
                    {
                        donggd = "UPDATE dbo.tblGiaoDich SET TinhTrang =0,HinhThucTT=N'" + hinhtttoan + "',PhiDV=" + phidv + ",TienCuoi=" + tiencuoi + ",GhiChu=N'Mã giảm giá: "+madg+"'  WHERE ID_HD_Oder=" + mahd;
                    }
                    db.Database.ExecuteSqlCommand(donggd);
                    CustomOderSer.XoaTatCa();
                }
                return reslt.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static void ThemMonAn(string id)
        {
            try
            {
                using (var dbs = new DoAnQuanLiNHEntities())
                {
                    foreach (CustomOder cs in CustomOderSer.DanhSachOder().ToList())
                    {
                        db.ThemMonAnBF(Int32.Parse(id), cs.ID_Buffe, Double.Parse(cs.SoLuong.ToString()), "0:00");
                    }
                    CustomOderSer.XoaTatCa();
                }
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}