using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Quan_li_nha_hang_MVC.Service
{
    public static class NhanVienService
    {
        private static DoAnQuanLiNHEntities db= new DoAnQuanLiNHEntities();

        internal static string InsertTTNV(string name, string birth, string gt,string cc, string dt, string qq, string sk, string nl, string cv)
        {
            try
            {
                string query = "INSERT INTO dbo.tblNhanVien (TenNV,NgaySinh,GioiTinh,IDCanCuoc,SoDT,TinhTrangSK," +
                    "NgayVaoLam,ID_ChucVu,LamViec,QueQuan) " +
                    "VALUES (   N'"+name+"','"+birth+"',"+gt+", '"+cc+"','"+dt+"',N'"+sk+"','"+nl+"', '"+cv+"',  DEFAULT, N'"+qq+"')";
                int reslt = db.Database.ExecuteSqlCommand(query);
                return reslt.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }

        internal static string UpdateTTNV(string id, string name, string birth, string cc, string dt, string qq, string sk, string nl, string cv)
        {
            try
            {
                string query = "UPDATE dbo.tblNhanVien SET TenNV=N'"+name+"',NgaySinh='"+birth+"',IDCanCuoc='"+cc+"',SoDT='"+dt+"',QueQuan=N'"+qq+"',NgayVaoLam='"+nl+"',ID_ChucVu='"+cv+"',TinhTrangSK=N'"+sk+"' WHERE ID_NhanVien="+id;
                int reslt = db.Database.ExecuteSqlCommand(query);
                return reslt.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }

        internal static string XoaNhanVien(string manv)
        {
            try
            {
                string query = "UPDATE dbo.tblNhanVien SET LamViec=0 WHERE ID_NhanVien="+manv;
                int reslt = db.Database.ExecuteSqlCommand(query);
                return reslt.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
    }
}