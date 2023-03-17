using Quan_li_nha_hang_MVC.Models;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace Quan_li_nha_hang_MVC.Controllers
{
    public class NhanVienController : Controller
    {
        // GET: NhanVien
        public ActionResult DanhSachNhanVien()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                ViewData["chucvu"] = db.tblChucVu.ToList();
                return View();
            }
        }

        [HttpPost]
        public JsonResult DanhSachNVDL()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var nv = db.DanhSachNhanVien.Where(p => p.LamViec == 1).ToList();
                return Json(nv);
            }
        }
        [HttpPost]
        public JsonResult XoaTaiKhoanNV(string id)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                try
                {
                    var nv = db.Database.ExecuteSqlCommand("DELETE FROM dbo.tblTaiKhoan WHERE ID_Acc="+id);
                    if (nv == 1)
                    {
                        return Json("Xóa thành công");
                    }
                    else
                    {
                        return Json("Đã xảy ra lỗi. Thử lại sau");
                    }
                    
                }
               catch(SqlException ex)
                {
                    return Json(ex.Message);
                }
            }
        }

        [HttpPost]
        public JsonResult TaiKhoanTheoNV(string id)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var rs = LoadData.Instance.ExcuteQuery("SELECT ID_Acc,ID_NV,TenDn,Email,SoDT,PassWrord,Type,MaNH FROM dbo.tblTaiKhoan WHERE ID_NV=" + id);
                List<CustomViewTK> list = new List<CustomViewTK>();
                foreach (DataRow item in rs.Rows)
                {
                    list.Add(new CustomViewTK(item));
                }
                return Json(list);
            }
        }


        public JsonResult LuuSuaTaiKhoan(string id, string matkhau)
        {
            try
            {


                using (var db = new DoAnQuanLiNHEntities())
                {
                    int rs = db.Database.ExecuteSqlCommand("UPDATE dbo.tblTaiKhoan SET PassWrord =N'"+matkhau+"' WHERE ID_Acc="+id);
                    if (rs == 1)
                    {
                        return Json("Đổi mật khẩu thành công");
                    }
                    else
                    {
                        return Json("Đã xảy ra lỗi thử lại sau!");
                    }
                }
            }
            catch (SqlException ex)
            {
                return Json(ex.Message);
            }
        }
        public ActionResult PhanQuyenNhanVien(string idnv)
        {

            ChuNhaHang cnh = Session["userlogin"] as ChuNhaHang;
            if (cnh == null)
            {
                return RedirectToAction("DangNhapAD", "Account");
            }
            else
            {
                if (idnv == "0" || idnv == null)
                {
                    ViewData["danhsachquyen"] = PhanQuyenService.QuyenNhanVien(1);
                    ViewData["manv"] = 1;
                    string idcv = (string)LoadData.Instance.ExcuteScalar("SELECT ID_ChucVu FROM dbo.tblNhanVien WHERE ID_NhanVien=" + 1);
                    ViewData["cvnv"] = ChucVuNV(idcv);
                }
                else
                {
                    ViewData["danhsachquyen"] = PhanQuyenService.QuyenNhanVien(Int32.Parse(idnv));
                    ViewData["manv"] = Int32.Parse(idnv);
                    string idcv = (string)LoadData.Instance.ExcuteScalar("SELECT ID_ChucVu FROM dbo.tblNhanVien WHERE ID_NhanVien=" + idnv);
                    ViewData["cvnv"] = ChucVuNV(idcv);
                }
                return View();
            }
        }

        private class CustomViewTK
        {

            public string ID_Acc { get; set; }
            public string ID_NV { get; set; }
            public string TenDn { get; set; }
            public string Email { get; set; }
            public string SoDT { get; set; }
            public string PassWrord { get; set; }
            public int Type { get; set; }
            public int MaNH { get; set; }

            public CustomViewTK(string iD_Acc, string iD_NV, string tenDn, string email, string soDT, string passWrord, int type, int maNH)
            {
                ID_Acc = iD_Acc;
                ID_NV = iD_NV;
                TenDn = tenDn;
                Email = email;
                SoDT = soDT;
                PassWrord = passWrord;
                Type = type;
                MaNH = maNH;
            }

            public CustomViewTK(DataRow dr)
            {
                ID_Acc = ((int)dr["ID_Acc"]).ToString();
                ID_NV = (((int)dr["ID_NV"])).ToString();
                TenDn = (string)dr["TenDn"];
                Email = (string)dr["Email"];
                SoDT = (string)dr["SoDT"];
                PassWrord = (string)dr["PassWrord"];
                Type = (int)dr["Type"];
                MaNH = (int)dr["MaNH"];
            }
        }

        [HttpPost]
        public JsonResult ThongTinNhanVien(string idnv)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                string qr = "SELECT*FROM dbo.tblNhanVien WHERE ID_NhanVien=" + idnv;
                var nv = db.ChiTietNVTheoMa(Int32.Parse(idnv)).ToList();
                return Json(nv);
            }
        }


        public List<tblChucVu> ChucVuNV(string idcv)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                List<tblChucVu> tblcv = db.tblChucVu.SqlQuery("SELECT*FROM dbo.tblChucVu").ToList();

                foreach (var v in tblcv.ToList())
                {
                    if (v.ID_ChucVu == idcv.Replace(" ", ""))
                    {
                        tblcv.Remove(v);
                        string a = tblcv.Count().ToString();
                        Console.WriteLine(a);
                        tblcv.Insert(0, v);
                    }
                }
                return tblcv;
            }
        }

        public JsonResult ThayDoiPhanQuyen(string idquyen, int manv, int tt)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                if (tt == 0)
                {
                    int kq = LoadData.Instance.ExcuteNoneQuery("INSERT INTO dbo.tblQuyenNV(ID_NhanVien,ID_PhanQuyen,NgayPQ)VALUES(" + manv + "," + idquyen + " ," + TonKhoService.NgayHomNay() + ")");
                }
                else
                {
                    int kq = LoadData.Instance.ExcuteNoneQuery("DELETE FROM dbo.tblQuyenNV WHERE ID_NhanVien=" + manv + " AND ID_PhanQuyen='" + idquyen + "'");
                }
                return Json("");
            }
        }

        [HttpPost]
        public JsonResult TatCaNhanVien()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var nv = db.DanhSachNhanVien.ToList();
                return Json(nv);
            }
        }


        public JsonResult SuaThongTinNV(string id, string name, string birth, string cc, string dt, string qq, string sk, string nl, string cv)
        {
            string result = NhanVienService.UpdateTTNV(id, name, birth, cc, dt, qq, sk, nl, cv);
            if (result == "1")
            {
                return Json("Sửa thông tin nhân viên thành công!");
            }
            else
            {
                return Json(result);
            }

        }

        public JsonResult XoaNhanVien(string manv)
        {
            string result = NhanVienService.XoaNhanVien(manv);
            if (result == "1")
            {
                return Json("Xóa nhân viên thành công!");
            }
            else
            {
                return Json(result);
            }
        }
        public JsonResult LuuMoiNhanVien(string name, string birth, string gt, string cc, string dt, string qq, string sk, string nl, string cv)
        {
            string result = NhanVienService.InsertTTNV(name, birth, gt, cc, dt, qq, sk, nl, cv);
            if (result == "1")
            {
                return Json("Sửa thông tin nhân viên thành công!");
            }
            else
            {
                return Json(result);
            }
        }



    }
}