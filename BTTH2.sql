USE ThucHanhSQL_LeTuanVu_2010A05
GO
/*
Bài 2.1
a. Viết lệnh cho phép thêm 3 bản ghi vào bảng tblLoaiihang.
b. Thêm 3 bản ghi cho bảng Nhà cung cấp.
c. Với mỗi loại hàng có trong bảng tblLoaihang thực hiện thêm 3 mặt hàng
cho mỗi loại hàng tương ứng.
d. Xóa mặt hàng có số lượng = 0.
e. Tăng phụ cấp 10% cho những nhân viên có thâm niên làm việc 5 năm trở
lên.

*/
--a.

INSERT dbo.tblKhachHang
VALUES
(   0,         -- iMaKH - int
    N'trần văn Anh',       -- sTenKH - nvarchar(30)
    NULL , -- dNgaysinh - date
    N'Hà Nội',       -- sDiachi - nvarchar(50)
    NULL,        -- sDienthoai - char(12)
    1       -- bGioitinh - bit
    )
GO 
	INSERT dbo.tblKhachHang
	VALUES
	(   1,         -- iMaKH - int
	    N'trần văn Quân',       -- sTenKH - nvarchar(30)
	    NULL, -- dNgaysinh - date
	    N'TPHCM',       -- sDiachi - nvarchar(50)
	    NULL,        -- sDienthoai - char(12)
	    0       -- bGioitinh - bit
	    )
GO 
			INSERT dbo.tblKhachHang
	VALUES
	(   2,         -- iMaKH - int
	    N'trần văn bảo',       -- sTenKH - nvarchar(30)
	    GETDATE(), -- dNgaysinh - date
	    N'Hà Nam',       -- sDiachi - nvarchar(50)
	    NULL,        -- sDienthoai - char(12)
	   1      -- bGioitinh - bit
	    )
		GO 
-- b. Thêm 3 bản ghi cho bảng Nhà cung cấp.

INSERT dbo.tblNhaCungCap
VALUES
(   N'lê tuấn vũ', -- sTenNhaCC - nvarchar(50)
    N'bán', -- sTengiaodich - nvarchar(50)
    N'Hà Nội', -- sDiachi - nvarchar(50)
    NULL   -- sDienthoai - char(12)

    )
GO 
	INSERT dbo.tblNhaCungCap
VALUES
(   N'lê văn võ', -- sTenNhaCC - nvarchar(50)
    N'mua', -- sTengiaodich - nvarchar(50)
    N'Đà Nẵng', -- sDiachi - nvarchar(50)
    NULL   -- sDienthoai - char(12)

    )
GO 
	INSERT dbo.tblNhaCungCap
VALUES
(   N'lê thị ánh', -- sTenNhaCC - nvarchar(50)
    N'mua', -- sTengiaodich - nvarchar(50)
    N'Vĩnh Yên', -- sDiachi - nvarchar(50)
    NULL   -- sDienthoai - char(12)

    )
	
--c. Với mỗi loại hàng có trong bảng tblLoaihang thực hiện thêm 3 mặt hàng cho mỗi loại hàng tương ứng.
--DELETE dbo.tblLoaiHang
INSERT dbo.tblLoaiHang
VALUES
(   '0', -- sMaloaihang - char(10)
    N'hoa' -- sTenloaihang - nvarchar(30)
    )
GO
    INSERT dbo.tblLoaiHang
VALUES
(   '1', -- sMaloaihang - char(10)
    N'quả' -- sTenloaihang - nvarchar(30)
    )
GO
    INSERT dbo.tblLoaiHang
VALUES
(   '2', -- sMaloaihang - char(10)
    N'trang sứt' -- sTenloaihang - nvarchar(30)
    )

	GO
-- d. Xóa mặt hàng có số lượng = 0. trước khi xóa ta cần có dữ liệu nên insert 2 mặt hàng và xóa =)
SELECT * FROM dbo.tblNhaCungCap
INSERT dbo.tblMatHang
VALUES
(   '001',  -- sMahang - char(10)
    N'cam', -- sTenhang - nvarchar(30)
    1,   -- iMaNCC - int
    '0',  -- sMaloaihang - char(10)
    10, -- fSoluong - float
    20, -- fGiahang - float
    'vnđ'   -- sDonvitinh - varchar(10)
    )
GO
 INSERT dbo.tblMatHang
