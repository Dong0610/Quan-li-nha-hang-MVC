using Quan_li_nha_hang_MVC.Models;
using System.Web.Mvc;
using System.Xml.Linq;
using FirebaseAdmin.Auth;
using FireSharp;
using FireSharp.Interfaces;
using FireSharp.Config;
using FireSharp.Response;
using System;
using Quan_li_nha_hang_MVC.Service;
using Microsoft.Ajax.Utilities;
using System.Linq;
using System.Security.Cryptography;
using System.Collections.Generic;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class KiemKeController : Controller
    {
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "r5jqC8HcKWQpWvW9awE2JyBaZpKz7IO1GClNTKeU",
            BasePath = "https://rmsystemproject-default-rtdb.asia-southeast1.firebasedatabase.app/"
        };
      //  IFirebaseClient client;

        public ActionResult TonKhoCuoiNgay()
        {
            TonKhoSER.XoaTatCa();
            
            return View();
        }

        public JsonResult KiemKeTheoNgay(string ngaykk)
        {
            return Json(TonKhoService.KiemKeTheoNgay(ngaykk).ToList());
        }


        [HttpPost]
        public JsonResult DanhSachTonHN()
        {
            return Json(TonKhoService.ListTonKho().ToList());
        }
        [HttpPost]
        public JsonResult ThemTonHang( string id,string name,string dvt,int sol,string note,string ncc,string kv)
        {
            //try
            //{
            //    client = new FireSharp.FirebaseClient(config);
               
            //    PushResponse response = client.Push("Students/", tk);
            //    SetResponse setResponse = client.Set("Students/" + tk.IdMH, tk);

            //    if (setResponse.StatusCode == System.Net.HttpStatusCode.OK)
            //    {
            //        ModelState.AddModelError(string.Empty, "Added Succesfully");
            //    }
            //    else
            //    {
            //        ModelState.AddModelError(string.Empty, "Something went wrong!!");
            //    }
            //}
            //catch (Exception ex)
            //{

            //    ModelState.AddModelError(string.Empty, ex.Message);
            //}
            TonKhoSER.ThemMon(new TonKho(id, name, dvt, ncc, sol, note, kv));
            var data = TonKhoService.ListTonKho();            
            return Json(data);
        }


        [HttpPost]
        public JsonResult LuuSuaSoLuong(string id,double slc,double slnew ,string gc  )
        {
            string result= TonKhoService.SuaDSTonKho(id,slc,slnew, gc);
            return Json(result);
        }

        [HttpPost]
        public JsonResult XoaHangTT(string id,double sol)
        {
            TonKhoService.XoaTonHang(id,sol);
            return Json(id);
        }

        [HttpPost]
        public JsonResult LuuDSTonKho()
        {
            string result = TonKhoService.TaoMoiHoaDon();
            if(result == "1")
            {
                return Json("Đã lưu kiểm kê thành công");
            }
            else
            {
                return Json(result);
            }
           
        }

        public ActionResult DanhSachTonKho()
        {

            return View();
        }
    }
}