using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace Quan_li_nha_hang_MVC.Service
{
    public static class DatBanService
    {
        private static DoAnQuanLiNHEntities db= new DoAnQuanLiNHEntities();
        private static string FomatDate(DateTime? date)
        {
            return (date?.Year + "-" + date?.Month + "-" + date?.Date).ToString().Substring(0,9);
        }
        public static string DatBanMoi(tblDatBan tb)
        {
            try
            {
                string query = "INSERT INTO dbo.tblDatBan (TenKH,SoDT,NgayDat,GioDat,SoKhach,ID_BanDat,TinhTrang,HuyBan,Note )" +
                    " VALUES ( N'"+tb.TenKH+"',N'"+tb.SoDT+"','"+tb.NgayDat+"','"+tb.GioDat+"',"+tb.SoKhach+",'"+tb.ID_BanDat+"' , 0,  0,N'"+tb.Note+"')";
                int result= db.Database.ExecuteSqlCommand(query);
                if (result == 1)
                {
                    string qrud = "UPDATE dbo.tblBanNH SET TinhTrang =2 WHERE ID_Ban= '" + tb.ID_BanDat + "'";
                   int update= db.Database.ExecuteSqlCommand(qrud);
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            catch(SqlException ex)
            {
                return ex.Message;
            }
        }
        internal static object ChiTietBan( int idban)
        {
            using(var dbs= new DoAnQuanLiNHEntities())
            {
                var rs = dbs.ChitietBanDat(idban).ToList();
                return rs;
            }
        }
        internal static List<DsBanNH> SoKhachNhoHon()
        {
            using(var db= new DoAnQuanLiNHEntities())
            {
                 return db.DsBanNH.Where(p => p.TinhTrang==0).ToList();
            }
        }
        internal static string DoiBanMoi(string idmoi,string idcu,string idband)
        {
            try
            {
                var update = db.Database.ExecuteSqlCommand("UPDATE dbo.tblDatBan SET ID_BanDat='"+idmoi+"' WHERE ID_BanDat='"+idcu+"' AND ID_Ban="+idband+"");
                if(update == 1)
                {
                    var r1 = db.Database.ExecuteSqlCommand("UPDATE dbo.tblBanNH SET TinhTrang=0 WHERE ID_Ban='"+idcu+"'");
                    var r2 = db.Database.ExecuteSqlCommand("UPDATE dbo.tblBanNH SET TinhTrang=2 WHERE ID_Ban='" + idmoi + "'");
                    return "Đổi bàn thành công";
                }
                else
                {
                    return "Xảy ra lỗi Thử lại sau";
                }
            }
            catch(SqlException ex)
            {
                return ex.Message;
            }
        }
    }
}