VALUES
(   '002',  -- sMahang - char(10)
    N'vòng tay', -- sTenhang - nvarchar(30)
    2,   -- iMaNCC - int
    '1',  -- sMaloaihang - char(10)
    10, -- fSoluong - float
    20, -- fGiahang - float
    'vnđ'   -- sDonvitinh - varchar(10)
    )
GO

INSERT dbo.tblMatHang
VALUES
(   '003',  -- sMahang - char(10)
    N'cam', -- sTenhang - nvarchar(30)
    3,   -- iMaNCC - int
    '2',  -- sMaloaihang - char(10)
    0, -- fSoluong - float
    20, -- fGiahang - float
    'vnđ'   -- sDonvitinh - varchar(10)
    )
GO
-- xóa đi hàng có số lượng = 0 nè
DELETE dbo.tblMatHang WHERE fSoluong = 0
--SELECT * FROM dbo.tblMatHang
--e. Tăng phụ cấp 10% cho những nhân viên có thâm niên làm việc 5 năm trở lên.
INSERT INTO dbo.tblNhanVien
VALUES
(   0,         -- iMaNV - int
    N'trần vân A',       -- sTenNV - nvarchar(30)
    N'Hà Nội',       -- sDiachi - nvarchar(50)
    '0988761555',        -- sDienthoai - char(12)
    '20020404', -- dNgaysinh - datetime
    '20100101', -- dNgayvaolam - datetime
    2.0,       -- fLuongcoban - real
    1.0,       -- fPhucap - real
    '000001'         -- sCMND - char(20)
    )
GO 
	INSERT INTO dbo.tblNhanVien
VALUES
(   1,         -- iMaNV - int
    N'trần vân B',       -- sTenNV - nvarchar(30)
    N'Hà Nội',       -- sDiachi - nvarchar(50)
    '0988761455',        -- sDienthoai - char(12)
    '20000404', -- dNgaysinh - datetime
    '20190101', -- dNgayvaolam - datetime
    2.0,       -- fLuongcoban - real
    1.0,       -- fPhucap - real
    '000002'         -- sCMND - char(20)
    )
	SELECT * FROM dbo.tblNhanVien
UPDATE dbo.tblNhanVien SET fPhucap = fPhucap + (fPhucap * 0.1) WHERE YEAR(GETDATE())- YEAR(dNgayvaolam) >=5
-------------------------------------------------------------------------------------------------------------------------------------
/*
Bài 2.2
A. Thực hiện cho phép thêm 3 bản ghi vào bảng tblKhachHang và 3 bản ghi vào bảng tblNhanVien
B. Thực hiện thêm 03 bản ghi vào bảng tblDonDatHang
C. Thực hiện với mỗi đơn đặt hàng trong bảng tblDonDatHang cho phép
thêm các chi tiết đơn đặt hàng tương ứng, mỗi đơn đặt hàng có ít nhất 02
mặt hàng được thêm
D. Thực hiện cho phép mức giảm giá là 10% cho các mặt hàng bán trong
tháng 7 năm 2016
E. Thực hiện xóa các chi tiết đơn đặt hàng của hóa đơn có mã đơn đặt hàng do sinh viên tự xác định.
*/
-- A. Thực hiện cho phép thêm 3 bản ghi vào bảng tblKhachHang và 3 bản ghi vào bảng tblNhanVien
INSERT INTO dbo.tblKhachHang
VALUES
(   4,         -- iMaKH - int
    N'trần văn lương',       -- sTenKH - nvarchar(30)
    GETDATE(), -- dNgaysinh - date
    N'Bình Thuận',       -- sDiachi - nvarchar(50)
    '0988771443',        -- sDienthoai - char(12)
    1       -- bGioitinh - bit
    )
	GO 
	INSERT INTO dbo.tblKhachHang
VALUES
(   5,         -- iMaKH - int
    N'trần văn vương',       -- sTenKH - nvarchar(30)
    GETDATE(), -- dNgaysinh - date
    N'Bình Thuận',       -- sDiachi - nvarchar(50)
    '0988771433',        -- sDienthoai - char(12)
    1       -- bGioitinh - bit
    )
	GO
    INSERT INTO dbo.tblKhachHang
