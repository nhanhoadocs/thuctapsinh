create database qldonvi;
use qldonvi;
create table NHANVIEN
(
	manv int primary key,
	madv int null,
	mada int null,
	hoten varchar(20) null,
	ngaysinh datetime null,
	gioitinh varchar(3) null,
	luong int null
)
create table DONVI
(
	madv int primary key,
	tendv varchar(20) not null,
	nguoiql varchar(20) null,
	ngaybatdau datetime null,
)

create table DUAN
(
	mada int primary key,
	madv int null,
	tenda varchar(20) null,
	diadiem varchar(25) default '141 Duong Chien Thang',
)	

alter table NHANVIEN
	add constraint FK1
		foreign key(madv) references DONVI(madv)

alter table NHANVIEN
	add constraint FK2
		foreign key(mada) references DUAN(mada)

alter table DUAN
	add constraint FK3
		foreign key(madv) references DONVI(madv)

insert into DONVI
values (001,'banhang','a',2000/9/11)
insert into DONVI
values (002,'suachua','nguyen van a',2000/9/11)
insert into DONVI
values (003,'thungan','nguyen van b',2000/9/11)

insert into DUAN (mada,madv,tenda)
values (001,001,'du dan a')
insert into DUAN
values (002,002,'du dan a','yen xa ha noi')
insert into DUAN (mada,madv,tenda)
values (003,003,'du dan a')

insert into NHANVIEN
values (001,001,001,'nguyen van A',1993/9/11,'nam',4000)
insert into NHANVIEN
values (002,003,002,'nguyen van b',1993/9/11,'nam',4000)
insert into NHANVIEN
values (003,003,003,'nguyen van c',1993/9/11,'nam',4000)
insert into NHANVIEN
values (004,002,002,'nguyen van d',1993/9/11,'nam',4000)
insert into NHANVIEN
values (005,002,002,'nguyen van e',1993/9/11,'nam',10000)
insert into NHANVIEN
values (006,002,002,'nguyen van f',1993/9/11,'nam',3400)
insert into NHANVIEN
values (007,002,002,'nguyen van g',1993/9/11,'nam',3600)

select * from donvi
select * from nhanvien
select * from duan

--4, hien thi ho ten, ngay sinh, gioi tinh cua nhan vien co ten 'a'

select hoten,ngaysinh,gioitinh
from nhanvien
where hoten='nguyen van A'

--5, cho biet danh sach don vi va du an cac don vi do tham gia

select da.tenda,dv.tendv
from duan da inner join donvi dv on da.madv=dv.madv

--6, danh sach nhan vien co luong lon hon luong trung binh

select hoten
from nhanvien
where luong>(select avg(luong)
				from nhanvien)

--7, tao mot view de dua ra ma nhan vien, ho ten, ngay sinh,ten don vi 
--co luong lon hon 3500; co the dung view nay de bo sung ban ghi duoc khong?

create view khungnhin
as
	select nv.manv,nv.hoten,nv.ngaysinh,dv.tendv
		from nhanvien nv inner join donvi dv on nv.madv=dv.madv
		where nv.luong>3500


--khong the dung view nay de bo sung ban ghi vi no tac dong den nhieu bang

