package com.kh.SharetheVision.board.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class Board {
	private int boardNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private String boardState; // 게시판 상태 (완료, 진행중 등)
	private String boardStatus;
	private String memberCode;
	private int deptNo;
	private String boardWriter; // member 테이블 m_name
	private String project; // project 테이블 p_name
	private String[] mCodeArr;
	private int noticeType;
	
	public Board() {}

	public Board(int boardNo, int boardType, String boardTitle, String boardContent, Date boardCreateDate,
			String boardState, String boardStatus, String memberCode, int deptNo, String boardWriter, String project, String[] mCodeArr, int noticeType) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardState = boardState;
		this.boardStatus = boardStatus;
		this.memberCode = memberCode;
		this.deptNo = deptNo;
		this.boardWriter = boardWriter;
		this.project = project;
		this.mCodeArr = mCodeArr;
		this.noticeType = noticeType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public String getBoardState() {
		return boardState;
	}

	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String[] getmCodeArr() {
		return mCodeArr;
	}

	public void setmCodeArr(String[] mCodeArr) {
		this.mCodeArr = mCodeArr;
	}
	
	public int getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardCreateDate=" + boardCreateDate + ", boardState="
				+ boardState + ", boardStatus=" + boardStatus + ", memberCode=" + memberCode + ", deptNo=" + deptNo
				+ ", boardWriter=" + boardWriter + ", project=" + project + ", mCodeArr=" + Arrays.toString(mCodeArr)
				+ ", noticeType=" + noticeType + "]";
	}

	
}