VALUES
(   6,         -- iMaKH - int
    N'trần thị Quỳnh',       -- sTenKH - nvarchar(30)
    GETDATE(), -- dNgaysinh - date
    N'Bình Thuận',       -- sDiachi - nvarchar(50)
    '0988773443',        -- sDienthoai - char(12)
    2       -- bGioitinh - bit
    )
GO
-- 3 bản nhân viên
--SELECT * FROM dbo.tblNhanVien
INSERT INTO dbo.tblNhanVien
VALUES
(   2,         -- iMaNV - int
    N'lê thị Dung',       -- sTenNV - nvarchar(30)
    N'Vĩnh phúc',       -- sDiachi - nvarchar(50)
    '',        -- sDienthoai - char(12)
    '20020202', -- dNgaysinh - datetime
    '20200101', -- dNgayvaolam - datetime
    2.0,       -- fLuongcoban - real
    1.0,       -- fPhucap - real
    '0000003'         -- sCMND - char(20)
    )
GO 
	INSERT INTO dbo.tblNhanVien
VALUES
(   3,         -- iMaNV - int
    N'lê văn Luân',       -- sTenNV - nvarchar(30)
    N'Vĩnh phúc',       -- sDiachi - nvarchar(50)
    '',        -- sDienthoai - char(12)
    '20021202', -- dNgaysinh - datetime
    '20210101', -- dNgayvaolam - datetime
    2.0,       -- fLuongcoban - real
    1.0,       -- fPhucap - real
    '0000005'         -- sCMND - char(20)
    )
GO 
	INSERT INTO dbo.tblNhanVien
VALUES
(   4,         -- iMaNV - int
    N'lê thị chung',       -- sTenNV - nvarchar(30)
    N'Vĩnh phúc',       -- sDiachi - nvarchar(50)
    '',        -- sDienthoai - char(12)
    '20000212', -- dNgaysinh - datetime
    '20200101', -- dNgayvaolam - datetime
    2.0,       -- fLuongcoban - real
    1.0,       -- fPhucap - real
    '0000004'         -- sCMND - char(20)
    )
GO 
-- B. Thực hiện thêm 03 bản ghi vào bảng tblDonDatHang
SELECT * FROM dbo.tblNhanVien
INSERT INTO dbo.tblDonDatHang
VALUES
(   1,         -- iSoHD - int
     1,         -- iMaNV - int
    0,         -- iMaKH - int
    '20210829', -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N'Hà Nội'        -- sDiachigiaohang - nvarchar(50)
    )
GO 
INSERT INTO dbo.tblDonDatHang
VALUES
(   2,         -- iSoHD - int
     2,         -- iMaNV - int
    1,         -- iMaKH - int
    '20210829', -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N'Hà Nội'        -- sDiachigiaohang - nvarchar(50)
    )
GO 
INSERT INTO dbo.tblDonDatHang
VALUES
(   3,         -- iSoHD - int
     3,         -- iMaNV - int
    2,         -- iMaKH - int
    '20210829', -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N'Đan Phượng'        -- sDiachigiaohang - nvarchar(50)
    )
GO
/*C. Thực hiện với mỗi đơn đặt hàng trong bảng tblDonDatHang cho phép
thêm các chi tiết đơn đặt hàng tương ứng, mỗi đơn đặt hàng có ít nhất 02
mặt hàng được thêm */
INSERT INTO dbo.tblDonDatHang
VALUES
(   4,         -- iSoHD - int
     3,         -- iMaNV - int
    0,         -- iMaKH - int
    '20210829', -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N'Hà Nam'        -- sDiachigiaohang - nvarchar(50)
    )
GO
INSERT INTO dbo.tblDonDatHang
VALUES
(   5,         -- iSoHD - int
     4,         -- iMaNV - int
    1,         -- iMaKH - int
    '20210829', -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N'Hà Tĩnh'        -- sDiachigiaohang - nvarchar(50)
    )
