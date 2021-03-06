-- --------------------------------------------------------------------------------------------------------------------------------------------------------
-- =========================================================================================================================================================
-- 2021.08.13 19:05  UPDATE
-- SCHEDULE, CHECKLIST TABLE 수정 (맨밑에 추가하시면 됩니다)

DROP TABLE SCHEDULE;
CREATE TABLE  SCHEDULE  (
	 SC_CODE 	NUMBER	DEFAULT 2	NOT NULL,
	 DSC_NO 	NUMBER		NOT NULL,
	 SC_TITLE 	VARCHAR2(100)		NOT NULL,
	 SC_SDATE 	DATE		NOT NULL,
	 SC_EDATE 	DATE		NOT NULL,
	 SC_STATUS 	VARCHAR(20)	DEFAULT 'N'	NULL,
	 M_CODE 	VARCHAR2(100)		NOT NULL
);
COMMENT ON COLUMN  SCHEDULE . SC_CODE  IS '부서일정(1),개인일정(2)';
COMMENT ON COLUMN  SCHEDULE . DSC_NO  IS 'SEQ_DSC (일정 번호 시퀀스)';
COMMENT ON COLUMN  SCHEDULE . SC_TITLE  IS 'SCHEDULE TITLE';
COMMENT ON COLUMN  SCHEDULE . SC_SDATE  IS 'SCHEDULE START';
COMMENT ON COLUMN  SCHEDULE . SC_EDATE  IS 'SCHEDULE END';
COMMENT ON COLUMN  SCHEDULE . SC_STATUS  IS 'Y/N (종료Y/진행중N)';
ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE_PK PRIMARY KEY (DSC_NO);

DROP TABLE CHECKLIST;
CREATE TABLE  CHECKLIST  (
	 CH_NO 	NUMBER	DEFAULT 2	NOT NULL,
	 DCH_NO 	NUMBER		NOT NULL,
	 CH_NAME 	VARCHAR2(200)		NULL,
	 C_STATUS 	VARCHAR(20)	DEFAULT 'N'	NULL,
	 M_CODE 	VARCHAR2(100)		NOT NULL
);
COMMENT ON COLUMN  CHECKLIST . CH_NO  IS '부서업무(1),개인업무(2)';
COMMENT ON COLUMN  CHECKLIST . DCH_NO  IS 'SEQ_DCH';
COMMENT ON COLUMN  CHECKLIST . CH_NAME  IS 'CHECKLIST NAME';
COMMENT ON COLUMN  CHECKLIST . C_STATUS  IS 'Y/N(CHECKED Y/ ING N)';
ALTER TABLE CHECKLIST ADD CONSTRAINT CHECKLIST_PK PRIMARY KEY (DCH_NO);

CREATE SEQUENCE SEQ_MS
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_DSC
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_DCH
START WITH 1
INCREMENT BY 1
NOCACHE;


-- 2021.08.13 17:17
-- SEQ_BNO 추가
CREATE SEQUENCE SEQ_BNO
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- 2021.08.16 18:24 유승현 UPDATE
-- MEMBER TABLE ID 컬럼 추가
ALTER TABLE MEMBER ADD (M_ID VARCHAR2(100) NOT NULL);

-- 2021.08.17 20:34 유승현 UPDATE
-- JOB, DEPARTMENT 테이블 insert 
INSERT INTO JOB VALUES(1, '부장');
INSERT INTO JOB VALUES(2, '차장');
INSERT INTO JOB VALUES(3, '과장');
INSERT INTO JOB VALUES(4, '대리');
INSERT INTO JOB VALUES(5, '사원');

INSERT INTO DEPARTMENT VALUES(1,'인사');
INSERT INTO DEPARTMENT VALUES(2,'마케팅');
INSERT INTO DEPARTMENT VALUES(3,'생산');
INSERT INTO DEPARTMENT VALUES(4,'영업');
INSERT INTO DEPARTMENT VALUES(5,'회계');


CREATE SEQUENCE  SEQ_MCODE
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE  NOORDER  NOCYCLE ;

-- 2021.08.18 00:33 유승현 UPDATE
-- PROJECT 시퀀스
CREATE SEQUENCE  SEQ_PRO
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
NOCACHE  NOORDER  NOCYCLE ;


