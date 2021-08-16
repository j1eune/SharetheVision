﻿CREATE TABLE "MEMBER" (
	"M_CODE"	VARCHAR2(100)		NOT NULL,
	"M_NAME"	VARCHAR2(100)		NOT NULL,
	"M_PWD"	VARCHAR2(200)		NOT NULL,
	"M_PHONE"	VARCHAR2(100)		NOT NULL,
	"M_ADDRESS"	VARCHAR2(200)		NOT NULL,
	"M_EMAIL"	VARCHAR2(200)		NOT NULL,
	"M_ENTRY"	DATE		NULL,
	"M_DATE"	DATE		NULL,
	"M_STATE"	NUMBER	DEFAULT 1	NULL,
	"M_STATUS"	VARCHAR2(20)	DEFAULT 'Y'	NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"DEPT_NO"	NUMBER		NOT NULL,
	"J_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."M_STATE" IS '1:업무종료 2:업무중 3:외근 4:휴가';

COMMENT ON COLUMN "MEMBER"."M_STATUS" IS 'Y/N';

CREATE TABLE "BOARD" (
	"B_NO"	NUMBER		NOT NULL,
	"B_TYPE"	NUMBER		NOT NULL,
	"B_TITLE"	VARCHAR2(100)		NOT NULL,
	"B_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"B_CREATEDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"B_STATE"	VARCHAR2(10)		NULL,
	"B_STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NOT NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL,
	"DEPT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."B_TYPE" IS '1 = 부서별 공지 / 2= 부서별 게시판';

CREATE TABLE "ATTACHMENTS" (
	"AT_NO"	NUMBER		NOT NULL,
	"AT_LEVEL"	NUMBER		NULL,
	"AT_CATEGORY"	VARCHAR2(100)		NULL,
	"AT_PATH"	VARCHAR2(100)		NULL,
	"AT_ORIGIN"	VARCHAR2(1000)		NULL,
	"AT_CHANGE"	VARCHAR2(1000)		NULL,
	"AT_EXTENTION"	VARCHAR2(100)		NULL,
	"AT_STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "ATTACHMENTS"."AT_LEVEL" IS '1 = 회원 프로필 / 2 = 게시판 이미지 / 3= 게시판 첨부파일';

CREATE TABLE "COMMUTE" (
	"CMT_NO"	NUMBER		NOT NULL,
	"C_DATE"	DATE		NULL,
	"C_START"	DATE		NULL,
	"C_END"	DATE		NULL,
	"C_WORKTIME"	NUMBER		NULL,
	"C_STATUS"	VARCHAR2(20)		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "SCHEDULE" (
	"SC_NO"	NUMBER	DEFAULT 2	NOT NULL,
	"DSC_NO"	NUMBER		NULL,
	"PSC_NO"	NUMBER		NULL,
	"SC_TITLE"	VARCHAR2(100)		NOT NULL,
	"SC_SDATE"	DATE		NOT NULL,
	"SC_EDATE"	DATE		NOT NULL,
	"SC_STATUS"	VARCHAR(20)	DEFAULT 'N'	NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "SCHEDULE"."SC_NO" IS '부서일정(1),개인일정(2)';

COMMENT ON COLUMN "SCHEDULE"."DSC_NO" IS 'SEQ_DSC  (DEPT)';

COMMENT ON COLUMN "SCHEDULE"."PSC_NO" IS 'SEQ_PSC (PRIVATE)';

COMMENT ON COLUMN "SCHEDULE"."SC_TITLE" IS 'SCHEDULE TITLE';

COMMENT ON COLUMN "SCHEDULE"."SC_SDATE" IS 'SCHEDULE START';

COMMENT ON COLUMN "SCHEDULE"."SC_EDATE" IS 'SCHEDULE END';

COMMENT ON COLUMN "SCHEDULE"."SC_STATUS" IS 'Y/N (종료/진행중)';

CREATE TABLE "ANNUAL" (
	"A_NO"	NUMBER		NOT NULL,
	"A_YEAR"	VARCHAR(10)		NULL,
	"A_BASE_DATE"	DATE		NULL,
	"A_START_DATE"	DATE		NULL,
	"A_END_DATE"	DATE		NULL,
	"A_TOTAL_DAYS"	NUMBER		NULL,
	"A_CREATE"	DATE		NULL,
	"A_MEMO"	VARCHAR(400)		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "PROJECT" (
	"P_NO"	NUMBER		NOT NULL,
	"P_NAME"	VARCHAR2(100)		NOT NULL,
	"P_INTRO"	VARCHAR2(300)		NULL,
	"P_STATUS"	VARCHAR2(50)	DEFAULT 'Y'	NOT NULL,
	"P_END"	VARCHAR2(50)	DEFAULT 'N'	NULL,
	"DEPT_NO"	NUMBER		NOT NULL
);

CREATE TABLE "ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_NAME"	VARCHAR2(100)		NULL
);

CREATE TABLE "DEPARTMENT" (
	"DEPT_NO"	NUMBER		NOT NULL,
	"DEPT_NAME"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "CHECKLIST" (
	"CH_NO"	NUMBER	DEFAULT 2	NOT NULL,
	"DCH_NO"	NUMBER		NULL,
	"PCH_NO"	NUMBER		NULL,
	"CH_NAME"	VARCHAR2(200)		NULL,
	"C_STATUS"	VARCHAR(20)	DEFAULT 'N'	NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "CHECKLIST"."CH_NO" IS '부서업무(1),개인업무(2)';

COMMENT ON COLUMN "CHECKLIST"."DCH_NO" IS 'SEQ_DCH';

COMMENT ON COLUMN "CHECKLIST"."PCH_NO" IS 'SEQ_PCH';

COMMENT ON COLUMN "CHECKLIST"."CH_NAME" IS 'CHECKLIST NAME';

COMMENT ON COLUMN "CHECKLIST"."C_STATUS" IS 'Y/N(CHECKED/ING)';

CREATE TABLE "ADJUST" (
	"AD_NO"	NUMBER		NOT NULL,
	"AD_TYPE"	NUMBER	DEFAULT 1	NULL,
	"AD_DAYS"	NUMBER		NULL,
	"AD_CREATE"	DATE	DEFAULT SYSDATE	NULL,
	"AD_MEMO"	VARCHAR2(400)		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "ADJUST"."AD_TYPE" IS '1:발생연차 / 2:조정연차 / 3:1년미만 월차';

CREATE TABLE "USED" (
	"U_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"U_YEAR"	VARCHAR(4)		NULL,
	"U_START_DATE"	DATE		NULL,
	"U_END_DATE"	DATE		NULL,
	"U_USED_DAYS"	NUMBER		NULL,
	"U_CREATE"	DATE		NULL,
	"U_MEMO"	VARCHAR(400)		NULL,
	"U_APPROVAL"	VARCHAR(10)	DEFAULT 'W'	NULL,
	"U_STATUS"	VARCHAR(10)	DEFAULT 'N'	NULL,
	"U_TYPE"	NUMBER	DEFAULT 1	NULL
);

COMMENT ON COLUMN "USED"."U_APPROVAL" IS 'Y:승인 /  N:반려 / W:대기';

COMMENT ON COLUMN "USED"."U_STATUS" IS 'Y:사용완료  /  N:미사용';

COMMENT ON COLUMN "USED"."U_TYPE" IS '1:연차 2:반차 3:경조사 4:공가 5:병가 6.특별휴가';

CREATE TABLE "REPLY" (
	"R_NO"	VARCHAR(255)		NOT NULL,
	"J_NO"	NUMBER		NULL,
	"R_WRITER"	VARCHAR2(100)		NULL,
	"R_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"C_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"R_STATUS"	VARCHAR2(50)	DEFAULT 'Y'	NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL,
	"B_NO"	NUMBER		NOT NULL
);

CREATE TABLE "BOARD_LOG" (
	"L_NO"	NUMBER		NOT NULL,
	"L_NAME"	VARCHAR2(100)		NOT NULL,
	"L_MODIFYCONTENT"	VARCHAR2(1000)		NOT NULL,
	"L_MODIFYDATE"	DATE		NOT NULL,
	"B_NO"	NUMBER		NOT NULL
);

CREATE TABLE "DOC" (
	"DOC_NUM"	NUMBER		NOT NULL,
	"DOC_OG_NM"	VARCHAR2(2000)		NOT NULL,
	"DOC_SV_NM"	VARCHAR2(2000)		NOT NULL,
	"DOC_SIZE"	NUMBER		NOT NULL,
	"DOC_PATH"	VARCHAR2(100)		NULL,
	"APV_NUM"	NUMBER		NOT NULL,
	"DOC_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "MS" (
	"MS_NO"	VARCHAR2(100)		NOT NULL,
	"MS_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"MS_TIME"	VARCHAR2(50)		NOT NULL,
	"EMO"	VARCHAR2(2000)		NULL,
	"MS_FILE"	VARCHAR2(1000)		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL,
	"M_CODE2"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "MS"."MS_NO" IS 'SEQ_MS';

COMMENT ON COLUMN "MS"."MS_CONTENT" IS '텍스트';

COMMENT ON COLUMN "MS"."MS_TIME" IS 'YYMMDD - HH:mm:SS';

COMMENT ON COLUMN "MS"."EMO" IS '이미지파일';

COMMENT ON COLUMN "MS"."MS_FILE" IS '첨부파일';

COMMENT ON COLUMN "MS"."M_CODE" IS '수신인';

COMMENT ON COLUMN "MS"."M_CODE2" IS '발신인';

CREATE TABLE "JOB" (
	"J_NO"	NUMBER		NOT NULL,
	"J_NAME"	VARCHAR2(100)		NULL
);

CREATE TABLE "APV_CATEGORY" (
	"APV_CATE"	NUMBER		NOT NULL,
	"APV_NAME"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "APV_CATEGORY"."APV_CATE" IS '1:기안 2:합의 3:결재';

CREATE TABLE "APV" (
	"APV_NUM"	NUMBER		NOT NULL,
	"APV_TITLE"	VARCHAR2(2000)		NOT NULL,
	"APV_CONTENT"	VARCHAR2(2500)		NOT NULL,
	"APV_DATE"	DATE		NOT NULL,
	"APV_REC"	DATE		NOT NULL,
	"APV_END"	DATE		NOT NULL,
	"APV_RESULT"	NUMBER	DEFAULT 1	NULL,
	"DEPT_NAME"	VARCHAR2(500)		NOT NULL,
	"APV_STATUS"	CHAR(1)		NULL,
	"APV_WRITER"	VARCHAR2(500)		NOT NULL,
	"APV_REVIEWER"	VARCHAR2(500)		NOT NULL,
	"APV_APPROVER"	VARCHAR2(500)		NOT NULL,
	"APV_CATE"	NUMBER		NOT NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "APV"."APV_RESULT" IS '1:대기 2:반려 3:승인';

COMMENT ON COLUMN "APV"."APV_CATE" IS '1:기안 2:합의 3:결재';

CREATE TABLE "SIGN_IMG" (
	"S_IMG_NM"	NUMBER		NOT NULL,
	"ORG_SMG_NM"	VARCHAR2(20)		NOT NULL,
	"SAVE_SMG_NM"	VARCHAR2(60)		NOT NULL,
	"S_IMG_SIZE"	NUMBER		NULL,
	"S_IMG_PATH"	VARCHAR2(100)		NULL,
	"REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "OVERWORK" (
	"O_NO"	NUMBER		NOT NULL,
	"O_DATE"	DATE		NULL,
	"O_TIME"	NUMBER		NULL,
	"O_TYPE"	NUMBER	DEFAULT 1	NOT NULL,
	"O_APPLYDATE"	DATE	DEFAULT SYSDATE	NULL,
	"O_APPROVAL"	VARCHAR(10)	DEFAULT 'N'	NULL,
	"O_MEMO"	VARCHAR(400)		NULL,
	"M_CODE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "OVERWORK"."O_TYPE" IS '1:연장 2:야간 3:휴일';

COMMENT ON COLUMN "OVERWORK"."O_APPROVAL" IS 'Y:승인 / N:미승인';

CREATE TABLE "M_PROJECT" (
	"M_CODE"	VARCHAR2(100)		NOT NULL,
	"P_NO"	NUMBER		NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"M_CODE"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"B_NO"
);

ALTER TABLE "ATTACHMENTS" ADD CONSTRAINT "PK_ATTACHMENTS" PRIMARY KEY (
	"AT_NO"
);

ALTER TABLE "COMMUTE" ADD CONSTRAINT "PK_COMMUTE" PRIMARY KEY (
	"CMT_NO"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY (
	"SC_NO"
);

ALTER TABLE "ANNUAL" ADD CONSTRAINT "PK_ANNUAL" PRIMARY KEY (
	"A_NO"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"P_NO"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
	"DEPT_NO"
);

ALTER TABLE "CHECKLIST" ADD CONSTRAINT "PK_CHECKLIST" PRIMARY KEY (
	"CH_NO"
);

ALTER TABLE "ADJUST" ADD CONSTRAINT "PK_ADJUST" PRIMARY KEY (
	"AD_NO"
);

ALTER TABLE "USED" ADD CONSTRAINT "PK_USED" PRIMARY KEY (
	"U_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"R_NO"
);

ALTER TABLE "BOARD_LOG" ADD CONSTRAINT "PK_BOARD_LOG" PRIMARY KEY (
	"L_NO"
);

ALTER TABLE "DOC" ADD CONSTRAINT "PK_DOC" PRIMARY KEY (
	"DOC_NUM"
);

ALTER TABLE "MS" ADD CONSTRAINT "PK_MS" PRIMARY KEY (
	"MS_NO"
);

ALTER TABLE "JOB" ADD CONSTRAINT "PK_JOB" PRIMARY KEY (
	"J_NO"
);

ALTER TABLE "APV_CATEGORY" ADD CONSTRAINT "PK_APV_CATEGORY" PRIMARY KEY (
	"APV_CATE"
);

ALTER TABLE "APV" ADD CONSTRAINT "PK_APV" PRIMARY KEY (
	"APV_NUM"
);

ALTER TABLE "SIGN_IMG" ADD CONSTRAINT "PK_SIGN_IMG" PRIMARY KEY (
	"S_IMG_NM"
);

ALTER TABLE "OVERWORK" ADD CONSTRAINT "PK_OVERWORK" PRIMARY KEY (
	"O_NO"
);

ALTER TABLE "M_PROJECT" ADD CONSTRAINT "PK_M_PROJECT" PRIMARY KEY (
	"M_CODE",
	"P_NO"
);

ALTER TABLE "M_PROJECT" ADD CONSTRAINT "FK_MEMBER_TO_M_PROJECT_1" FOREIGN KEY (
	"M_CODE"
)
REFERENCES "MEMBER" (
	"M_CODE"
);

ALTER TABLE "M_PROJECT" ADD CONSTRAINT "FK_PROJECT_TO_M_PROJECT_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PROJECT" (
	"P_NO"
);