GO
-- D. Thực hiện cho phép mức giảm giá là 10% cho các mặt hàng bán trong tháng 7 năm 2016
SELECT * FROM dbo.tblDonDatHang
UPDATE dbo.tblMatHang SET fGiahang = fGiahang - (fGiahang * 0.1) FROM dbo.tblDonDatHang WHERE (MONTH(dNgaydathang) = 7)
GO 
-- E. Thực hiện xóa các chi tiết đơn đặt hàng của hóa đơn có mã đơn đặt hàng do sinh viên tự xác định.
DELETE dbo.tblDonDatHang WHERE iSoHD = 1
GO 
---------------------------------------------------------------------------------------------------------------
/*
Bài 2.3
a. Với mỗi khách hàng Nam, hãy thêm cho mỗi người 3 đơn hàng
(tblDonDatHang); mỗi đơn hàng trong 1 tháng khác nhau trước đây và đặt
ít nhất 3 mặt hàng (tblChitietDonHang) với số lượng mua khác nhau.
b. Thêm loại hàng “Thời trang” và “Chăm sóc sức khoẻ” : done
c. Thêm 5 mặt hàng thuộc loại hàng “Thời trang” : done
d. Lập đơn đặt hàng cho ít nhất 2⁄3 số khách hàng Nữ với ít nhất 4⁄5 số mặt hàng Thời trang đã thêm.
e. Giảm giá bán 5% mỗi mặt hàng đã đặt và chưa giao thuộc loại hàng “Thời
trang”
f. Xoá loại hàng “Chăm sóc sức khoẻ”
*/

/*a. Với mỗi khách hàng Nam, hãy thêm cho mỗi người 3 đơn hàng
(tblDonDatHang); mỗi đơn hàng trong 1 tháng khác nhau trước đây và đặt
ít nhất 3 mặt hàng (tblChitietDonHang) với số lượng mua khác nhau. */


INSERT INTO dbo.tblDonDatHang
VALUES
(   0,         -- iSoHD - int
    1,         -- iMaNV - int
    0,         -- iMaKH - int
    GETDATE(), -- dNgaydathang - datetime
    GETDATE(), -- dNgaygiaohang - datetime
    N''        -- sDiachigiaohang - nvarchar(50)
    )
GO 
-- b. Thêm loại hàng “Thời trang” và “Chăm sóc sức khoẻ"
INSERT INTO dbo.tblLoaiHang
VALUES
(   '4', -- sMaloaihang - char(10)
    N'Thời Trang' -- sTenloaihang - nvarchar(30)
    )
	INSERT INTO dbo.tblLoaiHang
VALUES
(   '3', -- sMaloaihang - char(10)
    N'Chăm Sóc Sức Khỏe' -- sTenloaihang - nvarchar(30)
    )
	SELECT * FROM dbo.tblLoaiHang WHERE sTenloaihang = N'thời trang'
	SELECT * FROM dbo.tblMatHang
	SELECT * FROM dbo.tblNhaCungCap
