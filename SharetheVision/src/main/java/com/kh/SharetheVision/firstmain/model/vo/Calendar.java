package com.kh.SharetheVision.firstmain.model.vo;

public class Calendar {
	private int code;
	private int no;
	private String title;
	private String sDate;
	private String eDate;
	private String status;
	private String mCode;
	
	public Calendar() {}

	public Calendar(int code, int no, String title, String sDate, String eDate, String status, String mCode) {
		super();
		this.code = code;
		this.no = no;
		this.title = title;
		this.sDate = sDate;
		this.eDate = eDate;
		this.status = status;
		this.mCode = mCode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "Calendar [code=" + code + ", no=" + no + ", title=" + title + ", sDate=" + sDate + ", eDate=" + eDate
				+ ", status=" + status + ", mCode=" + mCode + "]";
	}

	

	
}
