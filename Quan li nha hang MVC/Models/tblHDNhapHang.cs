//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Quan_li_nha_hang_MVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblHDNhapHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblHDNhapHang()
        {
            this.tblChiTietHDNH = new HashSet<tblChiTietHDNH>();
        }
    
        public string SoHieuHD { get; set; }
        public string NgayDat { get; set; }
        public string NgayDao { get; set; }
        public double ThanhTien { get; set; }
        public Nullable<int> ID_NV { get; set; }
        public int DuyetHD { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblChiTietHDNH> tblChiTietHDNH { get; set; }
        public virtual tblNhanVien tblNhanVien { get; set; }
    }
}