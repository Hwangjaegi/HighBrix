-- 테이블 삭제 (삭제 순서 순)
drop table mypage;
drop table review4;
drop table account;
drop table buy_list;
drop table delivery_buy;
drop table love_cm;
drop table cart;
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
select * from member4;
-- member insert문 , => id가 n인 insert문은 비회원 게시판 처리시 필요하여 추가해주시면 됩니다 
insert into member4 values('n','1234','비회원','비회원동','01012345678','k1@k.com',sysdate,'n','n');
insert into member4 values('admin','1234','어드민','어드민동','01012345678','admin@k.com',sysdate,'n','y');

-- 일반 상품
drop table cm_product;
create sequence cm_no_seq start with 16 increment by 1 maxvalue 999999;
drop sequence cm_no_seq;
-- create sequence cm_no_seq;
create table cm_product (
	cm_no number(20) primary key,
	cm_name varchar2(40),
	cm_content varchar2(2000),
	cm_image varchar2(100),
	cm_price number(20),
	cm_discount number(2),
	cm_date date,
	cm_like number(20),
	cm_count number(20),
	cm_detailimage varchar2(100) -- 상세페이지이미지 추가
);
select * from cm_product;
select sequence cm_no_seq;
select * from (select a.* ,rowNum rn from(select * from cm_product order by cm_no asc) a) where rn between 1 and 8;
select * from (select a.* ,rowNum rn from(select * from cm_product where cm_discount > 0 order by cm_no asc) a) 
		where rn between 1 and 3;
select * from (select a.* ,rowNum rn from(select * from cm_product order by cm_date desc) a) 
		where rn between 1 and 4;
		-- 일반 상품 DB insert --
insert into cm_product values(cm_no_seq.nextval,'꿀 예산사과(1kg)','<h1>아삭아삭 달콤달콤 맛있는 예산 꿀사과</h1><p><h2>아는사람만 아는 사과 맛집 예산지역에서 자라난 달고단 예산사과로<br>기본 16brix이상 당도를 뽑아주는 기가막힌 사과입니다!<h2>','apple.jpg',20000,0,sysdate,0,0,'appleDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'나주 신고배(1kg)','<h1>시원하고 달콤한 나주산 신고배</h1><p><h2>배를 좋아하는 사람들은 이 배만 먹는다죠!<br>기본 14brix이상 당도를 뽑아주는 맛있는 신고배로<br>평균 brix를 뛰어넘는 당도좋은 배입니다!<h2>','pear.jpg',15000,0,sysdate,0,0,'pearDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'산청 딸기(1kg)','<h1>부드럽게 달콤한 산청 딸기</h1><p><h2>우리 아이들에게 항상 핫템!<br>딸기로 유명한 산청에서 무럭무럭 자라났죠!<br>드셔보시면 아는 최고당도 산청딸기입니다!<h2>','strawberry.jpg',15000,0,sysdate,0,0,'strawberryDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'제주도 감귤(5kg)','<h1>톡톡터지는 달콤함! 식감까지좋은 제주도감귤</h1><p><h2>싫어하는 사람 찾는게 어렵다! 기가막힌 당도의 제주도 감귤!<br>심사숙고해서 선별한 감귤로 선호도높은 S사이즈감귤!<br>꼭 드셔보세요! 헤어나올수 없습니다!<h1>','mandarin.jpg',39900,0,sysdate,0,0,'mandarinDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'허니글로우 파인애플(2통)','<h1>과일중 최고당도 자랑! 노랗게 잘익은 허니파인애플</h1><p><h2>노랗게 잘익은 고당도 파인애플을 드셔보세요!<br>실패없는 허니글로우 파인애플로 20brix이상 뽑아줍니다!<br>달달함에 입안이 녹아내리는걸 경험해보세요!<h1></strong>','pineapple.jpg',14000,0,sysdate,0,0,'pineappleDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'태국 망고(2개)','<h1>부들부들 쫀득쫀득 맛있는 태국망고!<p>후숙후 말랑~ 할 때 드셔보세요! 정말맛있답니다<br>항공으로 운송되어 에어포켓없이 맛있게!<br>푸딩처럼 부드럽고 맛있게 즐겨보세요~</h1>','mango.jpg',9900,0,sysdate,0,0,'mangoDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'애플 망고(2개)','<h1>태국망고와는 색다른 향과 맛을 자랑하는 애플망고!<p>후숙후 말랑~ 할 때 드셔보세요! 태국망고보다 맛이좋아요! <br>항공으로 운송되어 에어포켓없이 맛있게!<br>푸딩처럼 부드럽고 맛있게 즐겨보세요~</h1>','applemango.jpg',19900,0,sysdate,0,0,'applemangoDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'샤인머스켓 1박스(2kg)','<h1>사탕처럼 달콤한 샤인머스켓 등장!<p>사과처럼 아삭한 식감에 과즙이 팡팡!<br>씨도없어서 아이들도 안전하게!<br>맛있게 즐겨보세요~!</h1>','shine.jpg',29900,0,sysdate,0,0,'shineDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'스테비아 토마토(500g)','<h1>설탕 뿌린것처럼 달콤한 토마토!<p>빨간 방울토마토를 스테비아로 키운 달콤한 토마토라구요~<br>한번 드셔보시면 빠져나올수 없는 그맛!<br>스테비아 토마토를 드셔보세요!</h1>','tomato.jpg',9000,20,sysdate,0,0,'tomatoDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'스테비아 별마토(500g)','<h1>설탕 뿌린것처럼 달콤한 토마토!<p>꼭지를 똑 떼면 별이보인다해서 별마토!<br>흑토마토 종류의 별마토는 더욱 달콤하답니다!<br>별칭으로 초코단마토라는 말도 있다구요~</h1>','tomato2.jpg',10000,20,sysdate,0,0,'tomato2Detail.jpg');
insert into cm_product values(cm_no_seq.nextval,'스테비아 젤리마토(500g)','<h1>설탕 뿌린것처럼 달콤한 토마토!<p>젤리처럼 말랑말랑한 촉감의 토마토!<br>상한거 아니에요! 일단 드셔봐바~<br>톡터지면서 단맛이 사르르 녹아드는 꿀토마토!</h1>','tomato3.jpg',10000,20,sysdate,0,0,'tomato3Detail.jpg');
insert into cm_product values(cm_no_seq.nextval,'피치애플(1kg)','<h1>복숭아향이 찐~한 사과!<p>피치애플이 찾아왔습니다!<br>정말 보기힘든 사과인데 드셔보셨나몰라~<br>복숭아를 평소에 좋아한다면 TRY~</h1>','peachapple.jpg',15000,0,sysdate,0,0,'peachappleDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'파파야메론(2개)','<h1>참외와 메론의 장점을 하나로!<p>파파야메론 두둥등장!<br>참외처럼 아삭하고 메론처럼 단맛가득!<br>달콤한 파파야 드셔보세요!</h1>','papayamelon.jpg',10000,0,sysdate,0,0,'papayamelonDetail.jpg');
insert into cm_product values(cm_no_seq.nextval,'신데렐라딸기(500g)','<h1>하얀 눈꽃맞고자란 신데렐라 딸기!<p>일반 딸기와다르게 알이 단단하고 단맛도 가득!<br>특별한 선물을 하고싶다면 신데렐라딸기로 gogo~</h1>','strawberry2.jpg',10000,0,sysdate,0,0,'strawberry2Detail.jpg');
insert into cm_product values(cm_no_seq.nextval,'스테비아자몽(1kg)','<h1>달콤한 자몽이 찾아온다<p>쌉싸름한 맛은가라! 달콤한맛 가득!<br>꿀같은 자몽을 찾으신다면 스테비아자몽 선택해보세요!</h1>','jamong.jpg',12900,0,sysdate,0,0,'jamongDetail.jpg');

-- 장바구니
drop table cart;
create sequence c_no_seq;
drop sequence c_no_seq;
create table cart (
	c_no number(10) primary key,
	c_count number(10),
	id varchar2(20),
	cm_no number(20),
	cm_name varchar2(4),
	cm_image varchar2(100),
	cm_price number(20),
	cm_discount number(2),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no)
);
select * from cart;

-- 찜 상품
drop table love_cm;
create sequence lcm_no_seq;
drop sequence lcm_no_seq;
create table love_cm (
	lcm_no number(10),
	id varchar2(20),
	cm_no number(20),
	cm_name varchar2(40),
	cm_image varchar2(100),
	cm_price number(20),
	primary key(lcm_no, cm_no),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no)
);

