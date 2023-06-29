USE EX3

-- Câu a: Tìm những nhân viên ở cơ quan có mã số là 50
Select Ten
From NV
Where MScoquan = '50';

-- Câu b: Tìm mã số tất cả các cơ quan từ quan hệ NV
Select distinct MScoquan
From NV;

-- Câu c: Tìm tên các nhân viên ở cơ quan có mã số là 15,20,25
Select Ten
From NV
Where MScoquan = '25' or MScoquan = '20' or MScoquan = '15';

-- Câu d: Tìm tên những người làm việc tai Ha Noi
Select Ten
From NV inner join (Select MScoquan From CoQuan  Where DiaChi = 'Ha Noi') Q on NV.MScoquan = Q.MScoquan;
