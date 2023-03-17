using FirebaseAdmin.Auth.Multitenancy;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using WebGrease.Css.Extensions;

namespace Quan_li_nha_hang_MVC.Models
{
    public class ProductMix
    {
        public string ID_Hang { get; set; }
        public string TenHang { get; set; }
        public string DonViTon { get; set; }
        public double MucGia { get; set; }
        public double TonDau { get; set; }
        public double NhapVe { get; set; }
        public double TonCuoi { get; set; }
        public double SuDung { get; set; }
        public string TenLoai { get; set; }
        public double PhanTram { get; set; }
        public string TenNCC { get; set; }

        public ProductMix(string iD_Hang, string tenHang, string donViTon, double mucGia,
            double tonDau, double nhapVe, double tonCuoi, double suDung, string tenLoai, double phanTram, string tenNCC)
        {
            ID_Hang = iD_Hang;
            TenHang = tenHang;
            DonViTon = donViTon;
            MucGia = mucGia;
            TonDau = tonDau;
            NhapVe = nhapVe;
            TonCuoi = tonCuoi;
            SuDung = suDung;
            TenLoai = tenLoai;
            PhanTram = phanTram;
            TenNCC = tenNCC;
        }
        public ProductMix()
        {
        }
    }
    public static class ProduceMixService
    {
        private static DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        private static string NgayHomQua()
        {
            var today = DateTime.Today.AddDays(-1);
            var year = today.Year;
            var month = "";
            var day = "";
            if (today.Day.ToString().Length == 1)
            {
                day = "0" + today.Day.ToString();
            }
            if (today.Month.ToString().Length == 1)
            {
                month = "0" + today.Month.ToString();
            }
            return day + "/" + month + "/" + year;
        }
        public static List<ProductMix> GetMixList()
        {
            List<ProductMix> products = new List<ProductMix>();
            using (var dbs = new DoAnQuanLiNHEntities())
            {
                var danhsachh = db.DSAllMatHang.SqlQuery("SELECT*FROM dbo.DSAllMatHang").ToList();
                double tongdung = 0;
                foreach (DSAllMatHang mh in danhsachh.ToList())
                {
                    ProductMix product = new ProductMix();
                    product.ID_Hang = mh.ID_Hang;
                    product.TenHang = mh.TenHang;
                    product.DonViTon = mh.DonViTon;
                    product.MucGia = mh.MucGia;
                    product.TenLoai = mh.TenLoai;
                    product.TenNCC = mh.TenNCC;
                    var rest = LoadData.Instance.ExcuteScalar("EXEC dbo.TongHangDaGoiTheoNgay @ngay = '" + TonKhoService.NgayHomNay() + "',  @mah = '" + mh.ID_Hang + "'");
                    product.NhapVe = double.Parse(rest.ToString());
                    DanhSachTonHangTN_Result tonhq = db.DanhSachTonHangTN(TonKhoService.NgayHomNay()).Where(p => p.IdMH == mh.ID_Hang).FirstOrDefault();
                    if (tonhq != null)
                    {
                        product.TonCuoi = double.Parse(db.TongTienSPTonKho(TonKhoService.NgayHomNay(), tonhq.IdMH).FirstOrDefault().ToString());
                    }
                    else
                    {
                        product.TonCuoi = 0;
                    }
                    DanhSachTonHangTN_Result tonhd = db.DanhSachTonHangTN(NgayHomQua()).Where(p => p.IdMH == mh.ID_Hang).FirstOrDefault();
                    if (tonhd != null)
                    {
                        product.TonDau = double.Parse(db.TongTienSPTonKho(NgayHomQua(), tonhd.IdMH).FirstOrDefault().ToString());
                    }
                    else
                    {
                        product.TonDau = 0;
                    }
                    product.SuDung = (product.TonDau + product.NhapVe) - product.TonCuoi;
                    product.PhanTram = product.SuDung / product.TonCuoi;

                    tongdung += product.SuDung;
                    products.Add(product);
                    continue;
                }
                foreach (var product in products)
                {
                    product.PhanTram = Math.Abs( Math.Round(product.SuDung * 100 / tongdung, 3));
                    if (product.PhanTram.ToString() == "NaN")
                    {
                        product.PhanTram = 0;
                    }
                }
                return products;
            };
        }

        internal static string LuuLaiMix()
        {
            try
            {
                string maqr = "EXEC dbo.MaMixTimKiem @ngay = '"+TonKhoService.NgayHomNay()+"',@manv = 1, @note = N'Tồn kho Mix'";
                int maprmix = (int)LoadData.Instance.ExcuteScalar(maqr);
                if (maprmix == 0)
                {
                    int idprmix = (int)LoadData.Instance.ExcuteScalar("SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon ='" + TonKhoService.NgayHomNay() +"'");
                    foreach (ProductMix pr in GetMixList())
                    {
                        if (pr.PhanTram.ToString() == "NaN")
                        {
                            pr.PhanTram = 0;
                        }
                        string query = "INSERT INTO dbo.tblCT_ProductMix" +
                            "(ID_Mix,ID_Hang,TenHang,DonViTon,GiaHang,TonKho,TonDau,NhapThuc,XuatThuc,PhanTram,TenLoai,NhaCC,SuaDoi)" +
                            "VALUES (" + idprmix + ",'" + pr.ID_Hang + "', N'" + pr.TenHang + "','" + pr.DonViTon + "'," + pr.MucGia + ",0," + pr.TonDau + ", " +
                            "" + pr.NhapVe + ",  " + pr.SuDung + ", " + pr.PhanTram.ToString().Replace(',','.') + ",  N'" + pr.TenLoai + "', N'" + pr.TenNCC + "', N'Đã lưu')";
                        LoadData.Instance.ExcuteNoneQuery(query);
                    }
                    return "1";
                }
                else
                {
                    var ketqua = "";

                    foreach (ProductMix pr in GetMixList())
                    {
                        if (pr.PhanTram.ToString() == "NaN")
                        {
                            pr.PhanTram = 0;
                        }
                        string query = "UPDATE dbo.tblCT_ProductMix SET TonKho = 0,TonDau = " + pr.TonDau + ",NhapThuc = " + pr.NhapVe + ",XuatThuc = " + pr.SuDung + "," +
                            "PhanTram =" + pr.PhanTram + " ,SuaDoi = N'Sửa đổi:" + DateTime.Now.ToString() + "' WHERE ID_Mix= '" + maprmix + "' AND ID_Hang='" + pr.ID_Hang + "'";
                        try
                        {
                           ketqua= LoadData.Instance.ExcuteNoneQuery(query).ToString();

                        }
                        catch (SqlException ex)
                        {
                            ketqua = ex.Message;
                        }                       
                    }
                    return ketqua;
                }
            }
            catch (SqlException ex)
            {
                return (ex.Message);
            }
        }


