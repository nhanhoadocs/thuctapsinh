create database truonghoc;
use truonghoc;
create table sinhvien
(
	masv int primary key,
	malop int null,
	hoten varchar(20) null,
	ngaysinh datetime null,
	gioitinh varchar(10) default 'nam',
	diem int null,
)
create table giaovien
(
	magv int primary key,
	malop int null,
	tengv varchar(20) null,
	trinhdocm varchar(20) null,
)
create table lophoc
(
	malop int primary key,
	tenlop varchar(20) not null,
	diadiem varchar(20) null,
	gvcn varchar(20) null,
)

alter table sinhvien
add
	constraint fk1 foreign key(malop) references lophoc(malop)

alter table giaovien
add
	constraint fk2 foreign key(malop) references lophoc(malop)

insert into lophoc
values (001,'at8a','phong 101','quynh')
insert into lophoc
values (002,'at8b','phong 103','quynh')
insert into lophoc
values (003,'at8c','phong 104','quynh')

insert into sinhvien
values (001,001,'nguyen van a',1993/11/9,'nu',6)
insert into sinhvien
values (002,001,'nguyen van b',1993/11/9,'nam',9)
insert into sinhvien
values (003,002,'nguyen hoang a',1993/11/9,'nu',10)
insert into sinhvien
values (004,003,'nguyen a',1993/11/9,'nam',9)

insert into giaovien
values (001,001,'nguyen hoa a','tien si') 
insert into giaovien
values (002,002,'nguyen van a','cao dang')
insert into giaovien
values (003,002,'nguyen xuan a','thac si')
insert into giaovien
values (004,003,'nguyen hoang a','giao su')

select * from sinhvien

-- 4, danh sach cac sinh vien nu dat diem >=9

select masv,hoten
from sinhvien
where (diem>=9)and(gioitinh='nu')

-- 5, hien thi ten giao vien, trinh do giao vien lop at8b

select gv.tengv,gv.trinhdocm
from giaovien gv inner join lophoc lh on gv.malop=lh.malop
where lh.tenlop='at8b'

-- 6, cho biet ho ten, diem cua cac sinh vien co diem lon hon trung binh cua lop

select hoten,diem
from sinhvien
where (malop=001)and(diem>(select avg(diem)
						from sinhvien))


-- 7, tao mot thu tuc co chuc nang hien thi danh sach sinh vien cua mot lop bat ky

create procedure sp_dssinhvien (@tenlop varchar(20))
as
	begin
		select sv.masv,sv.hoten,sv.ngaysinh
		from sinhvien sv inner join lophoc lh on sv.malop=lh.malop
		where lh.tenlop=@tenlop
		print ' danh sach sinh vien cua lop ' + @tenlop
	end

sp_dssinhvien @tenlop='at8a'
