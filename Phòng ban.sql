-- Tạo bảng Nhân viên
CREATE TABLE NhanVienMoi1 (
    MaNV INT PRIMARY KEY,
    TenNV NVARCHAR(50),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(100),
    Email NVARCHAR(50),
    SoDienThoai NVARCHAR(20),
    ViTri NVARCHAR(50),
    PhongBan NVARCHAR(50),
    Luong FLOAT
);

-- Tạo bảng Phòng ban
CREATE TABLE PhongBan1 (
    MaPB INT PRIMARY KEY,
    TenPB NVARCHAR(50),
    DiaChi NVARCHAR(100),
    SoDienThoai NVARCHAR(20)
);

-- Tạo bảng Quản lý
CREATE TABLE QuanLy1 (
    MaNV INT,
    MaPB INT,
    PRIMARY KEY (MaNV, MaPB),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
);

-- Thêm dữ liệu vào bảng Nhân viên
INSERT INTO NhanVienMoi (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, Email, SoDienThoai, ViTri, PhongBan, Luong)
VALUES (1, N'Trần Lê Tuấn Anh', '1990-01-01', N'Nam', N'Hà Nội', N'nguyenvana@gmail.com', N'0123456789', N'Nhân viên', N'Phòng Marketing', 10000000);

INSERT INTO NhanVienMoi (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, Email, SoDienThoai, ViTri, PhongBan, Luong)
VALUES (2, N'Nguyễn Thị B', '1995-02-01', N'Nữ', N'Hồ Chí Minh', N'nguyenthib@gmail.com', N'0987654321', N'Quản lý', N'Phòng Sản xuất', 15000000);

-- Thêm dữ liệu vào bảng Phòng ban
INSERT INTO PhongBan1 (MaPB, TenPB, DiaChi, SoDienThoai)
VALUES (1, N'Phòng Marketing', N'Hà Nội', N'0123456789');

INSERT INTO PhongBan1 (MaPB, TenPB, DiaChi, SoDienThoai)
VALUES (2, N'Phòng Sản xuất', N'Hồ Chí Minh', N'0987654321');

-- Thêm dữ liệu vào bảng Quản lý
INSERT INTO QuanLy1 (MaNV, MaPB)
VALUES (2, 2);

-- Hiển thị danh sách nhân viên
SELECT NhanVien.MaNV, NhanVien.TenNV, NhanVien.NgaySinh, NhanVien.GioiTinh, NhanVien.DiaChi, NhanVien.Email, NhanVien.SoDienThoai, NhanVien.ViTri, PhongBan.TenPB, NhanVien.Luong
FROM NhanVien
JOIN PhongBan ON NhanVien.MaNV= PhongBan.TenPB ;

-- Hiển thị danh sách nhân viên theo phòng ban
SELECT NhanVien.MaNV, NhanVien.TenNV, NhanVien.NgaySinh, NhanVien.GioiTinh, NhanVien.DiaChi, NhanVien.Email, NhanVien.SoDienThoai, NhanVien.ViTri, PhongBan.TenPB, NhanVien.Luong
FROM NhanVien
JOIN PhongBan1 ON NhanVien.TenNV= PhongBan1.TenPB
WHERE PhongBan1.TenPB = N'Phòng Sản xuất';

-- Hiển thị danh sách quản lý
SELECT NhanVien.MaNV, NhanVien.TenNV, PhongBan.TenPB
FROM NhanVien
JOIN QuanLy ON NhanVien.MaNV = QuanLy.MaNV
JOIN PhongBan ON QuanLy.MaPB = PhongBan.MaPB;