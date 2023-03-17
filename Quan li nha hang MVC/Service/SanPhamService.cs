using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
namespace Quan_li_nha_hang_MVC.Service
{
    public static class SanPhamService
    {
         private static   DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        public static object ListMatHang()
        {
            using (DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities())
            {
                var listdsh = db.DanhSachMatHang.ToList();
                
                return listdsh;
            }
           
        }

        public static void InitListSP()
        {

        }
        internal static object Save_Food_ChangeSRVC(string id, string ten, string anh, string gia, string mota, string trac)
        {
            string query = "UPDATE dbo.tblMonAn SET TenMon=N'"+ten+"',GiaMon='"+gia+"',MoTa=N'"+mota+"',HinhAnh=N'"+anh+"',TracMon=N'"+trac+"' WHERE ID_MonAn='"+id+"'";
            try
            {
                var resl = db.Database.ExecuteSqlCommand(query);
                return resl.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            throw new NotImplementedException();
        }
        internal static string ThayDoiDinhLuongCT(string idma, string idh, double sl, string dvt)
        {
            string query = "UPDATE dbo.tblChiTietMon SET DinhLuong= "+sl+" ,DonViDung= N'"+dvt+"' WHERE ID_Hang='"+idh+"' AND ID_MonAn='"+idma+"'";
            try
            {
                var resl = db.Database.ExecuteSqlCommand(query);
                return resl.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static string ThemChiTietMon(string idma, string idh, double sl, string dvt)
        {
            string query = "INSERT INTO dbo.tblChiTietMon (ID_MonAn,ID_Hang,DinhLuong,DonViDung)VALUES(N'"+idma+"','"+idh+"', "+sl+", N'"+dvt+"')";
            try
            {
                var resl= db.Database.ExecuteSqlCommand(query);
                return resl.ToString();
            }
            catch(SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static string ThemMonAnTuFile(List<tblMonAn> model)
        {
            try
            {
                foreach( tblMonAn t in model)
                {
                    string query = "INSERT INTO dbo.tblMonAn (ID_MonAn,TenMon,GiaMon,MoTa,TracMon,SuDung,HinhAnh) VALUES ('"+t.ID_MonAn+"', N'"+t.TenMon+"',"+t.GiaMon+", N'"+t.MoTa+"',N'"+t.TracMon+"',1,  N'"+t.HinhAnh+"') ";
                    int reslt= db.Database.ExecuteSqlCommand(query);
                    if (reslt == 0)
                    {
                        return "0";
                    }                    
                }
                return "1";
            }catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static void UseFood(string use, string idh)
        {
            db.Database.ExecuteSqlCommand("UPDATE dbo.tblMonAn SET SuDung= "+use+" WHERE ID_MonAn='"+idh+"'");
        }
        internal static string XoaChiTietMon(string idma, string idh)
        {
            string query = "DELETE FROM dbo.tblChiTietMon WHERE ID_MonAn='"+idma+"' AND ID_Hang='"+idh+"'";
            try
            {
                var resl = db.Database.ExecuteSqlCommand(query);
                return resl.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
    }
}