CREATE DATABASE EX5
GO
USE EX5
GO
--
CREATE TABLE MHOC(
	MAMH char(4) PRIMARY KEY,
	TENMH varchar(10) NULL,
	SOTIET int
)
GO

Insert into MHOC Values ('T001', 'Toán', 34);
Insert into MHOC Values ('VL02', 'Vật Lý', 30);
Insert into MHOC Values ('SH03', 'SINH Học', 30);
Insert into MHOC Values ('VH04', 'Văn Học', 45);
Insert into MHOC Values ('AV05', 'Tieng Anh', 30);
GO

CREATE TABLE GV(
	MAGV char(4) PRIMARY KEY,
	TENGV varchar(50) NULL,
	MAMH char(4) REFERENCES MHOC(MAMH) NULL,
)
GO

Insert into GV Values ('GV01', 'Co A', 'T001')
Insert into GV Values ('GV02', 'Thay B',  'AV05')
Insert into GV Values ('GV03', 'Co C',  'VH04')
Insert into GV Values ('GV04', 'Thay D', NULL)
Insert into GV Values ('GV05', 'Co E', 'VL02')
Insert into GV Values ('GV06', 'Thay H', NULL)
GO

CREATE TABLE BUOITHI(
	HKY char(5),
	NGAY date,
	GIO CHAR(6),
	PHG char(4) ,
	MAMH char(4) REFERENCES MHOC(MAMH),
	PRIMARY KEY (HKY,NGAY,GIO,PHG) 
)
GO

INSERT into BUOITHI Values ('II', '2023-03-02', '9H00', 'A101', 'T001')
INSERT into BUOITHI Values ('II', '2023-03-03', '7H00', 'A102', 'VH04')
INSERT into BUOITHI Values ('II', '2023-03-04', '7H00', 'B202', 'VL02')
INSERT into BUOITHI Values ('II', '2023-03-04', '15H00', 'A102', 'SH03')
INSERT into BUOITHI Values ('II', '2023-03-05', '15H00', 'B102', 'AV05')
GO

CREATE TABLE PC_COI_THI(
	MAGV char(4) REFERENCES GV(MAGV),
    HKY char(5),
	NGAY date,
	GIO char(6),
	PHG char(4),
	FOREIGN KEY(HKY,NGAY,GIO,PHG) REFERENCES BUOITHI(HKY,NGAY,GIO,PHG)
)
GO

Insert into PC_COI_THI Values ('GV01', 'II', '2023-03-02', '9H00', 'A101')
Insert into PC_COI_THI Values ('GV02', 'II', '2023-03-03', '7H00', 'A102')
Insert into PC_COI_THI Values ('GV03', 'II', '2023-03-04', '7H00', 'B202')
Insert into PC_COI_THI Values ('GV04', 'II', '2023-03-04', '15H00', 'A102')
Insert into PC_COI_THI Values ('GV05','II', '2023-03-05', '15H00', 'B102')

GO