
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/12/2023 22:37:27
-- Generated from EDMX file: T:\Visual Studio\Quan-li-nha-hang-MVC\Quan li nha hang MVC\Models\Do An Quan  Li Nha Hang.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DoAnQuanLiNH];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CNH_NV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChuNhaHang] DROP CONSTRAINT [FK_CNH_NV];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK__tblCT_Pro__ID_Ha__0DCF0841]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblCT_ProductMix] DROP CONSTRAINT [FK__tblCT_Pro__ID_Ha__0DCF0841];
GO
IF OBJECT_ID(N'[dbo].[FK__tblChiTie__ID_Bu__123EB7A3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietOderBuffet] DROP CONSTRAINT [FK__tblChiTie__ID_Bu__123EB7A3];
GO
IF OBJECT_ID(N'[dbo].[FK__tblChiTie__ID_Mo__17F790F9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietGoiMon] DROP CONSTRAINT [FK__tblChiTie__ID_Mo__17F790F9];
GO
IF OBJECT_ID(N'[dbo].[FK_ACC_tblNV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTaiKhoan] DROP CONSTRAINT [FK_ACC_tblNV];
GO
IF OBJECT_ID(N'[dbo].[FK_B_BNH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblDatBan] DROP CONSTRAINT [FK_B_BNH];
GO
IF OBJECT_ID(N'[dbo].[FK_B_LB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblBanNH] DROP CONSTRAINT [FK_B_LB];
GO
IF OBJECT_ID(N'[dbo].[FK_CT_H]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietMon] DROP CONSTRAINT [FK_CT_H];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_CT_HDNH_FK]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblChiTietHDNH] DROP CONSTRAINT [FK_CT_HDNH_FK];
GO
IF OBJECT_ID(N'[dbo].[FK_CT_MA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietMon] DROP CONSTRAINT [FK_CT_MA];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_CT_Mix]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblCT_ProductMix] DROP CONSTRAINT [FK_CT_Mix];
GO
IF OBJECT_ID(N'[dbo].[FK_CTBF_BF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietBuffet] DROP CONSTRAINT [FK_CTBF_BF];
GO
IF OBJECT_ID(N'[dbo].[FK_CTBF_MA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietBuffet] DROP CONSTRAINT [FK_CTBF_MA];
GO
IF OBJECT_ID(N'[dbo].[FK_CTOD_MO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietGoiMon] DROP CONSTRAINT [FK_CTOD_MO];
GO
IF OBJECT_ID(N'[dbo].[FK_CTOD_OD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblChiTietOderBuffet] DROP CONSTRAINT [FK_CTOD_OD];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_CTTH_HH]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblCTTonHang] DROP CONSTRAINT [FK_CTTH_HH];
GO
IF OBJECT_ID(N'[dbo].[FK_H_MaLH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblMatHang] DROP CONSTRAINT [FK_H_MaLH];
GO
IF OBJECT_ID(N'[dbo].[FK_H_NCC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblMatHang] DROP CONSTRAINT [FK_H_NCC];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_HD_H]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblChiTietHDNH] DROP CONSTRAINT [FK_HD_H];
GO
IF OBJECT_ID(N'[dbo].[FK_NV_CV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblNhanVien] DROP CONSTRAINT [FK_NV_CV];
GO
IF OBJECT_ID(N'[dbo].[FK_NV_HDNH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblHDNhapHang] DROP CONSTRAINT [FK_NV_HDNH];
GO
IF OBJECT_ID(N'[dbo].[FK_NV_HDOD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblHDOder] DROP CONSTRAINT [FK_NV_HDOD];
GO
IF OBJECT_ID(N'[dbo].[FK_OD_BNH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblHDOder] DROP CONSTRAINT [FK_OD_BNH];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_PQ_NV]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblQuyenNV] DROP CONSTRAINT [FK_PQ_NV];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_PQ_PQ]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblQuyenNV] DROP CONSTRAINT [FK_PQ_PQ];
GO
IF OBJECT_ID(N'[dbo].[FK_TK_tblNH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTaiKhoan] DROP CONSTRAINT [FK_TK_tblNH];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[FK_TH_CT]', 'F') IS NOT NULL
    ALTER TABLE [DoAnQuanLiNHModelStoreContainer].[tblCTTonHang] DROP CONSTRAINT [FK_TH_CT];
GO
IF OBJECT_ID(N'[dbo].[FK_TH_NV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTonHang] DROP CONSTRAINT [FK_TH_NV];
GO
IF OBJECT_ID(N'[dbo].[FK_PK_GD_HDOD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblGiaoDich] DROP CONSTRAINT [FK_PK_GD_HDOD];
GO
IF OBJECT_ID(N'[dbo].[FK_PK_GD_NVDO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblGiaoDich] DROP CONSTRAINT [FK_PK_GD_NVDO];
GO
IF OBJECT_ID(N'[dbo].[FK_PK_GD_NVMO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblGiaoDich] DROP CONSTRAINT [FK_PK_GD_NVMO];
GO
IF OBJECT_ID(N'[dbo].[FK_PK_NV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProductMix] DROP CONSTRAINT [FK_PK_NV];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ChuNhaHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChuNhaHang];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tblBanNH]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblBanNH];
GO
IF OBJECT_ID(N'[dbo].[tblBuffet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblBuffet];
GO
IF OBJECT_ID(N'[dbo].[tblChiTietBuffet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblChiTietBuffet];
GO
IF OBJECT_ID(N'[dbo].[tblChiTietGoiMon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblChiTietGoiMon];
GO
IF OBJECT_ID(N'[dbo].[tblChiTietMon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblChiTietMon];
GO
IF OBJECT_ID(N'[dbo].[tblChiTietOderBuffet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblChiTietOderBuffet];
GO
IF OBJECT_ID(N'[dbo].[tblChucVu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblChucVu];
GO
IF OBJECT_ID(N'[dbo].[tblDatBan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblDatBan];
GO
IF OBJECT_ID(N'[dbo].[tblGiaoDich]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblGiaoDich];
GO
IF OBJECT_ID(N'[dbo].[tblHDNhapHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblHDNhapHang];
GO
IF OBJECT_ID(N'[dbo].[tblHDOder]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblHDOder];
GO
IF OBJECT_ID(N'[dbo].[tblLoaiBan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblLoaiBan];
GO
IF OBJECT_ID(N'[dbo].[tblLoaiHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblLoaiHang];
GO
IF OBJECT_ID(N'[dbo].[tblMatHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblMatHang];
GO
IF OBJECT_ID(N'[dbo].[tblMonAn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblMonAn];
GO
IF OBJECT_ID(N'[dbo].[tblNhaCC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblNhaCC];
GO
IF OBJECT_ID(N'[dbo].[tblNhanVien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblNhanVien];
GO
IF OBJECT_ID(N'[dbo].[tblProductMix]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProductMix];
GO
IF OBJECT_ID(N'[dbo].[tblPhanQuyen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblPhanQuyen];
GO
IF OBJECT_ID(N'[dbo].[tblTaiKhoan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblTaiKhoan];
GO
IF OBJECT_ID(N'[dbo].[tblTonHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblTonHang];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[tblCT_ProductMix]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[tblCT_ProductMix];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[tblCTTonHang]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[tblCTTonHang];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[tblChiTietHDNH]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[tblChiTietHDNH];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[tblQuyenNV]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[tblQuyenNV];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[BanChoThanhToan]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[BanChoThanhToan];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[ChiTietHoaDonOder]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[ChiTietHoaDonOder];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachGiaoDich]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachGiaoDich];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachHD]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachHD];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachHDCTT]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachHDCTT];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachHoaDon]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachHoaDon];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachMatHang]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachMatHang];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DanhSachNhanVien]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DanhSachNhanVien];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DatTruocBan]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DatTruocBan];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DSAllMatHang]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DSAllMatHang];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DsBanNH]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DsBanNH];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DsBuffet]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DsBuffet];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[DsMonAnAll]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[DsMonAnAll];
GO
IF OBJECT_ID(N'[DoAnQuanLiNHModelStoreContainer].[ThanhPhanHang]', 'U') IS NOT NULL
    DROP TABLE [DoAnQuanLiNHModelStoreContainer].[ThanhPhanHang];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ChuNhaHang'
CREATE TABLE [dbo].[ChuNhaHang] (
    [ID_Assitant] int IDENTITY(1,1) NOT NULL,
    [TenCH] nvarchar(300)  NOT NULL,
    [TenQL] nvarchar(300)  NOT NULL,
    [SDT] varchar(20)  NOT NULL,
    [Email] varchar(100)  NOT NULL,
    [PassWrord] nvarchar(200)  NOT NULL,
    [Id_NV] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tblBanNH'
CREATE TABLE [dbo].[tblBanNH] (
    [ID_Ban] varchar(10)  NOT NULL,
    [TenBan] nvarchar(100)  NOT NULL,
    [MoTa] nvarchar(500)  NOT NULL,
    [ViTri] nvarchar(500)  NOT NULL,
    [SoGhe] int  NOT NULL,
    [TinhTrang] int  NOT NULL,
    [KhuVuc] nvarchar(200)  NULL,
    [ID_LoaiBan] varchar(10)  NULL
);
GO

-- Creating table 'tblBuffet'
CREATE TABLE [dbo].[tblBuffet] (
    [ID_Buffe] varchar(20)  NOT NULL,
    [TenBF] nvarchar(300)  NOT NULL,
    [GiaBF] float  NOT NULL,
    [NgayTao] varchar(40)  NOT NULL,
    [Thue] float  NOT NULL,
    [SuDung] int  NOT NULL,
    [Image] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'tblChiTietBuffet'
CREATE TABLE [dbo].[tblChiTietBuffet] (
    [ID_Buffet] varchar(20)  NOT NULL,
    [ID_Mon] nvarchar(15)  NOT NULL,
    [SoLuong] float  NOT NULL,
    [TongTien] float  NOT NULL
);
GO

-- Creating table 'tblChiTietGoiMon'
CREATE TABLE [dbo].[tblChiTietGoiMon] (
    [ID_HDOder] int  NOT NULL,
    [ID_Mon] nvarchar(15)  NOT NULL,
    [SoLuong] int  NOT NULL,
    [GioOder] varchar(40)  NULL
);
GO

-- Creating table 'tblChiTietMon'
CREATE TABLE [dbo].[tblChiTietMon] (
    [ID_MonAn] nvarchar(15)  NOT NULL,
    [ID_Hang] varchar(20)  NOT NULL,
    [DinhLuong] float  NOT NULL,
    [DonViDung] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'tblChiTietOderBuffet'
CREATE TABLE [dbo].[tblChiTietOderBuffet] (
    [ID_HDOder] int  NOT NULL,
    [ID_Buffet] varchar(20)  NOT NULL,
    [SoLuong] int  NOT NULL,
    [GioOder] varchar(40)  NULL
);
GO

-- Creating table 'tblChucVu'
CREATE TABLE [dbo].[tblChucVu] (
    [ID_ChucVu] varchar(20)  NOT NULL,
    [TenChucVu] nvarchar(200)  NOT NULL,
    [MoTa] nvarchar(500)  NOT NULL,
    [LuongCoBan] float  NOT NULL
);
GO

-- Creating table 'tblDatBan'
CREATE TABLE [dbo].[tblDatBan] (
    [ID_Ban] int IDENTITY(1,1) NOT NULL,
    [TenKH] nvarchar(300)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [NgayDat] varchar(40)  NOT NULL,
    [GioDat] nvarchar(30)  NULL,
    [SoKhach] int  NOT NULL,
    [ID_BanDat] varchar(10)  NULL,
    [Note] nvarchar(1000)  NOT NULL,
    [TinhTrang] int  NOT NULL,
    [HuyBan] int  NOT NULL
);
GO

-- Creating table 'tblGiaoDich'
CREATE TABLE [dbo].[tblGiaoDich] (
    [ID_GiaoDich] int IDENTITY(1,1) NOT NULL,
    [TenGD] nvarchar(300)  NOT NULL,
    [ThoiGianGD] varchar(30)  NOT NULL,
    [ID_HD_Oder] int  NULL,
    [ID_NVMo] int  NULL,
    [ID_NVDo] int  NULL,
    [TinhTrang] int  NOT NULL,
    [HinhThucTT] nvarchar(100)  NULL,
    [PhiDV] float  NOT NULL,
    [TienBanDau] float  NOT NULL,
    [TienCuoi] float  NOT NULL,
    [GhiChu] nvarchar(3000)  NULL
);
GO

-- Creating table 'tblHDNhapHang'
CREATE TABLE [dbo].[tblHDNhapHang] (
    [SoHieuHD] nvarchar(30)  NOT NULL,
    [NgayDat] varchar(40)  NULL,
    [NgayDao] varchar(40)  NOT NULL,
    [ThanhTien] float  NOT NULL,
    [ID_NV] int  NULL,
    [DuyetHD] int  NOT NULL
);
GO

-- Creating table 'tblHDOder'
CREATE TABLE [dbo].[tblHDOder] (
    [ID_HDOder] int IDENTITY(1,1) NOT NULL,
    [TenKH] nvarchar(300)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [NgayVao] varchar(40)  NOT NULL,
    [GioVao] nvarchar(30)  NULL,
    [GioRa] varchar(40)  NULL,
    [SoKhach] int  NOT NULL,
    [ID_NV] int  NOT NULL,
    [ID_Ban] varchar(10)  NULL,
    [Thue] float  NOT NULL,
    [TongTien] float  NOT NULL,
    [GhiChu] nvarchar(1000)  NULL,
    [TTThanhToan] int  NOT NULL
);
GO

-- Creating table 'tblLoaiBan'
CREATE TABLE [dbo].[tblLoaiBan] (
    [ID_LoaiBan] varchar(10)  NOT NULL,
    [TenLoaiBan] nvarchar(100)  NOT NULL,
    [SuDung] int  NOT NULL
);
GO

-- Creating table 'tblLoaiHang'
CREATE TABLE [dbo].[tblLoaiHang] (
    [ID_LoaiH] varchar(10)  NOT NULL,
    [TenLoai] nvarchar(200)  NOT NULL,
    [MoTa] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'tblMatHang'
CREATE TABLE [dbo].[tblMatHang] (
    [ID_Hang] varchar(20)  NOT NULL,
    [TenHang] nvarchar(500)  NOT NULL,
    [MoTa] nvarchar(100)  NOT NULL,
    [SoLuong] float  NOT NULL,
    [DonViTon] varchar(10)  NOT NULL,
    [MucGia] float  NOT NULL,
    [HanSudung] nvarchar(50)  NOT NULL,
    [ID_LoaiH] varchar(10)  NOT NULL,
    [ID_NCC] varchar(20)  NOT NULL,
    [SuDung] int  NULL
);
GO

-- Creating table 'tblMonAn'
CREATE TABLE [dbo].[tblMonAn] (
    [ID_MonAn] nvarchar(15)  NOT NULL,
    [TenMon] nvarchar(200)  NOT NULL,
    [GiaMon] float  NOT NULL,
    [MoTa] nvarchar(200)  NOT NULL,
    [TracMon] nvarchar(max)  NOT NULL,
    [SuDung] int  NULL,
    [HinhAnh] nvarchar(max)  NULL
);
GO

-- Creating table 'tblNhaCC'
CREATE TABLE [dbo].[tblNhaCC] (
    [ID_NCC] varchar(20)  NOT NULL,
    [TenNCC] nvarchar(500)  NOT NULL,
    [DiaChi] nvarchar(500)  NOT NULL,
    [SoDt] varchar(15)  NOT NULL,
    [TinhTrang] int  NOT NULL,
    [SuDung] int  NOT NULL
);
GO

-- Creating table 'tblNhanVien'
CREATE TABLE [dbo].[tblNhanVien] (
    [ID_NhanVien] int IDENTITY(1,1) NOT NULL,
    [TenNV] nvarchar(200)  NOT NULL,
    [NgaySinh] varchar(20)  NOT NULL,
    [GioiTinh] int  NOT NULL,
    [IDCanCuoc] varchar(20)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [TinhTrangSK] nvarchar(300)  NULL,
    [NgayVaoLam] varchar(20)  NOT NULL,
    [ID_ChucVu] varchar(20)  NOT NULL,
    [LamViec] int  NOT NULL,
    [QueQuan] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'tblProductMix'
CREATE TABLE [dbo].[tblProductMix] (
    [ID_Pr_Mix] int IDENTITY(1,1) NOT NULL,
    [TenTon] nvarchar(1000)  NOT NULL,
    [NgayTon] varchar(30)  NOT NULL,
    [IdNV] int  NULL,
    [GhiChu] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'tblPhanQuyen'
CREATE TABLE [dbo].[tblPhanQuyen] (
    [ID_Quyen] varchar(20)  NOT NULL,
    [TenQuyen] nvarchar(300)  NOT NULL
);
GO

-- Creating table 'tblTaiKhoan'
CREATE TABLE [dbo].[tblTaiKhoan] (
    [ID_Acc] int IDENTITY(1,1) NOT NULL,
    [ID_NV] int  NULL,
    [TenDn] varchar(100)  NOT NULL,
    [Email] varchar(100)  NOT NULL,
    [SoDT] varchar(100)  NOT NULL,
    [PassWrord] nvarchar(200)  NOT NULL,
    [Type] int  NOT NULL,
    [MaNH] int  NULL
);
GO

-- Creating table 'tblTonHang'
CREATE TABLE [dbo].[tblTonHang] (
    [ID_THang] int IDENTITY(1,1) NOT NULL,
    [TenTonH] nvarchar(500)  NOT NULL,
    [NgayTon] varchar(30)  NOT NULL,
    [KhuVuc] nvarchar(100)  NOT NULL,
    [MaNV] int  NOT NULL,
    [GhiChu] nvarchar(1000)  NULL
);
GO

-- Creating table 'tblCT_ProductMix'
CREATE TABLE [dbo].[tblCT_ProductMix] (
    [ID_Mix] int  NULL,
    [ID_Hang] varchar(20)  NULL,
    [TenHang] nvarchar(1000)  NOT NULL,
    [DonViTon] nvarchar(10)  NOT NULL,
    [GiaHang] float  NOT NULL,
    [TonKho] float  NOT NULL,
    [TonDau] float  NOT NULL,
    [NhapThuc] float  NOT NULL,
    [XuatThuc] float  NOT NULL,
    [PhanTram] float  NOT NULL,
    [TenLoai] nvarchar(100)  NULL,
    [NhaCC] nvarchar(500)  NOT NULL,
    [SuaDoi] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'tblCTTonHang'
CREATE TABLE [dbo].[tblCTTonHang] (
    [ID_TonH] int  NULL,
    [Id_Hang] varchar(20)  NULL,
    [SoLuong] float  NOT NULL,
    [GhiChu] nvarchar(1000)  NOT NULL,
    [KhuVuc] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'tblChiTietHDNH'
CREATE TABLE [dbo].[tblChiTietHDNH] (
    [ID_HDNH] nvarchar(30)  NULL,
    [ID_Hang] varchar(20)  NOT NULL,
    [SoLuong] float  NOT NULL,
    [DuyetH] int  NOT NULL
);
GO

-- Creating table 'tblQuyenNV'
CREATE TABLE [dbo].[tblQuyenNV] (
    [ID_NhanVien] int  NOT NULL,
    [ID_PhanQuyen] varchar(20)  NULL,
    [NgayPQ] varchar(100)  NOT NULL
);
GO

-- Creating table 'BanChoThanhToan'
CREATE TABLE [dbo].[BanChoThanhToan] (
    [ID_Ban] varchar(10)  NOT NULL,
    [ID_HDOder] int  NOT NULL,
    [TenBan] nvarchar(100)  NOT NULL,
    [SoGhe] int  NOT NULL,
    [KhuVuc] nvarchar(200)  NULL,
    [TenLoaiBan] nvarchar(100)  NOT NULL,
    [ViTri] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'ChiTietHoaDonOder'
CREATE TABLE [dbo].[ChiTietHoaDonOder] (
    [ID_HDOder] int  NOT NULL,
    [ID_Buffe] varchar(20)  NOT NULL,
    [TenBF] nvarchar(300)  NOT NULL,
    [GiaBF] float  NOT NULL,
    [SoLuong] int  NOT NULL,
    [Image] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DanhSachGiaoDich'
CREATE TABLE [dbo].[DanhSachGiaoDich] (
    [ID_GiaoDich] int  NOT NULL,
    [TenGD] nvarchar(300)  NOT NULL,
    [ThoiGianGD] varchar(30)  NOT NULL,
    [ID_HD_Oder] int  NULL,
    [DO] nvarchar(200)  NOT NULL,
    [MO] nvarchar(200)  NOT NULL,
    [TinhTrang] int  NOT NULL,
    [HinhThucTT] nvarchar(100)  NULL,
    [PhiDV] float  NOT NULL,
    [TienBanDau] float  NOT NULL,
    [TienCuoi] float  NOT NULL,
    [GhiChu] nvarchar(3000)  NULL
);
GO

-- Creating table 'DanhSachHD'
CREATE TABLE [dbo].[DanhSachHD] (
    [ID_HDOder] int  NOT NULL,
    [TenKH] nvarchar(300)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [NgayVao] varchar(40)  NOT NULL,
    [GioVao] nvarchar(30)  NULL,
    [GioRa] varchar(40)  NULL,
    [SoKhach] int  NOT NULL,
    [TenNV] nvarchar(200)  NOT NULL,
    [TenBan] nvarchar(100)  NOT NULL,
    [Thue] float  NOT NULL,
    [TongTien] float  NOT NULL,
    [GhiChu] nvarchar(1000)  NULL,
    [TTThanhToan] int  NOT NULL
);
GO

-- Creating table 'DanhSachHDCTT'
CREATE TABLE [dbo].[DanhSachHDCTT] (
    [ID_GiaoDich] int  NOT NULL,
    [ID_HDOder] int  NOT NULL,
    [TenKH] nvarchar(300)  NOT NULL,
    [GioVao] nvarchar(30)  NULL,
    [TienBanDau] float  NOT NULL,
    [TTThanhToan] int  NOT NULL
);
GO

-- Creating table 'DanhSachHoaDon'
CREATE TABLE [dbo].[DanhSachHoaDon] (
    [SoHieuHD] nvarchar(30)  NOT NULL,
    [NgayDat] varchar(40)  NULL,
    [NgayGiao] varchar(40)  NOT NULL,
    [ThanhTien] float  NOT NULL,
    [TenNV] nvarchar(200)  NOT NULL,
    [TenChucVu] nvarchar(200)  NOT NULL,
    [DuyetHD] int  NOT NULL
);
GO

-- Creating table 'DanhSachMatHang'
CREATE TABLE [dbo].[DanhSachMatHang] (
    [ID_Hang] varchar(20)  NOT NULL,
    [TenHang] nvarchar(500)  NOT NULL,
    [MoTa] nvarchar(100)  NOT NULL,
    [SoLuong] float  NOT NULL,
    [DonViTon] varchar(10)  NOT NULL,
    [MucGia] float  NOT NULL,
    [HanSudung] nvarchar(50)  NOT NULL,
    [TenLoai] nvarchar(200)  NOT NULL,
    [TenNCC] nvarchar(500)  NOT NULL,
    [Tien] float  NOT NULL
);
GO

-- Creating table 'DanhSachNhanVien'
CREATE TABLE [dbo].[DanhSachNhanVien] (
    [ID_NhanVien] int  NOT NULL,
    [TenNV] nvarchar(200)  NOT NULL,
    [NgaySinh] varchar(20)  NOT NULL,
    [GioiTinh] int  NOT NULL,
    [IDCanCuoc] varchar(20)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [TinhTrangSK] nvarchar(300)  NULL,
    [NgayVaoLam] varchar(20)  NOT NULL,
    [TenChucVu] nvarchar(200)  NOT NULL,
    [LamViec] int  NOT NULL,
    [QueQuan] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'DatTruocBan'
CREATE TABLE [dbo].[DatTruocBan] (
    [ID_Ban] int  NOT NULL,
    [ID_BanNH] varchar(10)  NOT NULL,
    [TenKH] nvarchar(300)  NOT NULL,
    [SoDT] varchar(20)  NOT NULL,
    [NgayDat] varchar(20)  NULL,
    [GioDat] nvarchar(30)  NULL,
    [SoKhach] int  NOT NULL,
    [Note] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'DSAllMatHang'
CREATE TABLE [dbo].[DSAllMatHang] (
    [ID_Hang] varchar(20)  NOT NULL,
    [TenHang] nvarchar(500)  NOT NULL,
    [MoTa] nvarchar(100)  NOT NULL,
    [SoLuong] float  NOT NULL,
    [DonViTon] varchar(10)  NOT NULL,
    [MucGia] float  NOT NULL,
    [HanSudung] nvarchar(50)  NOT NULL,
    [TenLoai] nvarchar(200)  NOT NULL,
    [TenNCC] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'DsBanNH'
CREATE TABLE [dbo].[DsBanNH] (
    [ID_Ban] varchar(10)  NOT NULL,
    [TenBan] nvarchar(100)  NOT NULL,
    [MoTa] nvarchar(500)  NOT NULL,
    [ViTri] nvarchar(500)  NOT NULL,
    [SoGhe] int  NOT NULL,
    [TinhTrang] int  NOT NULL,
    [KhuVuc] nvarchar(200)  NULL,
    [SuDung] int  NOT NULL,
    [TenLoaiBan] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'DsBuffet'
CREATE TABLE [dbo].[DsBuffet] (
    [ID_Buffe] varchar(20)  NOT NULL,
    [TenBF] nvarchar(300)  NOT NULL,
    [GiaBF] float  NOT NULL,
    [NgayTao] varchar(40)  NOT NULL,
    [Thue] float  NOT NULL,
    [SuDung] int  NOT NULL,
    [Image] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DsMonAnAll'
CREATE TABLE [dbo].[DsMonAnAll] (
    [ID_MonAn] nvarchar(15)  NOT NULL,
    [TenMon] nvarchar(200)  NOT NULL,
    [GiaMon] float  NOT NULL,
    [MoTa] nvarchar(200)  NOT NULL,
    [TracMon] nvarchar(max)  NOT NULL,
    [SuDung] int  NULL,
    [HinhAnh] nvarchar(max)  NULL
);
GO

-- Creating table 'ThanhPhanHang'
CREATE TABLE [dbo].[ThanhPhanHang] (
    [TenLoai] nvarchar(200)  NOT NULL,
    [SoLuong] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID_Assitant] in table 'ChuNhaHang'
ALTER TABLE [dbo].[ChuNhaHang]
ADD CONSTRAINT [PK_ChuNhaHang]
    PRIMARY KEY CLUSTERED ([ID_Assitant] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [ID_Ban] in table 'tblBanNH'
ALTER TABLE [dbo].[tblBanNH]
ADD CONSTRAINT [PK_tblBanNH]
    PRIMARY KEY CLUSTERED ([ID_Ban] ASC);
GO

-- Creating primary key on [ID_Buffe] in table 'tblBuffet'
ALTER TABLE [dbo].[tblBuffet]
ADD CONSTRAINT [PK_tblBuffet]
    PRIMARY KEY CLUSTERED ([ID_Buffe] ASC);
GO

-- Creating primary key on [ID_Buffet], [ID_Mon] in table 'tblChiTietBuffet'
ALTER TABLE [dbo].[tblChiTietBuffet]
ADD CONSTRAINT [PK_tblChiTietBuffet]
    PRIMARY KEY CLUSTERED ([ID_Buffet], [ID_Mon] ASC);
GO

-- Creating primary key on [ID_HDOder], [ID_Mon] in table 'tblChiTietGoiMon'
ALTER TABLE [dbo].[tblChiTietGoiMon]
ADD CONSTRAINT [PK_tblChiTietGoiMon]
    PRIMARY KEY CLUSTERED ([ID_HDOder], [ID_Mon] ASC);
GO

-- Creating primary key on [ID_MonAn], [ID_Hang] in table 'tblChiTietMon'
ALTER TABLE [dbo].[tblChiTietMon]
ADD CONSTRAINT [PK_tblChiTietMon]
    PRIMARY KEY CLUSTERED ([ID_MonAn], [ID_Hang] ASC);
GO

-- Creating primary key on [ID_HDOder], [ID_Buffet] in table 'tblChiTietOderBuffet'
ALTER TABLE [dbo].[tblChiTietOderBuffet]
ADD CONSTRAINT [PK_tblChiTietOderBuffet]
    PRIMARY KEY CLUSTERED ([ID_HDOder], [ID_Buffet] ASC);
GO

-- Creating primary key on [ID_ChucVu] in table 'tblChucVu'
ALTER TABLE [dbo].[tblChucVu]
ADD CONSTRAINT [PK_tblChucVu]
    PRIMARY KEY CLUSTERED ([ID_ChucVu] ASC);
GO

-- Creating primary key on [ID_Ban] in table 'tblDatBan'
ALTER TABLE [dbo].[tblDatBan]
ADD CONSTRAINT [PK_tblDatBan]
    PRIMARY KEY CLUSTERED ([ID_Ban] ASC);
GO

-- Creating primary key on [ID_GiaoDich] in table 'tblGiaoDich'
ALTER TABLE [dbo].[tblGiaoDich]
ADD CONSTRAINT [PK_tblGiaoDich]
    PRIMARY KEY CLUSTERED ([ID_GiaoDich] ASC);
GO

-- Creating primary key on [SoHieuHD] in table 'tblHDNhapHang'
ALTER TABLE [dbo].[tblHDNhapHang]
ADD CONSTRAINT [PK_tblHDNhapHang]
    PRIMARY KEY CLUSTERED ([SoHieuHD] ASC);
GO

-- Creating primary key on [ID_HDOder] in table 'tblHDOder'
ALTER TABLE [dbo].[tblHDOder]
ADD CONSTRAINT [PK_tblHDOder]
    PRIMARY KEY CLUSTERED ([ID_HDOder] ASC);
GO

-- Creating primary key on [ID_LoaiBan] in table 'tblLoaiBan'
ALTER TABLE [dbo].[tblLoaiBan]
ADD CONSTRAINT [PK_tblLoaiBan]
    PRIMARY KEY CLUSTERED ([ID_LoaiBan] ASC);
GO

-- Creating primary key on [ID_LoaiH] in table 'tblLoaiHang'
ALTER TABLE [dbo].[tblLoaiHang]
ADD CONSTRAINT [PK_tblLoaiHang]
    PRIMARY KEY CLUSTERED ([ID_LoaiH] ASC);
GO

-- Creating primary key on [ID_Hang] in table 'tblMatHang'
ALTER TABLE [dbo].[tblMatHang]
ADD CONSTRAINT [PK_tblMatHang]
    PRIMARY KEY CLUSTERED ([ID_Hang] ASC);
GO

-- Creating primary key on [ID_MonAn] in table 'tblMonAn'
ALTER TABLE [dbo].[tblMonAn]
ADD CONSTRAINT [PK_tblMonAn]
    PRIMARY KEY CLUSTERED ([ID_MonAn] ASC);
GO

-- Creating primary key on [ID_NCC] in table 'tblNhaCC'
ALTER TABLE [dbo].[tblNhaCC]
ADD CONSTRAINT [PK_tblNhaCC]
    PRIMARY KEY CLUSTERED ([ID_NCC] ASC);
GO

-- Creating primary key on [ID_NhanVien] in table 'tblNhanVien'
ALTER TABLE [dbo].[tblNhanVien]
ADD CONSTRAINT [PK_tblNhanVien]
    PRIMARY KEY CLUSTERED ([ID_NhanVien] ASC);
GO

-- Creating primary key on [ID_Pr_Mix] in table 'tblProductMix'
ALTER TABLE [dbo].[tblProductMix]
ADD CONSTRAINT [PK_tblProductMix]
    PRIMARY KEY CLUSTERED ([ID_Pr_Mix] ASC);
GO

-- Creating primary key on [ID_Quyen] in table 'tblPhanQuyen'
ALTER TABLE [dbo].[tblPhanQuyen]
ADD CONSTRAINT [PK_tblPhanQuyen]
    PRIMARY KEY CLUSTERED ([ID_Quyen] ASC);
GO

-- Creating primary key on [ID_Acc] in table 'tblTaiKhoan'
ALTER TABLE [dbo].[tblTaiKhoan]
ADD CONSTRAINT [PK_tblTaiKhoan]
    PRIMARY KEY CLUSTERED ([ID_Acc] ASC);
GO

-- Creating primary key on [ID_THang] in table 'tblTonHang'
ALTER TABLE [dbo].[tblTonHang]
ADD CONSTRAINT [PK_tblTonHang]
    PRIMARY KEY CLUSTERED ([ID_THang] ASC);
GO

-- Creating primary key on [TenHang], [DonViTon], [GiaHang], [TonKho], [TonDau], [NhapThuc], [XuatThuc], [PhanTram], [NhaCC], [SuaDoi] in table 'tblCT_ProductMix'
ALTER TABLE [dbo].[tblCT_ProductMix]
ADD CONSTRAINT [PK_tblCT_ProductMix]
    PRIMARY KEY CLUSTERED ([TenHang], [DonViTon], [GiaHang], [TonKho], [TonDau], [NhapThuc], [XuatThuc], [PhanTram], [NhaCC], [SuaDoi] ASC);
GO

-- Creating primary key on [SoLuong], [GhiChu], [KhuVuc] in table 'tblCTTonHang'
ALTER TABLE [dbo].[tblCTTonHang]
ADD CONSTRAINT [PK_tblCTTonHang]
    PRIMARY KEY CLUSTERED ([SoLuong], [GhiChu], [KhuVuc] ASC);
GO

-- Creating primary key on [ID_Hang], [SoLuong], [DuyetH] in table 'tblChiTietHDNH'
ALTER TABLE [dbo].[tblChiTietHDNH]
ADD CONSTRAINT [PK_tblChiTietHDNH]
    PRIMARY KEY CLUSTERED ([ID_Hang], [SoLuong], [DuyetH] ASC);
GO

-- Creating primary key on [ID_NhanVien], [NgayPQ] in table 'tblQuyenNV'
ALTER TABLE [dbo].[tblQuyenNV]
ADD CONSTRAINT [PK_tblQuyenNV]
    PRIMARY KEY CLUSTERED ([ID_NhanVien], [NgayPQ] ASC);
GO

-- Creating primary key on [ID_Ban], [ID_HDOder], [TenBan], [SoGhe], [TenLoaiBan], [ViTri] in table 'BanChoThanhToan'
ALTER TABLE [dbo].[BanChoThanhToan]
ADD CONSTRAINT [PK_BanChoThanhToan]
    PRIMARY KEY CLUSTERED ([ID_Ban], [ID_HDOder], [TenBan], [SoGhe], [TenLoaiBan], [ViTri] ASC);
GO

-- Creating primary key on [ID_HDOder], [ID_Buffe], [TenBF], [GiaBF], [SoLuong], [Image] in table 'ChiTietHoaDonOder'
ALTER TABLE [dbo].[ChiTietHoaDonOder]
ADD CONSTRAINT [PK_ChiTietHoaDonOder]
    PRIMARY KEY CLUSTERED ([ID_HDOder], [ID_Buffe], [TenBF], [GiaBF], [SoLuong], [Image] ASC);
GO

-- Creating primary key on [ID_GiaoDich], [TenGD], [ThoiGianGD], [DO], [MO], [TinhTrang], [PhiDV], [TienBanDau], [TienCuoi] in table 'DanhSachGiaoDich'
ALTER TABLE [dbo].[DanhSachGiaoDich]
ADD CONSTRAINT [PK_DanhSachGiaoDich]
    PRIMARY KEY CLUSTERED ([ID_GiaoDich], [TenGD], [ThoiGianGD], [DO], [MO], [TinhTrang], [PhiDV], [TienBanDau], [TienCuoi] ASC);
GO

-- Creating primary key on [ID_HDOder], [TenKH], [SoDT], [NgayVao], [SoKhach], [TenNV], [TenBan], [Thue], [TongTien], [TTThanhToan] in table 'DanhSachHD'
ALTER TABLE [dbo].[DanhSachHD]
ADD CONSTRAINT [PK_DanhSachHD]
    PRIMARY KEY CLUSTERED ([ID_HDOder], [TenKH], [SoDT], [NgayVao], [SoKhach], [TenNV], [TenBan], [Thue], [TongTien], [TTThanhToan] ASC);
GO

-- Creating primary key on [ID_GiaoDich], [ID_HDOder], [TenKH], [TienBanDau], [TTThanhToan] in table 'DanhSachHDCTT'
ALTER TABLE [dbo].[DanhSachHDCTT]
ADD CONSTRAINT [PK_DanhSachHDCTT]
    PRIMARY KEY CLUSTERED ([ID_GiaoDich], [ID_HDOder], [TenKH], [TienBanDau], [TTThanhToan] ASC);
GO

-- Creating primary key on [SoHieuHD], [NgayGiao], [ThanhTien], [TenNV], [TenChucVu], [DuyetHD] in table 'DanhSachHoaDon'
ALTER TABLE [dbo].[DanhSachHoaDon]
ADD CONSTRAINT [PK_DanhSachHoaDon]
    PRIMARY KEY CLUSTERED ([SoHieuHD], [NgayGiao], [ThanhTien], [TenNV], [TenChucVu], [DuyetHD] ASC);
GO

-- Creating primary key on [ID_Hang], [TenHang], [MoTa], [SoLuong], [DonViTon], [MucGia], [HanSudung], [TenLoai], [TenNCC], [Tien] in table 'DanhSachMatHang'
ALTER TABLE [dbo].[DanhSachMatHang]
ADD CONSTRAINT [PK_DanhSachMatHang]
    PRIMARY KEY CLUSTERED ([ID_Hang], [TenHang], [MoTa], [SoLuong], [DonViTon], [MucGia], [HanSudung], [TenLoai], [TenNCC], [Tien] ASC);
GO

-- Creating primary key on [ID_NhanVien], [TenNV], [NgaySinh], [GioiTinh], [IDCanCuoc], [SoDT], [NgayVaoLam], [TenChucVu], [LamViec], [QueQuan] in table 'DanhSachNhanVien'
ALTER TABLE [dbo].[DanhSachNhanVien]
ADD CONSTRAINT [PK_DanhSachNhanVien]
    PRIMARY KEY CLUSTERED ([ID_NhanVien], [TenNV], [NgaySinh], [GioiTinh], [IDCanCuoc], [SoDT], [NgayVaoLam], [TenChucVu], [LamViec], [QueQuan] ASC);
GO

-- Creating primary key on [ID_Ban], [ID_BanNH], [TenKH], [SoDT], [SoKhach], [Note] in table 'DatTruocBan'
ALTER TABLE [dbo].[DatTruocBan]
ADD CONSTRAINT [PK_DatTruocBan]
    PRIMARY KEY CLUSTERED ([ID_Ban], [ID_BanNH], [TenKH], [SoDT], [SoKhach], [Note] ASC);
GO

-- Creating primary key on [ID_Hang], [TenHang], [MoTa], [SoLuong], [DonViTon], [MucGia], [HanSudung], [TenLoai], [TenNCC] in table 'DSAllMatHang'
ALTER TABLE [dbo].[DSAllMatHang]
ADD CONSTRAINT [PK_DSAllMatHang]
    PRIMARY KEY CLUSTERED ([ID_Hang], [TenHang], [MoTa], [SoLuong], [DonViTon], [MucGia], [HanSudung], [TenLoai], [TenNCC] ASC);
GO

-- Creating primary key on [ID_Ban], [TenBan], [MoTa], [ViTri], [SoGhe], [TinhTrang], [SuDung], [TenLoaiBan] in table 'DsBanNH'
ALTER TABLE [dbo].[DsBanNH]
ADD CONSTRAINT [PK_DsBanNH]
    PRIMARY KEY CLUSTERED ([ID_Ban], [TenBan], [MoTa], [ViTri], [SoGhe], [TinhTrang], [SuDung], [TenLoaiBan] ASC);
GO

-- Creating primary key on [ID_Buffe], [TenBF], [GiaBF], [NgayTao], [Thue], [SuDung], [Image] in table 'DsBuffet'
ALTER TABLE [dbo].[DsBuffet]
ADD CONSTRAINT [PK_DsBuffet]
    PRIMARY KEY CLUSTERED ([ID_Buffe], [TenBF], [GiaBF], [NgayTao], [Thue], [SuDung], [Image] ASC);
GO

-- Creating primary key on [ID_MonAn], [TenMon], [GiaMon], [MoTa], [TracMon] in table 'DsMonAnAll'
ALTER TABLE [dbo].[DsMonAnAll]
ADD CONSTRAINT [PK_DsMonAnAll]
    PRIMARY KEY CLUSTERED ([ID_MonAn], [TenMon], [GiaMon], [MoTa], [TracMon] ASC);
GO

-- Creating primary key on [TenLoai] in table 'ThanhPhanHang'
ALTER TABLE [dbo].[ThanhPhanHang]
ADD CONSTRAINT [PK_ThanhPhanHang]
    PRIMARY KEY CLUSTERED ([TenLoai] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_NV] in table 'ChuNhaHang'
ALTER TABLE [dbo].[ChuNhaHang]
ADD CONSTRAINT [FK_CNH_NV]
    FOREIGN KEY ([Id_NV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CNH_NV'
CREATE INDEX [IX_FK_CNH_NV]
ON [dbo].[ChuNhaHang]
    ([Id_NV]);
GO

-- Creating foreign key on [MaNH] in table 'tblTaiKhoan'
ALTER TABLE [dbo].[tblTaiKhoan]
ADD CONSTRAINT [FK_TK_tblNH]
    FOREIGN KEY ([MaNH])
    REFERENCES [dbo].[ChuNhaHang]
        ([ID_Assitant])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TK_tblNH'
CREATE INDEX [IX_FK_TK_tblNH]
ON [dbo].[tblTaiKhoan]
    ([MaNH]);
GO

-- Creating foreign key on [ID_BanDat] in table 'tblDatBan'
ALTER TABLE [dbo].[tblDatBan]
ADD CONSTRAINT [FK_B_BNH]
    FOREIGN KEY ([ID_BanDat])
    REFERENCES [dbo].[tblBanNH]
        ([ID_Ban])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_B_BNH'
CREATE INDEX [IX_FK_B_BNH]
ON [dbo].[tblDatBan]
    ([ID_BanDat]);
GO

-- Creating foreign key on [ID_LoaiBan] in table 'tblBanNH'
ALTER TABLE [dbo].[tblBanNH]
ADD CONSTRAINT [FK_B_LB]
    FOREIGN KEY ([ID_LoaiBan])
    REFERENCES [dbo].[tblLoaiBan]
        ([ID_LoaiBan])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_B_LB'
CREATE INDEX [IX_FK_B_LB]
ON [dbo].[tblBanNH]
    ([ID_LoaiBan]);
GO

-- Creating foreign key on [ID_Ban] in table 'tblHDOder'
ALTER TABLE [dbo].[tblHDOder]
ADD CONSTRAINT [FK_OD_BNH]
    FOREIGN KEY ([ID_Ban])
    REFERENCES [dbo].[tblBanNH]
        ([ID_Ban])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OD_BNH'
CREATE INDEX [IX_FK_OD_BNH]
ON [dbo].[tblHDOder]
    ([ID_Ban]);
GO

-- Creating foreign key on [ID_Buffet] in table 'tblChiTietOderBuffet'
ALTER TABLE [dbo].[tblChiTietOderBuffet]
ADD CONSTRAINT [FK__tblChiTie__ID_Bu__123EB7A3]
    FOREIGN KEY ([ID_Buffet])
    REFERENCES [dbo].[tblBuffet]
        ([ID_Buffe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblChiTie__ID_Bu__123EB7A3'
CREATE INDEX [IX_FK__tblChiTie__ID_Bu__123EB7A3]
ON [dbo].[tblChiTietOderBuffet]
    ([ID_Buffet]);
GO

-- Creating foreign key on [ID_Buffet] in table 'tblChiTietBuffet'
ALTER TABLE [dbo].[tblChiTietBuffet]
ADD CONSTRAINT [FK_CTBF_BF]
    FOREIGN KEY ([ID_Buffet])
    REFERENCES [dbo].[tblBuffet]
        ([ID_Buffe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Mon] in table 'tblChiTietBuffet'
ALTER TABLE [dbo].[tblChiTietBuffet]
ADD CONSTRAINT [FK_CTBF_MA]
    FOREIGN KEY ([ID_Mon])
    REFERENCES [dbo].[tblMonAn]
        ([ID_MonAn])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CTBF_MA'
CREATE INDEX [IX_FK_CTBF_MA]
ON [dbo].[tblChiTietBuffet]
    ([ID_Mon]);
GO

-- Creating foreign key on [ID_Mon] in table 'tblChiTietGoiMon'
ALTER TABLE [dbo].[tblChiTietGoiMon]
ADD CONSTRAINT [FK__tblChiTie__ID_Mo__17F790F9]
    FOREIGN KEY ([ID_Mon])
    REFERENCES [dbo].[tblMonAn]
        ([ID_MonAn])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblChiTie__ID_Mo__17F790F9'
CREATE INDEX [IX_FK__tblChiTie__ID_Mo__17F790F9]
ON [dbo].[tblChiTietGoiMon]
    ([ID_Mon]);
GO

-- Creating foreign key on [ID_HDOder] in table 'tblChiTietGoiMon'
ALTER TABLE [dbo].[tblChiTietGoiMon]
ADD CONSTRAINT [FK_CTOD_MO]
    FOREIGN KEY ([ID_HDOder])
    REFERENCES [dbo].[tblHDOder]
        ([ID_HDOder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_Hang] in table 'tblChiTietMon'
ALTER TABLE [dbo].[tblChiTietMon]
ADD CONSTRAINT [FK_CT_H]
    FOREIGN KEY ([ID_Hang])
    REFERENCES [dbo].[tblMatHang]
        ([ID_Hang])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CT_H'
CREATE INDEX [IX_FK_CT_H]
ON [dbo].[tblChiTietMon]
    ([ID_Hang]);
GO

-- Creating foreign key on [ID_MonAn] in table 'tblChiTietMon'
ALTER TABLE [dbo].[tblChiTietMon]
ADD CONSTRAINT [FK_CT_MA]
    FOREIGN KEY ([ID_MonAn])
    REFERENCES [dbo].[tblMonAn]
        ([ID_MonAn])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_HDOder] in table 'tblChiTietOderBuffet'
ALTER TABLE [dbo].[tblChiTietOderBuffet]
ADD CONSTRAINT [FK_CTOD_OD]
    FOREIGN KEY ([ID_HDOder])
    REFERENCES [dbo].[tblHDOder]
        ([ID_HDOder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_ChucVu] in table 'tblNhanVien'
ALTER TABLE [dbo].[tblNhanVien]
ADD CONSTRAINT [FK_NV_CV]
    FOREIGN KEY ([ID_ChucVu])
    REFERENCES [dbo].[tblChucVu]
        ([ID_ChucVu])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NV_CV'
CREATE INDEX [IX_FK_NV_CV]
ON [dbo].[tblNhanVien]
    ([ID_ChucVu]);
GO

-- Creating foreign key on [ID_HD_Oder] in table 'tblGiaoDich'
ALTER TABLE [dbo].[tblGiaoDich]
ADD CONSTRAINT [FK_PK_GD_HDOD]
    FOREIGN KEY ([ID_HD_Oder])
    REFERENCES [dbo].[tblHDOder]
        ([ID_HDOder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PK_GD_HDOD'
CREATE INDEX [IX_FK_PK_GD_HDOD]
ON [dbo].[tblGiaoDich]
    ([ID_HD_Oder]);
GO

-- Creating foreign key on [ID_NVDo] in table 'tblGiaoDich'
ALTER TABLE [dbo].[tblGiaoDich]
ADD CONSTRAINT [FK_PK_GD_NVDO]
    FOREIGN KEY ([ID_NVDo])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PK_GD_NVDO'
CREATE INDEX [IX_FK_PK_GD_NVDO]
ON [dbo].[tblGiaoDich]
    ([ID_NVDo]);
GO

-- Creating foreign key on [ID_NVMo] in table 'tblGiaoDich'
ALTER TABLE [dbo].[tblGiaoDich]
ADD CONSTRAINT [FK_PK_GD_NVMO]
    FOREIGN KEY ([ID_NVMo])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PK_GD_NVMO'
CREATE INDEX [IX_FK_PK_GD_NVMO]
ON [dbo].[tblGiaoDich]
    ([ID_NVMo]);
GO

-- Creating foreign key on [ID_HDNH] in table 'tblChiTietHDNH'
ALTER TABLE [dbo].[tblChiTietHDNH]
ADD CONSTRAINT [FK_CT_HDNH_FK]
    FOREIGN KEY ([ID_HDNH])
    REFERENCES [dbo].[tblHDNhapHang]
        ([SoHieuHD])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CT_HDNH_FK'
CREATE INDEX [IX_FK_CT_HDNH_FK]
ON [dbo].[tblChiTietHDNH]
    ([ID_HDNH]);
GO

-- Creating foreign key on [ID_NV] in table 'tblHDNhapHang'
ALTER TABLE [dbo].[tblHDNhapHang]
ADD CONSTRAINT [FK_NV_HDNH]
    FOREIGN KEY ([ID_NV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NV_HDNH'
CREATE INDEX [IX_FK_NV_HDNH]
ON [dbo].[tblHDNhapHang]
    ([ID_NV]);
GO

-- Creating foreign key on [ID_NV] in table 'tblHDOder'
ALTER TABLE [dbo].[tblHDOder]
ADD CONSTRAINT [FK_NV_HDOD]
    FOREIGN KEY ([ID_NV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NV_HDOD'
CREATE INDEX [IX_FK_NV_HDOD]
ON [dbo].[tblHDOder]
    ([ID_NV]);
GO

-- Creating foreign key on [ID_LoaiH] in table 'tblMatHang'
ALTER TABLE [dbo].[tblMatHang]
ADD CONSTRAINT [FK_H_MaLH]
    FOREIGN KEY ([ID_LoaiH])
    REFERENCES [dbo].[tblLoaiHang]
        ([ID_LoaiH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_H_MaLH'
CREATE INDEX [IX_FK_H_MaLH]
ON [dbo].[tblMatHang]
    ([ID_LoaiH]);
GO

-- Creating foreign key on [ID_Hang] in table 'tblCT_ProductMix'
ALTER TABLE [dbo].[tblCT_ProductMix]
ADD CONSTRAINT [FK__tblCT_Pro__ID_Ha__0DCF0841]
    FOREIGN KEY ([ID_Hang])
    REFERENCES [dbo].[tblMatHang]
        ([ID_Hang])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblCT_Pro__ID_Ha__0DCF0841'
CREATE INDEX [IX_FK__tblCT_Pro__ID_Ha__0DCF0841]
ON [dbo].[tblCT_ProductMix]
    ([ID_Hang]);
GO

-- Creating foreign key on [Id_Hang] in table 'tblCTTonHang'
ALTER TABLE [dbo].[tblCTTonHang]
ADD CONSTRAINT [FK_CTTH_HH]
    FOREIGN KEY ([Id_Hang])
    REFERENCES [dbo].[tblMatHang]
        ([ID_Hang])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CTTH_HH'
CREATE INDEX [IX_FK_CTTH_HH]
ON [dbo].[tblCTTonHang]
    ([Id_Hang]);
GO

-- Creating foreign key on [ID_NCC] in table 'tblMatHang'
ALTER TABLE [dbo].[tblMatHang]
ADD CONSTRAINT [FK_H_NCC]
    FOREIGN KEY ([ID_NCC])
    REFERENCES [dbo].[tblNhaCC]
        ([ID_NCC])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_H_NCC'
CREATE INDEX [IX_FK_H_NCC]
ON [dbo].[tblMatHang]
    ([ID_NCC]);
GO

-- Creating foreign key on [ID_Hang] in table 'tblChiTietHDNH'
ALTER TABLE [dbo].[tblChiTietHDNH]
ADD CONSTRAINT [FK_HD_H]
    FOREIGN KEY ([ID_Hang])
    REFERENCES [dbo].[tblMatHang]
        ([ID_Hang])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_NV] in table 'tblTaiKhoan'
ALTER TABLE [dbo].[tblTaiKhoan]
ADD CONSTRAINT [FK_ACC_tblNV]
    FOREIGN KEY ([ID_NV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ACC_tblNV'
CREATE INDEX [IX_FK_ACC_tblNV]
ON [dbo].[tblTaiKhoan]
    ([ID_NV]);
GO

-- Creating foreign key on [ID_NhanVien] in table 'tblQuyenNV'
ALTER TABLE [dbo].[tblQuyenNV]
ADD CONSTRAINT [FK_PQ_NV]
    FOREIGN KEY ([ID_NhanVien])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MaNV] in table 'tblTonHang'
ALTER TABLE [dbo].[tblTonHang]
ADD CONSTRAINT [FK_TH_NV]
    FOREIGN KEY ([MaNV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TH_NV'
CREATE INDEX [IX_FK_TH_NV]
ON [dbo].[tblTonHang]
    ([MaNV]);
GO

-- Creating foreign key on [IdNV] in table 'tblProductMix'
ALTER TABLE [dbo].[tblProductMix]
ADD CONSTRAINT [FK_PK_NV]
    FOREIGN KEY ([IdNV])
    REFERENCES [dbo].[tblNhanVien]
        ([ID_NhanVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PK_NV'
CREATE INDEX [IX_FK_PK_NV]
ON [dbo].[tblProductMix]
    ([IdNV]);
GO

-- Creating foreign key on [ID_Mix] in table 'tblCT_ProductMix'
ALTER TABLE [dbo].[tblCT_ProductMix]
ADD CONSTRAINT [FK_CT_Mix]
    FOREIGN KEY ([ID_Mix])
    REFERENCES [dbo].[tblProductMix]
        ([ID_Pr_Mix])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CT_Mix'
CREATE INDEX [IX_FK_CT_Mix]
ON [dbo].[tblCT_ProductMix]
    ([ID_Mix]);
GO

-- Creating foreign key on [ID_PhanQuyen] in table 'tblQuyenNV'
ALTER TABLE [dbo].[tblQuyenNV]
ADD CONSTRAINT [FK_PQ_PQ]
    FOREIGN KEY ([ID_PhanQuyen])
    REFERENCES [dbo].[tblPhanQuyen]
        ([ID_Quyen])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PQ_PQ'
CREATE INDEX [IX_FK_PQ_PQ]
ON [dbo].[tblQuyenNV]
    ([ID_PhanQuyen]);
GO

-- Creating foreign key on [ID_TonH] in table 'tblCTTonHang'
ALTER TABLE [dbo].[tblCTTonHang]
ADD CONSTRAINT [FK_TH_CT]
    FOREIGN KEY ([ID_TonH])
    REFERENCES [dbo].[tblTonHang]
        ([ID_THang])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TH_CT'
CREATE INDEX [IX_FK_TH_CT]
ON [dbo].[tblCTTonHang]
    ([ID_TonH]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------





-- Nha cung cap

INSERT INTO dbo.tblNhaCC
(ID_NCC,TenNCC,DiaChi,SoDt,TinhTrang)
VALUES 
	(   'NCC01', N'Minh Trí', N'13 Trần Thái Tông, Hà Nội', '0934723943', 1),
	(   'NCC02', N'CTCP Nhập khẩu HN', N'Hoàng Mai , Hà Nội', '0335689353', 1),
	(   'NCC03', N'CTTNHH Lan Anh', N'105 Nguyễn Hiền-Hai Bà Trưng- Hà Nội', '0218392394', 1),
	(   'NCC04', N'Fresfarm', N'Nguyễn Hiền-Hai Bà Trưng- Hà Nội', '02123809233', 1)

GO

INSERT INTO dbo.tblLoaiHang
(ID_LoaiH,TenLoai,MoTa)
VALUES
(   'LH01',N'Hàng đông', N'Hàng được bảo quản ở nhiệt độ từ -20  đến 0 độ' ),
(   'LH02',N'Hàng lạnh', N'Hàng được bảo quản ở nhiệt độ từ 8  đến 15 độ' ),
(   'LH03',N'Hàng mát', N'Hàng được bảo quản ở nhiệt độ từ 2  đến 8 độ' ),
(   'LH04',N'Hàng bình thường', N'Hàng được bảo quản ở nhiệt độ phòng' )
GO


INSERT INTO dbo.tblChucVu
(ID_ChucVu, TenChucVu,  MoTa, LuongCoBan)
VALUES
(   'CV01',   N'Nhân viên',  N'Nhân viên phục vụ', 25000  ),
(   'CV02',   N'Trợ lí',  N'Trợ lí phụ giúp quản lí', 40000  ),
(   'CV03',   N'Bếp trưởng',  N'Người chịu trách nhiệm bếp', 40000  ),
(   'CV04',   N'Quản lí',  N'Người quản lí trực tiếp giám sát nhà hàng',50000),
(   'CV05',   N'Giám đốc',  N'Người quản lí mở nhà hàng', 50000  )
GO
 
