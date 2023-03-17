using Microsoft.Ajax.Utilities;
using Quan_li_nha_hang_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quan_li_nha_hang_MVC.Service
{
    public static class TonKhoService
    {
       static DoAnQuanLiNHEntities db= new DoAnQuanLiNHEntities();

        public static string NgayHomNay()
        {
            var today = DateTime.Now;
            var year = today.Year;
            var month = "";
            var day = "";
            if (today.Day.ToString().Length == 1)
            {
                day = "0" + today.Day.ToString();
            }
            else
            {
                day = today.Day.ToString();
            }
            if (today.Month.ToString().Length == 1)
            {
                month = "0" + today.Month.ToString();
            }
            else { month = today.Month.ToString(); }
            return day + "/" + month + "/" + year;
        }

        private static int TimKiem(string id, double sl)
        {
            int kiemtra = 0;
            foreach (TonKho tk in TonKhoSER.DanhSachTonKho())
            {
                if (tk.IdMH == id && tk.SoLuong == sl)
                {
                    kiemtra = 1;
                }
            }
            using (var db = new DoAnQuanLiNHEntities())
            {
                var rst = db.DanhSachTonHangTN(TonKhoService.NgayHomNay()).ToList();
                foreach (DanhSachTonHangTN_Result tk in rst)
                {
                    if (tk.IdMH == id && tk.SoLuong == sl)
                    {
                        kiemtra = 2;
                    }
                }

            }
            return kiemtra;
        }

        internal static string SuaDSTonKho(string id, double slc,double slnew, string gc)
        {
            int rstvl = TimKiem(id,slc);
            if(rstvl == 1)
            {
                foreach (TonKho tk in TonKhoSER.DanhSachTonKho())
                {
                    if (tk.IdMH == id && tk.SoLuong == slc)
                    {
                        tk.SoLuong = float.Parse(slnew.ToString());
                    }
                }
              
            }
            else
            {
                int idth = db.Database.SqlQuery<int>(" SELECT ID_THang FROM dbo.tblTonHang WHERE NgayTon='"+NgayHomNay()+"'").FirstOrDefault();
                string qrs="UPDATE dbo.tblCTTonHang SET SoLuong= "+slnew+ " , GhiChu=N'"+gc+"' WHERE ID_TonH=" + idth+" AND Id_Hang='"+id+"' AND SoLuong="+slc;
                int update = db.Database.ExecuteSqlCommand(qrs) ;
                UpdateSoLuong();
            }
            return rstvl.ToString();
        }


        private static void UpdateSoLuong()
        {
            int mahd =(int) LoadData.Instance.ExcuteScalar(" SELECT ID_THang FROM dbo.tblTonHang WHERE NgayTon='"+TonKhoService.NgayHomNay()+"'");
            List<tblCTTonHang> listth= db.tblCTTonHang.Where(p=>p.ID_TonH==mahd).ToList();

            foreach(tblMatHang mh in db.tblMatHang.ToList())
            {
                tblCTTonHang tb = listth.Find(p => p.Id_Hang == mh.ID_Hang);
                if (tb != null)
                {
                    double sol = (double)LoadData.Instance.ExcuteScalar("EXEC dbo.TongTienSPTonKho @ngay = '"+TonKhoService.NgayHomNay()+"', " +
                        "@mah = '"+tb.Id_Hang+"'");
                  int kq=  LoadData.Instance.ExcuteNoneQuery("UPDATE dbo.tblMatHang SET SoLuong="+sol+" WHERE ID_Hang='"+tb.Id_Hang+"'");
                }
            }
            
        }
        internal static string TaoMoiHoaDon()
        {           
            try
            {
                var date =NgayHomNay();
                string qrs = "SELECT ID_THang FROM dbo.tblTonHang  WHERE NgayTon='"+date+"'";
                int idh = db.Database.SqlQuery<int>(qrs).FirstOrDefault();
                if ( idh==0)
                {
                    string query = "INSERT INTO dbo.tblTonHang(TenTonH,NgayTon,KhuVuc,MaNV,GhiChu)VALUES(N'Kiểm kê cuối ngày','" + date + "',N'NhaHang', 1,  N'Kiem ke cuoi ca')";
                    int reslt = db.Database.ExecuteSqlCommand(query);

                    if (reslt == 1)
                    {
                        int val = db.Database.SqlQuery<int>("SELECT MAX(ID_THang) FROM dbo.tblTonHang").FirstOrDefault();
                        foreach (TonKho cus in TonKhoSER.DanhSachTonKho().ToList())
                        {
                            string themstr = "INSERT INTO dbo.tblCTTonHang(ID_TonH,Id_Hang,SoLuong,GhiChu,KhuVuc)VALUES(   N'" + val + "', N'" + cus.IdMH + "'," + cus.SoLuong + ", N'" + cus.Ghichu + "', N'" + cus.KhuVuc + "'  )";
                            db.Database.ExecuteSqlCommand(themstr);
                        }
                        TonKhoSER.XoaTatCa();
                        UpdateSoLuong();
                    }
                    return reslt.ToString();
                }
                else
                {
                   
                    int val = db.Database.SqlQuery<int>("SELECT MAX(ID_THang) FROM dbo.tblTonHang").FirstOrDefault();
                    foreach (TonKho cus in TonKhoSER.DanhSachTonKho().ToList())
                    {
                        string themstr = "INSERT INTO dbo.tblCTTonHang(ID_TonH,Id_Hang,SoLuong,GhiChu,KhuVuc)VALUES(   N'" + val + "', N'" + cus.IdMH + "'," + cus.SoLuong + ", N'" + cus.Ghichu + "', N'" + cus.KhuVuc + "'  )";
                        db.Database.ExecuteSqlCommand(themstr);
                    }
                    TonKhoSER.XoaTatCa();
                    UpdateSoLuong();
                    return "1";
                }
              
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }


        public static List<TonKho> ListTonKho()
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var rs = db.DanhSachTonHangTN(TonKhoService.NgayHomNay()).ToList();
                var dsall = new List<TonKho>();
                var dstk = TonKhoSER.DanhSachTonKho();
                foreach (var r in dstk)
                {
                    dsall.Add(r);
                }
                foreach (DanhSachTonHangTN_Result th in rs)
                {
                    TonKho tk = new TonKho(th.IdMH, th.TenH, th.DonViTon, th.NhaCC, float.Parse(th.SoLuong.ToString()), th.GhiChu,th.KhuVuc);
                    dsall.Add(tk);
                }

                return dsall;
            }
        }
        internal static void XoaTonHang(string id, double sol)
        {
            int rstvl = TimKiem(id, sol);
            if (rstvl == 1)
            {
                foreach (TonKho tk in TonKhoSER.DanhSachTonKho())
                {
                    if (tk.IdMH == id && tk.SoLuong == sol)
                    {
                        TonKhoSER.DanhSachTonKho().Remove(tk);
                    }
                }

            }
            else
            {
                int idth = db.Database.SqlQuery<int>(" SELECT ID_THang FROM dbo.tblTonHang WHERE NgayTon='" + NgayHomNay() + "'").FirstOrDefault();
                string qrs = "DELETE FROM dbo.tblCTTonHang WHERE ID_TonH="+idth+" AND Id_Hang='"+id+"' AND SoLuong="+sol;
                int update = db.Database.ExecuteSqlCommand(qrs);
            }
        }

        internal static List<TonKho> KiemKeTheoNgay(string ngaykk)
        {
            using (var db = new DoAnQuanLiNHEntities())
            {
                var rs = db.DanhSachTonHangTN(ngaykk).ToList();
                var dsall = new List<TonKho>();
                var dstk = TonKhoSER.DanhSachTonKho();
                foreach (var r in dstk)
                {
                    dsall.Add(r);
                }
                foreach (DanhSachTonHangTN_Result th in rs)
                {
                    TonKho tk = new TonKho(th.IdMH, th.TenH, th.DonViTon, th.NhaCC, float.Parse(th.SoLuong.ToString()), th.GhiChu, th.KhuVuc);
                    dsall.Add(tk);
                }

                return dsall;
            }
        }
    }
}