select * from love_cm;

-- 배송 주문
drop table delivery_buy;
create sequence db_no_seq;
drop sequence db_no_seq;

create table delivery_buy (
	db_no number(10) primary key,
	db_name varchar2(20) not null,
	db_address varchar2(40),
	db_tel varchar2(20),
	db_request varchar2(50) not null,
	db_date date,
	cm_no number(20),
	id varchar2(20),
	cm_name varchar2(40),
	cm_image varchar2(100),
	cm_price number(20),
	bl_count number(10),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no)
);
select * from delivery_buy;

-- 고객센터 게시판
drop table account;
create sequence refcount;
drop sequence refcount;
create table account (
	a_no number(10) primary key,
	a_title varchar2(100),
	a_password varchar2(100),
	a_content varchar2(2000),
	a_date date,
	a_view number(20),
	a_image varchar2(100),
	a_del char(1) default 'n',
	a_ref number(10),
	a_step number(10),
	a_level number(10),
	id varchar2(20),
	foreign key(id) references member4(id)
);
select * from account;
delete from account;
-- 고객센터 insert	, [회원게시판 password는 임시적으로 member로 설정되게하였습니다.]
insert into account values(1,'공지사항입니다','member','공지드립니다 이번 2024년 5월 13일 이후로 하이브릭스 영업 종료됩니다.<br> 그동안 사랑해주신 회원님들께 감사말씀드립니다.',sysdate,1234,'null.jpg','n',1,0,0,'admin');
insert into account values(3,'헉! 말도안돼','1234','ㅠㅠ 그동안 고생하셨습니다!!<br>다른일도 번창하시기를 바랍니다!',sysdate,0,'null.jpg','n',1,1,1,'jeff0808');


-- 리뷰
drop table review4;
drop sequence r_no_seq;
create sequence r_no_seq;
select * from r_no_seq1;

create table review4 (
	r_no number(10) primary key,
	r_title varchar2(200),
	r_content varchar2(2000),
	r_image varchar2(100),
	r_date date,
	r_score number(1),
	id varchar2(20),
	cm_no number(20),
	foreign key(id) references member4(id),
	foreign key(cm_no) references cm_product(cm_no)
);
select * from review4;

-- 구매내역
drop table buy_list; 
create sequence bl_no_seq;
drop sequence bl_no_seq;
create table buy_list(
	bl_no number(10) primary key ,
	bl_count number(10),
	bl_price number(10),
	id varchar2(20),
	cm_no number(20),
	foreign key(cm_no) references cm_product(cm_no),
	foreign key(id) references member4(id)
);
select * from buy_list;
