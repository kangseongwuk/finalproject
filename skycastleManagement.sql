
drop SEQUENCE ev_sq;
drop SEQUENCE fb_sq;
drop SEQUENCE nb_sq;

drop SEQUENCE eb_sq;
drop SEQUENCE mb_sq;
drop SEQUENCE gb_sq;

drop SEQUENCE a_sq;
drop SEQUENCE m_sq;


drop table eventBoardT;
drop table FAQBoardT;
drop table noticeBoardT;
drop table siteAskT;
drop table counselReservationT;

drop table eBoardReviewT;
drop table eBoardT;
drop table mBoardReviewT;
drop table mBoardT;
drop table gBoardReviewT;
drop table gBoardT;

drop table topMenuT;

drop table memberConnectionT;
drop table blacklistT;
drop table teacherReviewT;
drop table academyTeacherT;
drop table academySubjectT;
drop table academyMemberT;
drop table memberChildT;
drop table memberT;
--테이블을 다시 만들 때 위의 순서대로 드랍 후에 아래의 생성코드를 전체 선택해서 실행해주세요.


--1.0 일반 회원 번호 시퀀스
create SEQUENCE m_sq
    INCREMENT by 1
    START with  10000001
    MAXVALUE    99999999
    MINVALUE    10000001
    NOCYCLE;

--1. 일반회원 테이블
create table memberT(
    m_classify  number(3)
        default '100' not null,
    m_memberNo  number(8)
        PRIMARY key,
    m_id    varchar2(40)
        unique not null,
    m_pw    varchar2(30)
        not null,
    m_name  varchar2(30)
        not null,
    m_birth varchar2(6)
        not null,
    m_gender    number(1)
        not null,
    m_tele  varchar2(11)
        not null,
    m_joinDate  timestamp
        default systimestamp not null,
    m_recommend varchar2(8),
    m_email varchar2(60),
    m_confirm varchar2(2)
        default 'n' not null
);

--관리자, 회원 등록 예시
insert into membert(m_classify,m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_recommend,m_email)
    values('999','1001','admin01','12345678','Admin','901010','1','01012341234','','admin@asd.com');
insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_recommend,m_email)
    values(m_sq.nextval,'user01','12345678','user','921212','2','01012124545','','user@asd.com');



--2. 학부모 자녀 정보 테이블
CREATE TABLE memberChildT(
    m_memberNo    number(8) not null,
        CONSTRAINT child_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    c_name  varchar2(30)
        not null,
    c_grade varchar2(9)
        not null,
    c_gender    varchar2(3)
        not null,
    c_level varchar2(9)
        DEFAULT '미입력',
    constraint c_pk primary key(m_memberNo, c_name)
);

--자녀 등록 예시
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000001,'child01','중1','남','미입력');



--3.0 학원 회원 번호 시퀀스
create SEQUENCE a_sq
    INCREMENT by 1
    START with  100001
    MAXVALUE    999999
    MINVALUE    100001
    NOCYCLE;

--3. 학원 회원 정보 테이블
CREATE TABLE academyMemberT(
    a_memberNo  number(6)
        PRIMARY key,
    a_id    varchar2(40)
        UNIQUE not null,
    a_pw    varchar2(30)
        not null,
    a_name  varchar2(60)
        unique not null,
    a_CRN   varchar2(10)
        not null,
    a_location  varchar2(60)
        not null,
    a_locationDetail    varchar2(100)
        not null,
    a_tele  varchar2(11)
        not null,
    a_joinDate  timestamp
        DEFAULT systimestamp not null
);

--학원 회원 등록 예시
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele)
    values(a_sq.nextval,'aca01','12345678','aca_user','1234567890','서울시 관악구 신림동','이젠 607호','01099998888');



--4. 학원 과목 정보
CREATE TABLE academySubjectT(
    a_memberNo  number(6)   not null,
        CONSTRAINT subject_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    a_subject   varchar2(45)
        not null
);

--학원 과목 예시
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'국어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'수학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'영어');


--5. 학원 강사 정보 테이블
CREATE TABLE academyTeacherT(
    a_memberNo  number(6)   not null,
        CONSTRAINT teacher_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    t_name  varchar2(30)
        not null,
    t_subject   varchar2(45)
        not null,
    t_contents  varchar2(3000),
    t_file  varchar2(3000),
    constraint t_pk primary key(a_memberNo, t_name)
);

