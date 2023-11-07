USE quanlydiemsv;
-- 1
SELECT MaSV, HoSV, TenSV, HocBong
FROM dmsv
ORDER BY MaSV;
-- 2
SELECT MaSV, HoSV, TenSV, gioitinh, NgaySinh
FROM dmsv
ORDER BY gioitinh;
-- 3
SELECT MaSV, HoSV, TenSV, NgaySinh, HocBong
FROM dmsv
ORDER BY NgaySinh, HocBong DESC;
-- 4
SELECT MaMH, TenMH, SoTiet
FROM dmmh
where TenMH LIKE ('t%');
-- 5
SELECT TenSV, HoSV, NgaySinh, gioitinh
FROM dmsv
WHERE TenSV LIKE ('%i');
-- 6
SELECT MaKhoa, TenKhoa
FROM dmkhoa
WHERE TenKhoa LIKE ('_n%');
-- 7
SELECT *
FROM dmsv
WHERE HoSV LIKE ('%Thi%');
-- 8
SELECT MaSV, HoSV, TenSV, MaKhoa, HocBong
FROM dmsv
WHERE HocBong >= 100000
ORDER BY MaKhoa DESC;
-- 9
SELECT HoSV, TenSV, MaKhoa, NoiSinh, HocBong
FROM dmsv
WHERE HocBong >= 70000
  AND NoiSinh LIKE '%ha noi%';
-- 10
SELECT MaSV, MaKhoa, gioitinh
FROM dmsv
WHERE MaKhoa LIKE 'AV'
   OR MaKhoa LIKE 'VL';
-- 11
SELECT MaSV, NgaySinh, NoiSinh, HocBong
FROM dmsv
WHERE NgaySinh BETWEEN '1991-1-1' AND '1992-6-6';
-- 12
SELECT MaSV, NgaySinh, MaSV, HocBong
FROM dmsv
WHERE HocBong BETWEEN 80000 AND 150000;
-- 13
SELECT MaMH, TenMH, SoTiet
FROM dmmh
WHERE SoTiet BETWEEN 30 AND 45;
-- 14
SELECT k.TenKhoa, sv.MaSV, sv.HoSV, sv.TenSV, sv.gioitinh
FROM dmkhoa as k
         JOIN (SELECT * FROM dmsv WHERE gioitinh LIKE 'nam' AND (MaKhoa = 'AV' OR MaKhoa = 'TH')) as sv
WHERE k.MaKhoa = sv.MaKhoa;
-- 15
SELECT *
FROM dmsv
WHERE gioitinh LIKE 'nu'
  AND TenSV LIKE '%n%';
-- 16
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM dmsv
WHERE MONTH(NgaySinh) = 2
  AND NoiSinh LIKE '%ha noi%';
-- 17
SELECT HoSV, TenSV, TIMESTAMPDIFF(YEAR, NgaySinh, NOW()) as Tuoi, HocBong
FROM dmsv
WHERE TIMESTAMPDIFF(YEAR, NgaySinh, NOW()) > 30;
-- 18
SELECT sv.HoSV, sv.TenSV, TIMESTAMPDIFF(YEAR, NgaySinh, NOW()) as Tuoi, k.TenKhoa
FROM dmsv as sv
         JOIN (SELECT * FROM dmkhoa) as k
WHERE (TIMESTAMPDIFF(YEAR, NgaySinh, NOW()) BETWEEN 20 AND 25)
  and k.MaKhoa = sv.MaKhoa;
-- 19
SELECT HoSV, TenSV, gioitinh, NgaySinh
FROM dmsv
WHERE NgaySinh BETWEEN '1990-1-1' AND '1990-3-30';
-- 20
SELECT MaSV,
       gioitinh,
       MaKhoa,
       (CASE
            WHEN HocBong > 50000 THEN 'hoc bong cao'
            ELSE 'hoc bong trung binh'
           END) as 'muc hoc bong'
FROM dmsv;
-- 21
SELECT COUNT(1)
FROM dmsv;
-- 22
SELECT COUNT(1) as 'tsv', SUM(CASE WHEN gioitinh LIKE '%nu%' THEN 1 ELSE 0 END ) as 'svn'
FROM dmsv as sv;
-- 23
