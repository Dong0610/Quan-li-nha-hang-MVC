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
    
    public partial class tblChucVu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblChucVu()
        {
            this.tblNhanVien = new HashSet<tblNhanVien>();
        }
    
        public string ID_ChucVu { get; set; }
        public string TenChucVu { get; set; }
        public string MoTa { get; set; }
        public double LuongCoBan { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblNhanVien> tblNhanVien { get; set; }
    }
}
