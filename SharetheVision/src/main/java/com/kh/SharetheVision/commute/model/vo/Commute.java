package com.kh.SharetheVision.commute.model.vo;

import java.sql.Date;

public class Commute {

	private int commuteNo;
	private String memberNo;
	private Date enrollDate;
	private String commuteStart;
	private String commuteEnd;
	private int worktime;
	
	public Commute() {}

	public int getCommuteNo() {
		return commuteNo;
	}

	public void setCommuteNo(int commuteNo) {
		this.commuteNo = commuteNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getCommuteStart() {
		return commuteStart;
	}

	public void setCommuteStart(String commuteStart) {
		this.commuteStart = commuteStart;
	}

	public String getCommuteEnd() {
		return commuteEnd;
	}

	public void setCommuteEnd(String commuteEnd) {
		this.commuteEnd = commuteEnd;
	}

	public int getWorktime() {
		return worktime;
	}

	public void setWorktime(int worktime) {
		this.worktime = worktime;
	}

	@Override
	public String toString() {
		return "Commute [commuteNo=" + commuteNo + ", memberNo=" + memberNo + ", enrollDate=" + enrollDate
				+ ", commuteStart=" + commuteStart + ", commuteEnd=" + commuteEnd + ", worktime=" + worktime + "]";
	}

	
}
