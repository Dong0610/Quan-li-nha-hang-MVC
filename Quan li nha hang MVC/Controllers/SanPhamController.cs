using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using OfficeOpenXml;
using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.Remoting.Lifetime;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
namespace Quan_li_nha_hang_MVC.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        public ActionResult DanhMucSanPham()
        {
            ViewData["dsloaihang"] = db.tblLoaiHang.ToList();
            ViewData["dsnhacc"] = db.tblNhaCC.ToList();
            ViewData["dssanpham"] = SanPhamService.ListMatHang();
            return View();
        }
        [HttpPost]
        public JsonResult GetListAll()
        {
            return Json(SanPhamService.ListMatHang());
        }
        List<tblMatHang> tbl = new List<tblMatHang>();
        [HttpPost]
        public JsonResult LuuSanPhamMoi(tblMatHang model)
        {
            try
            {
                string query = "INSERT INTO dbo.tblMatHang(ID_Hang,TenHang,MoTa,SoLuong,DonViTon,MucGia,HanSudung,ID_LoaiH,ID_NCC,SuDung)" +
                    "VALUES(   '" + model.ID_Hang + "',N'" + model.TenHang + "', N' " + model.MoTa + "', " + model.SoLuong + ",N'" + model.DonViTon + "', " + model.MucGia + ",N'" + model.HanSudung + "', '" + model.ID_LoaiH + "',  '" + model.ID_NCC + "', " + 1 + " )";
                using (var dp = new DoAnQuanLiNHEntities())
                {
                    db.Database.ExecuteSqlCommand(query);
                    var sp = SanPhamService.ListMatHang();
                    return Json(sp);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Json(ex.Message);
            }
        }
        [HttpPost]
        public JsonResult ChiTetDSThucPham(string idma)
        {
            var result = (from ct in db.tblChiTietMon
                          join hh in db.tblMatHang on ct.ID_Hang
                          equals hh.ID_Hang
                          where ct.ID_MonAn == idma
                          select new
                          {
                              ct.ID_Hang,
                              hh.TenHang,
                              ct.DinhLuong,
                              ct.DonViDung,
                          }).ToList();
            return Json(result);
        }
        [HttpPost]
        public JsonResult SuDungMonAn(string use, string idh)
        {
            SanPhamService.UseFood(use, idh);
            return Json(db.DsMonAnAll.ToList());
        }
        [HttpPost]
        public JsonResult XoaSanPham(string value)
        {
            var sanpham = db.tblMatHang.Where(p => p.ID_Hang == value).ToList();
            tblMatHang sp = new tblMatHang();
            foreach (tblMatHang mh in sanpham)
            {
                if (mh.ID_Hang == value)
                {
                    sp = mh;
                }
            }
            sp.SuDung = 0;
            db.Entry(sp).State = EntityState.Modified;
            db.SaveChanges();
            return Json(SanPhamService.ListMatHang());
        }
        [HttpPost]
        public JsonResult Save_Food_Change(string id, string ten, string anh, string mota, string trac, string gia)
        {
            string result = SanPhamService.Save_Food_ChangeSRVC(id, ten, anh, gia, mota, trac).ToString();
            return Json(result);
        }
        [HttpPost]
        public JsonResult SuaTTSanPham(tblMatHang model)
        {
            var sanpham = db.tblMatHang.Where(p => p.ID_Hang == model.ID_Hang).ToList();
            tblMatHang sp = new tblMatHang();
            foreach (tblMatHang mh in sanpham)
            {
                if (mh.ID_Hang == model.ID_Hang)
                {
                    sp = mh;
                }
            }
            sp.ID_Hang = model.ID_Hang;
            sp.TenHang = model.TenHang;
            sp.MucGia = model.MucGia;
            sp.MoTa = model.MoTa;
            sp.DonViTon = model.DonViTon;
            sp.HanSudung = model.HanSudung;
            sp.SoLuong = 0;
            sp.SuDung = 1;
            db.Entry(sp).State = EntityState.Modified;
            db.SaveChanges();
            var list = SanPhamService.ListMatHang();
            return Json(list);
        }
        public ActionResult DanhSachMonAn()
        {
            return View();
        }
        // mon an
        [HttpPost]
        public JsonResult Upload(List<tblMonAn> model)
        {
            string result = SanPhamService.ThemMonAnTuFile(model);
            if (result == "1")
            {
                return Json("Thêm thành công");
            }
            else
            {
                return Json(result);
            }
        }
        [HttpPost]
        public JsonResult DanhSachMonAnList()
        {
            return Json(db.DsMonAnAll.ToList());
        }
        [HttpPost]
        public JsonResult ThemChiTietMonAn(string idma, string idh, double sl, string dvt)
        {
            string retun = SanPhamService.ThemChiTietMon(idma, idh, sl, dvt);
            if (retun == "1")
            {
                return Json("Thêm thành công ");
            }
            else
            {
                return Json(retun);
            }
        }
        [HttpPost]
        public JsonResult ThayDoiDinhLuongCT(string idma, string idh, double sl, string dvt)
        {
            string retun = SanPhamService.ThayDoiDinhLuongCT(idma, idh, sl, dvt);
            if (retun == "1")
            {
                return Json("Thay đổi thành công ");
            }
            else
            {
                return Json(retun);
            }
        }
        [HttpPost]
        public JsonResult XoaCTDSThucPham(string idma, string idh)
        {
            string retun = SanPhamService.XoaChiTietMon(idma, idh);
            if (retun == "1")
            {
                return Json("Xóa thành công ");
            }
            else
            {
                return Json(retun);
            }
        }
    }
}