        private static string NgayHomQuaFM(DateTime ngay)
        {
            var today = ngay.AddDays(-1);
            var year = today.Year;
            var month = "";
            var day = "";
            if (today.Day.ToString().Length == 1)
            {
                day = "0" + today.Day.ToString();
            }
            else
            {
                day += today.Day.ToString();
            }
            if (today.Month.ToString().Length == 1)
            {
                month = "0" + today.Month.ToString();
            }
            else
            {
                month += today.Month.ToString();
            }
            return day + "/" + month + "/" + year;
        }
        private static string FMNgayThang(DateTime ngay)
        {
            var today = ngay;
            var year = today.Year;
            var month = "";
            var day = "";
            if (today.Day.ToString().Length == 1)
            {
                day = "0" + today.Day.ToString();
            }
            else
            {
                day += today.Day.ToString();
            }
            if (today.Month.ToString().Length == 1)
            {
                month = "0" + today.Month.ToString();
            }
            else
            {
                month += today.Month.ToString();
            }
            return day + "/" + month + "/" + year;
        }
        internal static object DanhSachMixTheoNgay(string ngay)
        {
            int idpromix = (int)LoadData.Instance.ExcuteScalar("SELECT CASE WHEN COALESCE((SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon='" + ngay + "'),0)" +
                           " LIKE 0 THEN 0 ELSE (SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon='" + ngay + "') END ;");
            if (idpromix == 0)
            {
                List<ProductMix> products = new List<ProductMix>();
                var ngaythang = DateTime.ParseExact(ngay, "dd/MM/yyyy",CultureInfo.InvariantCulture);
                using (var dbs = new DoAnQuanLiNHEntities())
                {
                    var danhsachh = db.DSAllMatHang.SqlQuery("SELECT*FROM dbo.DSAllMatHang").ToList();
                    var ngaychon = FMNgayThang(ngaythang).ToString();
                    var ngaytruoc = NgayHomQuaFM(ngaythang).ToString();
                    double tongdung = 0;
                    foreach (DSAllMatHang mh in danhsachh.ToList())
                    {
                        ProductMix product = new ProductMix();
                        product.ID_Hang = mh.ID_Hang;
                        product.TenHang = mh.TenHang;
                        product.DonViTon = mh.DonViTon;
                        product.MucGia = mh.MucGia;
                        product.TenLoai = mh.TenLoai;
                        product.TenNCC = mh.TenNCC;
                        var rest = LoadData.Instance.ExcuteScalar("EXEC dbo.TongHangDaGoiTheoNgay @ngay = '" +ngaychon + "',  @mah = '" + mh.ID_Hang + "'");
                        product.NhapVe = double.Parse(rest.ToString());
                        DanhSachTonHangTN_Result tonhq = db.DanhSachTonHangTN(ngaychon).Where(p => p.IdMH == mh.ID_Hang).FirstOrDefault();
                        if (tonhq != null)
                        {
                            product.TonCuoi = double.Parse(db.TongTienSPTonKho(ngaychon, tonhq.IdMH).FirstOrDefault().ToString());
                        }
                        else
                        {
                            product.TonCuoi = 0;
                        }
                        DanhSachTonHangTN_Result tonhd = db.DanhSachTonHangTN(ngaytruoc).Where(p => p.IdMH == mh.ID_Hang).FirstOrDefault();
                        if (tonhd != null)
                        {
                            product.TonDau = double.Parse(db.TongTienSPTonKho(ngaytruoc, tonhd.IdMH).FirstOrDefault().ToString());
                        }
                        else
                        {
                            product.TonDau = 0;
                        }
                        product.SuDung = (product.TonDau + product.NhapVe) - product.TonCuoi;
                        product.PhanTram = product.SuDung / product.TonCuoi;

                        tongdung += product.SuDung;
                        products.Add(product);
                        continue;
                    }
                    foreach (var product in products)
                    {
                        product.PhanTram = Math.Abs(Math.Round(product.SuDung * 100 / tongdung, 3));
                        if (product.PhanTram == double.NaN)
                        {
                            product.PhanTram = 0;
                        }
                    }
                    return products;
                };
            }
            else
            {
                using (var db = new DoAnQuanLiNHEntities())
                {
                    return (List<tblCT_ProductMix>)db.tblCT_ProductMix.Where(pr => pr.ID_Mix == idpromix).ToList();
                }
            }
           
        }
    }

}