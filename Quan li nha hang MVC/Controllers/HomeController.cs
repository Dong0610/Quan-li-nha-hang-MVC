using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["sokhach"] = (int)LoadData.Instance.ExcuteScalar
                ("SELECT CASE WHEN SUM(SoKhach) IS NULL THEN 0 ELSE SUM(SoKhach) END AS SK FROM dbo.tblHDOder WHERE  NgayVao LIKE FORMAT(CONVERT(datetime, GETDATE(), 100), 'dd/MM/yyyy')\r\n");
            ViewData["tongnv"] = (int)LoadData.Instance.ExcuteScalar("SELECT CASE WHEN COUNT(ID_NhanVien) IS NULL THEN 0 ELSE COUNT(ID_NhanVien) END FROM dbo.tblNhanVien");
            ViewData["tongmh"] = (int)LoadData.Instance.ExcuteScalar("SELECT CASE WHEN COUNT(*) IS NULL THEN 0 ELSE COUNT(*) END FROM dbo.tblMatHang");
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult DangXuat()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("DangNhapAD", "Account");
        }


        [HttpPost]
        public JsonResult SoSuatBuffet()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var listbf = db.DsBuffet.ToList();
                var ngayhn = TonKhoService.NgayHomNay();
                List<BieuDoBFHomNay> listitem = new List<BieuDoBFHomNay>();
                var ds = db.SoluongBuffetToDay(ngayhn).ToList();
                foreach (var item in listbf)
                {
                    var sanpham = ds.Find(p => p.TenBF.Equals(item.TenBF));
                    if (sanpham != null)
                    {
                        listitem.Add(new BieuDoBFHomNay(item.TenBF, (int)sanpham.SoLuong));
                    }
                    else
                    {
                        listitem.Add(new BieuDoBFHomNay(item.TenBF, 0));
                    }
                }
                return Json(listitem);
            }
        }

        [HttpPost]
        public JsonResult BieuDoThanhPhan()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                List<BieuDoBFHomNay> listbd = new List<BieuDoBFHomNay>();
                foreach (var item in db.ThanhPhanHang.ToList())
                {
                    listbd.Add(new BieuDoBFHomNay(item.TenLoai, (int)item.SoLuong));
                }
                return Json(listbd);
            }
        }

        [HttpPost]
        public JsonResult HoaDonChoThanhT()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var ds = db.DanhSachHDCTT.ToList();
                return Json(ds);
            }
        }

        public JsonResult PhanTramDoanhThu()
        {
            double tongdt = (double)LoadData.Instance.ExcuteScalar("SELECT SUM(TienCuoi) AS TongTien FROM dbo.tblGiaoDich");
            double daonhthu = (double)LoadData.Instance.ExcuteScalar("SELECT CASE WHEN  SUM(TienCuoi)  IS NULL THEN 0 ELSE SUM(TienCuoi)" +
                " END  AS TongTien FROM dbo.tblGiaoDich  WHERE FORMAT(CONVERT(datetime, ThoiGianGD, 100), 'dd/MM/yyyy') LIKE FORMAT(CONVERT(datetime, GETDATE(), 100), 'dd/MM/yyyy')\r\n");
            List<BieuDoBFHomNay> listtd = new List<BieuDoBFHomNay>();

            listtd.Add(new BieuDoBFHomNay("Hôm nay", (int)(daonhthu)));
            listtd.Add(new BieuDoBFHomNay("Tổng doanh thu", (int)(tongdt - daonhthu)));
            return Json(listtd);
        }


        public JsonResult KiemTraQuyen(string idquyen)
        {
            ChuNhaHang cnh = Session["userlogin"] as ChuNhaHang;
            int rs =(int) LoadData.Instance.ExcuteScalar("EXEC dbo.KiemTraPhanQuyen @manv = "+cnh.Id_NV+", @maquyen = '"+idquyen+"'");
            return Json(rs);
        }

        public JsonResult DoanhThuTheoNgay()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {

                DataTable datatb = LoadData.Instance.ExcuteQuery("EXEC dbo.DoanhThuThangNay @thang = '" + DateTime.Now.Month.ToString() + "',@nam = '" + DateTime.Now.Year.ToString() + "'");
                List<BieuDoBFHomNay> listtd = new List<BieuDoBFHomNay>();
                foreach (DataRow row in datatb.Rows)
                {
                    listtd.Add(new BieuDoBFHomNay(row["Ngay"].ToString(), (int)(double.Parse(row["DoanhThu"].ToString()))));
                }
                return Json(listtd);
            }

        }
    }
}