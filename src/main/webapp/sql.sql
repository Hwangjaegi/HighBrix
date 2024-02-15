-- 회원 --
drop table Member2;
create table Member2
(
	id varchar(20) primary key,
	password varchar2(20),
	name varchar2(20),
	address varchar2(40),
	tel varchar2(20),
	email varchar2(30),
	reg_date date,
	del char(1)
);

-- 회원추가 --
insert into Member2 values('admin','1234','황재기','부천','010-1234-5678','zzx9603@naver.com',sysdate,'n');
select * from Member2;
select * from board1;

-- 게시판 --
create table Acount
(
	a_no number(10) primary key,
	a_title varchar2(100),
	a_content varchar2(1000),
	a_date date,
	a_view number(10),
	a_image varchar2(300),
	a_password number(10),
	a_del char(1),
	a_ref number(10),
	a_step number(10),
	a_level number(10)
);

select * from Acount;
create sequence Acount;