package com.kh.SharetheVision.board.model.vo;

import java.sql.Date;

public class Scrap {
	private String mCode;
	private int boardNo;
	private String project;
	private String boardTitle;
	private String boardWriter;
	private Date scrapDate;
	
	public Scrap() {}

	public Scrap(String mCode, int boardNo, String project, String boardTitle, String boardWriter, Date scrapDate) {
		super();
		this.mCode = mCode;
		this.boardNo = boardNo;
		this.project = project;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.scrapDate = scrapDate;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	
	public Date getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}

	@Override
	public String toString() {
		return "Scrap [mCode=" + mCode + ", boardNo=" + boardNo + ", project=" + project + ", boardTitle=" + boardTitle
				+ ", boardWriter=" + boardWriter + ", scrapDate=" + scrapDate + "]";
	}

}
