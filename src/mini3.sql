create database minitest;
use minitest;
create table VatTu
(
    id        int primary key,
    MaVT      int,
    TenVT     varchar(255),
    DonViTinh VARCHAR(255),
    GiaTien   int
);
create table NhaCungCap
(
    id            int primary key,
    MaCungCap     int,
    TenNhaCungCap varchar(255),
    DiaChi        varchar(255),
    SoDienThoai   varchar(255)
);
create table PhieuXuat
(
    id           int primary key,
    NgayXuat     date,
    TenKhachHang varchar(255)
);
create table TonKho
(
    id         int primary key,
    VatTu_id   int,
    SLDau      int,
    TongSlNhap int,
    TongSLXuat int,
    foreign key (VatTu_id) references VatTu (id)
);
create table DonHang
(
    id            int primary key,
    MaDon         int,
    NgayDatHang   date,
    NhaCungCap_id int,
    foreign key (NhaCungCap_id) references NhaCungCap (id)
);
create table PhieuNhap
(
    id          int primary key,
    SoPhieuNhap int,
    NgayNhap    date,
    DonHang_id  int,
    foreign key (DonHang_id) references DonHang (id)

);

create table CTDonHang
(
    id         int primary key,
    DonHang_id int,
    VatTu_id   int,
    SoLuongDat int,
    foreign key (DonHang_id) references DonHang (id),
    foreign key (VatTu_id) references VatTu (id)
);
create table CTPhieuNhap
(
    id           int primary key,
    PhieuNhap_id int,
    VatTu_id     int,
    SoLuongNhap  int,
    DonGiaNhap   int,
    GhiChu       varchar(255),
    foreign key (PhieuNhap_id) references PhieuNhap (id),
    foreign key (VatTu_id) references VatTu (id)

);
create table CTPhieuXuat
(
    id           int primary key,
    PhieuXuat_id int,
    VatTu_id     int,
    SoLuongXuat  int,
    DonGiaXuat   int,
    GhiChu       varchar(255),
    foreign key (PhieuXuat_id) references PhieuNhap (id)
);
select *
from VatTu;
select *
from NhaCungCap;
select *
from PhieuXuat;
select *
from TonKho;
select *
from PhieuNhap;
select *
from CTDonHang;
select *
from CTPhieuNhap;
select *
from CTPhieuXuat;


insert into VatTu(id, MaVT, TenVT, DonViTinh, GiaTien)
VALUES (1, 1, 'Búa', 'Cái', 20),
       (2, 2, 'Liềm', 'Cái', 30),
       (3, 3, 'Chày', 'Cân', 40),
       (4, 4, 'Cối', 'Tạ', 50),
       (5, 5, 'Chảo', 'Cái', 60);
insert into TonKho(id, VatTu_id, SLDau, TongSlNhap, TongSLXuat)
VALUES (1,1,50,100,50),
       (2,2,150,200,50),
       (3,3,50,200,150),
       (4,4,40,100,60),
       (5,5,50,100,50),
       (6,1,60,100,40),
       (7,2,70,100,30),
       (8,3,80,100,20),
       (9,4,90,100,10),
       (10,5,100,100,0);
insert into NhaCungCap(id, MaCungCap, TenNhaCungCap, DiaChi, SoDienThoai)
VALUES (1,11,'Nguyễn Tất quân','Bắc Ninh','0888666888'),
       (2,11,'Trịnh Lưu Khoa','Hà Nội','0999999999'),
       (3,11,'Phan Thanh Thảo','Hà Đông','0123456789');
insert into DonHang(id, MaDon, NgayDatHang, NhaCungCap_id)
VALUES (1,1,'2024-04-17',3),
       (2,2,'2024-03-18',1),
       (3,3,'2024-02-19',2);
insert into PhieuNhap(id, SoPhieuNhap, NgayNhap, DonHang_id)
VALUES (1,1,'2024-05-19',3),
       (2,2,'2024-04-16',1),
       (3,3,'2024-03-19',2);
insert into PhieuXuat(id, NgayXuat, TenKhachHang)
VALUES (1,'2024-06-19','Nguyễn Tất Quân'),
       (2,'2024-05-17','Trịnh Lưu Khoa'),
       (3,'2024-04-18   ','Phan Thanh Thảo');
