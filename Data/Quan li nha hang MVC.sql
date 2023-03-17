

CREATE DATABASE DoAnQuanLiNH
GO
USE DoAnQuanLiNH
GO


CREATE TABLE tblNhaCC
(
ID_NCC VARCHAR(20) PRIMARY KEY,
TenNCC NVARCHAR(500) NOT NULL DEFAULT N'',
DiaChi NVARCHAR(500) NOT NULL DEFAULT N'',
SoDt VARCHAR(15) NOT NULL DEFAULT N'',
TinhTrang INT NOT NULL CHECK (TinhTrang IN (0,1)),
SuDung INT NOT NULL DEFAULT 1
)
GO

CREATE TABLE tblChucVu
(
ID_ChucVu VARCHAR(20) PRIMARY KEY,
TenChucVu NVARCHAR(200) NOT NULL DEFAULT N'',
MoTa NVARCHAR(500) NOT NULL DEFAULT N'',
LuongCoBan FLOAT NOT NULL DEFAULT 0
)
GO

SELECT * FROM dbo.tblNhanVien
UPDATE dbo.tblNhanVien SET LamViec= 1  WHERE ID_NhanVien=1
CREATE TABLE tblLoaiHang(
ID_LoaiH VARCHAR(10) PRIMARY KEY,
TenLoai NVARCHAR(200) NOT NULL DEFAULT N'',
MoTa NVARCHAR(1000) NOT NULL DEFAULT N''
)
GO

CREATE TABLE tblMatHang
(
ID_Hang VARCHAR(20) PRIMARY KEY,
TenHang NVARCHAR(500) NOT NULL DEFAULT N'',
MoTa NVARCHAR(100) NOT NULL DEFAULT N'',
SoLuong FLOAT NOT NULL DEFAULT 0,
DonViTon VARCHAR(10) NOT NULL DEFAULT N'',
MucGia FLOAT NOT NULL DEFAULT 0,
HanSudung NVARCHAR(50) NOT NULL DEFAULT N'',
ID_LoaiH VARCHAR(10) NOT NULL CONSTRAINT FK_H_MaLH FOREIGN KEY REFERENCES dbo.tblLoaiHang(ID_LoaiH),
ID_NCC VARCHAR(20) NOT NULL CONSTRAINT FK_H_NCC FOREIGN KEY REFERENCES dbo.tblNhaCC(ID_NCC),
SuDung INT DEFAULT 1
)
GO

CREATE TABLE   dbo.tblPhanQuyen  (
	ID_Quyen varchar(20) PRIMARY KEY ,
	  TenQuyen     nvarchar  (300) NOT NULL DEFAULT N''
	)
	GO
    

CREATE TABLE tblNhanVien 
( ID_NhanVien INT IDENTITY PRIMARY KEY,
TenNV NVARCHAR(200) NOT NULL DEFAULT N'',
NgaySinh VARCHAR(20) NOT NULL DEFAULT GETDATE() ,
GioiTinh INT NOT NULL DEFAULT 0,
IDCanCuoc VARCHAR(20) NOT NULL DEFAULT '',
SoDT VARCHAR(20) NOT NULL DEFAULT '',
TinhTrangSK NVARCHAR(300) NULL ,
NgayVaoLam VARCHAR(20) NOT NULL ,
ID_ChucVu VARCHAR(20) NOT NULL CONSTRAINT FK_NV_CV FOREIGN KEY REFERENCES dbo.tblChucVu(ID_ChucVu),
LamViec INT NOT NULL DEFAULT 1,
QueQuan  NVARCHAR(1000) NOT NULL DEFAULT N''
 )
GO

CREATE TABLE dbo.tblQuyenNV  (
	ID_NhanVien  INT NOT NULL PRIMARY KEY ,
	ID_PhanQuyen VARCHAR(20) NULL,
	NgayPQ     VARCHAR(100) NOT NULL DEFAULT N''
)
GO

CREATE TABLE tblHDNhapHang
(
SoHieuHD NVARCHAR(30) PRIMARY  KEY  ,
NgayDat VARCHAR(40) DEFAULT GETDATE(),
NgayDao VARCHAR(40) NOT NULL DEFAULT GETDATE(),
ThanhTien FLOAT NOT NULL DEFAULT 0,
ID_NV INT CONSTRAINT FK_NV_HDNH FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
DuyetHD INT NOT NULL DEFAULT 0
)
GO


CREATE TABLE tblChiTietHDNH
(ID_HDNH NVARCHAR(30) CONSTRAINT FK_CT_HDNH_FK FOREIGN KEY REFERENCES dbo.tblHDNhapHang(SoHieuHD),
ID_Hang VARCHAR(20) NOT NULL CONSTRAINT FK_HD_H FOREIGN KEY REFERENCES dbo.tblMatHang(ID_Hang),
SoLuong FLOAT NOT NULL DEFAULT 0,
DuyetH INT NOT NULL DEFAULT 0
)
GO

CREATE TABLE tblLoaiBan
( ID_LoaiBan VARCHAR(10) PRIMARY KEY,
TenLoaiBan NVARCHAR(100) NOT NULL DEFAULT N'Loại ',
SuDung INT NOT NULL DEFAULT 1 CONSTRAINT CK_SD_LoaiBan CHECK (SuDung IN (0,1)))

GO

CREATE TABLE tblBanNH
( ID_Ban VARCHAR(10)  PRIMARY KEY,
TenBan NVARCHAR(100) NOT NULL DEFAULT N'Bàn ',
MoTa NVARCHAR(500) NOT NULL DEFAULT N'',
ViTri NVARCHAR(500) NOT NULL DEFAULT N'',
SoGhe int NOT NULL DEFAULT 0,
TinhTrang INT NOT NULL DEFAULT 0,
KhuVuc NVARCHAR(200) NULL,
ID_LoaiBan VARCHAR(10) CONSTRAINT FK_B_LB FOREIGN KEY REFERENCES dbo.tblLoaiBan(ID_LoaiBan)
)
GO



