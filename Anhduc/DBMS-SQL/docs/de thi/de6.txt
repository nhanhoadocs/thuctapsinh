create database thuvien1;
use thuvien1;
create table bandoc
(
	mabd int primary key,
	tenbd varchar(20) not null,
	lop varchar (10) null,
	ngaycap datetime null
)
create table sach
(
	masach int primary key,
	tensach varchar(20) null,
	tacgia varchar(20) null,
	namxb int null,
	nhaxb varchar(20) null,
)
create table phieumuon
(
	mabd int not null,
	masach int not null,
		constraint khoachinh primary key (mabd,masach),
	ngaymuon datetime default getdate(),
	ngaytra datetime null,
	datra varchar(20) null,
)


alter table phieumuon
	add constraint fk1
		foreign key(mabd) references bandoc(mabd)

alter table phieumuon
	add constraint fk2
		foreign key(masach) references sach(masach)

insert into bandoc
values (001,'nguyen van a','at8c',2011/6/9)
insert into bandoc
values (002,'nguyen van b','at8b',2011/6/9)
insert into bandoc
values (003,'nguyen van d','at8a',2011/6/9)
insert into bandoc
values (004,'nguyen van e','at8a',2011/6/9)
insert into bandoc
values (005,'nguyen van f','at8c',2011/6/9)

insert into sach
values (001,'tin hoc','a',2010,'nxb giao duc')
insert into sach
values (002,'toan hoc','a',2008,'nxb giao duc')
insert into sach
values (003,'vat ly','e',2011,'nxb kim dong')
insert into sach
values (004,'phan cung','f',2000,'nxb giao duc')

insert into phieumuon
values (001,001,2013/11/18,2013/11/28,'chua')
insert into phieumuon
values (001,002,2013/11/18,2013/11/28,'chua')
insert into phieumuon
values (002,002,2013/11/8,2013/11/18,'roi')
insert into phieumuon
values (002,003,2013/11/29,2013/12/9,'chua')
insert into phieumuon
values (003,001,2013/11/28,2013/12/8,'chua')
insert into phieumuon
values (003,002,2013/11/28,2013/12/8,'roi')
insert into phieumuon
values (003,003,2013/11/8,2013/11/28,'roi')
insert into phieumuon
values (005,002,2013/11/28,2013/12/8,'roi')
insert into phieumuon
values (005,003,2013/11/8,2013/11/28,'roi')
insert into phieumuon
values (005,001,11/11/2013,21/11/2013,'roi')
insert into phieumuon
values (001,003,11/2013/11,2013/11/9,'roi')
insert into phieumuon
values (002,001,1900/11/8,1900/11/28,'roi')
insert into phieumuon
values (004,001,'1900/11/8','1900/11/28','roi')
insert into phieumuon
values (004,002,'2013/11/8','2013/11/28','roi')
insert into phieumuon
values (004,003,'2013/12/1','2013/12/11','roi')

select * from bandoc
select * from sach
select * from phieumuon

-- 4, hien thi danh sach ban doc duoc cap the vao ngay 2/7/1900

select tenbd
from bandoc
where ngaycap=2011/6/9


-- 5, danh sach ten ban doc va lop cua ban doc muon sach qua han. biet rang moi quyen
--sach duoc muon trong 5 ngay

select bd.tenbd,bd.lop,pm.mabd
from bandoc bd inner join phieumuon pm on bd.mabd=pm.mabd 
where  (year(getdate())-year(ngaymuon))*365 + (month(getdate())-month(ngaymuon))*30 + (day(getdate())-day(ngaymuon))>5

-- 6, hien thi so lan muon tung quyen sach, nhung quyen chua duoc muon ghi la 0
--cac cot gom masach tensach va so lan muon

select s.masach,s.tensach,count(pm.masach) as solanmuon
from sach s full outer join phieumuon pm on s.masach=pm.masach
group by s.masach,s.tensach

-- 7, tao mot thu tuc co chuc nang dua ra ten sach co trong thu vien

create procedure sp_tensach (@nhaxb varchar(20))
as
	begin
		print 'ten sach co trong thu vien cua nxb' + @nhaxb
		select tensach
		from sach
		where nhaxb=@nhaxb
	end 
-- 8, su dung thu tuc tren de dua ra cac sach cua nxb giao duc
sp_tensach @nhaxb='nxb giao duc'
