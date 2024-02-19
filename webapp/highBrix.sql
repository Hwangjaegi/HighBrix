
-- 테이블 삭제 (삭제 순서 순)
drop table mypage;
drop table review4;
drop table account;
drop table pickup_buy;
drop table delivery_buy;
drop table love;
drop table cart;
drop table gp_product;
drop table cm_product;
drop table member4;

-- 회원
drop table member4;

create table member4 (
	id varchar2(20) primary key,
	password varchar2(20),
	name varchar2(20),
	address varchar2(40),
	tel varchar2(20),
	email varchar2(30),
	reg_date date,
	del char(1) default 'n',
	is_admin char(1) default 'n'
);
update member4 set is_admin = 'y' where id = 'admin';
insert into member4 values('admin','1234','관리자','신촌','010-1111-1111','k1@k.com',sysdate,'n', 'y');
select * from member4;

-- 일반 상품
drop table cm_product;

create table cm_product (
	cm_no number(20) primary key,
	cm_name varchar2(40),
	cm_content varchar2(100),
	cm_image varchar2(100),
	cm_price number(20),
	cm_discount number(2),
	cm_date date,
	cm_like number(20),
	cm_count number(20)
);
select * from cm_product;

-- 사다드림 상품
drop table gp_product;

create table gp_product (
	gp_no number(10) primary key,
	gp_name varchar2(40),
	gp_content varchar2(100),
	gp_image varchar2(100),
	gp_price number(20),
	gp_discount number(2),
	gp_date date,
	gp_like number(20),
	gp_save char(1),
	gp_count number(20)
);
select * from gp_product;

-- 장바구니
drop table cart;

create table cart (
	c_no number(10) primary key,
	c_count number(10),
	id varchar2(20),
	cm_no number(20),
	gp_no number(10),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no),
	foreign key(gp_no) references gp_product(gp_no)
);
select * from cart;

-- 찜 상품
drop table love;

create table love (
	l_no number(10),
	id varchar2(20),
	cm_no number(20),
	gp_no number(10),
	primary key(l_no, cm_no, gp_no),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no),
	foreign key(gp_no) references gp_product(gp_no)
);
select * from love;

-- 배송 주문
drop table delivery_buy;

create table delivery_buy (
	db_no number(10) primary key,
	db_name varchar2(20),
	db_address varchar2(40),
	db_tel varchar2(20),
	db_request varchar2(50),
	db_date date,
	c_no number(10),
	foreign key(c_no) references cart(c_no)
);
select * from delivery_buy;

-- 픽업 주문
drop table pickup_buy;

create table pickup_buy (
	pb_no number(10) primary key,
	pb_name varchar2(10),
	pb_tel varchar2(20),
	pb_request varchar2(100),
	pb_date date,
	c_no number(10),
	foreign key(c_no) references cart(c_no)
);
select * from pickup_buy;

-- 고객센터 게시판
drop table account;

create table account (
	a_no number(10) primary key,
	a_title varchar2(100),
	a_content varchar2(100),
	a_date date,
	a_view number(20),
	a_password varchar2(20),
	a_image varchar2(100),
	a_del char(1) default 'n',
	a_ref number(10),
	a_step number(10),
	s_level number(10),
	id varchar2(20),
	foreign key(id) references member4(id)
);
select * from account;

-- 리뷰
drop table review4;

create table review4 (
	r_no number(10) primary key,
	r_title varchar2(30),
	r_content varchar2(100),
	r_image varchar2(100),
	r_date date,
	r_score number(1),
	id varchar2(20),
	cm_no number(20),
	gp_no number(10),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no),
	foreign key(gp_no) references gp_product(gp_no)
);
select * from review4;

-- 마이페이지
drop table mypage;

create table mypage (
	id varchar2(20),
	cm_no number(20),
	gp_no number(10),
	db_no number(10),
	pb_no number(10), 
	primary key(id, db_no, pb_no),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no),
	foreign key(gp_no) references gp_product(gp_no)
);
select * from mypage;