CREATE TABLE tblDatBan
(
ID_Ban INT IDENTITY PRIMARY KEY,
TenKH NVARCHAR(300) NOT NULL DEFAULT N'',
SoDT VARCHAR(20) NOT NULL DEFAULT N'',
NgayDat  VARCHAR(40) NOT NULL DEFAULT GETDATE(),
GioDat NVARCHAR(30) NULL DEFAULT N'',
SoKhach INT NOT NULL DEFAULT 1,
ID_BanDat VARCHAR(10) CONSTRAINT FK_B_BNH FOREIGN KEY REFERENCES dbo.tblBanNH(ID_Ban),
Note NVARCHAR(1000) NOT NULL DEFAULT N'',
TinhTrang INT NOT NULL DEFAULT 0,
HuyBan INT NOT NULL DEFAULT 0
)


CREATE TABLE tblBuffet
(
ID_Buffe VARCHAR(20) PRIMARY KEY,
TenBF NVARCHAR(300) NOT NULL DEFAULT N'',
GiaBF FLOAT NOT NULL DEFAULT 0,
NgayTao VARCHAR(40) NOT NULL DEFAULT GETDATE(),
Thue FLOAT NOT NULL DEFAULT 0,
SuDung int NOT NULL DEFAULT 1,
Image NTEXT NOT NULL DEFAULT N'')

GO


CREATE TABLE tblMonAn
(
ID_MonAn NVARCHAR(15) PRIMARY KEY,
TenMon NVARCHAR(200) NOT NULL DEFAULT N'',
GiaMon FLOAT NOT NULL DEFAULT 0,
MoTa  NVARCHAR(200) NOT NULL DEFAULT N'',
TracMon NTEXT NOT NULL DEFAULT N'',
SuDung INT DEFAULT 1,
HinhAnh NTEXT DEFAULT N''
)
GO


CREATE TABLE tblChiTietMon 
( 
	ID_MonAn NVARCHAR(15) CONSTRAINT FK_CT_MA FOREIGN KEY REFERENCES dbo.tblMonAn(ID_MonAn),
	ID_Hang VARCHAR(20) CONSTRAINT FK_CT_H FOREIGN KEY REFERENCES dbo.tblMatHang(ID_Hang),
	DinhLuong FLOAT NOT NULL DEFAULT 0,
	DonViDung Nvarchar(10) Not null default N'',
	CONSTRAINT PK_CTMON PRIMARY KEY(ID_MonAn,ID_Hang)
)
GO
CREATE TABLE tblChiTietBuffet
( ID_Buffet VARCHAR(20) CONSTRAINT FK_CTBF_BF FOREIGN KEY REFERENCES dbo.tblBuffet(ID_Buffe),
ID_Mon NVARCHAR(15) CONSTRAINT FK_CTBF_MA FOREIGN KEY REFERENCES dbo.tblMonAn(ID_MonAn),
SoLuong FLOAT NOT NULL DEFAULT 0,
TongTien FLOAT NOT NULL DEFAULT 0,
CONSTRAINT PK_CTBF PRIMARY KEY(ID_Buffet,ID_Mon)
)
GO
CREATE TABLE tblHDOder
(
ID_HDOder INT IDENTITY PRIMARY KEY,
TenKH NVARCHAR(300) NOT NULL DEFAULT N'',
SoDT VARCHAR(20) NOT NULL DEFAULT N'',
NgayVao  VARCHAR(40) NOT NULL DEFAULT GETDATE(),
GioVao NVARCHAR(30) NULL DEFAULT N'',
GioRa VARCHAR(40) DEFAULT GETDATE(),
SoKhach INT NOT NULL DEFAULT 1,
ID_NV INT NOT NULL CONSTRAINT FK_NV_HDOD FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
ID_Ban VARCHAR(10) CONSTRAINT FK_OD_BNH FOREIGN KEY REFERENCES dbo.tblBanNH(ID_Ban),
Thue FLOAT NOT NULL DEFAULT 0,
TongTien FLOAT NOT NULL DEFAULT 0,
GhiChu NVARCHAR(1000) DEFAULT N'',
TTThanhToan INT NOT NULL DEFAULT 0
)
GO
CREATE TABLE tblChiTietOderBuffet(
ID_HDOder INT CONSTRAINT FK_CTOD_OD FOREIGN KEY REFERENCES dbo.tblHDOder(ID_HDOder),
ID_Buffet VARCHAR(20) FOREIGN KEY REFERENCES dbo.tblBuffet(ID_Buffe),
SoLuong INT NOT NULL DEFAULT 1,
GioOder VARCHAR(40) DEFAULT GETDATE(),
CONSTRAINT PK_CTOD PRIMARY KEY (ID_HDOder,ID_Buffet)
)
GO

CREATE TABLE tblChiTietGoiMon(
ID_HDOder INT CONSTRAINT FK_CTOD_MO FOREIGN KEY REFERENCES dbo.tblHDOder(ID_HDOder),
ID_Mon NVARCHAR(15) FOREIGN KEY REFERENCES dbo.tblMonAn(ID_MonAn),
SoLuong INT NOT NULL DEFAULT 1,
GioOder VARCHAR(40) DEFAULT GETDATE(),
CONSTRAINT PK_CTOD_MO PRIMARY KEY (ID_HDOder,ID_Mon)
)
GO


CREATE TABLE tblGiaoDich(
ID_GiaoDich INT IDENTITY PRIMARY KEY,
TenGD NVARCHAR(300) NOT NULL DEFAULT N'',
ThoiGianGD VARCHAR(30) NOT NULL DEFAULT GETDATE(),
ID_HD_Oder INT CONSTRAINT PK_GD_HDOD FOREIGN KEY REFERENCES dbo.tblHDOder(ID_HDOder),
ID_NVMo INT CONSTRAINT PK_GD_NVMO FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
ID_NVDo INT CONSTRAINT PK_GD_NVDO FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
TinhTrang INT NOT NULL DEFAULT 1,
HinhThucTT NVARCHAR(100) DEFAULT N'',
PhiDV FLOAT NOT NULL DEFAULT 0,
TienBanDau FLOAT NOT NULL DEFAULT 0,
TienCuoi FLOAT NOT NULL DEFAULT 0,
GhiChu NVARCHAR(3000) DEFAULT N''
)
GO


