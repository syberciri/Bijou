-- MEMBER 테이블
ALTER TABLE company_member RENAME COLUMN member_name TO member_name2;

drop table member;
create table member(
    member_idx       number(10) primary key,
    member_id        varchar2(20),
    member_pw        varchar2(20),
    member_name      varchar2(20),
    member_email     varchar2(100),
    member_phone     varchar2(20),
    member_address   varchar2(100),
    member_gender    varchar2(10),
    member_birthdate      date,
    member_joindate      date default sysdate
);
​
drop sequence member_seq;
create sequence member_seq;
​
insert into member(member_idx, member_id, member_pw, member_name, member_email, member_phone, member_address, member_gender, member_birthdate, member_joindate)
values (member_seq.nextval, 'saltriver', '1234', '소금강', 'saltriver@gmail.com', '010-1111-2222', '서울시 노원구', 'male', '2020/01/01', sysdate);
​
-- ITEM 테이블
create table items(
    item_idx        number(10) primary key,
    item_number     varchar(10),
    item_name       varchar(100),
    item_category   varchar(100),
    item_img        varchar(100),
    item_price      number(10)
);
​
create sequence items_seq;
​
insert into items(item_idx, item_number, item_name, item_category, item_img, item_price)
values (items_seq.nextval, '1105',  '비쥬수제팔찌',  '팔찌',  '????',  '2000');
​

-- 공지사항
drop table notice;
create table notice(
notice_idx number(4) primary key,
notice_title varchar2(100),
notice_conctent varchar2(2000),
notice_date date default sysdate,
notice_hit number(4) default 0
);
drop sequence notice_seq;
create sequence notice_seq;

insert into notice(notice_idx, notice_title, notice_conctent, notice_date)
values (notice_seq.nextval, '주문 전 필독사항', '주문/결제', sysdate);
​
-- 주문내역
create table order_list(
order_number number(3) primary key,
order_item_img varchar2(100) ,
order_item_info varchar2(50),
order_amount number(3),
order_status varchar2(10)
);
​
drop sequence order_list_seq;
create sequence order_list_seq;
​
-- 장바구니
drop table cart;
create table cart(
    cart_idx number(4) primary key,
    user_idx number(4) not null,
    constraint fk_user_idx foreign key(user_idx) references member(member_idx),
    cart_item_idx number(20) not null,
    constraint fk_cart_item_idx foreign key(cart_item_idx) references member(member_idx),
    item_order_amount number(3)
);

drop sequence cart_seq;
create sequence cart_seq;
​
-- 리뷰(후기)
drop table review;
create table review(
    review_idx      number(4) primary key,
    review_image    varchar2(255),
    review_date     date default sysdate,
    review_name     varchar2(20),
    review_title    varchar2(100),
    review_content  varchar2(2000),
    review_score    varchar2(20)
);

drop sequence review_seq;
create sequence review_seq;​

insert into review(review_idx,review_image,review_date,review_name,review_title,review_content,review_score)
values (review_seq.nextval,'load_image',sysdate,'홍길동','리뷰제목','리뷰내용','평점');
​
-- 아이템 1:1
drop table items_qna;
create table items_qna(
    items_qna_idx      number(4) primary key,
    items_qna_content varchar2(2000),
    items_qna_name    varchar2(20),
    items_qna_date    date default sysdate
);
​
drop sequence items_qna_seq;
create sequence items_qna_seq;

insert into items_qna(items_qna_idx, items_qna_content, items_qna_name, items_qna_date)
values(items_qna_seq.nextval,'qna내용','홍길동',sysdate);
​
-- 1:1문의
drop table one2one;
create table one2one(
    one2one_idx      		number(10) primary key,
    one2one_category		varchar2(20),
    one2one_title     		varchar2(20),
    one2one_email     		varchar2(100),
    one2one_phone    		varchar2(20),
    one2one_content  		varchar2(200),
    one2one_img		 	    varchar2(100),
    one2one_date     		date default sysdate
);
drop sequence one2one_seq;
create sequence one2one_seq;
​
insert into one2one (one2one_idx, one2one_category, one2one_title, one2one_email, one2one_phone, one2one_content, one2one_img, one2one_date)
values (one2one_seq.nextval, '배송지연/불만', '글 제목1', 'test@gmail.com', '010-1111-2222', '글 내용1', '/upload/2021710012161.png', sysdate);
​
--1대1문의 관리자 답변
drop table one2one_reply;
create table one2one_reply (
	one2one_reply_idx			 number(4) primary key,
	one2one_reply_name			 varchar2(20),
	one2one_reply_title			 varchar2(50),
	one2one_reply_content		 varchar2(500),
	one2one_reply_one2one_idx	 number(4),
	one2one_reply_date			 date default sysdate
);
	
drop sequence one2one_reply_seq;
create sequence one2one_reply_seq;
	
insert into one2one_reply (one2one_reply_idx, one2one_reply_name, one2one_reply_title, one2one_reply_content, one2one_reply_one2one_idx, one2one_reply_date)
values (one2one_reply_seq.nextval, '비쥬', '문의하신 내용의 답변입니다.', '문의한 내용의 답변', 1, sysdate);

--주문페이지
drop table payment;
create table payment (
	payment_idx			  number(4) primary key,
	payment_name		  varchar2(20),
	payment_address		  varchar2(20),
	payment_phone		  varchar2(20),
	payment_request		  varchar2(200),
	payment_total_payment varchar2(20),
	payment_payment		  varchar2(20),
	payment_date	      date default sysdate
);
	
drop sequence payment_seq;
create sequence payment_seq;
	
insert into payment (payment_idx, payment_name, payment_address, payment_phone, payment_request, payment_total_payment, payment_payment, payment_date)
values (payment_seq.nextval, '홍길동', '서울 노원구', '010-1111-2222', '빠른 배송부탁드립니다.', '30000', '무통장 입금',sysdate);