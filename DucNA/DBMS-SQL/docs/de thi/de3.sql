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

select * from bandoc
select * from sach
select * from phieumuon

-- 4, hien thi danh sach ban doc duoc cap the vao ngay 2/7/1900

select tenbd
from bandoc
where ngaycap=2011/6/9


-- 5, danh sach ten ban doc va lop cua ban doc muon sach qua han. biet rang moi quyen
--sach duoc muon trong 5 ngay

select *
from bandoc bd inner join phieumuon pm on bd.mabd=pm.mabd 
where  (getdate()-getdate(pm.ngaymuon))>5

-- 6, danh sach nhung ban doc da dang ky the nhung chua muon lan nao

select tenbd
from bandoc
where mabd not in ( select mabd from phieumuon)

-- 7, tao mot view de hien thi cac thong tin ve ma ban doc, ten ban
-- doc va lop cua ban doc muon sach qua han; co the dung view nay de 
-- bo sung du lieu vao bang BANDOC khong?

create view khungnhin
as
select bd.mabd,bd.tenbd,bd.lop
	from bandoc bd inner join phieumuon pm on bd.mabd=pm.mabd
	where	bd.mabd not in(select bd.mabd
							from bandoc bd inner join phieumuon pm on bd.mabd=pm.mabd
								where pm.datra='chua')
	group by bd.mabd,bd.tenbd,bd.lop

-- khong bo xung duoc vi trong khungnhin co chua tu khoa group by