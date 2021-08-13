﻿-- --------------------------------------------------------------------------------------------------------------------------------------------------------
-- =========================================================================================================================================================
-- 2021.08.13 UPDATE
--SCHEDULE, CHECKLIST TABLE 수정 (맨밑에 추가하시면 됩니다)

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

-- 2021.08.13 17:17
-- SEQ_BNO 추가
CREATE SEQUENCE SEQ_BNO
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
NOCACHE;