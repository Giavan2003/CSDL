CREATE DATABASE EX3
GO
USE EX3

GO
Create table dbo.CoQuan(
	MScoquan char(10) Primary key,
	Tencoquan char(30) null, 
	Diachi char(50) null
)
Go
Insert into CoQuan Values ('50', 'Phong Dao Tao', 'Ho Chi MInh ')
Insert into CoQuan Values ('15', 'Bo Giao Duc', 'Ha Noi ')
Insert into CoQuan Values ('20', 'Bo Thanh Tra', 'Thu Duc')
Insert into CoQuan Values ('25', 'So Giao Duc', 'Ha Noi ')

GO
Create table dbo.NV(
	MSNV char(10) Primary key,
	Ten char(30) null,
	MScoquan char(10) references CoQuan(MScoquan),
	CongViec char(40) null,
	Luong int null
)
Go
Insert into NV Values ('01', 'Nguyen Van A', '15', 'Phó Bo Truong ', 12500000)
Insert into NV Values ('02', 'Nguyen Van B', '20','Thanh Tra Vien', 10000000)
Insert into NV values ('03', 'Nguyen Van C', '25', ' Tong Thu Ki', 7500000)
Insert into NV values ('04', 'Nguyen Van  D', '20', 'Thu Truong Bo Thanh Tra ', 8000000)
Insert into NV Values ('05', 'Nguyen van  E', '25', 'Thanh Tra So Giao duc', 13500000)
Insert into NV Values ('06', 'Nguyen Van F', '50', 'Pho Phong dao tao', 15000000)
