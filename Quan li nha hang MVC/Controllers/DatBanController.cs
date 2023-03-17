using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace Quan_li_nha_hang_MVC.Controllers
{
    public class DatBanController : Controller
    {
        DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        public ActionResult DanhSachBanDat()
        {
            ViewData["dsloaiban"]= db.tblLoaiBan.ToList();
            return View();
        }
        [HttpPost]
        public JsonResult ListBanRS()
        {
            return Json(db.DsBanNH.ToList());
        }
        public JsonResult TimKiemMaBan(string idbd)
        {
            using(var dbs= new DoAnQuanLiNHEntities())
            {
                var idb = dbs.Database.SqlQuery<int>("SELECT tblDatBan.ID_Ban FROM dbo.tblDatBan INNER JOIN dbo.tblBanNH ON tblBanNH.ID_Ban = tblDatBan.ID_BanDat WHERE tblDatBan.TinhTrang =0 AND ID_BanDat='"+idbd+"'").FirstOrDefault();
                return Json(idb);
            }
        }
        public JsonResult TimKiemMaHD(string idbd)
        {
            string query = "SELECT ID_HDOder FROM dbo.tblHDOder INNER JOIN dbo.tblBanNH ON tblBanNH.ID_Ban = tblHDOder.ID_Ban WHERE tblBanNH.ID_Ban='"+idbd+ "' AND TTThanhToan=2";
            using (var dbs = new DoAnQuanLiNHEntities())
            {
                var idbs = dbs.Database.SqlQuery<int>(query).FirstOrDefault();
                return Json(idbs);
            }
        }
        public JsonResult DatBanMoi(tblDatBan model)
        {
            string result= DatBanService.DatBanMoi(model);
            return Json(result);
        }
        [HttpPost]
        public JsonResult ChiTietBan(int idb)
        {
            var obj = DatBanService.ChiTietBan(idb);
            return Json(obj);
        }
        public JsonResult SoKhachNhoHon()
        {
            var obj = DatBanService.SoKhachNhoHon();
            return Json(obj);
        }
        [HttpPost]
        public JsonResult DoiBanMoi(string idmoi,string idcu,string idbd)
        {
            return Json(DatBanService.DoiBanMoi(idmoi, idcu, idbd));
        }
        public JsonResult ThongTinCTBan(string idb)
        {
            using(var db= new DoAnQuanLiNHEntities())
            {
                tblBanNH tbl = db.tblBanNH.SqlQuery("SELECT*FROM dbo.tblBanNH WHERE ID_Ban='"+idb+"'").FirstOrDefault(); ;
                return Json("Mã bàn: "+tbl.ID_Ban + "- Bàn: " + tbl.TenBan + "- Khu:" + tbl.KhuVuc);
            }
        }
    }
}