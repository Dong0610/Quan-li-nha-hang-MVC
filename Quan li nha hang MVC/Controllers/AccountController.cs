using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult DangKiChu()
        {
            return View();
        }

        [HttpPost]
        public JsonResult XacNhanDangKi(string tenql, string tennh, string sodt, string email, string pass)
        {
            var kqdk = AccountService.DangKiNH(tennh, tenql, email, sodt, pass);
            if (kqdk== 1)
            {
                ChuNhaHang chunhah =  AccountService.DangNhapAD(sodt, pass);
                if (chunhah == null)
                {
                    return Json("Số điện thoại này đã đăng kí");
                }
                else
                {
                    Session["userlogin"] = chunhah;
                    return Json("1");
                }
            }
            else
            {
                return Json("Số điện thoại này đã đăng kí");
            }
        }
       

        [HttpPost]
        public ActionResult DangNhapByAD(string sdt, string pass)
        {
            var cnh = AccountService.DangNhapAD(sdt, pass);
            if (cnh!=null)
            {
                Session["userlogin"] = cnh;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("DangKiChu");
            }
        }
        [HttpPost]
        public ActionResult DangNhapByUser(string sdt, string pass, string tentk)
        {
            ChuNhaHang cnh = (ChuNhaHang)AccountService.DangNhapUser(sdt, pass, tentk);
            if (cnh!=null)
            {
                Session["userlogin"] = cnh;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("DangKiChu");
            }
        }

        public JsonResult ThemTKMoi(string id,string tendn,string pass,string email)
        {
            ChuNhaHang cnh = ((ChuNhaHang)Session["userlogin"]);
            string result = AccountService.ThemTKNhanVien(id,tendn,pass,email,cnh.ID_Assitant.ToString(),cnh.SDT);
            if (result=="1")
            {
                return Json("Thành công");
            }
            else
            {
                return Json(result);
            }
            
        }

        public ActionResult DangNhapNV()
        {
            return View();
        }

        public ActionResult DangNhapAD()
        {
            return View();
        }


    }
}