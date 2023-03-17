using Microsoft.Ajax.Utilities;
using Quan_li_nha_hang_MVC.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quan_li_nha_hang_MVC.Models
{
    public  class PhanQuyenNV
    {
        public string IDQuyen { get; set; }
        public string TenQuyen { get; set; }
        public string MaNV { get; set; }
        public int TinhTrang { get; set; }

        public PhanQuyenNV(string iDQuyen, string tenQuyen, string maNV, int tinhTrang)
        {
            IDQuyen = iDQuyen;
            TenQuyen = tenQuyen;
            MaNV = maNV;
            TinhTrang = tinhTrang;
        }
    }

    public static class PhanQuyenService{
        private static DoAnQuanLiNHEntities db = new DoAnQuanLiNHEntities();
        public static List<PhanQuyenNV> QuyenNhanVien( int idnv)
        {
            var dspq = db.tblPhanQuyen.ToList();

            List<PhanQuyenNV> phanQuyenNVs = new List<PhanQuyenNV>();
            foreach( tblPhanQuyen d in dspq ) {
                string query = "SELECT CASE WHEN COALESCE((SELECT TOP 1  ID_PhanQuyen FROM dbo.tblQuyenNV WHERE ID_PhanQuyen= '" + d.ID_Quyen+"' AND ID_NhanVien='" + idnv + "'),0) LIKE 0" +
                    " THEN 0 ELSE (SELECT TOP 1  ID_PhanQuyen  FROM dbo.tblQuyenNV WHERE ID_PhanQuyen= '" + d.ID_Quyen +"' AND ID_NhanVien='" + idnv + "') END";
                int val = (int)LoadData.Instance.ExcuteScalar(query);
                if( val == 0 )
                {
                    phanQuyenNVs.Add(new PhanQuyenNV(d.ID_Quyen, d.TenQuyen, idnv.ToString(), 0));
                }
                else
                {
                    phanQuyenNVs.Add(new PhanQuyenNV(d.ID_Quyen, d.TenQuyen, idnv.ToString(), 1));
                }

            }
            return phanQuyenNVs;
        }
    }
}