GO 
-- c. Thêm 5 mặt hàng thuộc loại hàng “Thời trang”
	INSERT INTO dbo.tblMatHang
	VALUES
	(   '004',  -- sMahang - char(10)
	    N'đào', -- sTenhang - nvarchar(30)
	    1,   -- iMaNCC - int
	    '0',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
        INSERT INTO dbo.tblMatHang
	VALUES
	(   '005',  -- sMahang - char(10)
	    N'dây chuyền', -- sTenhang - nvarchar(30)
	    2,   -- iMaNCC - int
	    '1',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
        INSERT INTO dbo.tblMatHang
	VALUES
	(   '006',  -- sMahang - char(10)
	    N'đào', -- sTenhang - nvarchar(30)
	    3,   -- iMaNCC - int
	    '2',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
        INSERT INTO dbo.tblMatHang
	VALUES
	(   '007',  -- sMahang - char(10)
	    N'mận', -- sTenhang - nvarchar(30)
	    2,   -- iMaNCC - int
	    '0',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
        INSERT INTO dbo.tblMatHang
	VALUES
	(   '008',  -- sMahang - char(10)
	    N'đồng hồ', -- sTenhang - nvarchar(30)
	    3,   -- iMaNCC - int
	    '0',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
        INSERT INTO dbo.tblMatHang
	VALUES
	(   '009',  -- sMahang - char(10)
	    N'xoài', -- sTenhang - nvarchar(30)
	    2,   -- iMaNCC - int
	    '0',  -- sMaloaihang - char(10)
	    1.0, -- fSoluong - float
	    0.5, -- fGiahang - float
	    'vnd'   -- sDonvitinh - varchar(10)
	    )
GO
	INSERT INTO dbo.tblMatHang
	VALUES
	(   '010',N'vòng cổ',1,'4',1.0,0.5,'vnd' )
		INSERT INTO dbo.tblMatHang
	VALUES
	(   '011',N'vòng tay',1,'4',1.0,0.5,'vnd' )
		INSERT INTO dbo.tblMatHang
	VALUES
	(   '012',N'watch',1,'4',1.0,0.5,'vnd' )
		INSERT INTO dbo.tblMatHang
	VALUES
	(   '013',N'bông tai',1,'4',1.0,0.5,'vnd' )
		INSERT INTO dbo.tblMatHang
	VALUES
	(   '014',N'chàng hạt',1,'4',1.0,0.5,'vnd' )

--d. Lập đơn đặt hàng cho ít nhất 2⁄3 số khách hàng Nữ với ít nhất 4⁄5 số mặt hàng Thời trang đã thêm.
SELECT * FROM dbo.tblDonDatHang
SELECT * FROM dbo.tblChiTietDatHang
SELECT * FROM dbo.tblKhachHang
INSERT INTO dbo.tblDonDatHang
VALUES
(   8,1,
1,GETDATE(),GETDATE()+1,N'Mỹ Đình')
INSERT INTO dbo.tblChiTietDatHang
VALUES
(   8,   -- iSoHD - int
    '010',  -- sMahang - char(10)
    2.0, -- fGiaban - float
    10, -- fSoluongmua - float
    0.0  -- fMucgiamgia - float
    )
	INSERT INTO dbo.tblChiTietDatHang
VALUES
(   8,'011',2.0,20,0.0)
INSERT INTO dbo.tblChiTietDatHang
VALUES
(   8,'012',2.0,110,2.0)
INSERT INTO dbo.tblChiTietDatHang
VALUES
(   8,'013',2.0,30,1.0)
---
-- f. Xoá loại hàng “Chăm sóc sức khoẻ”
DELETE FROM dbo.tblLoaiHang WHERE sTenloaihang = N'Chăm Sóc Sức Khỏe'
SELECT * FROM dbo.tblLoaiHang

-- e. Giảm giá bán 5% mỗi mặt hàng đã đặt và chưa giao thuộc loại hàng “Thời trang"
UPDATE dbo.tblMatHang SET fGiahang = (fGiahang +fGiahang*0.5) WHERE sMaloaihang = 4
SELECT * FROM dbo.tblMatHang
SELECT * FROM dbo.tblLoaiHang
SELECT * FROM dbo.tblDonDatHang
----
/*
Bài 2.4
a. Thực hiện thêm 03 bản ghi vào bảng tblDonNhapHang, ngày nhập thuộc năm
2016 và 2017
b. Thực hiện với mỗi đơn nhập hàng trong bảng tblDonNhapHang cho phép
thêm các chi tiết đơn nhập hàng tương ứng, mỗi đơn nhập hàng có ít nhất 02
mặt hàng được thêm
c. Thực hiện xóa các chi tiết đơn nhập hàng của hóa đơn nhập có mã đơn nhập
hàng do sinh viên tự xác định.
*/
INSERT INTO dbo.tblDonnhaphang
VALUES
(   0,        -- iSoHD - int
    1,        -- iMaNV - int
    GETDATE() -- dNgaynhaphang - datetime
    )
INSERT INTO dbo.tblDonnhaphang VALUES(1,2,GETDATE())
INSERT INTO dbo.tblDonnhaphang VALUES(2,1,GETDATE())
-- b
INSERT INTO dbo.tblChiTietNhapHang
VALUES
(   0,   -- iSoHD - int
    '001',  -- sMahang - char(10)
    100, -- fGianhap - float
    10000  -- fSoluongnhap - float
    )
INSERT INTO dbo.tblChiTietNhapHang VALUES( 0,'002',100,10000 )
INSERT INTO dbo.tblChiTietNhapHang VALUES( 1,'007',200,10000 )
INSERT INTO dbo.tblChiTietNhapHang VALUES( 1,'004',200,10000 )
INSERT INTO dbo.tblChiTietNhapHang VALUES( 2,'005',300,10000 )
INSERT INTO dbo.tblChiTietNhapHang VALUES( 2,'006',300,10000 )

-- c
DELETE dbo.tblChiTietNhapHang FROM dbo.tblDonnhaphang
WHERE tblChiTietNhapHang.iSoHD = tblDonnhaphang.iSoHD AND tblChiTietNhapHang.iSoHD = 1
SELECT * FROM dbo.tblDonnhaphang
SELECT * FROM dbo.tblChiTietNhapHang