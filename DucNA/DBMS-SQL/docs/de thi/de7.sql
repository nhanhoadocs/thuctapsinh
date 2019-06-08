create database qldonvi2;
use qldonvi2;
create table NHANVIEN
(
	manv int primary key,
	madv int null,
	hoten varchar(20) not null,
	ngaysinh datetime null,
	gioitinh varchar(3) default 'nam',
	luong int null
)

create table DONVI
(
	madv int primary key,
	tendv varchar(20) null,
	nguoiql varchar(20) null,
	ngaybatdau datetime null,
)

create table DUAN
(
	mada int primary key,
	madv int null,
	tenda varchar(20) null,
	diadiem varchar(25) null,
)	

alter table NHANVIEN
	add constraint FK1
		foreign key(madv) references DONVI(madv)

alter table DUAN
	add constraint FK3
		foreign key(madv) references DONVI(madv)

insert into DONVI
values (001,'banhang','a','2000/9/11')
insert into DONVI
values (002,'suachua','nguyen van a','2000/9/11')
insert into DONVI
values (003,'thungan','nguyen van b','2000/9/11')
insert into DONVI
values (004,'nghiencuu','nguyen hoang ha','2008/9/11')
insert into DONVI
values (005,'quan ly','nguyen hoang ha','2008/9/11')


insert into DUAN (mada,madv,tenda)
values (001,001,'du dan a')
insert into DUAN
values (002,002,'du dan a','yen xa ha noi')
insert into DUAN (mada,madv,tenda)
values (003,003,'du dan a')
insert into DUAN
values (004,004,'du dan a','hung thanh tuyen quang')
insert into DUAN
values (005,004,'du dan a','ba dinh ha noi')

insert into NHANVIEN
values (001,001,'nguyen van A','1993/9/11','nam',4000)
insert into NHANVIEN
values (002,003,'nguyen van b','1993/9/11','nu',4000)
insert into NHANVIEN
values (003,003,'nguyen van c','1993/9/11','nu',4000)
insert into NHANVIEN
values (004,002,'nguyen van d','1993/9/11','nam',4000)
insert into NHANVIEN
values (005,002,'nguyen van e','1993/9/11','nu',10000)
insert into NHANVIEN
values (006,002,'nguyen van f','1993/9/11','nam',3400)
insert into NHANVIEN
values (007,002,'nguyen van g','1993/9/11','nu',3600)
insert into NHANVIEN
values (008,004,'nguyen van g','1993/9/11','nam',399)
insert into NHANVIEN
values (009,004,'nguyen van g','1993/9/11','nu',350)

select * from donvi
select * from nhanvien
select * from duan

--4, hien thi ho ten, luong  cua nhan vien co trong don vi 'nghien cuu'

select nv.hoten,nv.luong
from nhanvien nv inner join donvi dv on nv.madv=dv.madv
where dv.tendv='nghiencuu'

--5, cho biet danh sach co luong duoi 5000 cua tung don vi

select dv.tendv,count(nv.manv)
from nhanvien nv inner join donvi dv on nv.madv=dv.madv
where nv.luong<5000
group by dv.tendv

--6, danh sach cac don vi chua co du an nao

select tendv
from donvi		
where madv not in(	select madv
						from duan)

--7, tao mot view de dua ra ma nhan vien, ho ten, ngay sinh,ten don vi 
--co luong lon hon 3500; co the dung view nay de bo sung ban ghi duoc khong?

create view khungnhin
as
	select nv.manv,nv.hoten,nv.ngaysinh,dv.tendv
		from nhanvien nv inner join donvi dv on nv.madv=dv.madv
		where nv.luong>3500

--khong the dung view nay de bo sung ban ghi vi no tac dong den nhieu bang

