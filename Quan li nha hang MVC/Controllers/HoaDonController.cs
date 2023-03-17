using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using ZXing;
using ZXing.Common;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class HoaDonController : Controller
    {
        // GET: HoaDon
        public ActionResult TaoHoaDon()
        {
            HoaDonService.HuyTaoHD();
            return View();
        }
        public ActionResult HoaDonThanhToan()
        {
            using(var db= new DoAnQuanLiNHEntities())
            {
                ViewData["ban"]=db.tblBanNH.ToList();

                return View(db.tblHDOder.ToList());
            }
            
        }
       // SELECT* FROM dbo.DanhSachHD
         [HttpPost]
         public JsonResult HoaDonOderBill()
         {
            using (var db = new DoAnQuanLiNHEntities())
            {
                return Json(db.DanhSachHD.ToList());
            }
         }

       

        [HttpPost]
        public JsonResult GetListAll()
        {
            return Json(SanPhamService.ListMatHang());
        }
        public ActionResult HuyHoaDon()
        {
            HoaDonService.HuyTaoHD();
            return RedirectToAction("TaoHoaDon");
        }
        [HttpPost]
        public JsonResult GetListSua()
        {
            return Json(HoaDonService.AllPrAdd());
        }
        [HttpPost]
        public JsonResult AddData(tblMatHang model)
        {
            HoaDonService.ThemSp(model);
            return Json(HoaDonService.AllPrAdd());
        }
        [HttpPost]
        public JsonResult XoaSanPham(string id)
        {
            HoaDonService.XoaMatHang(id);
            return Json(HoaDonService.AllPrAdd());
        }
        [HttpPost]
        public JsonResult SuaData(string id, int sol)
        {
            return Json(HoaDonService.SuaSlMH(id, sol));
        }
        [HttpPost]
        public JsonResult LuuLaiHoaDon(tblHDNhapHang model)
        {
            if (HoaDonService.LuuHoaDonDT(model) > 0)
            {
                return Json("Success");
            }
            else
            {
                return Json("Error");
            }
        }
        public ActionResult DanhSachHoaDon()
        {
            return View();
        }
        [HttpPost]
        public JsonResult ListHD()
        {
            return Json(HoaDonService.ListHoaDon());
        }
        [HttpPost]
        public JsonResult ChiTietHD(string idhd)
        {
            return Json(HoaDonService.ChitetHD(idhd));
        }
        [HttpPost]
        public JsonResult DuyetHangTheoSP(string idhd, string idh,double sl,double tientt)
        {
            string value = HoaDonService.DuyetHSanPham(idhd, idh, sl);
            if (value =="1")
            {
                return Json(HoaDonService.ChitetHD(idhd));
            }
            else
            {
                return Json("Error:"+value);
            }
        }

        public JsonResult SoHangChuaDuyet(string idhd)
        {
            using (var db= new DoAnQuanLiNHEntities())
            {
                int sohang=db.Database.SqlQuery<int>("SELECT COUNT(*) FROM dbo.tblChiTietHDNH WHERE DuyetH=0 AND ID_HDNH='"+idhd+"'").FirstOrDefault();
                return Json(sohang);
            }
        }
        [HttpPost]
        public JsonResult XoaHoaDon(string idhd)
        {
            string message= HoaDonService.XoaHoaDon(idhd);
            if (message == "1")
            {
                return Json(HoaDonService.ListHoaDon());
            }
            else
            {
                return Json("Error: "+message);
            }
        }
        [HttpPost]
        public JsonResult DuyetTatCaSP(string idhd)
        {
            if (HoaDonService.DuyetTatCaSP(idhd))
            {
                return Json("Đã xác hóa đơn thành công");
            }
            else
            {
                return Json("Đã xảy ra lỗi. Thử lại sau");
            }
        }
        public ActionResult DuyetHoaDon(string idhd)
        {
            DanhSachHoaDon ds = HoaDonService.HoaDonTheoMa(idhd) as DanhSachHoaDon;
            if (ds == null)
            {
               return RedirectToAction("DanhSachHoaDon");
            }
            else
            {
                ViewData["hoadon"] = ds;
                return View();
            }
        }
    }
}