using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace Quan_li_nha_hang_MVC.Service
{
    public class BuffetService
    {
        private static DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        internal static object CTBffet(string idbf)
        {
            return db.DetailViewBf(idbf).ToList();
        }
        internal static string TaoMoiSuatBF(string name, string ngay, string gia, string thue, string anh, string dung)
        {
            var id = db.Database.SqlQuery<int>("SELECT MAX(ID_Buffe)+1 AS NewIDBF FROM dbo.tblBuffet").FirstOrDefault();
            try
            {   string query = "INSERT INTO dbo.tblBuffet " +
                "(ID_Buffe,TenBF,GiaBF,NgayTao,Thue,SuDung,Image)" +
                "VALUES(   '" + id + "', N'" + name + "', " + gia + ", N'" + ngay + "', " + thue + ",N'" + dung + "', N'" + anh + "')";
                int result = db.Database.ExecuteSqlCommand(query);
                if (result == 1)
                {
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static string ThemMonAnTuFile(List<tblBuffet> model)
        {
            try
            {
                foreach (tblBuffet t in model)
                {
                    string query = "INSERT INTO dbo.tblBuffet(ID_Buffe,TenBF,GiaBF,NgayTao,Thue,SuDung,Image)" +
                        "VALUES('" + t.ID_Buffe + "',N'" + t.TenBF + "', N'" + t.GiaBF + "', N'" + t.NgayTao.Substring(0, 10) + "','" + t.Thue + "',N'" + t.SuDung + "', N'" + t.Image + "')";
                    int reslt = db.Database.ExecuteSqlCommand(query);
                    if (reslt == 0)
                    {
                        return "0";
                    }
                }
                return "1";
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static string UpdateVal(string id, string name, string gia, string thue, string anh)
        {
            try
            {   
                string query = "UPDATE dbo.tblBuffet SET TenBF =N'"+name+"',GiaBF="+gia+", Thue="+thue+" ,Image='"+anh+"' WHERE ID_Buffe='"+id+"'";
                    int result = db.Database.ExecuteSqlCommand(query);
                if (result == 1)
                {
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static void UseBuffet(string use, string idh)
        {
            var query = "UPDATE dbo.tblBuffet SET SuDung= "+use+" WHERE ID_Buffe='"+idh+"'";
            var rs=  db.Database.ExecuteSqlCommand(query);
        }
    }
}