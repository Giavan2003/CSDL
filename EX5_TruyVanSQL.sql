USE EX5
--a. Danh sách các giáo viên dạy các môn học có số tiết từ 45 trở lên
Select GV.TENGV
From GV inner join MHOC on GV.MAMH=MHOC.MAMH
Where MHOC.SOTIET>=45
--b. Danh sách giáo viên được phân công gác thi trong học kỳ 2
Select GV.TENGV
From GV inner join PC_COI_THI on GV.MAGV=PC_COI_THI.MAGV
Where PC_COI_THI.HKY='II'
--c. Danh sách giáo viên không được phân công gác thi trong học kỳ 2
Select GV.TENGV
From GV inner join PC_COI_THI on GV.MAGV=PC_COI_THI.MAGV
Where PC_COI_THI.HKY<>'II'
--d. Cho biết lịch thi môn văn (TENMH = ‘VĂN HỌC’)
Select BUOITHI.HKY, BUOITHI.NGAY, BUOITHI.GIO, BUOITHI.PHG
From MHOC inner join BUOITHI on MHOC.MAMH=BUOITHI.MAMH
Where MHOC.TENMH='Văn Học'
--e. Cho biết các buổi gác thi của các giáo viên chủ nhiệm môn văn (TENMH = ‘VĂN HỌC’).
Select pc.HKY, pc.NGAY, pc.GIO, pc.PHG
From PC_COI_THI pc inner join (Select GV.MAGV
		From GV inner join MHOC on GV.MAMH=MHOC.MAMH
		Where TENMH='Văn Học') Q on pc.MAGV=Q.MAGV