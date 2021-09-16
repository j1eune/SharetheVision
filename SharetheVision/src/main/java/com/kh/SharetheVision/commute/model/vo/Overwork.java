package com.kh.SharetheVision.commute.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Overwork {
	
	private int overworkNo;
	private Date overworkDate;
	private String overworkStart;
	private String overworkEnd;
	private double overworktime;
	private int type;
	private Date enrollDate;
	private String approval;
	private String overworkContent;
	private String memberNo;
	
	public Overwork() {}

	public int getOverworkNo() {
		return overworkNo;
	}

	public void setOverworkNo(int overworkNo) {
		this.overworkNo = overworkNo;
	}

	public Date getOverworkDate() {
		return overworkDate;
	}

	public void setOverworkDate(Date overworkDate) {
		this.overworkDate = overworkDate;
	}

	public String getOverworkStart() {
		return overworkStart;
	}

	public void setOverworkStart(String overworkStart) {
		this.overworkStart = overworkStart;
	}

	public String getOverworkEnd() {
		return overworkEnd;
	}

	public void setOverworkEnd(String overworkEnd) {
		this.overworkEnd = overworkEnd;
	}

	public double getOverworktime() {
		return overworktime;
	}

	public void setOverworktime(double overworktime) {
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Overwork [overworkNo=" + overworkNo + ", overworkDate=" + overworkDate + ", overworkStart="
				+ overworkStart + ", overworkEnd=" + overworkEnd + ", overworktime=" + overworktime + ", type=" + type
				+ ", enrollDate=" + enrollDate + ", approval=" + approval + ", overworkContent=" + overworkContent
				+ ", memberNo=" + memberNo + "]";
	}
	
}
