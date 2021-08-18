package com.kh.SharetheVision.commute.model.vo;

import java.sql.Date;

public class Overwork {
	
	private int overworkNo;
	private String memberNo;
	private Date overworkDate;
	private int overworktime;
	private int type;
	private Date enrollDate;
	private String approval;
	private String overworkContent;
	
	public Overwork() {}

	public int getOverworkNo() {
		return overworkNo;
	}

	public void setOverworkNo(int overworkNo) {
		this.overworkNo = overworkNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public Date getOverworkDate() {
		return overworkDate;
	}

	public void setOverworkDate(Date overworkDate) {
		this.overworkDate = overworkDate;
	}

	public int getOverworktime() {
		return overworktime;
	}

	public void setOverworktime(int overworktime) {
		this.overworktime = overworktime;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getOverworkContent() {
		return overworkContent;
	}

	public void setOverworkContent(String overworkContent) {
		this.overworkContent = overworkContent;
	}

	@Override
	public String toString() {
		return "Overwork [overworkNo=" + overworkNo + ", memberNo=" + memberNo + ", overworkDate=" + overworkDate
				+ ", overworktime=" + overworktime + ", type=" + type + ", enrollDate=" + enrollDate + ", approval="
				+ approval + ", overworkContent=" + overworkContent + "]";
	}
	
	
}
