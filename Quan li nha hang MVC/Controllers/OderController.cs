using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace Quan_li_nha_hang_MVC.Controllers
{
    public class OderController : Controller
    {
        // GET: Oder
        public ActionResult StartOder(string id)
        {
            CustomOderSer.XoaTatCa();
            if (id == "0")
            {
                return RedirectToAction("OderBanMoi",new {id=id});
            }
            else
            {
                return RedirectToAction("OderDatTruoc", new { id = id });
            }
        }
        public ActionResult OderDatTruoc(string id)
        {
            if (id == null)
            {
                return RedirectToAction("DanhSachBanDat", "DatBan");
            }
            else
            {
                ViewData["idban"] = id;
                return View();
            }
        }
        public ActionResult OderBanMoi(string id)
        {
            if (id == null)
            {
                return RedirectToAction("DanhSachBanDat", "DatBan");
            }
            else
            {
                ViewData["idban"] = id;
                return View();
            }
        }
        [HttpPost]
        public JsonResult ThemVaoSuatOder(string id, string ten, string anh, double gia, int sol)
        {
            CustomOderSer.ThemMon(new CustomOder(id, ten, gia, sol, anh));
            return Json(CustomOderSer.DanhSachOder());
        }
        [HttpPost]
        public JsonResult XoaMonSuatOder(string id)
        {
            CustomOderSer.XoaMon(id);
            return Json(CustomOderSer.DanhSachOder());
        }
        public JsonResult XacNhanOder(string ten, string phone, string giovao, string ngay, string sokhach, string note, string maban)
        {
            string rs = OderService.XacNhanOder(ten, phone, giovao, ngay, sokhach, note, maban);
            if (rs == "1")
            {
                return Json("Đã tạo bill thành công");
            }
            else
            {
                return Json(rs);
            }
        }
        [HttpPost]
        public JsonResult LuuMonAnMoi(string id)
        {
            OderService.ThemMonAn(id);
            using (var db= new DoAnQuanLiNHEntities())
            {
                return Json(db.ChiTietHoaDonGiMon(int.Parse(id)).ToList());
            }
        }
        [HttpPost]
        public JsonResult TenNguoiOder(string idhd)
        {
            using( var  dbs= new DoAnQuanLiNHEntities())
            {
                var ten = dbs.Database.SqlQuery<string>("SELECT TenNV FROM dbo.tblNhanVien INNER JOIN dbo.tblHDOder ON tblHDOder.ID_NV = tblNhanVien.ID_NhanVien WHERE ID_HDOder =" + idhd).FirstOrDefault();
                return Json(ten);
            }
        }
        [HttpPost]
        public JsonResult MonAnDaGoiTheoBan(string id)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var data = db.ChiTietHoaDonGiMon(int.Parse(id)).ToList();
                return Json(data);
            }
        }
        [HttpPost]
        public JsonResult DanhSachMonAn()
        {
            using(var db= new DoAnQuanLiNHEntities())
            {
                return Json(db.DsMonAnAll.ToList());
            }           
        }
        public JsonResult KiemTraMaDatBan(string ten, string phone, string ngay, string maban)
        {
            string findId = "SELECT ID_HDOder FROM dbo.tblHDOder WHERE ID_Ban='" + maban + "' AND ID_NV=1 AND TenKH=N'" + ten + "' AND SoDT = '" + phone + "' AND NgayVao='" + ngay.Replace("-", "/") + "'";
            using (var db = new DoAnQuanLiNHEntities())
            {
                int id = db.Database.SqlQuery<int>(findId).FirstOrDefault();
                if(id == 0)
                {
                    return Json("0");
                }
                else
                {
                    return Json(id);
                }
            }
        }
        [HttpPost]
        public JsonResult DanhSachBFOder(string ten, string phone, string ngay, string maban)
        {
            string findId = "SELECT ID_HDOder FROM dbo.tblHDOder WHERE ID_Ban='" + maban + "' AND ID_NV=1 AND TenKH=N'" + ten + "' AND SoDT = '" + phone + "' AND NgayVao='" + ngay.Replace("-", "/") + "'";
            using (var db = new DoAnQuanLiNHEntities())
            {
                int id = db.Database.SqlQuery<int>(findId).FirstOrDefault();
                var listds = db.Database.SqlQuery<ChiTietHoaDonOder>("SELECT ID_HDOder, ID_Buffe, TenBF, GiaBF,SoLuong,Image FROM dbo.tblChiTietOderBuffet INNER JOIN dbo.tblBuffet ON tblBuffet.ID_Buffe = tblChiTietOderBuffet.ID_Buffet AND ID_HDOder=" + id).ToList();
                return Json(listds);
            }
        }
        public JsonResult PhachThemSuat(string id)
        {
            OderService.PhachThemSuat(id);
            using (var db = new DoAnQuanLiNHEntities())
            {
                var listds = db.Database.SqlQuery<ChiTietHoaDonOder>("SELECT ID_HDOder, ID_Buffe, TenBF, GiaBF,SoLuong,Image FROM dbo.tblChiTietOderBuffet INNER JOIN dbo.tblBuffet ON tblBuffet.ID_Buffe = tblChiTietOderBuffet.ID_Buffet AND ID_HDOder=" + id).ToList();
                return Json(listds);
            }
        }
        [HttpPost]
        public JsonResult ChiTietBanOder(string idb)
        {
            if (idb != null)
            {
                int id = Int32.Parse(idb);
                using (var db = new DoAnQuanLiNHEntities())
                {
                    var listds = db.Database.SqlQuery<tblHDOder>("SELECT *FROM dbo.tblHDOder WHERE ID_HDOder=" + idb).FirstOrDefault();
                    return Json(listds);
                }
            }
            else
            {
                return Json(null);
            }
        }
        [HttpPost]
        public JsonResult ChiTietBanOderCF(string idb)
        {
            if (idb != null)
            {
                using (var db = new DoAnQuanLiNHEntities())
                {
                    string qr = "SELECT ID_HDOder,TenKH,SoDT,NgayVao,GioVao,GioRa,SoKhach,ID_NV," +
                        "tblHDOder.ID_Ban,Thue,TongTien,GhiChu,TTThanhToan FROM dbo.tblHDOder JOIN dbo.tblBanNH" +
                        " ON tblBanNH.ID_Ban = tblHDOder.ID_Ban WHERE TTThanhToan=2 AND  TinhTrang=1 AND tblHDOder.ID_Ban='" + idb + "'";
                    var listds = db.Database.SqlQuery<tblHDOder>(qr).FirstOrDefault();
                    return Json(listds);
                }
            }
            else
            {
                return Json(null);
            }
        }


        public JsonResult ThanhToanBill(string mahd, string tongtien, string hinhtttoan,string giora, string madg, string tiencuoi, string phidv, string gc)
        {
            string rs = OderService.ThanhToanBill(mahd, tongtien, hinhtttoan,giora, madg, tiencuoi, phidv, gc);
            if (rs == "1")
            {
                return Json("Thanh toán thành công!");
            }
            else
            {
                return Json(rs);
            }
        }
        public ActionResult ThanhToanHD(string idhd)
        {
            if (idhd == null)
            {
                return RedirectToAction("DanhSachBanDat", "DatBan");
            }
            else
            {
                ViewData["id"] = idhd;
                return View();
            }
        }

        public JsonResult CacBanChoTT()
        {
            using(var db= new DoAnQuanLiNHEntities())
            {
                var dbs = db.BanChoThanhToan.ToList();
                return Json(dbs);
            }
        }
        [HttpPost]
        public JsonResult ThongTinHoaDon(string mahd)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                string qr = "SELECT ID_HDOder,TenKH,SoDT,NgayVao,GioVao,GioRa,SoKhach,ID_NV," +
                    "tblHDOder.ID_Ban,Thue,TongTien,GhiChu,TTThanhToan FROM dbo.tblHDOder JOIN dbo.tblBanNH" +
                    " ON tblBanNH.ID_Ban = tblHDOder.ID_Ban WHERE TinhTrang=1 AND tblHDOder.ID_HDOder=" + mahd;
                var listds = db.Database.SqlQuery<tblHDOder>(qr).FirstOrDefault();
                return Json(listds);
            }
        }

        public JsonResult ThongTinGiaoDich(string mahd)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                string qr = "SELECT ID_HDOder,TenKH,SoDT,NgayVao,GioVao,GioRa,SoKhach,ID_NV," +
                    "tblHDOder.ID_Ban,Thue,TongTien,GhiChu,TTThanhToan FROM dbo.tblHDOder JOIN dbo.tblBanNH" +
                    " ON tblBanNH.ID_Ban = tblHDOder.ID_Ban WHERE tblHDOder.ID_HDOder=" + mahd;
                var listds = db.Database.SqlQuery<tblHDOder>(qr).FirstOrDefault();
                return Json(listds);
            }
        }
    }
}