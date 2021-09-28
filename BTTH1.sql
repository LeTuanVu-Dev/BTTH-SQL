-- a.Tạo Database đã cho và lưu vào thư mục ThuchanhSQL_Tên sinh
--viên_Lớp đặt tại ổ D hoặc E.

CREATE DATABASE ThucHanhSQL_LeTuanVu_2010A05
ON
(
NAME = 'BTTH',
FILENAME = 'D:\ThucHanhSQL_LeTuanVu_2010A05\BTTH.mdf',
SIZE = 2MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10%
)
GO 
--b. Tạo bảng tblKhachHang và bảng tblNhanvien theo cấu trúc đã cho.
USE ThucHanhSQL_LeTuanVu_2010A05
GO 
CREATE TABLE tblKhachHang
(
iMaKH INT NOT NULL,
sTenKH NVARCHAR(30),
dNgaysinh DATE,
sDiachi NVARCHAR(50),
sDienthoai CHAR(12)
)
GO 
CREATE TABLE tblNhanVien
(
iMaNV INT NOT NULL,
sTenNV NVARCHAR(30),
sDiachi NVARCHAR(50),
sDienthoai CHAR(12),
dNgaysinh DATETIME,
dNgayvaolam DATETIME,
fLuongcoban FLOAT(11),
fPhucap FLOAT(7)
)
/*
c. Thêm trường sCMND không chứa giá trị trùng nhau vào bảng
tblNhanVien
*/
ALTER TABLE dbo.tblNhanVien ADD sCMND CHAR(20) UNIQUE
GO 
--d. Thiết lập ràng buộc khóa chính, khóa ngoại cho 2 bảng trên.
ALTER TABLE dbo.tblKhachHang ADD CONSTRAINT PK_iMaKH PRIMARY KEY(iMaKH)
ALTER TABLE dbo.tblNhanVien ADD CONSTRAINT PK_iMaNV PRIMARY KEY(iMaNV)

-- e. Thiết lập ràng buộc ngày vào làm việc so với ngày sinh tối thiểu đủ 18 tuổi
ALTER TABLE dbo.tblNhanVien ADD CONSTRAINT DT_du18t CHECK ( DATEDIFF(YEAR , dNgaysinh , dNgayvaolam) >= 18 )
-- f. Thêm cột sDonvitinh cho bảng Mặt hàng. tạo bảng mặt hàng trước
CREATE TABLE tblMatHang
(
sMahang CHAR(10) NOT NULL,
sTenhang NVARCHAR(30),
iMaNCC INT NOT NULL ,
sMaloaihang CHAR(10),
fSoluong FLOAT,
fGiahang FLOAT
)
ALTER TABLE  dbo.tblMatHang ADD CONSTRAINT FK_smaloaihang FOREIGN KEY(sMaloaihang) REFERENCES dbo.tblLoaiHang(sMaloaihang)
ALTER TABLE  dbo.tblMatHang ADD CONSTRAINT  FK_iMaNCC FOREIGN KEY(iMaNCC) REFERENCES dbo.tblNhaCungCap(iMaNCC)
ALTER TABLE  dbo.tblMatHang ADD CONSTRAINT  PK_sMahang PRIMARY KEY(sMahang)

-- thêm cột sdonvitinh
ALTER TABLE dbo.tblMatHang ADD sDonvitinh VARCHAR(10)
GO 
CREATE TABLE tblLoaiHang
(
sMaloaihang CHAR(10) NOT NULL,
sTenloaihang NVARCHAR(30)
)
ALTER TABLE dbo.tblLoaiHang ADD CONSTRAINT PK_sMaloaihang PRIMARY KEY(sMaloaihang)
GO 
CREATE TABLE tblNhaCungCap
(
iMaNCC INT IDENTITY(1,1) NOT NULL,
sTenNhaCC NVARCHAR(50),
sTengiaodich NVARCHAR(50),
sDiachi NVARCHAR(50),
sDienthoai CHAR(12)
)
ALTER TABLE dbo.tblNhaCungCap ADD CONSTRAINT iMaNCC_PK_ID PRIMARY KEY(iMaNCC)
GO
-- g. Tạo chỉ mục cho cột sTenHang trong bảng tblMathang
CREATE INDEX sTenHang_index ON dbo.tblMatHang(sTenhang)


---------
-- bài 1.2 --
/*
a. Tạo bảng tblDonNhapHang và bảng tblChiTietNhapHang theo cấu trúc đã
cho
b. Thiết lập ràng buộc khóa chính, khóa ngoại cho bảng tblDonNhapHang và
bảng tblChiTietNhapHang vừa tạo 
(bảng tblChiTietNhapHang đặt trườngsMaHang làm khóa ngoại, tham chiếu sang bảng tblMatHang và trường
iSoHD là khóa ngoại và tham chiếu sang bảng tblDonNhapHang.iSoHD)

c. Trong bảng tblChiTietNhapHang đảm bảo ràng buộc cơ bản sau:
○ fGianhap > 0
○ fSoLuongNhap > 0
*/
-- a
CREATE TABLE tblDonnhaphang
(
iSoHD INT NOT NULL,iMaNV INT NOT NULL,dNgaynhaphang DATETIME
)
-- b.
ALTER TABLE dbo.tblDonnhaphang ADD CONSTRAINT PK_iSoHD PRIMARY KEY(iSoHD)
ALTER TABLE dbo.tblDonnhaphang ADD CONSTRAINT FK_iMaNV FOREIGN KEY(iMaNV) REFERENCES dbo.tblNhanVien(iMaNV)
CREATE TABLE tblChiTietNhapHang
(
iSoHD INT NOT NULL,sMahang CHAR(10) NOT NULL,fGianhap FLOAT,fSoluongnhap FLOAT,
)
ALTER TABLE dbo.tblChiTietNhapHang ADD CONSTRAINT PK_iSoHD_sMahang PRIMARY KEY(iSoHD,sMahang)
ALTER TABLE dbo.tblChiTietNhapHang ADD CONSTRAINT FK_iSoHD FOREIGN KEY(iSoHD)REFERENCES dbo.tblDonnhaphang(iSoHD)
ALTER TABLE  dbo.tblChiTietNhapHang ADD CONSTRAINT FK_sMahang FOREIGN KEY(sMahang) REFERENCES dbo.tblMatHang(sMahang)

