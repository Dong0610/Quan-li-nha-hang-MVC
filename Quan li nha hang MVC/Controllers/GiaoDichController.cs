using Microsoft.Azure.Management.Batch.Fluent;
using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Syncfusion.XlsIO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static System.Net.Mime.MediaTypeNames;
using static Google.Cloud.Firestore.V1.StructuredAggregationQuery.Types.Aggregation.Types;
using Bytescout.Spreadsheet;
using Bytescout.Spreadsheet.Constants;
using System.Drawing;
using IApplication = Syncfusion.XlsIO.IApplication;
using System.Diagnostics;
using Quan_li_nha_hang_MVC.Service;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class GiaoDichController : Controller
    {
        // GET: GiaoDich
        public ActionResult QuanLiGiaoDich()
        {
            return View();
        }

        public JsonResult DanhSachGiaoDich()
        {
            using (var ds = new DoAnQuanLiNHEntities())
            {
                return Json(ds.DanhSachGiaoDich.ToList());
            }
        }



        public JsonResult GiaoDichTheoMa(int id)
        {
            using (var ds = new DoAnQuanLiNHEntities())
            {
                return Json(ds.DanhSachGiaoDich.Where(p => p.ID_HD_Oder == id).ToList());
            }
        }
        public ActionResult ChiTietGiaoDich(string idgd)
        {
            if (idgd == null)
            {
                return RedirectToAction("DanhSachBanDat", "DatBan");
            }
            else
            {
                ViewData["id"] = idgd;
                return View();
            }
        }
        [HttpPost]
        public JsonResult ProMixList()
        {
            var list = ProduceMixService.GetMixList().ToList() ;
            return Json(list);
        }
        [HttpPost]
        public JsonResult ProMixListDay(string ngay)
        {
            int idpromix = (int)LoadData.Instance.ExcuteScalar("SELECT CASE WHEN COALESCE((SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon='"+ngay+"'),0)" +
                " LIKE 0 THEN 0 ELSE (SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon='"+ngay+"') END ;");
            if(idpromix == 0)
            {
                return Json((List<ProductMix>)ProduceMixService.DanhSachMixTheoNgay(ngay));
            }
            else
            {
                return Json((List<tblCT_ProductMix>)ProduceMixService.DanhSachMixTheoNgay(ngay));
            }
           
        }

        public ActionResult ProductMixView()
        {
            return View(ProduceMixService.GetMixList());
        }
        public JsonResult LuuLaiMix()
        {
            string ketqua = ProduceMixService.LuuLaiMix();
            if (ketqua == "1")
            {
                return Json("Đã lưu thành công");
            }
            else
            {
                return Json(ketqua);
            }
        }
    }
}