insert into CTDonHang(id, DonHang_id, VatTu_id, SoLuongDat)
VALUES (1,2,1,10),
       (2,1,2,20),
       (3,3,3,30),
       (4,2,4,15),
       (5,1,5,25),
       (6,3,1,10);
insert into CTPhieuNhap(id, PhieuNhap_id, VatTu_id, SoLuongNhap, DonGiaNhap, GhiChu)
VALUES(1,1,1,10,20,'test thoải mái') ,
      (2,2,5,25,60,'Không được test') ,
      (3,3,4,15,50,'test thoải mái') ,
      (4,1,3,30,40,'test thoải mái') ,
      (5,2,2,20,30,'Không được test') ,
      (6,3,1,10,20,'Không được test') ;
insert into CTPhieuXuat(id, PhieuXuat_id, VatTu_id, SoLuongXuat, DonGiaXuat, GhiChu)
VALUES(1,3,1,10,30,'Da xuat') ,
      (2,1,2,20,40,'Da xuat') ,
      (3,2,3,30,50,'Da xuat') ,
      (4,3,4,10,60,'Da xuat') ,
      (5,1,5,20,70,'Da xuat') ,
      (6,3,1,30,30,'Da xuat') ;

# Cau 1
create view vw_CTPNHAP as
select
    id as 'Số phiếu nhập hàng',
    VATTU_id as 'Mã vật tư',
    SoLuongNhap as 'Số lượng nhập',
    DonGiaNhap as 'Đơn giá nhập',
    (SoLuongNhap * DonGiaNhap) as 'Thành tiền nhập'
from CTPhieuNhap;
# Cau 2
CREATE VIEW vw_CTPNHAP_VT AS
SELECT
    CTPhieuNhap.id AS 'Số phiếu nhập hàng',
    CTPhieuNhap.VatTu_id AS 'Mã vật tư',
    VatTu.TenVT AS 'Tên vật tư',
    CTPhieuNhap.SoLuongNhap AS 'Số lượng nhập',
    CTPhieuNhap.DonGiaNhap AS 'Đơn giá nhập',
    (CTPhieuNhap.SoLuongNhap * CTPhieuNhap.DonGiaNhap) AS 'Thành tiền nhập'
FROM CTPhieuNhap
         INNER JOIN VatTu ON CTPhieuNhap.VatTu_id = VatTu.id;
# Cau 3
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT
    CTPhieuNhap.id AS 'Số phiếu nhập hàng',
    CTPhieuNhap.VatTu_id AS 'Mã vật tư',
    VatTu.TenVT AS 'Tên vật tư',
    CTPhieuNhap.SoLuongNhap AS 'Số lượng nhập',
    CTPhieuNhap.DonGiaNhap AS 'Đơn giá nhập',
    (CTPhieuNhap.SoLuongNhap * CTPhieuNhap.DonGiaNhap) AS 'Thành tiền nhập',
    PhieuNhap.NgayNhap AS 'Ngày nhập hàng',
    PhieuNhap.SoPhieuNhap AS 'Số đơn đặt hàng'
FROM CTPhieuNhap
         INNER JOIN VatTu ON CTPhieuNhap.VatTu_id = VatTu.id
         INNER JOIN PhieuNhap ON CTPhieuNhap.PhieuNhap_id = PhieuNhap.id
         INNER JOIN DonHang ON PhieuNhap.DonHang_id = DonHang.id;
# Cau 4
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT
    CTPhieuNhap.id AS 'Số phiếu nhập hàng',
    CTPhieuNhap.VatTu_id AS 'Mã vật tư',
    VatTu.TenVT AS 'Tên vật tư',
    CTPhieuNhap.SoLuongNhap AS 'Số lượng nhập',
    DonHang.NhaCungCap_id AS 'Nhà cung cấp',
    CTPhieuNhap.DonGiaNhap AS 'Đơn giá nhập',
    (CTPhieuNhap.SoLuongNhap * CTPhieuNhap.DonGiaNhap) AS 'Thành tiền nhập',
    PhieuNhap.NgayNhap AS 'Ngày nhập hàng',
    PhieuNhap.SoPhieuNhap AS 'Số đơn đặt hàng'