-- 2021.08.17 21:44 원형
-- 뷰 생성 권한 부여, V_BOARD 뷰 생성
grant create view to sharethevision;
--★SYSTEM계정에서 sharethevision create 권한 주신 후에
--sharethevision 계정에서 밑에 구문 작성하셔서 V_BOARD 뷰 생성하시면 됩니다.

create or replace view v_board
as select board.b_no, board.b_type, board.b_title, board.b_content, board.b_createdate, board.b_state,
          board.b_status, board.m_code, board.dept_no, member.m_name, project.p_name
    from board
        left join member on(board.m_code = member.m_code)
        left join project on(board.dept_no = project.dept_no);

-- 2021.08.13 20:41 지은UPDATE
-- DEFAULT값 수정
ALTER TABLE USED MODIFY U_APPROVAL DEFAULT 'W';
ALTER TABLE USED MODIFY U_STATUS DEFAULT 'N';
ALTER TABLE OVERWORK MODIFY O_APPROVAL DEFAULT 'N';
ALTER TABLE ATTACHMENTS MODIFY AT_STATUS DEFAULT 'Y';
ALTER TABLE PROJECT MODIFY P_STATUS DEFAULT 'Y';
ALTER TABLE PROJECT MODIFY P_END DEFAULT 'N';
ALTER TABLE REPLY MODIFY R_STATUS DEFAULT 'Y';
ALTER TABLE BOARD MODIFY B_STATUS DEFAULT 'Y';
ALTER TABLE SCHEDULE MODIFY SC_STATUS DEFAULT 'N';
ALTER TABLE CHECKLIST MODIFY C_STATUS DEFAULT 'N';

-- 2021.08.13 20:23 지은UPDATE
-- COMMUTE테이블 C_STATUS 컬럼 삭제
ALTER TABLE COMMUTE DROP COLUMN C_STATUS;

-- 2021.08.16 16:20 지은UPDATE
-- OVERWORK테이블 시퀀스 추가
CREATE SEQUENCE SEQ_OW
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 2021.08.14 11:21 지은UPDATE
-- COMMUTE 테이블 시퀀스 추가
CREATE SEQUENCE SEQ_CO
START WITH 1
INCREMENT BY 1
NOCACHE;

-- COMMUTE 테이블 컬럼 타입 변경
DROP TABLE COMMUTE CASCADE CONSTRAINTS;

