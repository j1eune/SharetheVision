package com.kh.SharetheVision.board.model.vo;

public class MemberProject {
	private String mCode;
	private int pNo;
	
	public MemberProject() {}

	public MemberProject(String mCode, int pNo) {
		super();
		this.mCode = mCode;
		this.pNo = pNo;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "MemberProject [mCode=" + mCode + ", pNo=" + pNo + "]";
	}
	
	
}