FROM CTPhieuNhap
         INNER JOIN VatTu ON CTPhieuNhap.VatTu_id = VatTu.id
         INNER JOIN PhieuNhap ON CTPhieuNhap.PhieuNhap_id = PhieuNhap.id
         INNER JOIN DonHang ON PhieuNhap.DonHang_id = DonHang.id
         INNER JOIN NhaCungCap NCC on DonHang.NhaCungCap_id = DonHang.id;
# Cau 5
create view vw_CTPNHAP_loc as
select
    PhieuNhap_id as 'Số phiếu nhập hàng',
    VATTU_id as 'Mã vật tư',
    SoLuongNhap as 'Số lượng nhập',
    DonGiaNhap as 'Đơn giá nhập',
    (CTPhieuNhap.SoLuongNhap * CTPhieuNhap.DonGiaNhap) as 'Thành tiền nhập'
from CTPhieuNhap
where CTPhieuNhap.SoLuongNhap > 5;

# Cau 6
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
    pnh.id AS so_phieu_nhap,
    vt.id AS ma_vat_tu,
    vt.TenVT AS ten_vat_tu,
    ctp.SoLuongNhap AS so_luong_nhap,
    ctp.DonGiaNhap AS don_gia_nhap,
    (ctp.SoLuongNhap * ctp.DonGiaNhap) AS thanh_tien_nhap
FROM
    CTPhieuNhap ctp
        JOIN
    PhieuNhap pnh ON ctp.PhieuNhap_id = pnh.id
        JOIN
    VATTU vt ON ctp.VATTU_id = vt.id
WHERE
    vt.DonViTinh = 'Cái';

# Cau 7
create view vw_CTPXUAT as
select
    PhieuXuat_id as 'Số phiếu xuất hàng',
    VATTU_id as 'Mã vật tư',
    SoLuongXuat as 'Số lượng xuất',
    DonGiaXuat as 'Đơn giá xuất',
    (CTPhieuXuat.SoLuongXuat * CTPhieuXuat.DonGiaXuat) as 'Thành tiền xuất'
from CTPhieuXuat;

#  Cau 8
create view vw_CTPXUAT_VT as
select
    PhieuXuat_id as 'Số phiếu xuất hàng',
    VATTU_id as 'Mã vật tư',
    TenVT as 'Tên vật tư',
    SoLuongXuat as 'Số lượng xuất',
    DonGiaXuat as 'Đơn giá xuất'
from CTPhieuXuat
         join VATTU on VATTU.id = CTPhieuXuat.VATTU_id;

#  Cau 1
delimiter //

create procedure TongSoLuongCuoiVT(in vattu_id int)
begin
    select
        VATTU_id,
        (SLDau + sum(TongSlNhap) - sum(TongSLXuat)) as final_quantity
    from
        TONKHO
    where
        VATTU_id = vattu_id
    group by
        VATTU_id;
end //

delimiter ;
# Cau 2
delimiter //

create procedure TongTienXuatVT(in VatTu_id int)
begin
    select
        VatTu_id,
        SUM(SoLuongXuat * DonGiaXuat) as total_sales
    from
        CTPhieuXuat
    where
        VatTu_id = VatTu_id
    group by
        VatTu_id;
end //

delimiter ;
# Cau 3
delimiter //

create procedure TongSoLuongDat(in DonDH_id int)
begin
    select
        DonDH_id,
        SUM(SoLuongDat) AS Tong_SoLuong
    from
        CTDonHang
    where
        DonDH_id = DonDH_id
    group by
        DonDH_id;
end //

delimiter ;
# Cau 4
delimiter //

create procedure ThemDonHang(in NgayDatHang date, in NhaCungCap_id int)
begin
    insert into DonHang (NgayDatHang, NhaCungCap_id)
    values (NgayDatHang, NhaCungCap_id);
end //

delimiter ;
#  Cau 5
delimiter //

create procedure XoaNhaCungCap(IN NhaCungCap_id INT)
begin
    update DonHang
    set NhaCungCap_id = null
    where NhaCungCap_id = NhaCungCap_id;

    delete from NhaCungCap
    where id = NhaCungCap_id;
end //

delimiter ;
