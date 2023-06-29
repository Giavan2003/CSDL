CREATE DATABASE  EX4
GO

USE EX4 

CREATE TABLE dbo.THO(
	MaTho char(5) PRIMARY KEY,
	TenTho char(30),
	Nhom int NULL,
	NhomTruong char(5) references THO(MaTho),
)
GO
Insert into THO Values ('001', 'A', '01', Null)
Insert into THO Values ('002', 'B', '01', '001')
Insert into THO Values ('003', 'C', '01', '001')
Insert into THO Values ('004', 'D', '02', Null)
Insert into THO Values ('005', 'E', '02', '005')
Insert into THO Values ('006', 'F', '02', '005')
Insert into THO Values ('007', 'G', '03', Null)
Insert into THO Values ('008', 'H', '04', '007')
Insert into THO Values ('009', 'K', '05', '007')

GO
CREATE TABLE dbo.KHACHHANG(
	MaKH char(5) PRIMARY KEY,
	TenKH char(30),
	DiaChi char(30) NULL,
	DienThoai char(10) NULL,
)
GO

Insert into KHACHHANG Values ('K01', 'Phuong', 'Thu Duc', 012345678)
Insert into KHACHHANG Values ('K02', 'Hieu', 'Quan 2', 0121212122)
Insert into KHACHHANG Values ('K03', 'Nam', 'Quan 10', 0811111111)
Insert into KHACHHANG Values ('K04', 'Hong', 'Tan Binh ',0922222222)
Insert into KHACHHANG Values ('K04', 'Hanh', 'Binh Thanh ',0955985214)
GO

CREATE TABLE dbo.CONGVIEC(
	MaCV char(5) PRIMARY KEY,
	NoiDungCV char(50),
)
GO

Insert into CONGVIEC Values ('CV1', 'SON XE')
Insert into CONGVIEC Values ('CV22', 'BOM HOI')
Insert into CONGVIEC Values ('CV3', 'KIEM TRA')
Insert into CONGVIEC Values ('CV4', 'LAM MAY')
Insert into CONGVIEC Values ('CV5', 'BAO TRI')
Insert into CONGVIEC Values ('CV6', 'VA XE')
Insert into CONGVIEC Values ('CV7', 'DIEN')
Insert into CONGVIEC Values ('CV8', 'THO DEN XE')


CREATE TABLE dbo.HOPDONG(
	SoHD char(10) PRIMARY KEY,
	NgayHD date NULL,
	MaKH char(5) references KHACHHANG(MaKH),
	SoXe char(10) NULL,
	TriGiaDH int NULL,
	NgayGiaoDK date NULL,
	NgayNgThu date NULL,
)
GO

Insert into HOPDONG Values ('HD01', '2023-02-15', 'K01', '59-1234', 1500000, '2023-02-25', '2023-02-27')
Insert into HOPDONG Values ('HD02', '2023-03-11', 'K02', '28-5002', 2600000, '2023-04-11', '2023-04-14')
Insert into HOPDONG Values ('HD03', '2023-02-12', 'K03', '47-5837', 1700000, '2023-04-20', '2023-04-02')
Insert into HOPDONG Values ('HD04', '2023-09-13', 'K04', '31-2321', 2800000, '2023-09-13', '2023-10-20')
Insert into HOPDONG Values ('HD05', '2023-03-11', 'K05', '38-7898', 3100000, '2023-03-11', '2023-04-20')
GO

CREATE TABLE dbo.CHITIET_HD(
	SoHD char(10) references HOPDONG(SoHD),
	MaCV char(5) references CONGVIEC(MaCV),
	TriGiaCV int NULL,
	MaTho char(5) references THO(MaTho),
	KhoanTho int NULL,
	PRIMARY KEY (SoHD, MaCV),
)
GO
Insert into CHITIET_HD Values ('HD01', 'CV1', 50000, '001', 45000)
Insert into CHITIET_HD Values ('HD02', 'CV3', 400000, '002', 350000)
Insert into CHITIET_HD Values ('HD03', 'CV2', 300000, '004', 20000)
Insert into CHITIET_HD Values ('HD04', 'CV4', 450000, '003', 40000)
Insert into CHITIET_HD Values ('HD05', 'CV7', 350000, '007', 30000)
Insert into CHITIET_HD Values ('HD06', 'CV6', 1000000, '008', 880000)


CREATE TABLE dbo.PHIEUTHU(
	SoPT char(10) PRIMARY KEY,
	NgaylapPT date NULL,
	SoHD char(10) references HOPDONG(SoHD),
	MaKH char(5) references KHACHHANG(MaKH),
	HoTen char(30),
	SoTienThu int NULL,
)
GO
Insert into PHIEUTHU Values ('PT1', '2023-03-03', 'HD01', 'K01', 'TRAN DUY PHUONG ', 2500000)
Insert into PHIEUTHU Values ('PT2', '2023-03-04', 'HD12', 'K02', 'TRAN VAN TIEN ', 6200000)
Insert into PHIEUTHU Values ('PT3', '2023-03-04', 'HD23', 'K03', 'NGUYEN DINH HIEU ', 250000)
Insert into PHIEUTHU Values ('PT4', '2023-03-05', 'HD34', 'K04', 'BÙI GIA VAN ', 8100000)
Insert into PHIEUTHU Values ('PT5', '2023-03-04', 'HD45', 'K04', 'HAOOANG NGUYEN ', 380000)