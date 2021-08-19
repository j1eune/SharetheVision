﻿-- --------------------------------------------------------------------------------------------------------------------------------------------------------
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
ALTER TABLE ATTACHMENT MODIFY AT_STATUS DEFAULT 'Y';
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
