using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.Expressions;
using System.Xml.Linq;
namespace Quan_li_nha_hang_MVC.Controllers
{
    public class BuffetController : Controller
    {
        // GET: Buffet
         DoAnQuanLiNHEntities db= new DoAnQuanLiNHEntities();
        public ActionResult DanhSachBuffet()
        {
            return View();
        }
        [HttpPost]
        public JsonResult DanhSachBuffetList()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                return Json(db.DsBuffet.ToList());
            }               
        }
        [HttpPost]
        public JsonResult DetailBuffetView(string idbf)
        {
            var result = BuffetService.CTBffet(idbf);
            return Json(result);
        }
        [HttpPost]
        public JsonResult LuuDSBuffet(List<tblBuffet> model)
        {
            var result = BuffetService.ThemMonAnTuFile(model);
            if (result == "1")
            {
                return Json("Thêm thành công");
            }
            else
            {
                return Json(result);
            }
        }
        public JsonResult UpdateDeatailBF(string id, string name,string gia, string thue, string anh)
        {
           string rs= BuffetService.UpdateVal(id,name,gia,thue,anh);
            if (rs == "1")
            {
                return Json("Sửa thành công");
            }
            else
            {
                return Json(rs);
            }
        }
        [HttpPost]
        public JsonResult XoaCtTietMon(string idbf,string idma)
        {
            db.Database.ExecuteSqlCommand("DELETE FROM dbo.tblChiTietBuffe WHERE ID_Buffe='"+idbf+"' AND ID_Mon='"+idma+"'");
            using (var dbs= new DoAnQuanLiNHEntities())
            {
                var rs = db.ChiTietBuffet(idbf).ToList();
                return Json(rs);
            }
        }
        [HttpPost]
        public JsonResult ThemMonCtBf(string idbf, string idm,double sl)
        {
            db.Database.ExecuteSqlCommand("INSERT INTO dbo.tblChiTietBuffe(ID_Buffe,ID_Mon,SoLuong)VALUES('"+idbf+"', N'"+idm+"',"+sl+")");
            using (var dbs = new DoAnQuanLiNHEntities())
            {
                var rs = db.ChiTietBuffet(idbf).ToList();
                return Json(rs);
            }
        }
        public JsonResult ChiTietMon(string id)
        {
            var rs = db.ChiTietBuffet(id).ToList();
            return Json(rs);
        }
        public JsonResult SuDungMonAn(string use, string idh)
        {
            BuffetService.UseBuffet(use, idh);
            return Json(db.DsBuffet.ToList());
        }
        public JsonResult TaoMoiSuatBuffet(string name , string ngay ,string gia ,string thue ,string anh ,string dung)
        {
            var result = BuffetService.TaoMoiSuatBF(name,ngay,gia,thue,anh,dung);
            if (result == "1")
            {
                return Json("Thêm thành công");
            }
            else
            {
                return Json(result);
            }
        }
    }
}