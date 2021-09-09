package com.kh.SharetheVision.board.model.vo;

import java.sql.Date;

public class Scrap {
	private String mCode;
	private int boardNo;
	private String project;
	private String boardTitle;
	private String boardWriter;
	private int scrapNo;
	private String boardState;
	
	public Scrap() {}

	public Scrap(String mCode, int boardNo, String project, String boardTitle, String boardWriter, int scrapNo, String boardState) {
		super();
		this.mCode = mCode;
		this.boardNo = boardNo;
		this.project = project;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.scrapNo = scrapNo;
		this.boardState = boardState;
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
	
	public int getScrapNo() {
		return scrapNo;
	}

	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}

	public String getBoardState() {
		return boardState;
	}

	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}

	@Override
	public String toString() {
		return "Scrap [mCode=" + mCode + ", boardNo=" + boardNo + ", project=" + project + ", boardTitle=" + boardTitle
				+ ", boardWriter=" + boardWriter + ", scrapNo=" + scrapNo + ", boardState=" + boardState + "]";
	}

}
