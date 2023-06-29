
USE EX4
--a.Cho biết danh sách các người thợ hiện không tham gia vào một  hợp đồng sửa chữa nào
Select THO.TenTho
From THO left outer join CHITIET_HD on THO.MaTho=CHITIET_HD.MaTho
Where CHITIET_HD.SoHD is null
--b. Cho biết danh sách những hợp đồng đã thanh lý nhưng chưa được thanh toán tiền đầy đủ
Select hd.SoHD
From HOPDONG hd, ( Select SoHD, sum (SoTienThu) as TongTien
							 From PHIEUTHU
							 Group by SoHD) Q 
Where hd.SoHD=Q.SoHD and hd.TriGiaDH>TongTien and hd.NgayNgThu is not null

--c. Cho biết danh sách những hợp đồng cần phải hoàn tất trước ngày 31/12/2023
Select hd.SoHD
From HOPDONG hd
Where hd.NgayNgThu < '2023-12-31'
--d. Cho biết người thợ nào thực hiện công việc nhiều nhất.
Select Tho.MaTho, Tho.TenTho
From THO inner join (
						Select *
						From (Select MaTho, count(MaCV) SLCV
								From CHITIET_HD
								Group by MaTho) Q
						Where SLCV = (Select MAX(SLCV)  From (Select MaTho, count(MaCV) SLCV
									From CHITIET_HD
									Group by MaTho) P) 
								) K on Tho.MaTho = K.MaTho;
--e. Cho biết người thợ nào có tổng trị giá công việc được giao cao nhấT
Select Tho.MaTho, Tho.TenTho
From THO inner join (Select * From (Select MaTho, sum(TriGiaCV) tongtrigiacv
								From CHITIET_HD Group by MaTho) Q
						Where tongtrigiacv = (Select MAX(tongtrigiacv)  From (Select MaTho, sum(TriGiaCV) tongtrigiacv
									From CHITIET_HD	Group by MaTho) P) ) K on Tho.MaTho = K.MaTho;