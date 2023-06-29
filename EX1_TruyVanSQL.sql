
USE EX1

Select TenDA
From DUAN inner join PhanCong on DUAN.MaDA=PhanCong.MaDA
Where MaNV = 'NV01';

-- Câu 1 Tính tổng thời gian tham gia các dự án của mỗi nhân viên
Select MaNV, Sum(ThoiGian) TongTG
From PhanCong
Group by MANV;

-- Câu 2 Cho biết họ và tên các nhân viên chưa tham gia dự án nào
Select HoNV, Tenlot, tenNV
From NhanVien left outer join PhanCong on NhanVien.Manv = PhanCong.MaNV
Where ThoiGian is NULL;



-- Câu a.Tìm ngày sinh và địa chỉ của nhân viên “Nguyễn Bảo Hùng”
Select NgSinh, Dchi
From NhanVien
Where HoNV = 'Nguyen' and Tenlot = 'Bao' and TenNV = 'Hung';

-- Câu b. Tìm tên và địa chỉ của các nhân viên làm việc cho phòng “Nghiên cứu”
Select HoNV, Tenlot, TenNV, Dchi
From NhanVien, PhongBan
Where NhanVien.Phong = PhongBan.MaPB and TenPB = 'Nghien cuu';

-- Câu c. Với mỗi dư án được triển khai ở Gò Vấp, cho biết mã dự án, mã phòng quản lý và họ tên, ngày sinh của trưởng phòng của phòng đó.
Select MaDA, MaPB MaPBQL, HoNV,TenLot, TenNV, NgSinh NgSinhTrPhg
From NhanVien inner join (Select MaDA, MaPB, TrPhong
			From DUAN inner join PhongBan on DuAn.Phong = PhongBan.MaPB
			Where DiaDiem ='Go Vap') Q on NhanVien.MaNV = Q.TrPhong;

-- Câu d.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên của người quản lý nhân viên đó
Select distinct HoNV ,TenLot, TenNV, HoTrgP ,TenlotTrgP,TenTrgP
From NhanVien inner join (Select distinct HoNV HoTrgP,TenLot TenlotTrgP,tenNV TenTrgP, TrPhong 
			From NhanVien inner join PhongBan 
			on NhanVien.MaNV = PhongBan.TrPhong) Q on NhanVien.MaNQL =  Q.TrPhong;
-- Câu e. Cho biết mã nhân viên, họ và tên của các nhân viên của phòng “Nghiên cứu” có mức lương nghiên cứu từ 30000 đến 50000
Select MaNV, HoNV, Tenlot, TenNV,Luong
From NhanVien inner join 
	(Select MaPB From PhongBan Where TenPB = 'Nghien Cuu') Q on NhanVien.Phong = Q.MaPB
Where Luong between 30000 and 50000; 
-- Câu f. Cho biết mã nhân viên, họ tên nhân viên và mã dự án, tên dự án của các dự án mà họ tham gia
Select HoNV, Tenlot, TenNV, DuAn.MaDA, TenDA
From DUAN inner join (Select HoNV, Tenlot,TenNV, MaDA
		From NhanVien inner join PhanCong 
		on NhanVien.Manv = PhanCong.MaNV) Q on DUAN.MaDA = Q.MaDA;
-- Câu g. Cho biết mã nhân viên, họ và tên những người không có quản lý
Select Manv, HoNV, Tenlot, TenNV
From NhanVien
Where MaNQL is NULL;

-- Câu h. Cho biết họ và tên của các trưởng phòng có nhân thân
Select  distinct HoNV, Tenlot, TenNV
From NhanVien 
Where EXISTS (Select distinct *
				From PhongBan inner join ThanNhan 
				on PhongBan.TrPhong = ThanNhan.MaNV)
-- Câu i. Tính tổng lương nhân viên, lương cao nhất, lương thấp nhất và mức lương trung bình
Select sum(Luong) TongLuong, max(Luong) LuongMAX, min(Luong) LuongMin, avg(Luong) LuongTB
From NhanVien;

-- Câu j. Cho biết tổng nhân viên và mức lương trung bình của phòng nghiên cứu
Select Count(Manv) TongNV, avg(Luong) LuongTB
From NhanVien inner join PhongBan on NhanVien.Phong =  PhongBan.MaPB
Where TenPB = 'Nghien cuu';
-- Câu k. Với mỗi phòng, cho biết mã phòng, số lượng nhân viên và mức lương trung bình
Select MaPB, Count(MaNV) SLNV, avg(Luong) LuongTB
From PhongBan inner join NhanVien on PhongBan.MaPB = NhanVien.Phong
Group By MaPB;
-- Câu l. Với mỗi dự án, cho biết mã dự án, tên dự án và tổng số nhân viên tham gia
Select PhanCong.MaDA, TenDA, Count(Manv) SLNV
From DUAN inner join PhanCong on DUAN.MaDA = PhanCong.MaDA
Group By tenDA,PhanCong.MaDA;
-- Câu m. Với mỗi dự án có nhiều hơn 2 nhân viên tham gia, cho biết mã dự án, tên dự án và số lượng nhân viên tham gia
Select DUAN.MaDA, TenDA ,Count(MaNV) SlNV
From DUAN inner join PhanCong on DUAN.MaDA = PhanCong.MaDA
Group By DUAN.MaDA, TenDA
Having Count(MaNV)>2;

-- Câu n. Với mỗi dự án, cho biết mã số dự án, tên dự án và số lượng nhân viên trong phòng số 5

Select DUAN.MaDA, TenDA , Count(MANV) SLNV 
From DUAN inner join PHANCONG on DUAN.MaDA = PHANCONG.MaDA
Where DUAN.Phong = '5'
Group By DUAN.MaDA, TenDA;

-- Câu o. Với mỗi phòng có nhiều hơn 2 nhân viên, cho biết mã phòng và số lượng nhân viên có lương lớp hơn 2500

Select Phong, Count(Manv) SLNV
From NhanVien
Where Luong>25000
Group by Phong
Having Count(Manv)>2;

-- Câu p. Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng và số lượng nhân viên của phòng đó
Select Phong, tenPB, SLNV
From PhongBan inner join 
			(Select Phong, Count(MaNV) SLNV, Avg(Luong) LuongTB
			From NhanVien
			Group by Phong
			Having Avg(Luong)>30000) Q on PhongBan.MaPB = Q.Phong;

-- Câu q. Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng và số lượng nhân viên nam của phong đó
Select P.Phong, tenPB, Count(Manv) SLNVNAM
From NhanVien inner join 
		(Select Phong, tenPB
		From PhongBan inner join 
					(Select Phong , Avg(Luong) LuongTB
					From NhanVien
					Group by Phong, Manv
					Having Avg(Luong)>30000) Q on PhongBan.MaPB = Q.Phong) P
					on NhanVien.Phong = P.Phong
Where NhanVien.Phai = 'nam'
Group by P.Phong, tenPB;