--학원 강사 예시
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100001,'김강사','영어','hello~','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100001,'박강산','국어','안녕하세요.','');


--6. 강사 리뷰 정보 테이블
CREATE TABLE teacherReviewT(
    a_memberNo  number(6)   not null,
    t_name  varchar2(30)    not null,
        CONSTRAINT teacherReview_teacher_fk foreign key(a_memberNo,t_name)
            REFERENCES academyTeacherT(a_memberNo, t_name),
    m_memberNo  number(8)   not null,
        CONSTRAINT teacherReview_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    t_score number(1)
        DEFAULT '5' not null,
    constraint t_review_pk primary key(a_memberNo, t_name, m_memberNo)
);

--강사 리뷰 예시
insert into teacherReviewT(a_memberNo,t_name,m_memberNo,t_score)
    values(100001,'박강산',10000001,'5');
insert into teacherReviewT(a_memberNo,t_name,m_memberNo,t_score)
    values(100001,'박강산',1001,'2');


--7. 신고/블랙리스트 관리 정보 테이블
CREATE TABLE blacklistT(
    m_memberNo  number(8)   not null,
        CONSTRAINT black_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    a_memberNo  number(6)   not null,
        CONSTRAINT black_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    black_contents  varchar2(3000)
        not null,
    black_time  timestamp
        DEFAULT systimestamp not null,
    constraint black_pk primary key(a_memberNo, m_memberNo)
);

-- 신고/블랙리스트 관리 예시(현재 없음)




--8. 학생-학원 연결 정보 테이블
CREATE TABLE memberConnectionT(
    m_memberNo  number(8)   not null,
        CONSTRAINT conn_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    a_memberNo  number(6)   not null,
        CONSTRAINT conn_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    m_connDate  timestamp
        DEFAULT systimestamp not null,
    constraint conn_pk primary key(a_memberNo, m_memberNo)
);


-- 학생-학원 연결 예시(현재 없음)




--9. 게시판명(상단메뉴) 테이블
CREATE TABLE topMenuT(
    menu_no number(2)   PRIMARY key,
    menu_name   varchar2(30)    not null
);

--상단 메뉴 예시
insert into topMenuT(menu_no,menu_name)
    values(1,'종합학원');
insert into topMenuT(menu_no,menu_name)
    values(2,'단과학원');
insert into topMenuT(menu_no,menu_name)
    values(3,'예체능(기타)');



--10.0 종합학원 게시물 번호 시퀀스
create SEQUENCE gb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--10. 종합학원(General Academy) 게시판 테이블
CREATE TABLE gBoardT(
    gb_no   number(7)
        PRIMARY key,
    gb_writerNo   number(6) not null,
        CONSTRAINT gb_writerNo_fk foreign key(gb_writerNo)
            REFERENCES academyMemberT(a_memberNo),
    gb_writerName   varchar2(60) not null,
        CONSTRAINT gb_writerName_fk foreign key(gb_writerName)
            REFERENCES academyMemberT(a_name),
    gb_title    varchar2(1000)
        not null,
    gb_contents long
        not null,
    gb_writeTime    timestamp
        DEFAULT systimestamp    not null,
    gb_modifyTime   timestamp,
    gb_uploadFile   varchar2(3000)
);

--종합학원 게시판 예시
insert into gBoardT(gb_no,gb_writerNo,gb_writerName,gb_title,gb_contents,gb_uploadFile)
    values(gb_sq.nextval,'100001','aca_user','종합게시판 테스트','테스트 중입니다.','');



--11. 종합학원 게시판 리뷰 테이블   
CREATE TABLE gBoardReviewT(
    gb_no   number(7)   not null,
        CONSTRAINT gb_no_fk foreign key(gb_no)
            REFERENCES gBoardT(gb_no),
    gr_no   number(4)
        not null,
    gr_writerNo number(8)   not null,
        CONSTRAINT gr_writerNo_fk foreign key(gr_writerNo)
            REFERENCES memberT(m_memberNo),
    gr_writerId varchar2(40)    not null,
        CONSTRAINT gr_writerId_fk foreign key(gr_writerId)
            REFERENCES memberT(m_id),
    gr_contents varchar2(1500),
    gr_score    number(1)
        default '5' not null,
    gr_writeTime    timestamp
        DEFAULT systimestamp    not null,
    constraint gr_pk primary key(gb_no, gr_no)
);

