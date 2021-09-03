package com.kh.SharetheVision.firstmain.model.vo;

public class Todo {
	private int chNo;
	private int dchNo;
	private String chName;
	private String chStatus;
	private String mCode;
	
	public Todo() {}

	public Todo(int chNo, int dchNo, String chName, String chStatus, String mCode) {
		super();
		this.chNo = chNo;
		this.dchNo = dchNo;
		this.chName = chName;
		this.chStatus = chStatus;
		this.mCode = mCode;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public int getDchNo() {
		return dchNo;
	}

	public void setDchNo(int dchNo) {
		this.dchNo = dchNo;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public String getChStatus() {
		return chStatus;
	}

	public void setChStatus(String chStatus) {
		this.chStatus = chStatus;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "Todo [chNo=" + chNo + ", dchNo=" + dchNo + ", chName=" + chName + ", chStatus=" + chStatus + ", mCode="
				+ mCode + "]";
	}
	
}