CREATE TABLE tblTonHang
(ID_THang INT IDENTITY NOT NULL  PRIMARY KEY,
TenTonH NVARCHAR(500) NOT NULL DEFAULT N'',
NgayTon VARCHAR(30) NOT NULL DEFAULT '',
KhuVuc NVARCHAR(100) NOT NULL DEFAULT '',
MaNV INT NOT NULL CONSTRAINT FK_TH_NV FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
GhiChu NVARCHAR(1000)
)
GO


CREATE TABLE tblCTTonHang
(ID_TonH INT CONSTRAINT FK_TH_CT FOREIGN KEY REFERENCES dbo.tblTonHang(ID_THang),
Id_Hang VARCHAR(20) CONSTRAINT FK_CTTH_HH FOREIGN KEY  REFERENCES dbo.tblMatHang(ID_Hang),
SoLuong FLOAT NOT NULL DEFAULT 0,
GhiChu NVARCHAR(1000) NOT NULL DEFAULT N'',
KhuVuc NVARCHAR(1000) NOT NULL DEFAULT N''
)
GO



CREATE TABLE ChuNhaHang(
ID_Assitant INT IDENTITY PRIMARY KEY,
TenCH NVARCHAR(300) NOT NULL DEFAULT N'',
TenQL NVARCHAR(300) NOT NULL DEFAULT N'',
SDT VARCHAR(20) NOT NULL,
Email VARCHAR(100) NOT NULL,
PassWrord NVARCHAR(200) NOT NULL,
Id_NV INT CONSTRAINT CNH_NV FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien)
)
GO


CREATE TABLE tblProductMix
(ID_Pr_Mix INT IDENTITY NOT NULL PRIMARY KEY ,
TenTon NVARCHAR(1000) NOT NULL DEFAULT N'',
NgayTon VARCHAR(30) NOT NULL DEFAULT '',
IdNV INT CONSTRAINT PK_NV FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
GhiChu NVARCHAR(1000) NOT NULL DEFAULT N''
)
GO

CREATE TABLE tblCT_ProductMix
(
	ID_Mix INT CONSTRAINT FK_CT_Mix FOREIGN KEY REFERENCES dbo.tblProductMix(ID_Pr_Mix),
	ID_Hang VARCHAR(20) FOREIGN KEY REFERENCES dbo.tblMatHang(ID_Hang),
	TenHang NVARCHAR(1000) NOT NULL DEFAULT N'',
	DonViTon NVARCHAR(10) NOT NULL DEFAULT N'',
	GiaHang FLOAT NOT NULL DEFAULT 0,
	TonKho FLOAT NOT NULL DEFAULT 0,
	TonDau FLOAT NOT NULL DEFAULT 0,
	NhapThuc FLOAT NOT NULL DEFAULT 0,
	XuatThuc FLOAT NOT NULL DEFAULT 0,
	PhanTram FLOAT NOT NULL DEFAULT 0,
	TenLoai NVARCHAR(100) DEFAULT N'',
	NhaCC NVARCHAR(500) NOT NULL DEFAULT N'',
	SuaDoi NVARCHAR(1000) NOT NULL DEFAULT N'',
)
SELECT*FROM dbo.tblProductMix

CREATE TABLE TaiKhoan(
ID_Acc INT IDENTITY PRIMARY KEY,
ID_NV Int CONSTRAINT FK_ACC_NV FOREIGN KEY REFERENCES dbo.tblNhanVien(ID_NhanVien),
TenDn VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL,
PassWrord NVARCHAR(200) NOT NULL,
Type INT NOT NULL DEFAULT 0,
MaNH INT  CONSTRAINT FK_TK_NH FOREIGN KEY REFERENCES dbo.ChuNhaHang(ID_Assitant)
)
GO




------------------------------------- Inser Data



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
 


CREATE PROC DangKiNH
@TenCH NVARCHAR(300),
@SoDT VARCHAR(20),
@TenQL NVARCHAR(300),
@Email VARCHAR(50),
@Pass NVARCHAR(50)
AS 
BEGIN
	INSERT INTO dbo.tblNhanVien
	(TenNV,NgaySinh,GioiTinh,IDCanCuoc,SoDT,TinhTrangSK,NgayVaoLam,ID_ChucVu)VALUES
	(   @TenQL, GETDATE(),  1,  '',     @SoDT,  N'Tốt',  GETDATE(),  'CV05'  )
	DECLARE @manv INT = (SELECT ID_NhanVien FROM dbo.tblNhanVien WHERE SoDT=@SoDT AND TenNV=@TenQL)
	INSERT INTO dbo.ChuNhaHang
	(TenCH,TenQL,SDT,Email,PassWrord,ID_NV	)
	VALUES
	( @TenCH,@TenQL,@SoDT,@Email,@Pass,@manv)
END
GO

EXEC dbo.DangKiNH @TenCH = N'Đồ ăn nhanh', -- nvarchar(300)
                  @SoDT = '0368344928',   -- varchar(20)
                  @TenQL = N'Bùi Văn Đông', -- nvarchar(300)
                  @Email = 'bdong0610@gmail.com',  -- varchar(50)
                  @Pass = N'100129'   -- nvarchar(50)

GO


CREATE PROC DannNhapAd
@sodt VARCHAR(20),
@pass NVARCHAR(50)
AS
BEGIN
    SELECT * FROM dbo.ChuNhaHang WHERE SDT=@sodt AND PassWrord=@pass
END
GO

CREATE VIEW DanhSachMatHang
AS
SELECT ID_Hang,TenHang,dbo.tblMatHang.MoTa,SoLuong,DonViTon,MucGia,HanSudung, TenLoai, TenNCC, SoLuong*MucGia AS Tien FROM dbo.tblMatHang
INNER JOIN dbo.tblLoaiHang ON tblLoaiHang.ID_LoaiH = tblMatHang.ID_LoaiH INNER JOIN dbo.tblNhaCC ON tblNhaCC.ID_NCC = tblMatHang.ID_NCC WHERE tblMatHang.SuDung=1
GO