--종합학원 리뷰 예시
insert into gBoardReviewT(gb_no,gr_no,gr_writerNo,gr_writerId,gr_contents,gr_score)
    values(1,1,'10000001','user01','테스트가 마음에 안드네요.','2');
insert into gBoardReviewT(gb_no,gr_no,gr_writerNo,gr_writerId,gr_contents,gr_score)
    values(1,2,'1001','admin01','관리자권한 리뷰','5');


--12.0 단과학원 게시물 번호 시퀀스
create SEQUENCE mb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--12. 단과학원(Monotechnic Academy) 게시판 테이블
CREATE TABLE mBoardT(
    mb_no   number(7)
        PRIMARY key,
    mb_writerNo   number(6) not null,
        CONSTRAINT mb_writerNo_fk foreign key(mb_writerNo)
            REFERENCES academyMemberT(a_memberNo),
    mb_writerName   varchar2(60) not null,
        CONSTRAINT mb_writerName_fk foreign key(mb_writerName)
            REFERENCES academyMemberT(a_name),
    mb_title    varchar2(1000)
        not null,
    mb_contents long
        not null,
    mb_writeTime    timestamp
        DEFAULT systimestamp    not null,
    mb_modifyTime   timestamp,
    mb_uploadFile   varchar2(3000)
);

--단과학원 게시판 예시
insert into mBoardT(mb_no,mb_writerNo,mb_writerName,mb_title,mb_contents,mb_uploadFile)
    values(mb_sq.nextval,'100001','aca_user','단과게시판 테스트','테스트 중입니다.','');



--13. 단과학원 게시판 리뷰 테이블   
CREATE TABLE mBoardReviewT(
    mb_no   number(7)   not null,
        CONSTRAINT mb_no_fk foreign key(mb_no)
            REFERENCES mBoardT(mb_no),
    mr_no   number(4)
        not null,
    mr_writerNo number(8)   not null,
        CONSTRAINT mr_writerNo_fk foreign key(mr_writerNo)
            REFERENCES memberT(m_memberNo),
    mr_writerId varchar2(40)    not null,
        CONSTRAINT mr_writerId_fk foreign key(mr_writerId)
            REFERENCES memberT(m_id),
    mr_contents varchar2(1500),
    mr_score    number(1)
        default '5' not null,
    mr_writeTime    timestamp
        DEFAULT systimestamp    not null,
    constraint mr_pk primary key(mb_no, mr_no)
);

--단과학원 리뷰 예시
insert into mBoardReviewT(mb_no,mr_no,mr_writerNo,mr_writerId,mr_contents,mr_score)
    values(1,1,'10000001','user01','테스트가 마음에 안드네요.','2');
insert into mBoardReviewT(mb_no,mr_no,mr_writerNo,mr_writerId,mr_contents,mr_score)
    values(1,2,'1001','admin01','관리자권한 리뷰','5');


--14.0 예체능 및 그 외 학원 게시물 번호 시퀀스
create SEQUENCE eb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;


--14. 예체능 및 그 외 학원(ETC Academy) 게시판 테이블
CREATE TABLE eBoardT(
    eb_no   number(7)
        PRIMARY key,
    eb_writerNo   number(6) not null,
        CONSTRAINT eb_writerNo_fk foreign key(eb_writerNo)
            REFERENCES academyMemberT(a_memberNo),
    eb_writerName   varchar2(60) not null,
        CONSTRAINT eb_writerName_fk foreign key(eb_writerName)
            REFERENCES academyMemberT(a_name),
    eb_title    varchar2(1000)
        not null,
    eb_contents long
        not null,
    eb_writeTime    timestamp
        DEFAULT systimestamp    not null,
    eb_modifyTime   timestamp,
    eb_uploadFile   varchar2(3000)
);

--예체능 및 그 외 학원 게시판 예시
insert into eBoardT(eb_no,eb_writerNo,eb_writerName,eb_title,eb_contents,eb_uploadFile)
    values(eb_sq.nextval,'100001','aca_user','예체능 게시판 테스트','테스트 중입니다.','');