CREATE TABLE "COMMUTE" (
	"CMT_NO"	NUMBER		NOT NULL,
	"C_DATE"	DATE		NULL,
	"C_START"	VARCHAR2(20)		NULL,
	"C_END"	VARCHAR2(20)		NULL,
	"C_WORKTIME"	NUMBER		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

ALTER TABLE "COMMUTE" ADD CONSTRAINT "PK_COMMUTE" PRIMARY KEY (
	"CMT_NO"
);


-- 2021.08.19 15:23 유승현 UPDATE
-- ATTACHMENT 시퀀스 추가
CREATE SEQUENCE  SEQ_AT
MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1
START WITH 1 NOCACHE  
NOORDER  NOCYCLE ;

-- 2021.08.19 15:33 유승현 UPDATE
-- ATTACHMENT AT_PATH 사이즈 수정
ALTER TABLE ATTACHMENTS MODIFY AT_PATH VARCHAR2(200);

-- 2021.08.21 1:29 노은비 UPDATE
-- 메신저MS NO, EMO 숫자타입으로 변경 (EMO:카운트 수로 변경)
ALTER TABLE MS MODIFY MS_NO NUMBER;
ALTER TABLE MS MODIFY EMO NUMBER DEFAULT 0;
COMMIT;

-- 2021.08.21 15:40 임지은 UPDATE
-- COMMUTE 테이블 컬럼 추가
ALTER TABLE COMMUTE ADD C_STATUS NUMBER DEFAULT 0 NOT NULL;
COMMENT ON COLUMN COMMUTE.C_STATUS  IS '0:정상출근 1:지각';


-- 2021.08.23 21:00 임지은 UPDATE
-- OVERWORK 테이블 삭제 및 생성
DROP TABLE OVERWORK CASCADE CONSTRAINTS;

CREATE TABLE "OVERWORK" (
	"O_NO" NUMBER NOT NULL,
	"O_APPLYDATE" DATE NULL,
    "O_START" VARCHAR2(40) NULL,
    "O_END" VARCHAR2(40) NULL,
	"O_TIME" NUMBER NULL,
	"O_TYPE" NUMBER	DEFAULT 1 NOT NULL,
	"O_DATE" DATE DEFAULT SYSDATE NULL,
	"O_APPROVAL" VARCHAR2(10) DEFAULT 'N' NULL,
	"O_MEMO" VARCHAR2(400) NULL,
	"M_CODE" VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN "OVERWORK"."O_TYPE" IS '1:연장 2:야간 3:휴일';
COMMENT ON COLUMN "OVERWORK"."O_APPROVAL" IS 'Y:승인 / N:미승인 / S:저장';


-- 2021.08.24 11:40 노은비 UPDATE
-- 메신저 채팅룸목록 테이블 추가, 시퀀스RNO 추가
CREATE TABLE ROOM (
    RNO NUMBER NOT NULL,
    FID VARCHAR2(30) NOT NULL,
    TID VARCHAR2(30) NOT NULL,
    RSTA VARCHAR2(10) DEFAULT 'Y' NOT NULL
    );
COMMENT ON COLUMN ROOM.RNO IS '방번호';
COMMENT ON COLUMN ROOM.FID IS 'FROM ID 나';
COMMENT ON COLUMN ROOM.TID IS 'TO ID 상대방';
COMMENT ON COLUMN ROOM.RSTA IS 'Y:존재,N:삭제';
COMMENT ON COLUMN MS.EMO IS 'ROOMID 로 변경';

CREATE SEQUENCE SEQ_RNO
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1 NOCACHE;  

commit;


-- 2021.08.25 21:50 임지은 UPDATE
-- 시퀀스 생성, ANNAUL TABLE 타입 변경
CREATE SEQUENCE SEQ_LE
START WITH 1
INCREMENT BY 1
NOCACHE;

ALTER TABLE ANNUAL MODIFY A_BASE_DATE VARCHAR2(100);
ALTER TABLE ANNUAL MODIFY A_START_DATE VARCHAR2(100);
ALTER TABLE ANNUAL MODIFY A_END_DATE VARCHAR2(100);


-- 2021.08.26 22:14 장원형 UPDATE
-- V_BOARD 수정, SCRAP 테이블 생성, COMMENT 수정, BOARD.B_WRITER, BOARD.PROJECT 추가, B_STATE 기본 값 설정
CREATE TABLE SCRAP (
	M_CODE	VARCHAR2(100)	NOT NULL,
	B_NO	NUMBER	NOT NULL,
	P_NAME	VARCHAR2(100)	NULL,
	B_TITLE	VARCHAR2(100)	NULL,
	M_NAME	VARCHAR2(100)	NULL
);

ALTER TABLE SCRAP ADD CONSTRAINT PK_SCRAP PRIMARY KEY (
	M_CODE,
	B_NO
);

ALTER TABLE SCRAP ADD CONSTRAINT FK_MEMBER_TO_SCRAP_1 FOREIGN KEY (
	M_CODE
) REFERENCES MEMBER (
	M_CODE
);

ALTER TABLE SCRAP ADD CONSTRAINT FK_BOARD_TO_SCRAP_1 FOREIGN KEY (
	B_NO
) REFERENCES BOARD (
	B_NO
);

COMMENT ON COLUMN "BOARD"."B_TYPE" IS '1: 공지 / 2: 자료실';
COMMENT ON COLUMN "BOARD"."B_STATE" IS '1: 진행중 / 2: 종료';
ALTER TABLE BOARD MODIFY B_STATE DEFAULT 1 NOT NULL;

ALTER TABLE BOARD ADD B_WRITER VARCHAR2(100) NOT NULL;
ALTER TABLE BOARD ADD PROJECT VARCHAR2(100) NOT NULL;

create or replace view v_board
as select board.b_no, board.b_type, board.b_title, board.b_content, board.b_createdate, board.b_state,
          board.b_status, board.m_code, board.dept_no, board.b_writer, project.p_name
    from board
        left join member on(board.m_code = member.m_code)
        left join project on(board.project = project.p_name)
    order by board.b_no desc;

commit;


-- 2021.08.26 21:08 임지은 UPDATE
-- 시퀀스 생성, USED테이블 수정
CREATE SEQUENCE SEQ_AD
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_USED
START WITH 1
INCREMENT BY 1
NOCACHE;

ALTER TABLE USED DROP COLUMN A_NO;
ALTER TABLE USED DROP COLUMN U_YEAR;
ALTER TABLE USED MODIFY U_START_DATE VARCHAR2(100);
ALTER TABLE USED MODIFY U_END_DATE VARCHAR2(100);
ALTER TABLE USED ADD M_CODE VARCHAR2(100) NOT NULL;
ALTER TABLE USED ADD FOREIGN KEY(M_CODE) REFERENCES MEMBER (M_CODE);

ALTER TABLE ANNUAL ADD A_TYPE NUMBER DEFAULT 0;
COMMENT ON COLUMN ANNUAL.A_TYPE IS '0:발생연차 / 1:조정연차 / 2:1년미만 월차';


-- 2021.08.31 17:28 유승현 UPDATE
-- JOB 테이블 데이터 수정
UPDATE JOB SET J_NAME = '사원' WHERE J_NO = 1;
UPDATE JOB SET J_NAME = '대리' WHERE J_NO = 2;
UPDATE JOB SET J_NAME = '과장' WHERE J_NO = 3;
UPDATE JOB SET J_NAME = '차장' WHERE J_NO = 4;
UPDATE JOB SET J_NAME = '부장' WHERE J_NO = 5;

-- 2021.08.27 21:51 장원형 UPDATE
-- scrap 테이블 수정
ALTER TABLE SCRAP RENAME COLUMN P_NAME TO PROJECT;
ALTER TABLE SCRAP RENAME COLUMN M_NAME TO B_WRITER;
ALTER TABLE SCRAP ADD SCRAP_DATE VARCHAR2(100) DEFAULT SYSDATE NOT NULL;

-- 2021.08.27 19:24 노은비 UPDATE
-- MS 테이블 이모티콘 -> 방번호, 파일 -> 읽음카운트로 변경
ALTER TABLE MS RENAME COLUMN EMO TO RNO;
ALTER TABLE MS RENAME COLUMN MS_FILE TO READCOUNT;
ALTER TABLE MS MODIFY READCOUNT NUMBER DEFAULT 1;
COMMENT ON COLUMN MS.READCOUNT IS 'READ 0, NOT READ 1';

-- 2021.08.30 06:00 노은비 update
-- MS 부서별 그룹대화방 DB 생성
INSERT INTO ROOM VALUES ( 9001, 'GROUP CH. 인사팀 ', 'GROUP CH. 인사팀', '1');             
INSERT INTO ROOM VALUES ( 9002, 'GROUP CH. 마케팅팀', 'GROUP CH. 마케팅팀', '2'); 
INSERT INTO ROOM VALUES ( 9003, 'GROUP CH. 생산팀', 'GROUP CH. 생산팀', '3'); 
INSERT INTO ROOM VALUES ( 9004, 'GROUP CH. 영업팀', 'GROUP CH. 영업팀', '4'); 
INSERT INTO ROOM VALUES ( 9005, 'GROUP CH. 회계팀', 'GROUP CH. 회계팀', '5');  

COMMIT;

-- 2021.08.31 20:23 장원형 UPDATE
-- BOARD_LOG 테이블 삭제

DROP TABLE BOARD_LOG;
COMMIT;


-- 2021-09-01 Approval 강정환 20:57
(APV_CATEGORY , APV , DOC 테이블 드롭 , APPROVAL , APV_FILE 테이블 추가)
-- + APV_FILE 테이블 PK,FK 추가  , APV_FILE PK 추가, 전자결재 시퀀스 추가 (SEQ_APV) , 

DROP TABLE APV_CATEGORY;

COMMIT;

DROP TABLE APV;

COMMIT;


CREATE TABLE "APPROVAL" (
	"APV_NO"	NUMBER		NOT NULL,
    "APV_TYPE" VARCHAR2(2000) NOT NULL,
    "M_CODE"  VARCHAR2(100) NOT NULL,
    "APV_AGR" VARCHAR2(500) NOT NULL,
    "APV_REF" VARCHAR2(500) NOT NULL,
    "APV_APP" VARCHAR2(500) NOT NULL,
    "APV_TITLE" VARCHAR2(1500) NOT NULL,
    "APV_COM" VARCHAR2(2000) NOT NULL,
    "APV_SDATE" DATE NOT NULL,
    "APV_DDATE" DATE NOT NULL,
    "APV_EDATE" DATE NULL,
    "APV_STATUS"  VARCHAR2(500) NULL
);

COMMENT ON COLUMN "APPROVAL"."APV_NO" IS '결재번호';
COMMENT ON COLUMN "APPROVAL"."APV_TYPE" IS '결재종류';
COMMENT ON COLUMN "APPROVAL"."APV_AGR" IS '합의자';
COMMENT ON COLUMN "APPROVAL"."APV_REF" IS '참조자';
COMMENT ON COLUMN "APPROVAL"."APV_APP" IS '결재자';
COMMENT ON COLUMN "APPROVAL"."APV_TITLE" IS '결재제목';
COMMENT ON COLUMN "APPROVAL"."APV_COM" IS '결재코멘트';
COMMENT ON COLUMN "APPROVAL"."APV_SDATE" IS '상신일';
COMMENT ON COLUMN "APPROVAL"."APV_DDATE" IS '마감일';
COMMENT ON COLUMN "APPROVAL"."APV_EDATE" IS '결재일';
COMMENT ON COLUMN "APPROVAL"."APV_STATUS" IS '결재상태 A:미결재 B:진행 C:완료 D:반려';


ALTER TABLE APPROVAL ADD CONSTRAINT APV_NO_PK PRIMARY KEY (APV_NO);
ALTER TABLE APPROVAL ADD CONSTRAINT M_CODE_FK FOREIGN KEY (M_CODE) REFERENCES MEMBER(M_CODE);


CREATE SEQUENCE  SEQ_APV
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
NOCACHE  NOORDER  NOCYCLE ;

COMMIT;


DROP TABLE DOC;

CREATE TABLE APV_FILE
(
 AF_NO NUMBER NOT NULL,
 APV_NO NUMBER NOT NULL,
 ORG_AF_NM VARCHAR2(500) NOT NULL,
 SAV_AF_NE VARCHAR(500) NOT NULL,
 AF_SIZE NUMBER DEFAULT 0 NOT NULL,
 AF_PATH VARCHAR2(100) NULL,
 AF_REG_DATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE APV_FILE ADD CONSTRAINT AF_NO_PK PRIMARY KEY (AF_NO);
ALTER TABLE APV_FILE ADD CONSTRAINT APV_NO_FK FOREIGN KEY (APV_NO) REFERENCES APPROVAL(APV_NO);

COMMENT ON COLUMN "APV_FILE"."AF_NO" IS '파일번호';
COMMENT ON COLUMN "APV_FILE"."APV_NO" IS '결재번호';
COMMENT ON COLUMN "APV_FILE"."ORG_AF_NM" IS '원본파일이름';
COMMENT ON COLUMN "APV_FILE"."SAV_AF_NM" IS '저장파일이름';
COMMENT ON COLUMN "APV_FILE"."AF_SIZE" IS '결재파일경로';
COMMENT ON COLUMN "APV_FILE"."AF_PATH" IS '결재파일사이즈';
COMMENT ON COLUMN "APV_FILE"."AF_REG_DATE" IS '파일등록날짜';

COMMIT;


ALTER TABLE APV_FILE RENAME COLUMN SAV_AF_NE TO SAV_AF_NM;
COMMENT ON COLUMN "APV_FILE"."SAV_AF_NM" IS '저장파일이름';

COMMENT ON COLUMN APV_FILE.AF_SIZE IS '결재파일사이즈';
COMMENT ON COLUMN APV_FILE.AF_PATH IS '결재파일경로';

COMMIT;
-----------2021-09-01 Approval 강정환 20:57 -----------------------------


----------- 2021.09.01 17:25 임지은 UPDATE
COMMENT ON COLUMN USED.U_TYPE IS '1:연차 2:반차 3:경조사 4:공가 5:병가 6.특별휴가 7.오전반차 8.오후반차';
COMMENT ON COLUMN OVERWORK.O_APPROVAL IS 'Y:승인 /  N:반려 / W:대기';

ALTER TABLE OVERWORK MODIFY O_APPROVAL DEFAULT 'W';

DROP TABLE ADJUST CASCADE CONSTRAINTS;


----------- 2021.09.06 16:40 임지은 UPDATE
-- ANNAUL테이블 컬럼 삭제
ALTER TABLE ANNUAL DROP COLUMN A_YEAR;

-- APPROVAL NULL 조건 변경
ALTER TABLE APPROVAL MODIFY (APV_AGR NULL);
ALTER TABLE APPROVAL MODIFY (APV_REF NULL);


----------2021-09-06 강정환 UPDATE-----(ATTACHMENTS) 테이블 AT_LEVEL 4번 추가 , APV_FILE DROP----------------

COMMENT ON COLUMN ATTACHMENTS.AT_LEVEL IS '1 = 회원 프로필 / 2 = 게시판 이미지 / 3= 게시판 첨부파일 / 4= 결재 첨부파일';

DROP TABLE APV_FILE CASCADE CONSTRAINTS;

COMMIT;

COMMENT ON COLUMN APPROVAL.APV_TYPE IS '1 = 휴가 / 2 = 기안서 / 3 = 세금 계산서 / 4 = 보고서 / 5 = 품의서 / 6 = 계획서 / 7 = 신청서';

COMMIT;

-------------2021-09-06 강정환 UPDATE---------------------------


----------- 2021.09.07 17:45 임지은 UPDATE
COMMENT ON COLUMN COMMUTE.C_STATUS IS '0:정상출근 1:지각 2:조퇴 3:결근';
COMMENT ON COLUMN APPROVAL.APV_TYPE IS '1 = 휴가 / 2 = 기안서 / 3 = 세금 계산서 / 4 = 보고서 / 5 = 품의서 / 6 = 계획서 / 7 = 연장근무신청서 / 8 = 근태변경신청서';


----------- 2021.09.08 13:54 임지은 UPDATE
ALTER TABLE APPROVAL ADD APV_REF_NO NUMBER;
COMMENT ON COLUMN APPROVAL.APV_REF_NO IS '휴가, 연장근무, 근태변경 신청서 관리';


----------- 2021.09.08 20:10 장원형 UPDATE
CREATE SEQUENCE SEQ_REPLY
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1 NOCACHE;  

DROP TABLE REPLY;

CREATE TABLE REPLY (
	R_NO VARCHAR(255) NOT NULL,
	R_WRITER VARCHAR2(100) NOT NULL,
	R_CONTENT VARCHAR2(1000) NOT NULL,
	R_CREATEDATE DATE DEFAULT SYSDATE,
	J_NAME VARCHAR2(100) NOT NULL,
	D_NAME VARCHAR2(100) NOT NULL,
	R_STATUS VARCHAR2(50) DEFAULT 'Y',
	M_CODE VARCHAR2(100) NOT NULL,
	B_NO NUMBER	NOT NULL
);

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	R_NO
);

COMMIT;

----------- 2021.09.08 22:17 장원형 UPDATE

ALTER TABLE REPLY MODIFY R_NO NUMBER;

COMMIT;

----------- 2021.09.09 16:54 유승현 UPDATE
----------- 게시판 및 프로젝트 알림 관련 테이블 생성

CREATE TABLE NOTICE(
    N_NO NUMBER PRIMARY KEY,
    N_CATEGORY VARCHAR2(30) NOT NULL,
    N_NUM NUMBER NOT NULL,
    N_CONTENT VARCHAR2(200),
    N_STATE VARCHAR2(10),
    N_DATE DATE
);

COMMENT ON COLUMN NOTICE.N_CATEGORY IS '알림 구분(게시판, 프로젝트, 결재)';
COMMENT ON COLUMN NOTICE.N_NUM IS '알림 관련 PK';
COMMENT ON COLUMN NOTICE.N_CONTENT IS '알림 내용';
COMMENT ON COLUMN NOTICE.N_STATE IS '알림 확인 여부';

ALTER TABLE NOTICE ADD (M_CODE VARCHAR2(30) NOT NULL);
ALTER TABLE NOTICE MODIFY (N_STATE DEFAULT 'N');

CREATE SEQUENCE  SEQ_NOTICE
MINVALUE 1 
MAXVALUE 9999999999999999999999999999
INCREMENT BY 1 
START WITH 1
NOCACHE  NOORDER  NOCYCLE ;



--------- 2021.09.09 20:10 강정환 -------------------------------------
--------- APPROVAL 테이블 컬럼명 수정 , 전자결재파일 테이블 생성 , 시퀀스 생성 ---------
ALTER TABLE APPROVAL RENAME COLUMN APV_TITLE TO APT;
ALTER TABLE APPROVAL RENAME COLUMN APV_COM TO "COMMENT";
ALTER TABLE APPROVAL RENAME COLUMN APV_SDATE TO ARRIVE;
ALTER TABLE APPROVAL RENAME COLUMN APV_EDATE TO DEPART;
ALTER TABLE APPROVAL RENAME COLUMN DEPART TO APV_EDATE;
ALTER TABLE APPROVAL RENAME COLUMN APV_DDATE TO DEPART;

COMMIT;

CREATE TABLE APPROVAL_ATTACH 
(
  ATTACH_NO NUMBER NOT NULL 
, APV_NO NUMBER NOT NULL 
, APT_ORIGIN_NAME VARCHAR2(128 BYTE) NOT NULL 
, APT_SAVE_NAME VARCHAR2(128 BYTE) NOT NULL 
, APT_PATH VARCHAR2(256 BYTE) NOT NULL 
, APT_FILE_SIZE NUMBER NOT NULL 
, DEL_YN CHAR(1 BYTE) 
, REG_DATE DATE DEFAULT SYSDATE NOT NULL 
, UPD_DATE DATE 
, CONSTRAINT APPROVAL_ATTACH_PK PRIMARY KEY 
  (
    ATTACH_NO 
  , APV_NO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX APPROVAL_ATTACH_PK ON APPROVAL_ATTACH (ATTACH_NO ASC, APV_NO ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

COMMENT ON COLUMN APPROVAL_ATTACH.ATTACH_NO IS '결재파일번호';

COMMENT ON COLUMN APPROVAL_ATTACH.APV_NO IS '결재번호';

COMMENT ON COLUMN APPROVAL_ATTACH.APT_ORIGIN_NAME IS '결재파일원본';

COMMENT ON COLUMN APPROVAL_ATTACH.APT_SAVE_NAME IS '결재파일저장';

COMMENT ON COLUMN APPROVAL_ATTACH.APT_PATH IS '파일저장경로';

COMMENT ON COLUMN APPROVAL_ATTACH.APT_FILE_SIZE IS '파일사이즈';

COMMENT ON COLUMN APPROVAL_ATTACH.REG_DATE IS '파일등록일';

COMMENT ON COLUMN APPROVAL_ATTACH.UPD_DATE IS '파일수정일';


CREATE SEQUENCE SEQ_APV_ATTACH INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 CACHE 20;

COMMIT;

-------------------------------------------

---------------- 2021.09.09 21:14 장원형 UPDATE
---------------- V_SCRAP 뷰 추가

CREATE OR REPLACE VIEW V_SCRAP
AS (SELECT S.M_CODE, S.B_NO, S.PROJECT, S.B_TITLE, S.B_WRITER, S.SCRAP_DATE, B.B_STATE
    FROM SCRAP S
    LEFT JOIN BOARD B ON (S.B_NO = B.B_NO));

COMMIT;

---------------- 2021.09.09 22:45 장원형 UPDATE
---------------- V_SCRAP 뷰 수정 / SCRAP 테이블 컬럼 추가 및 삭제 / SCRAP 시퀀스 생성

ALTER TABLE SCRAP ADD (S_NO NUMBER NOT NULL);
ALTER TABLE SCRAP DROP COLUMN SCRAP_DATE;

CREATE SEQUENCE SEQ_SCRAP
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1 NOCACHE;  

CREATE OR REPLACE VIEW V_SCRAP
AS (SELECT S.M_CODE, S.B_NO, S.PROJECT, S.B_TITLE, S.B_WRITER, S.S_NO, B.B_STATE
    FROM SCRAP S
    LEFT JOIN BOARD B ON (S.B_NO = B.B_NO));

COMMIT;


---------------- 2021.09.13 00:36 장원형 UPDATE
---------------- COMMENT 변경, BOARD 테이블 수정 / COMMENT 작성

COMMENT ON COLUMN NOTICE.N_CATEGORY IS '알림구분(자료실, 프로젝트, 결재)';

ALTER TABLE BOARD MODIFY B_STATE NULL;
ALTER TABLE BOARD MODIFY PROJECT NULL;
ALTER TABLE BOARD ADD NOTICE_TYPE NUMBER;

COMMENT ON COLUMN BOARD.NOTICE_TYPE IS '공지사항만 입력(1: 전체 / 2: 부서)';

COMMIT;


------------ 2021.09.13 17:01 임지은 UPDATE
APPROVAL 디폴트 값 변경

ALTER TABLE APPROVAL MODIFY APV_STATUS DEFAULT 'A';
COMMIT;

----------- 2021.09-14 17:41 장원형 UPDATE
----------- 게시글 내용 길이 변경

ALTER TABLE BOARD MODIFY B_CONTENT VARCHAR2(4000);




----------- 2021.09-14 21:08 강정환 UPDATE
----------- 결재 승인자 관련 테이블 , 결재 갯수 카운트 테이블 , 결재 승인자 관련 
CREATE TABLE APPROVAL_ACCEPT 
(
  ACCEPT_NO NUMBER NOT NULL 
, APV_NO NUMBER NOT NULL 
, APPROVAL_TYPE CHAR(3 BYTE) DEFAULT 'APP' NOT NULL 
, MEM_ID VARCHAR2(64 BYTE) NOT NULL 
, ACCEPT_YN CHAR(1 BYTE) DEFAULT 'N' NOT NULL 
, ACCEPT_TYPE VARCHAR2(20 BYTE) DEFAULT NULL 
, ACCEPT_DATE DATE 
, CONSTRAINT APPROVAL_ACCEPT_PK PRIMARY KEY 
  (
    ACCEPT_NO 
  , APV_NO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX APPROVAL_AGR_PK ON APPROVAL_ACCEPT (ACCEPT_NO ASC, APV_NO ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

COMMENT ON COLUMN APPROVAL_ACCEPT.ACCEPT_TYPE IS 'ACCEPT:''결재'', REFUSE:''합의거절'', ''CANCEL'':''반려''';


COMMIT;

CREATE TABLE CODE_INFO 
(
  MAIN_CODE CHAR(4 BYTE) NOT NULL 
, SUB_CODE VARCHAR2(8 BYTE) NOT NULL 
, CODE_DESC VARCHAR2(64 BYTE) NOT NULL 
, ATTR1 VARCHAR2(20 BYTE) 
, CONSTRAINT CODE_INFO_PK PRIMARY KEY 
  (
    MAIN_CODE 
  , SUB_CODE 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX CODE_INFO_PK ON CODE_INFO (MAIN_CODE ASC, SUB_CODE ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

COMMIT;

INSERT INTO CODE_INFO VALUES ('M001', 'A' , '진행' , 'ad'); 
         
INSERT INTO CODE_INFO VALUES ('M001', 'C' , '완료' , 'com'); 
         
INSERT INTO CODE_INFO VALUES ('M001', 'D' , '반려' , 'return');
         
INSERT INTO CODE_INFO VALUES ('M001', 'R' , '미결재' , 'none'); 
	 
COMMIT;

CREATE SEQUENCE SEQ_APV_ACCEPT INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

COMMIT;



---------2021-09-15---결재 합의자 이름출력 버그 수정-----------------
DROP TABLE CODE_INFO CASCADE CONSTRAINT;

COMMIT;

CREATE TABLE CODE_INFO 
(
  MAIN_CODE CHAR(4 BYTE) NOT NULL 
, SUB_CODE VARCHAR2(8 BYTE) NOT NULL 
, CODE_DESC VARCHAR2(64 BYTE) NOT NULL 
, ATTR1 VARCHAR2(20 BYTE) 
, ORDER_NO NUMBER DEFAULT 1 NOT NULL 
, CONSTRAINT CODE_INFO_PK PRIMARY KEY 
  (
    MAIN_CODE 
  , SUB_CODE 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX CODE_INFO_PK ON CODE_INFO (MAIN_CODE ASC, SUB_CODE ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;


COMMIT;

INSERT INTO CODE_INFO VALUES ('M001', 'A' , '미결재' , 'none',4); 
         
INSERT INTO CODE_INFO VALUES ('M001', 'B' , '진행' , 'ad',1); 
         
INSERT INTO CODE_INFO VALUES ('M001', 'C' , '완료' , 'com',2);
         
INSERT INTO CODE_INFO VALUES ('M001', 'D' , '반려' , 'return',3);

COMMIT;

