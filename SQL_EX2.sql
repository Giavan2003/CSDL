CREATE DATABASE EX2 
GO 
USE EX2 
GO 
CREATE TABLE dbo.NXB(
		MaNXB char(10) PRIMARY KEY, 
		TenNXB char(20) null, 
		DiaChiNXB char(50) null, 
		SoDTNXB char(10) null
)
Go

Insert into NXB Values ('NXB1', 'NXB A', 'DANANG ', '19001001')
Insert into NXB Values ('NXB2', 'NXB B', 'HANOI', '19001002')
Insert into NXB Values ('NXB3', 'NXB C', 'TPHCM', '19001003')
Insert into NXB Values ('NXB4', 'NXB D', 'NHATRANG', '19001004')

GO
CREATE TABLE dbo.DauSach(
		MaSach char(10) PRIMARY KEY,
		Tua char(40) NULL,
		MaNXB char(10) references NXB(MaNXB)
)
Go

Insert into DauSach Values ('B01', 'Cuoi Thuyen nguoc gio', 'NXB4')
Insert into DauSach Values ('B02', 'Tren duong bay ', 'NXB3')
Insert into DauSach Values ('B03', 'Lich su dang', 'NXB1')
Insert into DauSach Values ('B05', 'Business ', 'NXB01')
Insert into DauSach Values ('B06', 'Thi nghiem vat li ', 'NXB2')
Insert into DauSach Values ('B07', 'AI', 'NXB3')
Insert into DauSach Values ('B08', 'Toan 1', 'NXB01')
Insert into DauSach Values ('B09' , 'Toan 2', 'NXB2')
Insert into DauSach Values ('B10', 'Vat ly', 'NXB2')
Insert into DauSach Values ('B11', 'Tieng anh', 'NXB2')
Insert into DauSach Values ('B12', 'Mat troi van moc', 'NXB3')
Insert into DauSach Values ('B13', 'Note ','NXB1')
Insert into DauSach Values ('B14', 'Dac nhan tam ','NXB4')

GO
CREATE TABLE dbo.TacGia(
		MaSach char(10) references DauSach(MaSach),
		TenTG char(30),
		Primary key (MaSach, TenTG)
)
Go

Insert into TacGia Values ('B01', 'Mr.A')
Insert into TacGia Values ('B02', 'Mr.B')
Insert into TacGia Values ('B03', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B04', 'Gymer')
Insert into TacGia Values ('B05', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B06', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B07', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B09', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B10', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B11', 'Bo Giao Duc va Dao Tao')
Insert into TacGia Values ('B12', 'Bo Giao Duc va Dao Tao  ')
Insert into TacGia Values ('B13', 'Hemingway')
Insert into TacGia Values ('B14', 'Hemingway')
Insert into TacGia Values ('B15', 'Addison Wesley')

GO
CREATE TABLE dbo.CuonSach(
		MaSach char(10) references DauSach(MaSach),
		MaCuon char(10) PRIMARY KEY,
		ViTri char (30) Null
		
)
Go

Insert into CuonSach Values ('B01', '01', 'Ke A111')
Insert into CuonSach Values ('B02', '02', 'Ke F102')
Insert into CuonSach Values ('B03', '03', 'Ke A110')
Insert into CuonSach Values ('B03', '04', 'Ke C112')
Insert into CuonSach Values ('B04', '05', 'Ke D101')
Insert into CuonSach Values ('B04', '06', 'Ke B111')
Insert into CuonSach Values ('B05', '07', 'Ke C102')
Insert into CuonSach Values ('B07', '08', 'ke D110')
Insert into CuonSach Values ('B06', '09', 'Ke A104')
Insert into CuonSach Values ('B08', '10', 'Ke F102')
Insert into CuonSach Values ('B01', '11', 'Ke F110')
Insert into CuonSach Values ('B05', '12', 'Ke C117')
Insert into CuonSach Values ('B08', '13', 'Ke D100')
Insert into CuonSach Values ('B09', '14', 'Ke E201')
Insert into CuonSach Values ('B09', '15', 'Ke E101')
Insert into CuonSach Values ('B11', '16', 'Ke F201')
Insert into CuonSach Values ('B11', '17', 'Ke B113')
Insert into CuonSach Values ('B07', '18', 'Ke A104')
Insert into CuonSach Values ('B13', '18', 'Ke B112')
Insert into CuonSach Values ('B14', '19', 'Ke F109')
Insert into CuonSach Values ('B12', '20', 'Ke B200')
Insert into CuonSach Values ('B15', '21', 'Ke A114')
Insert into CuonSach Values ('B14', '22', 'Ke E103')
Insert into CuonSach Values ('B13', '23', 'Ke A201')
Insert into CuonSach Values ('B05', '24', 'Ke F150')
Insert into CuonSach Values ('B13', '25', 'Ke C123')
Insert into CuonSach Values ('B02', '26', 'Ke A124')
Insert into CuonSach Values ('B04', '27', 'Ke D1252')
Insert into CuonSach Values ('B06', '28', 'Ke C132')
Insert into CuonSach Values ('B10', '29', 'Ke F111')
Insert into CuonSach Values ('B15', '30', 'Ke C221')

GO
CREATE TABLE dbo.DocGia(
		MaDG char(10) PRIMARY KEY,
		TenDG char(30) null,
		DiaChi char(50) null,
		SoDT char(11) null
)
Go

Insert into DocGia Values ('M01', 'Nguyen Van A', 'Go Vap','0119999999') 
Insert into DocGia Values ('M02', 'Nguyen Van B', 'Binh Thanh ','0299999999') 
Insert into DocGia Values ('M03', 'Nguyen Van C', 'Quan 10','0288888888') 
Insert into DocGia Values ('M04', 'Nguyen Van D', 'Quan 12','0911111111') 
Insert into DocGia Values ('M05', 'Nguyen Van E', 'Thu Duc','0944444444')

GO
CREATE TABLE dbo.Muon(
		MaCuon char(10) references CuonSach(MaCuon),
		MaDG char(10) references DocGia(MaDG),
		NgMuon date null, 
		NgTra date null
)


Go

Insert into Muon Values ('01','M01', '2022-08-22',NULL)
Insert into Muon Values ('02','M01', '2022-01-22','2022-01-29')
Insert into Muon Values ('13','M03', '2022-09-09',NULL)
Insert into Muon Values ('04','M02', '2022-02-13',NULL)
Insert into Muon Values ('25','M05', '2022-07-25',NULL)
Insert into Muon Values ('16','M04', '2022-01-29',NULL)
Insert into Muon Values ('22','M01', '2022-09-10','2022-11-29')
Insert into Muon Values ('02','M03', '2022-08-22','2022-10-20')
Insert into Muon Values ('21','M02', '2022-09-29','2022-10-22')
Insert into Muon Values ('30','M05', '2022-02-02','2022-02-13')

 
  