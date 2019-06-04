create database qldonvi1;
use qldonvi1;
create table NHANVIEN
(
	manv int primary key,
	madv int null,
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
	add constraint FK
		foreign key(madv) references DONVI(madv)

alter table DUAN
	add constraint FK0
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
insert into DUAN (mada,madv,tenda)
values (004,001,'du dan f')
insert into DUAN
values (005,001,'du dan g','nhon ha noi')
insert into DUAN
values (006,001,'du dan h','ba dinh ha noi')

insert into NHANVIEN
values (001,001,'nguyen van A',1993/9/11,'nam',4000)
insert into NHANVIEN
values (002,003,'nguyen van b',1993/9/11,'nam',4000)
insert into NHANVIEN
values (003,003,'nguyen van c',1993/9/11,'nam',4000)
insert into NHANVIEN
values (004,002,'nguyen van d',1993/9/11,'nam',4000)
insert into NHANVIEN
values (005,002,'nguyen van e',1993/9/11,'nam',10000)
insert into NHANVIEN
values (006,002,'nguyen van f',1993/9/11,'nam',3400)
insert into NHANVIEN
values (007,002,'nguyen van g',1993/9/11,'nam',3600)
insert into NHANVIEN
values (008,001,'nguyen thi a',1993/9/11,'nu',400)

select * from donvi
select * from nhanvien
select * from duan

--4, hien thi ho ten, luong cua nhan vien nu co luong < 500

select hoten,luong
from nhanvien
where (luong<500)and(gioitinh='nu')

--5, hien thi ten va dia diem cua cac du an cua mot don vi cu the

select da.tenda,da.diadiem
from donvi dv inner join duan da on dv.madv=da.madv
where dv.tendv='banhang'

--6, cho biet ten nhung don vi dang thuc hien tren 3 du an

select dv.tendv
	from duan da inner join donvi dv on da.madv=dv.madv
	group by dv.tendv
	having count(dv.tendv)>3

--7, tao mot thu tuc luu tru de bo sung 1 ban ghi vao NHANVIEN
--kiem tra tinh hop le cua du lieu can dua vao

create procedure sp_bosung ( @manv int,
							 @madv int,
							 @hoten varchar(20),
							 @ngaysinh datetime,
							 @gioitinh varchar(3),
							 @luong int)
as
	begin
		if (@manv not in (select manv from nhanvien))and(@madv in (select madv from donvi))
			insert into NHANVIEN values (@manv,@madv,@hoten,@ngaysinh,@gioitinh,@luong)
		else
			print ' du lieu khong hop le '
	end

-- 8, su dung thu tuc de them mot bang ghi vao NHANVIEN

sp_bosung @manv=009,
		  @madv=002,
		  @hoten='nguyen van f',
		  @ngaysinh='1993/9/11',	
		  @gioitinh='nam',
		  @luong=3400

