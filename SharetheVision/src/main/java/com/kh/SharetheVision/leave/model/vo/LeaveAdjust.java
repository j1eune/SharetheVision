package com.kh.SharetheVision.leave.model.vo;

import java.sql.Date;

public class LeaveAdjust {
	
	private int adjustNo;
	private int type;
	private int days;
	private Date createDate;
	private String content;
	private String memberNo;
	
	public LeaveAdjust() {}

	public int getAdjustNo() {
		return adjustNo;
	}

	public void setAdjustNo(int adjustNo) {
		this.adjustNo = adjustNo;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "LeaveAdjust [adjustNo=" + adjustNo + ", type=" + type + ", days=" + days + ", createDate=" + createDate
				+ ", content=" + content + ", memberNo=" + memberNo + "]";
	}
	
	
}
