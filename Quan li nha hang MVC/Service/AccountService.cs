using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Quan_li_nha_hang_MVC.Service
{
    public class AccountService
    {
        internal static int CheckPhone(string sodt)
        {
            string qr = "SELECT COUNT(*) FROM dbo.ChuNhaHang WHERE SDT='" + sodt + "'";
            return (int)LoadData.Instance.ExcuteScalar(qr);
        }

        public static int DangKiNH(string tennh, string tenql, string email, string phone, string pass)
        {
            string quyery = String.Format("EXEC dbo.DangKiNH @TenCH = N'" + tennh + "' ,@SoDT = '" + phone + "'," +
                "@TenQL = N'" + tenql + "',@Email = '" + email + "',@Pass = N'" + pass + "'");

            int manv = (int)LoadData.Instance.ExcuteScalar("SELECT TOP 1 Id_NV FROM dbo.ChuNhaHang WHERE SDT='" + phone + "' AND PassWrord='" + pass + "'");

            using (var db = new DoAnQuanLiNHEntities())
            {
                foreach (var dsq in db.tblPhanQuyen.ToList())
                {
                    LoadData.Instance.ExcuteNoneQuery("INSERT INTO dbo.tblQuyenNV (ID_NhanVien,ID_PhanQuyen,PQ ) VALUES ( " + manv + ", '" + dsq.ID_Quyen + "'  , '" + TonKhoService.NgayHomNay() + "' )");
                }
            }

            return (int)LoadData.Instance.ExcuteScalar(quyery);
        }



        internal static ChuNhaHang DangNhapAD(string sodt, string pass)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                ChuNhaHang cnh = db.ChuNhaHang.Where(p => p.SDT == sodt && p.PassWrord == pass).FirstOrDefault();
                if (cnh == null)
                {
                    return null;
                }
                else
                {
                    return cnh;
                }
            }
        }

        internal static ChuNhaHang DangNhapUser(string sdt, string pass, string tentk)
        {
            string qr = "EXEC dbo.DangNhapNhanVien @sodt = '" + sdt + "',   @tendn = N'" + tentk + "',   @pass = N'" + pass + "'";
            int matk = (int)LoadData.Instance.ExcuteScalar(qr);
            ChuNhaHang cnh = new ChuNhaHang();
            if (matk == 0)
            {
                cnh = null;
            }
            else
            {
                DataTable dts = LoadData.Instance.ExcuteQuery("SELECT ID_Acc,tblTaiKhoan.ID_NV,TenDn,dbo.tblTaiKhoan.Email,SoDT,tblTaiKhoan.PassWrord,ID_Assitant AS MaCH,TenQL,TenCH FROM dbo.tblTaiKhoan INNER JOIN dbo.ChuNhaHang ON ID_Assitant=MaNH WHERE ID_Acc=" + matk);
                foreach (DataRow dr in dts.Rows)
                {
                    var s = (int)dr["ID_Acc"];
                    Console.WriteLine(s);
                    cnh = new ChuNhaHang((int)dr["ID_Acc"], (string)dr["TenCH"], (string)dr["TenDn"], (string)dr["SoDT"], (string)dr["Email"], (string)dr["PassWrord"], (int)dr["ID_NV"]);
                }
            }
            return cnh;
        }

        internal static string ThemTKNhanVien(string id, string tendn, string pass, string email, string manh, string sdt)
        {
            try
            {
                using (var db = new DoAnQuanLiNHEntities())
                {
                    string sql = "INSERT INTO dbo.tblTaiKhoan(ID_NV,TenDn,Email, SoDT,PassWrord,Type,MaNH)VALUES( " + id + ", '" + tendn + "', '" + email + "','" + sdt + "', N'" + pass + "', 1," + manh + " )";

                    int rs = db.Database.ExecuteSqlCommand(sql);
                    return rs.ToString();
                }
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
    }
}