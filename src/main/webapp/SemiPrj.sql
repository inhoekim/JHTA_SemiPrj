DROP TABLE COMMENTS;
DROP TABLE FILES;
DROP TABLE SERVICE;
DROP TABLE REVIEW;
DROP TABLE PAYMENT;
DROP TABLE RESERVE;
DROP TABLE ROOM;
DROP TABLE HLOGIN;
DROP TABLE ADMIN;

CREATE TABLE HLOGIN (
	HLOGIN_ID varchar2(15) PRIMARY KEY,
	PWD varchar2(200) NOT NULL,
	NAME varchar2(15) NOT NULL,
	JNUM varchar2(20) NOT NULL,
	AGE number(5),
	AREA varchar2(15),
	REGDATE date NOT NULL,
	NUM number(5) default 1 NOT NULL -- 1: 정상회원, 2: 탈퇴회원
);

CREATE TABLE ADMIN (
	ADMIN_ID varchar2(15) PRIMARY KEY,
	PWD varchar2(15) NOT NULL
);

CREATE TABLE ROOM (
	ROOM_ID	number(10) PRIMARY KEY,
	KIND varchar2(15),
	CAPACITY number(5),
	PRICE number(10),
	RATE number(2,1) NOT NULL, -- 평점
	SRC_NAME varchar2(30)
);


CREATE TABLE RESERVE (
	RESERVE_ID	number(10) PRIMARY KEY,
	HLOGIN_ID varchar2(15) NOT NULL,
	ROOM_ID number(5) NOT NULL,
	START_DAY varchar2(30) NOT NULL,
	END_DAY varchar2(30) NOT NULL,
	RESERVE_DATE date NOT NULL,
	STATEMENT number(1) default 1 NOT NULL, -- 1: 예약대기, 2:예약완료, 3:예약취소 
	CONSTRAINT FK_RESERVE_HLOGINID FOREIGN KEY(HLOGIN_ID) REFERENCES HLOGIN(HLOGIN_ID)
);

CREATE TABLE PAYMENT (
	PAYMENT_ID number(10) PRIMARY KEY,
	RESERVE_ID number(10) NOT NULL,
	METHOD number(1) NOT NULL, -- 1:카드결제, 2:휴대폰결제, 3:계좌이체
	PAYMENT number(10) NOT NULL,
	STATEMENT number(1)	default 1 NOT NULL, -- 1:결제대기, 2:결제완료, 3:결제취소 
	CONSTRAINT FK_PAYMENT_RESERVEID FOREIGN KEY(RESERVE_ID) REFERENCES RESERVE(RESERVE_ID)
);

CREATE TABLE REVIEW (
	REVIEW_ID number(10) PRIMARY KEY,
	ROOM_ID	number(5) NOT NULL,
	HLOGIN_ID varchar2(15) NOT NULL,
    TITLE varchar(100) NOT NULL,
	CONTENT varchar2(4000) NOT NULL,
    RATE number(2, 1) default 0,
    views number(4) default 0, -- 조회 수
    RECOMMEND number(3) default 0, -- 추천 수 
	CREATED_DAY date NOT NULL,
	UPDATED_DAY date,
	CONSTRAINT FK_REVIEW_ROOMID FOREIGN KEY(ROOM_ID) REFERENCES ROOM(ROOM_ID) on delete cascade,
	CONSTRAINT FK_REVIEW_HLOGINID FOREIGN KEY(HLOGIN_ID) REFERENCES HLOGIN(HLOGIN_ID)  on delete cascade
);

CREATE TABLE SERVICE (
	SERVICE_ID number(10) PRIMARY KEY,
	WRITER varchar2(15) NOT NULL,
	TITLE varchar2(20) NOT NULL,
	CONTENT varchar2(4000) NOT NULL,
	PWD varchar2(15) NOT NULL,
	REF number(10) NOT NULL,
	LEV number(10) NOT NULL,
	STEP number(10) NOT NULL,
	CREATED_DAY date NOT NULL,
	UPDATED_DAY date
);