-- c.
ALTER TABLE dbo.tblChiTietNhapHang ADD CONSTRAINT CK_fGianhap_fSoluongnhap CHECK(fGianhap > 0 AND fSoluongnhap > 0)

-- 1.3 
/*a. Thêm trường bGioitinh (bit) vào bảng tblKhachhang
b. Tạo bảng tblDonDatHang theo cấu trúc trên và đảm bảo rằng
○ dNgaygiaohang luôn lớn hơn hoặc bằng dNgaydathang
○ dNgaydathang mặc định bằng thời gian hiện tại và luôn nhỏ hơn
hoặc bằng thời gian hiện tại.

c. Trong bảng tblDonDatHang, đặt trường iMaKH làm khoá ngoại, tham
chiếu sang tblKhachHang.iMaKH
d. Trong bảng tblDonDatHang, đặt trường iMaNV làm khoá ngoại, tham
chiếu sang tblNhanVien.iMaNV*/

--a.
ALTER TABLE dbo.tblKhachHang ADD bGioitinh BIT 
GO 
--b.
CREATE TABLE tblDonDatHang
(
iSoHD INT NOT NULL,
iMaNV INT NOT NULL,
iMaKH INT NOT NULL,
dNgaydathang DATETIME,
dNgaygiaohang DATETIME,
sDiachigiaohang NVARCHAR(50),
)
ALTER TABLE dbo.tblDonDatHang ADD CONSTRAINT CK_ngaygiaohang CHECK (DATEDIFF(DAY , dNgaydathang , dNgaygiaohang) >=0)
ALTER TABLE dbo.tblDonDatHang ADD CONSTRAINT ngaydathang_CK CHECK (dNgaydathang <= GETDATE());
ALTER TABLE dbo.tblDonDatHang ADD CONSTRAINT PK_SoHD PRIMARY KEY(iSoHD);
ALTER TABLE dbo.tblDonDatHang ADD CONSTRAINT FK_MaNV FOREIGN KEY(iMaNV) REFERENCES dbo.tblNhanVien(iMaNV);
ALTER TABLE dbo.tblDonDatHang ADD CONSTRAINT FK_iMaKH FOREIGN KEY(iMaKH) REFERENCES dbo.tblKhachHang(iMaKH)
GO 

--1.4--
/*
a. Tạo bảng tblChiTietDatHang theo cấu trúc trên 
b. Trong bảng tblChiTietDatHang, sửa cấu trúc trường sMaHang sang kiểu
Kí tự có độ dài 10.
c. Trong bảng tblChiTietDatHang, đặt trường sMaHang làm khoá ngoại,
tham chiếu sang tblMatHang.sMaHang; đặt trường iSoHD làm khoá
ngoại, tham chiếu sang tblDonDatHang.iSoHD
d. Trong bảng tblChiTietDatHang, đặt khoá chính trên cặp trường {iSoHD,
sMaHang}
e. Trong bảng tblChiTietDatHang, đảm bảo rằng:
○ fGiaban>0
○ fSoluongMua>0
○ fMucgiamgia>=0
*/
--a.
CREATE TABLE tblChiTietDatHang
(
iSoHD INT NOT NULL,
sMahang CHAR(20) NOT NULL,
fGiaban FLOAT,
fSoluongmua FLOAT,
fMucgiamgia FLOAT,
)
--b 
ALTER TABLE dbo.tblChiTietDatHang ALTER COLUMN sMahang CHAR(10) NOT NULL;
--c
ALTER TABLE dbo.tblChiTietDatHang ADD CONSTRAINT FK_Mahang FOREIGN KEY(sMahang) REFERENCES dbo.tblMatHang(sMahang);
ALTER TABLE dbo.tblChiTietDatHang ADD CONSTRAINT FK_iSoHD_Dathang FOREIGN KEY(iSoHD) REFERENCES dbo.tblDonDatHang(iSoHD);
--d.
ALTER TABLE dbo.tblChiTietDatHang ADD CONSTRAINT PK_iSoHD_Mahang PRIMARY KEY(iSoHD,sMahang);

-- e.
ALTER TABLE dbo.tblChiTietDatHang ADD CONSTRAINT CK_fGiaban_fSoluongmua_fmucgiamgia 
CHECK(fGiaban >0 AND fSoluongmua >0 AND fMucgiamgia >=0);