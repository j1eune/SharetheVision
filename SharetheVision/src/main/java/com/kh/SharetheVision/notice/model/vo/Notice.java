package com.kh.SharetheVision.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeCategory;
	private int noticeNumber;
	private String noticeContent;
	private String noticeState;
	private Date noticeDate;
	private String mCode;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeCategory, int noticeNumber, String noticeContent, String noticeState,
			Date noticeDate, String mCode) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeNumber = noticeNumber;
		this.noticeContent = noticeContent;
		this.noticeState = noticeState;
		this.noticeDate = noticeDate;
		this.mCode = mCode;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeState() {
		return noticeState;
	}

	public void setNoticeState(String noticeState) {
		this.noticeState = noticeState;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeNumber=" + noticeNumber
				+ ", noticeContent=" + noticeContent + ", noticeState=" + noticeState + ", noticeDate=" + noticeDate
				+ ", mCode=" + mCode + "]";
	}
	
}