INSERT INTO  tblMatHang  ( ID_Hang ,  TenHang ,  MoTa ,  SoLuong ,  DonViTon ,  MucGia ,  HanSudung ,  ID_LoaiH ,  ID_NCC,  SuDung ) VALUES
 ('1001001', N'Paste cà chua', N'Paste dùng để pha lẩu cà chua', 0, 'Kg', 50000, N'Bốn ngày sau mở bảo quản mát', 'LH03', 'NCC01',1),
 ('1001002', N'Paste lẩu thái', N'Paste dùng để pha lẩu thái', 0, 'Pak', 50000, N'Bốn ngày sau mở bảo quản mát', 'LH03', 'NCC01',1),
 ('1001003', N'Paste Colagen', N'Paste dùng để pha lẩu Colagen', 0, 'Pak', 50000, N'Bốn ngày sau mở bảo quản mát', 'LH03', 'NCC01',1),
 ('1001004', N'Paste tứ xuyên', N'Paste dùng để pha lẩu tứ xuyên', 0, 'Pak', 50000, N'Bốn ngày sau mở bảo quản mát', 'LH03', 'NCC01',1),
 ('1001005', N'Paste lẩu Miso', N'Paste dùng để pha lẩu Miso', '1', 'Pak', 50000, N'Bốn ngày sau mở bảo quản mát', 'LH03', 'NCC01',1),
 ('2001006', N'Bò ba chỉ cắt dọc', N'Bò ba chỉ cắt dọc', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001007', N'Gù bò đông lạnh khối', N'Gù bò đông lạnh khối', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001008', N'Ba chỉ heo', N'Ba chỉ heo', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001009', N'Nạc dăm heo Balli', N'Nạc dăm heo Balli', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001010', N'Sườn heo', N'Sườn heo', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001011', N'Lõi vai cắt 2,5 cm', N'Lõi vai cắt 2,5 cm', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001012', N'Mực trứng', N'Mực trứng', 0, 'Kg', 50000, N'1 tháng sau mở bảo quản tủ đông', 'LH01', 'NCC02',1),
 ('2001013', N'Tôm thẻ', N'Tôm thẻ', 0, 'Kg', 50000, N'Trong ngày bảo quản mát', 'LH01', 'NCC02',1),
 ('2001014', N'Ngao sạch Lengger', N'Ngao sạch Lengger', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001015', N'Cá hồi', N'Cá hồi', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001016', N'Lườn cá hồi', N'Lườn cá hồi', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001017', N'Bạch tuộc', N'Bạch tuộc', 0, 'Kg', 50000, N'24 h sau khi sơ chế bảo quản đông', 'LH01', 'NCC02',1),
 ('2001018', N'Mực nút', N'Mực nút', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001019', N'Râu mực', N'Râu mực', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('2001020', N'Chân gà', N'Chân gà', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001021', N'Tok khoai môn', N'Tok khoai môn', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001022', N'Tok khoai lang', N'Tok khoai lang', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001023', N'Tok phô mai', N'Tok phô mai', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001024', N'Xúc xích nấm', N'Xúc xích nấm', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001025', N'Xúc xích phô mai', N'Xúc xích phô mai', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001026', N'Kẹp cá', N'Kẹp cá', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001027', N'Cốm cua', N'Cốm cua', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001028', N'Đậu hũ phô mai', N'Đậu hũ phô mai', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001029', N'Há cảo tôm', N'Há cảo tôm', 0, 'Pak', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001030', N'Há cảo bò', N'Há cảo bò', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('3001031', N'Mandu mini', N'Mandu mini', 0, 'Kg', 50000, N'1 tháng sau sơ chế', 'LH01', 'NCC02',1),
 ('4001032', N'Rau muống', N'Rau muống', 0, 'Kg', 50000, N'Theo bao bì', 'LH03', 'NCC03',1),
 ('4001033', N'Rau mồng tơi', N'Rau mồng tơi', 0, 'Kg', 50000, N'Theo bao bì', 'LH03', 'NCC03',1),
 ('4001034', N'Rau cải cúc', N'Rau cải cúc', 0, 'Kg', 50000, N'Tình trạng rau', 'LH03', 'NCC03',1),
 ('4001035', N'Rau cải thảo', N'Rau cải thảo', 0, 'Kg', 50000, N'Tình trạng rau', 'LH03', 'NCC03',1),
 ('4001036', N'Rau cải bắp', N'Rau cải bắp', 0, 'Kg', 50000, N'Theo bao bì', 'LH03', 'NCC03',1),
 ('4001037', N'Rau cải ngọt', N'Rau cải ngọt', 0, 'Kg', 50000, N'Theo bao bì', 'LH03', 'NCC03',1),
 ('4001038', N'Nấm tiên', N'Nấm tiên', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001039', N'Nấm cua nâu', N'Nấm cua nâu', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001040', N'Nấm cua trắng', N'Nấm cua trắng', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001041', N'Nấm kim châm', N'Nấm kim châm', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001042', N'Nấm chinh hải', N'Nấm chinh hải', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001043', N'Nấm sò', N'Nấm sò', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001044', N'Nấm ngô', N'Nấm ngô', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('4001045', N'Nấm đông cô', N'Nấm đông cô', 0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH03', 'NCC03',1),
 ('5001046', N'Mỳ dẹt', N'Mỳ dẹt', 0, 'Kg', 60000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
 ('5001047', N'Phở khô', N'Phở khô',0, 'Kg', 70000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('5001048', N'Miến sợi hàn quốc', N'Miến sợi hàn quốc',0, 'Kg', 80000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('5001049', N'Nấm tuyết nhĩ', N'Nấm tuyết nhĩ',0, N'Kg', 9000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('5001050', N'Bột gà', N'Bột gà',0, 'Kg', 100000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('5001051', N'Dầu ăn', N'Dầu ăn',0, 'Kg', 110000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('5001052', N'Nấm hương khô', N'Nấm hương khô',0, 'Kg', 120000, N'Sơ chế sử dụng trong ngày', 'LH04', 'NCC02',1),
('6001053', N'Dưa hấu', N'Dưa hấu',0, 'Kg', 130000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1),
('6001054', N'Xoài xanh', N'Xoài xanh',0, 'Kg', 140000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1),
('6001055', N'Dứa', N'Dứa',0, 'Kg', 150000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1),
('6001056', N'Chanh leo', N'Chanh leo',0, 'Kg', 160000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1),
('6001057', N'Bánh Mochi', N'Bánh Mochi',0, 'Kg', 170000, N'Theo bao bì', 'LH02', 'NCC02',1),
('6001058', N'Bánh tuyết', N'Bánh tuyết',0, 'Kg', 180000, N'Theo bao bì', 'LH02', 'NCC02',1),
('6001059', N'Thanh long', N'Thanh long',0, 'Kg', 190000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1),
('6001060', N'Cam vàng', N'Cam vàng',0, 'Kg', 50000, N'Sơ chế sử dụng trong ngày', 'LH02', 'NCC04',1);
GO



CREATE VIEW DanhSachHoaDon
AS
SELECT SoHieuHD,  NgayDat,
 NgayDao  AS NgayGiao,ThanhTien, dbo.tblNhanVien.TenNV,TenChucVu,DuyetHD FROM dbo.tblHDNhapHang  
INNER JOIN dbo.tblNhanVien ON ID_NV=ID_NhanVien INNER JOIN dbo.tblChucVu ON tblChucVu.ID_ChucVu = tblNhanVien.ID_ChucVu
GO


CREATE PROC DsHangTheoHD
@mahd VARCHAR(30)
AS
BEGIN
    SELECT ct.ID_Hang,ds.TenHang,ct.SoLuong,ds.DonViTon,ds.MucGia,ds.TenLoai,ds.TenNCC,ct.SoLuong*ds.MucGia AS Tien ,ct.DuyetH
	FROM dbo.DanhSachMatHang AS ds JOIN dbo.tblChiTietHDNH AS ct ON ct.ID_Hang = ds.ID_Hang INNER JOIN dbo.tblHDNhapHang ON SoHieuHD=ct.ID_HDNH WHERE SoHieuHD=@mahd
END
GO

CREATE PROC DuyetHang
@soluong FLOAT,
@mahd VARCHAR(30),
@mah VARCHAR(30)
AS
BEGIN
    UPDATE dbo.tblChiTietHDNH SET SoLuong=@soluong,DuyetH=1 WHERE ID_Hang=@mah AND ID_HDNH=@mahd
	UPDATE dbo.tblMatHang SET SoLuong=@soluong WHERE ID_Hang=@mah
	UPDATE dbo.tblMatHang SET SoLuong=SoLuong+@soluong WHERE ID_Hang=@mah
	DECLARE @tongtien FLOAT=(SELECT SUM(tblChiTietHDNH.SoLuong*MucGia) FROM dbo.tblChiTietHDNH
	INNER JOIN dbo.tblMatHang ON tblMatHang.ID_Hang = tblChiTietHDNH.ID_Hang WHERE ID_HDNH=@mahd)
	UPDATE dbo.tblHDNhapHang SET ThanhTien= CAST(@tongtien AS FLOAT) WHERE SoHieuHD=@mahd
END
GO

GO
CREATE PROC UpDateAll
@mahd VARCHAR(30)
AS
BEGIN
   UPDATE dbo.tblHDNhapHang SET DuyetHD=1 WHERE SoHieuHD=@mahd
   UPDATE dbo.tblChiTietHDNH SET DuyetH=1 WHERE ID_HDNH=@mahd

END
GO


INSERT INTO dbo.tblLoaiBan
(
    ID_LoaiBan,
    TenLoaiBan,
    SuDung
)
VALUES
(   'LB01', N'Bàn đơn',1),
(   'LB02', N'Bàn gia đình',1),
(   'LB03', N'Bàn VIP',1)
GO

INSERT INTO dbo.tblBanNH
(ID_Ban,TenBan,MoTa,ViTri,SoGhe,TinhTrang,KhuVuc,ID_LoaiBan)
VALUES
(   'TB01', N'A01',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB02', N'A02',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB03', N'A03',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB04', N'A04',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB05', N'A05',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB06', N'A06',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB07', N'A07',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB08', N'A08',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB09', N'A09',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB10', N'A10',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB11', N'A11',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB12', N'A12',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB13', N'A13',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB14', N'A14',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB15', N'A15',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB16', N'A16',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB17', N'A17',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB18', N'A18',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB19', N'A19',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB20', N'A20',N'Bàn cá nhân',  N'Khu vực băng chuyền',  1,0, N'A', 'LB01' ),
(   'TB22', N'B01',N'Bàn gia đình',  N'Khu vực bàn gia đình',  6,0, N'B', 'LB02' ),
(   'TB23', N'B02',N'Bàn gia đình',  N'Khu vực bàn gia đình',  6,0, N'B', 'LB02' ),
(   'TB24', N'B03',N'Bàn gia đình',  N'Khu vực bàn gia đình',  6,0, N'B', 'LB02' ),
(   'TB25', N'B04',N'Bàn gia đình',  N'Khu vực bàn gia đình',  6,0, N'B', 'LB02' ),
(   'TB26', N'B05',N'Bàn gia đình',  N'Khu vực bàn gia đình',  4,0, N'B', 'LB02' ),
(   'TB27', N'B06',N'Bàn gia đình',  N'Khu vực bàn gia đình',  4,0, N'B', 'LB02' ),
(   'TB28', N'B07',N'Bàn gia đình',  N'Khu vực bàn gia đình',  4,0, N'B', 'LB02' ),
(   'TB29', N'B08',N'Bàn gia đình',  N'Khu vực bàn gia đình',  4,0, N'B', 'LB02' ),
(   'TB30', N'B09',N'Bàn gia đình',  N'Khu vực bàn gia đình',  8,0, N'B', 'LB02' ),
(   'TB31', N'B10',N'Bàn gia đình',  N'Khu vực bàn gia đình',  8,0, N'B', 'LB02' ),
(   'TB32', N'B11',N'Bàn gia đình',  N'Khu vực bàn gia đình',  8,0, N'B', 'LB02' ),
(   'TB33', N'B12',N'Bàn gia đình',  N'Khu vực bàn gia đình',  8,0, N'B', 'LB02' ),
(   'TB34', N'C01',N'Bàn gia đình VIP',  N'Khu vực bàn gia đình',  10,0, N'C', 'LB03' ),
(   'TB35', N'C02',N'Bàn gia đình VIP',  N'Khu vực bàn gia đình',  10,0, N'C', 'LB03' ),
(   'TB36', N'C03',N'Bàn gia đình VIP',  N'Khu vực bàn gia đình',  10,0, N'C', 'LB03' ),
(   'TB37', N'C04',N'Bàn gia đình VIP',  N'Khu vực bàn gia đình',  10,0, N'C', 'LB03' )
GO

CREATE VIEW DsBanNH 
AS
SELECT ID_Ban,TenBan,MoTa,ViTri,SoGhe,TinhTrang,KhuVuc,SuDung,TenLoaiBan FROM dbo.tblBanNH INNER JOIN
dbo.tblLoaiBan ON tblLoaiBan.ID_LoaiBan = tblBanNH.ID_LoaiBan
GO



CREATE PROC DatBan
@tenkh NVARCHAR(200),
@sodt VARCHAR(20),
@ngaydat DATE,
@giodat VARCHAR(20),
@sokhach INT,
@idban VARCHAR(10)
AS
BEGIN
    INSERT INTO dbo.tblDatBan
    (TenKH,SoDT,NgayDat,GioDat,SoKhach,ID_BanDat,TinhTrang,HuyBan )
    VALUES
    ( @tenkh,@sodt,@ngaydat,@giodat,@sokhach,@idban , 0,  0)
	UPDATE dbo.tblBanNH SET TinhTrang =2 WHERE ID_Ban= @idban
END
GO

INSERT INTO dbo.tblPhanQuyen (ID_Quyen, TenQuyen) 
VALUES ('100101', N'Tạo hóa đơn Oder'),
       ('100102', N'Xuất hóa đơn'),
       ('100103', N'Sửa hóa đơn'),
       ('100104', N'Tồn kho'),
       ('100105', N'Tạo mix'),
       ('100106', N'Xuất báo cáo Product Mix'),
       ('100107', N'Thêm hàng'),
       ('100108', N'Sửa hàng'),
       ('100109', N'Xóa hàng'),
       ('100110', N'Giảm giá'),
       ('100111', N'Thêm xuất Buffet'),
       ('100112', N'Sửa giá xuất Buffet'),
       ('100113', N'Xóa xuất Buffet'),
       ('100114', N'Thêm xuất Buffet'),
       ('100115', N'Thêm nhân viên'),
       ('100116', N'Sửa thông tin nhân viên'),
       ('100117', N'Xóa thông tin nhân viên');

GO


CREATE PROC HuyBanDat
@maban INT,
@mabannh VARCHAR(20)
AS
BEGIN
    DELETE FROM dbo.tblDatBan WHERE ID_Ban= @maban
	UPDATE dbo.tblBanNH SET TinhTrang=0 WHERE ID_Ban=@mabannh
END
GO

CREATE PROC XoaHoaDonTheoMa
@mahd VARCHAR(20)
AS
 BEGIN
     DECLARE @shhd VARCHAR(20)=(SELECT SoHieuHD FROM dbo.tblHDNhapHang INNER JOIN dbo.tblNhanVien ON tblNhanVien.ID_NhanVien = tblHDNhapHang.ID_NV
	 INNER JOIN dbo.tblChucVu ON tblChucVu.ID_ChucVu = tblNhanVien.ID_ChucVu WHERE tblChucVu.ID_ChucVu='CV05' AND SoHieuHD=@mahd)
	
	 IF(@shhd IS NOT NULL)
	 SELECT CAST(@shhd AS VARCHAR(20))
	 ELSE
	 SELECT CAST('ERROR' AS VARCHAR(20))
END
GO



CREATE PROC ChitietBanDat
@id int
AS
BEGIN
    SELECT db.ID_Ban,tb.ID_Ban AS ID_BanNH,db.TenKH,db.SoDT,CONVERT(VARCHAR(20),db.NgayDat) AS NgayDat ,db.GioDat,db.SoKhach, db.Note
	FROM dbo.tblDatBan db INNER JOIN dbo.tblBanNH tb ON tb.ID_Ban = db.ID_BanDat 
	WHERE db.TinhTrang=0 AND db.ID_Ban= @id
END
GO




CREATE VIEW DSAllMatHang
as
SELECT  mh.ID_Hang,mh.TenHang,mh.MoTa,mh.SoLuong,mh.DonViTon,mh.MucGia,mh.HanSudung,lh.TenLoai,ncc.TenNCC
FROM dbo.tblMatHang AS mh INNER JOIN dbo.tblNhaCC AS ncc ON ncc.ID_NCC = mh.ID_NCC INNER JOIN dbo.tblLoaiHang 
AS lh ON lh.ID_LoaiH = mh.ID_LoaiH
WHERE mh.SuDung=1
GO

CREATE VIEW DsMonAnAll
AS
SELECT * FROM dbo.tblMonAn 
GO


CREATE VIEW  DsBuffet
AS SELECT*FROM dbo.tblBuffet
GO

CREATE PROC ChiTietBuffet
@mabf VARCHAR(20)
AS
BEGIN
    SELECT ct.ID_Mon,ma.TenMon,ma.GiaMon,ct.SoLuong FROM
	dbo.tblChiTietBuffet AS ct INNER JOIN dbo.tblMonAn AS
	ma ON ma.ID_MonAn = ct.ID_Mon WHERE ct.ID_Buffet=@mabf
END
GO
GO

CREATE PROC DetailViewBf
@mabg VARCHAR(20)
AS 
BEGIN
    SELECT*FROM dbo.tblBuffet WHERE ID_Buffe=@mabg
END

GO

CREATE VIEW DatTruocBan
AS
SELECT db.ID_Ban,tb.ID_Ban AS ID_BanNH,db.TenKH,db.SoDT,CONVERT(VARCHAR(20),db.NgayDat) AS NgayDat ,db.GioDat,db.SoKhach, db.Note
	FROM dbo.tblDatBan db INNER JOIN dbo.tblBanNH tb ON tb.ID_Ban = db.ID_BanDat 
	WHERE db.TinhTrang=0

GO

CREATE VIEW ChiTietHoaDonOder
AS
SELECT ID_HDOder, ID_Buffe, TenBF, GiaBF,SoLuong,Image FROM dbo.tblChiTietOderBuffet 
INNER JOIN dbo.tblBuffet ON tblBuffet.ID_Buffe = tblChiTietOderBuffet.ID_Buffet AND ID_HDOder=12
GO

CREATE PROC ThemSuatBF
@hdhd INT,
@mamon VARCHAR(20),
@soluong FLOAT,
@giooder VARCHAR(30)
AS
BEGIN
	DECLARE @idfoot VARCHAR(20)= (SELECT ID_Buffet FROM dbo.tblChiTietOderBuffet WHERE ID_Buffet=@mamon AND ID_HDOder=@hdhd)
	IF(@idfoot IS NOT NULL)	
	BEGIN
	    DECLARE @sobandau INT= (SELECT SoLuong FROM dbo.tblChiTietOderBuffet WHERE ID_Buffet=@mamon AND ID_HDOder=@hdhd)
		UPDATE dbo.tblChiTietOderBuffet SET SoLuong= @sobandau+@soluong WHERE ID_Buffet=@mamon AND ID_HDOder=@hdhd
	END
	ELSE
	BEGIN
	    INSERT INTO dbo.tblChiTietOderBuffet
		(ID_HDOder,ID_Buffet,SoLuong,GioOder)
		VALUES
		(@hdhd,@mamon,@soluong,@giooder)
	END
    
END
GO

CREATE PROC ThemMonAnBF
@hdhd INT,
@mamon VARCHAR(20),
@soluong FLOAT,
@giooder VARCHAR(30)
AS
BEGIN
	DECLARE @idfoot VARCHAR(20)= (SELECT ID_Mon FROM dbo.tblChiTietGoiMon WHERE ID_Mon=@mamon AND ID_HDOder=@hdhd)
	IF(@idfoot IS NOT NULL)	
	BEGIN
	    DECLARE @sobandau INT= (SELECT SoLuong FROM dbo.tblChiTietGoiMon WHERE ID_Mon=@mamon AND ID_HDOder=@hdhd)
		UPDATE dbo.tblChiTietGoiMon SET SoLuong= @sobandau+@soluong WHERE ID_Mon=@mamon AND ID_HDOder=@hdhd
	END
	ELSE
	BEGIN
	    INSERT INTO dbo.tblChiTietGoiMon
		(ID_HDOder,ID_Mon,SoLuong,GioOder)
		VALUES
		(@hdhd,@mamon,@soluong,@giooder)
	END
    
END
GO

CREATE PROC ChiTietHoaDonGiMon
@mahd INT 
AS
BEGIN
    SELECT ID_HDOder, ID_Mon, TenMon, GiaMon,SoLuong,HinhAnh  FROM dbo.tblChiTietGoiMon INNER JOIN dbo.tblMonAn ON tblMonAn.ID_MonAn = tblChiTietGoiMon.ID_Mon
	WHERE ID_HDOder=@mahd
END
GO
CREATE VIEW BanChoThanhToan
AS
SELECT tblBanNH.ID_Ban,ID_HDOder,TenBan,SoGhe,KhuVuc, TenLoaiBan,ViTri FROM dbo.tblHDOder INNER JOIN dbo.tblBanNH ON tblBanNH.ID_Ban = tblHDOder.ID_Ban JOIN dbo.tblLoaiBan ON tblLoaiBan.ID_LoaiBan = tblBanNH.ID_LoaiBan WHERE TTThanhToan=2 
GO

CREATE VIEW DanhSachHD
AS
SELECT hd.ID_HDOder, hd.TenKH,hd.SoDT,hd.NgayVao,hd.GioVao,hd.GioRa,hd.SoKhach,
TenNV,TenBan,hd.Thue,hd.TongTien,hd.GhiChu,hd.TTThanhToan 
FROM dbo.tblHDOder AS hd INNER JOIN dbo.tblNhanVien ON tblNhanVien.ID_NhanVien = hd.ID_NV
INNER JOIN dbo.tblBanNH ON tblBanNH.ID_Ban = hd.ID_Ban GROUP BY hd.ID_HDOder, hd.TenKH,hd.SoDT,hd.NgayVao,hd.GioVao,hd.GioRa,hd.SoKhach,
TenNV,TenBan,hd.Thue,hd.TongTien,hd.GhiChu,hd.TTThanhToan 
GO

CREATE VIEW DanhSachGiaoDich
AS 
SELECT ID_GiaoDich,TenGD,ThoiGianGD,ID_HD_Oder,do.TenNV AS DO ,mo.TenNV AS MO,TinhTrang,
HinhThucTT,PhiDV,TienBanDau,TienCuoi,GhiChu FROM dbo.tblGiaoDich INNER JOIN dbo.tblNhanVien  AS mo
ON mo.ID_NhanVien = tblGiaoDich.ID_NVMo INNER JOIN dbo.tblNhanVien AS do ON do.ID_NhanVien = tblGiaoDich.ID_NVDo 
GO


CREATE VIEW DanhSachNhanVien
AS
SELECT ID_NhanVien,TenNV,NgaySinh,GioiTinh,IDCanCuoc,SoDT,TinhTrangSK,NgayVaoLam,TenChucVu,LamViec,QueQuan
FROM dbo.tblNhanVien INNER JOIN dbo.tblChucVu ON tblChucVu.ID_ChucVu = tblNhanVien.ID_ChucVu
GO

 CREATE PROC DanhSachTonHangTN
 @ngay VARCHAR(30)
 AS
 BEGIN
     DECLARE @math INT =(SELECT ID_THang FROM dbo.tblTonHang WHERE NgayTon=@ngay)
	 SELECT mh.ID_Hang AS IdMH,mh.TenHang AS TenH, mh.DonViTon, cc.TenNCC AS NhaCC,th.SoLuong,th.GhiChu,th.KhuVuc
	 FROM dbo.tblCTTonHang  AS th INNER JOIN dbo.tblMatHang AS mh ON mh.ID_Hang = th.Id_Hang INNER JOIN 
	 dbo.tblNhaCC AS cc ON cc.ID_NCC = mh.ID_NCC WHERE ID_TonH=@math
 END
 GO

 CREATE PROC TongTienSPTonKho
 @ngay VARCHAR(30),
 @mah VARCHAR(20)
 AS
 BEGIN
     DECLARE @math INT =(SELECT ID_THang FROM dbo.tblTonHang WHERE NgayTon=@ngay)
	 SELECT SUM(th.SoLuong) AS SL FROM dbo.tblCTTonHang  AS th INNER JOIN dbo.tblMatHang AS mh ON mh.ID_Hang = th.Id_Hang WHERE mh.ID_Hang=@mah AND th.ID_TonH=@math
 END
 GO


 CREATE VIEW TongHangTonKho
 AS
   SELECT ct.ID_Hang,ds.TenHang,SUM(ct.SoLuong) AS SoLuong,ds.DonViTon,ds.MucGia,ds.TenLoai,ds.TenNCC,ct.SoLuong*ds.MucGia AS Tien ,ct.DuyetH
	FROM dbo.DanhSachMatHang AS ds JOIN dbo.tblChiTietHDNH AS ct ON ct.ID_Hang = ds.ID_Hang INNER JOIN dbo.tblHDNhapHang ON SoHieuHD=ct.ID_HDNH WHERE NgayDao=@ngay AND ct.ID_Hang=ct.ID_Hang
	GROUP BY ct.ID_Hang,ds.TenHang,ct.SoLuong,ds.DonViTon,ds.MucGia,ds.TenLoai,ds.TenNCC,Tien ,ct.DuyetH

GO

CREATE PROC TongHangDaGoiTheoNgay
 @ngay VARCHAR(20),
 @mah VARCHAR(20)
 AS
 BEGIN
   DECLARE @Soluong FLOAT= (SELECT   TOP 1( SUM(SoLuong)  over () )  FROM dbo.tblChiTietHDNH INNER JOIN
	dbo.tblHDNhapHang ON tblHDNhapHang.SoHieuHD = tblChiTietHDNH.ID_HDNH WHERE NgayDao=@ngay AND ID_Hang=@mah GROUP BY ID_Hang,SoLuong)
	IF @Soluong IS NOT NULL 
	BEGIN
	    SELECT @Soluong AS SoLuong
	END
	ELSE
	BEGIN
	    SELECT 0 AS SoLuong
	END
 END
 GO

CREATE PROC   dbo  .  SoluongBuffetToDay  
@ngay VARCHAR(30)
AS
	SELECT b.ID_Buffe, b.TenBF,COALESCE(SUM(SoLuong),0 )AS SoLuong FROM 
	dbo.tblHDOder INNER JOIN dbo.tblChiTietOderBuffet ON tblChiTietOderBuffet.ID_HDOder = tblHDOder.ID_HDOder INNER JOIN 
	dbo.tblBuffet AS b ON b.ID_Buffe = tblChiTietOderBuffet.ID_Buffet
	 WHERE b.SuDung=1 AND NgayVao=@ngay 
	GROUP BY TenBF,NgayTao,ID_Buffe
GO

CREATE VIEW ThanhPhanHang
AS
SELECT TenLoai, COUNT(tblLoaiHang.ID_LoaiH) AS SoLuong FROM dbo.tblMatHang
INNER JOIN dbo.tblLoaiHang ON tblLoaiHang.ID_LoaiH = tblMatHang.ID_LoaiH GROUP BY TenLoai
GO

CREATE VIEW DanhSachHDCTT
AS
SELECT ID_GiaoDich,hd.ID_HDOder,hd.TenKH,GioVao,TienBanDau,hd.TTThanhToan 
FROM dbo.tblGiaoDich INNER JOIN dbo.tblHDOder AS hd ON hd.ID_HDOder = tblGiaoDich.ID_HD_Oder AND hd.TTThanhToan NOT LIKE 1
GO


CREATE PROC DoanhThuThangNay
@thang VARCHAR(100),
@nam VARCHAR(1000)
AS 
BEGIN 
DECLARE @startDate DATETIME = DATEFROMPARTS(@nam, @thang, 1)
DECLARE @endDate DATETIME = DATEADD(DAY, -1, DATEADD(MONTH, 1, @startDate))
DECLARE @currentDate DATETIME = @startDate
CREATE TABLE #TempTable (Ngay VARCHAR(30) NOT NULL DEFAULT '',DoanhThu FLOAT NOT NULL DEFAULT 0)

WHILE @currentDate <= @endDate
BEGIN
    DECLARE @thoigian VARCHAR(30) = (SELECT FORMAT(CONVERT(datetime, @currentDate, 100), 'dd/MM/yyyy')) 
	DECLARE @Tien FLOAT=( SELECT CASE WHEN SUM(TienCuoi) IS NOT NULL THEN SUM(TienCuoi) ELSE 0 END AS TTien FROM dbo.tblGiaoDich WHERE  FORMAT(CONVERT(datetime, @currentDate, 100), 'dd/MM/yyyy')= FORMAT(CONVERT(datetime, ThoiGianGD, 100), 'dd/MM/yyyy'))
	INSERT INTO #TempTable (Ngay,DoanhThu) VALUES(@thoigian,@Tien)
    SET @currentDate = DATEADD(DAY, 1, @currentDate)
END

SELECT Ngay,DoanhThu FROM #TempTable
DROP TABLE #TempTable
END
GO



ALTER PROC MaMixTimKiem
@ngay VARCHAR(100),
@manv INT ,
@note NVARCHAR(1000)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.tblProductMix WHERE NgayTon = @ngay)
	BEGIN
		INSERT INTO dbo.tblProductMix
		(TenTon,NgayTon,IdNV,GhiChu)VALUES
		(    N'Product Mix ngày:'+@ngay,@ngay,  @manv,@note )
	SELECT 0;
	END
	ELSE
	BEGIN
	    SELECT ID_Pr_Mix FROM dbo.tblProductMix WHERE NgayTon = @ngay;
	END
	
END
GO

CREATE PROC ChiTietNVTheoMa
@manv INT
AS
BEGIN
    SELECT ID_NhanVien, TenNV,NgaySinh,GioiTinh,IDCanCuoc,SoDT,TinhTrangSK, NgayVaoLam,tblChucVu.ID_ChucVu, TenChucVu,LamViec,QueQuan,MoTa,LuongCoBan
	FROM dbo.tblNhanVien INNER JOIN dbo.tblChucVu ON tblChucVu.ID_ChucVu = tblNhanVien.ID_ChucVu WHERE ID_NhanVien=@manv
END
GO
EXEC dbo.ChiTietNVTheoMa @manv = 1 -- int



SELECT ID_ChucVu, ID_NhanVien FROM dbo.tblNhanVien WHERE ID_NhanVien= 2
UPDATE dbo.tblNhanVien SET ID_ChucVu='CV05' WHERE ID_NhanVien=1

SELECT*FROM dbo.tblChucVu
SELECT*FROM dbo.tblNhanVien