--15. 예체능 및 그 외 학원 게시판 리뷰 테이블   
CREATE TABLE eBoardReviewT(
    eb_no   number(7)   not null,
        CONSTRAINT eb_no_fk foreign key(eb_no)
            REFERENCES eBoardT(eb_no),
    er_no   number(4)
        not null,
    er_writerNo number(8)   not null,
        CONSTRAINT er_writerNo_fk foreign key(er_writerNo)
            REFERENCES memberT(m_memberNo),
    er_writerId varchar2(40)    not null,
        CONSTRAINT er_writerId_fk foreign key(er_writerId)
            REFERENCES memberT(m_id),
    er_contents varchar2(1500),
    er_score    number(1)
        default '5' not null,
    er_writeTime    timestamp
        DEFAULT systimestamp    not null,
    constraint er_pk primary key(eb_no, er_no)
);

--예체능 및 그 외 학원 리뷰 예시
insert into eBoardReviewT(eb_no,er_no,er_writerNo,er_writerId,er_contents,er_score)
    values(1,1,'10000001','user01','테스트가 마음에 안드네요.','2');
insert into eBoardReviewT(eb_no,er_no,er_writerNo,er_writerId,er_contents,er_score)
    values(1,2,'1001','admin01','관리자권한 리뷰','5');



--16. 학원상담 예약문의
CREATE TABLE counselReservationT(
    a_memberNo  number(6)   not null,
        CONSTRAINT counsel_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    m_memberNo  number(8)   not null,
        CONSTRAINT counsel_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    cr_name varchar2(30)
        not null,
    cr_childName    varchar2(30),
    cr_tele varchar2(11)
        not null,
    cr_writeTime    timestamp
        default systimestamp not null,
    cr_contents varchar2(1500)
);

-- 학원상담 예약문의 예시 (현재 없음)



--17. 사이트 문의 테이블
CREATE TABLE siteAskT(
    sa_memberNo varchar2(8)
        not null,
    sa_tele varchar2(11),
    sa_time timestamp
        default systimestamp not null,
    sa_contents varchar2(1500)
        not null,
    sa_file varchar2(3000)
);

-- 사이트 문의 예시 (현재 없음)




--18.0 공지사항 게시물 번호 시퀀스
create SEQUENCE nb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--18. 공지사항 게시판 테이블
CREATE TABLE noticeBoardT(
    nb_no   number(4)
        primary key,
    nb_title    varchar2(100)
        not null,
    nb_contents long
        not null,
    nb_writeTime    timestamp
        default systimestamp not null,
    nb_modifyTime   timestamp,
    nb_file varchar2(3000)
);


--공지사항 게시판 예시
insert into noticeBoardT(nb_no,nb_title,nb_contents,nb_file)
    values(nb_sq.nextval,'공지사항 테스트1','공지사항 테스트입니다','');



--19.0  FAQ 게시물 번호 시퀀스
create SEQUENCE fb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--19. FAQ 게시판 테이블
CREATE TABLE FAQBoardT(
    fb_no   number(4)
        primary key,
    fb_title    varchar2(100)
        not null,
    fb_contentsQ    varchar2(1500)
        not null,
    fb_contentsA    varchar2(3000)
        not null
);

--FAQ 게시판 예시
insert into FAQBoardT(fb_no,fb_title,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'FAQ 테스트1','이 사이트는 뭐 하는 곳이죠?','저도 모릅니다.');



--20.0 이벤트 게시물 번호 시퀀스
create SEQUENCE ev_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;


--20. 이벤트 게시판 테이블
CREATE TABLE eventBoardT(
    ev_no   number(4)
        primary key,
    ev_title    varchar2(100)
        not null,
    ev_contents long
        not null,
    ev_startTime    timestamp
        not null,
    ev_endTime  timestamp
        not null,
    ev_file varchar2(3000)
);

--이벤트 게시판 예시
insert into eventBoardT(ev_no,ev_title,ev_contents,ev_startTime,ev_endTime,ev_file)
    values(ev_sq.nextval,'테스트 이벤트','이벤트는 없습니다.','22/11/01 00:00:00','23/12/31 00:00:00','');
insert into eventBoardT(ev_no,ev_title,ev_contents,ev_startTime,ev_endTime,ev_file)
    values(ev_sq.nextval,'종료된 테스트 이벤트','끗!','22/08/01 00:00:00','22/10/30 00:00:00','');


commit;

