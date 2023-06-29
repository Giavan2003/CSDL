USE EX2
-- cau a.	Cho biết Địa chỉ và số điện thoại của Nhà xuất bản “NXB A”
Select DiaChiNXB , SoDTNXB From NXB Where TenNXB = 'NXB A'
-- cau b.	Cho biết mã sách và Tựa sách của những cuốn sách được xuất bản bởi nhà xuất bản “NXB A”
Select MaSach , Tua From DauSach inner join NXB on  DauSach.MaNXB = NXB.MaNXB
Where NXB.TenNXB='NXB A'
--cau c.	Cho biết mã sách và Tựa sách của những cuốn sách có tác giả là “Hemingway”
Select DauSach.MaSach, Tua From DauSach inner join TacGia on DauSach.MaSach = TacGia.MaSach 
Where TacGia.TenTG = 'Hemingway'
--cau d.	Với mỗi đầu sách, cho biết tựa và số lượng cuốn sách mà thư viện đang sở hữu 
Select Tua ,Sluong From DauSach inner join (Select MaSach , COUNT(MaSach) Sluong From CuonSach group by MaSach) Q on DauSach.MaSach = Q.MaSach
--cau e.	Với mỗi độc giả, hãy cho biết Tên, địa chỉ và số lượng cuốn sách mà người đó đã mượn 
Select 	DocGia.TenDG, DiaChi, SLCuon	
From DocGia inner join (Select MaDG, Count(MaCuon) SLCuon
						From Muon Group by MaDG) Q on DocGia.MaDG = Q.MaDG;
--Cau f.	Cho biết mã cuốn, tựa sách và vị trí của những cuốn sách được xuất bản bởi nhà xuất bản “NXB A”
Select MaCuon, Tua, ViTri From (Select MaNXB, Tua, MaCuon, ViTri From DauSach  inner join CuonSach on DauSach.MaSach = CuonSach.MaSach) Q
	inner join (Select MaNXB From NXB Where TenNXB= 'NXB A') P  on Q.MaNXB= P.MaNXB;
-- Câu g: Với mỗi đầu sách, hãy cho biết Tên nhà xuất bản và số lượng tác giả
Select TenNXB, COUNT(TenTG) SLTGia
From NXB inner join (Select distinct MaNXB, TenTG
					From TacGia inner join DauSach on TacGia.MaSach = DauSach.MaSach) Q on NXB.MaNXB = Q.MaNXB Group by TenNXB;
-- Câu h: Hãy cho viết Tên, địa chỉ, số điện thoại của những độc giả mượn từ 5 cuốn sách trở lên
Select TenDG, DiaChi, SoDT
From DocGia inner join (Select MaDG, COUNT(MaCuon) SLMuonS
	From Muon Group by MaDG) Q on DocGia.MaDG = Q.MaDG Where SLMuonS >=5;
-- Câu i: Cho biết mã NXB, tên NXB và số lượng đầu sách của NXB đó trong CSDL
Select NXB.MaNXB, TenNXB, SLSach
From NXB inner join (Select MaNXB, Count (MaCuon) SLSach From DauSach inner join CuonSach on DauSach.MaSach = CuonSach.MaSach
Group by MaNXB) Q on NXB.MaNXB = Q.MaNXB;
-- Câu j: Cho biết mã NXB, tên NXB và địa chỉ của những NXB có từ 100 đầu sách trở lên
Select NXB.MaNXB, TenNXB, DiaChiNXB
From DauSach inner join NXB on DauSach.MaNXB = NXB.MaNXB Group by NXB.MaNXB, TenNXB, DiaChiNXB Having Count(MaSach)>=100;

-- Câu k: Cho biết mã NXB, tên NXB và số lượng tác giả đã hợp tác với NXB đó
Select NXB.MaNXB, TenNXB, COUNT(TenTG) SLTGia
From NXB inner join (Select distinct MaNXB, TenTG From TacGia inner join DauSach on TacGia.MaSach = DauSach.MaSach) Q on NXB.MaNXB = Q.MaNXB
Group by NXB.MaNXB ,TenNXB;
-- Câu l: Tựa và số lượng tác giả của những cuốn sách có tác giả là "Hemingway" mà độc giả Nguyễn Văn A đã mượn