CREATE TABLE COMMENTS (
	COMMENT_ID number(10) PRIMARY KEY,
	REVIEW_ID number(10) NOT NULL,
	HLOGIN_ID varchar2(15) NOT NULL,
	CONTENT	varchar2(1000) NOT NULL,
	READ number(1) DEFAULT 2 NOT NULL, -- 1: 읽음 , 2: 읽지 않음
    CREATED_DAY date NOT NULL,
	CONSTRAINT FK_COMMENT_REVIEWID FOREIGN KEY(REVIEW_ID) REFERENCES REVIEW(REVIEW_ID),
	CONSTRAINT FK_COMMENT_HLOGINID FOREIGN KEY(HLOGIN_ID) REFERENCES HLOGIN(HLOGIN_ID)
);


CREATE TABLE FILES (
	FILE_ID NUMBER(10) PRIMARY KEY,
	REVIEW_ID number(10) NOT NULL,
	TYPE varchar2(20) NOT NULL,
	ORG_NAME varchar2(30) NOT NULL,
	SRC_NAME varchar2(30) NOT NULL,
	CONSTRAINT FK_FILE_REVIEWID FOREIGN KEY(REVIEW_ID) REFERENCES REVIEW(REVIEW_ID)
);

CREATE TABLE RECOMMEND ( -- 추천수 테이블
    REC_ID number(4) PRIMARY KEY,
    REVIEW_ID number(10) NOT NULL,
    THUMB_UP number(4) DEFAULT 0,
    THUMB_DOWN  number(4) DEFAULT 0,
    CONSTRAINT FK_RECOMMEND_REVIEWID FOREIGN KEY(REVIEW_ID) REFERENCES REVIEW(REVIEW_ID)
);

DROP SEQUENCE SEQ_ROOM;
DROP SEQUENCE SEQ_RESERVE;
DROP SEQUENCE SEQ_PAYMENT;
DROP SEQUENCE SEQ_SERVICE;
DROP SEQUENCE SEQ_COMMENTS;
DROP SEQUENCE SEQ_FILES;
DROP SEQUENCE SEQ_RECOMMEND;

CREATE SEQUENCE SEQ_ROOM;
CREATE SEQUENCE SEQ_RESERVE;
CREATE SEQUENCE SEQ_PAYMENT;
CREATE SEQUENCE SEQ_SERVICE;
CREATE SEQUENCE SEQ_COMMENTS;
CREATE SEQUENCE SEQ_FILES;
CREATE SEQUENCE SEQ_RECOMMEND;

-- 템플릿 Rows

-- room Insert
insert into room values (seq_room.nextval, '싱글', 1, 100000, 0, 'singleRoom1.jpg');
insert into room values (seq_room.nextval, '싱글', 1, 100000, 0, 'singleRoom2.jpg');
insert into room values (seq_room.nextval, '더블', 2, 130000, 0, 'doubleRoom1.jpg');
insert into room values (seq_room.nextval, '더블', 2, 130000, 0, 'doubleRoom2.jpg');
insert into room values (seq_room.nextval, '트윈', 2, 130000, 0, 'twinRoom1.jpg');
insert into room values (seq_room.nextval, '트윈', 3, 150000, 0, 'twinRoom2.jpg');
insert into room values (seq_room.nextval, '패밀리', 4, 180000, 0, 'familyRoom1.jpg');

drop PROCEDURE review_del_proc;
create or replace procedure review_del_proc -- 리뷰 삭제 프로시저
(
    call_review_id number
)
as
begin
    delete
    from files f
    where exists
    (
        select review_id
        from review r
        where  f.review_id = r.review_id  and f.review_id = call_review_id
    );

    delete comments
    where review_id = call_review_id;
    
    delete review
    where review_id = call_review_id;
end;
/