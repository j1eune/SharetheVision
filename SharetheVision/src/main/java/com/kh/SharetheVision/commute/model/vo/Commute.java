package com.kh.SharetheVision.commute.model.vo;

import java.sql.Date;

public class Commute {

	private int commuteNo;
	private String memberNo;
	private Date enrollDate;
	private String commuteStart;
	private String commuteEnd;
	private int worktime;
	private int overworktime;
	private double total;
	
	public Commute() {}

	public Commute(int commuteNo, String memberNo, Date enrollDate, String commuteStart, String commuteEnd,
			int worktime, int overworktime, double total) {
		super();
		this.commuteNo = commuteNo;
		this.memberNo = memberNo;
		this.enrollDate = enrollDate;
		this.commuteStart = commuteStart;
		this.commuteEnd = commuteEnd;
		this.worktime = worktime;
		this.overworktime = overworktime;
		this.total = total;
	}

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

	public int getOverworktime() {
		return overworktime;
	}

	public void setOverworktime(int overworktime) {
		this.overworktime = overworktime;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Commute [commuteNo=" + commuteNo + ", memberNo=" + memberNo + ", enrollDate=" + enrollDate
				+ ", commuteStart=" + commuteStart + ", commuteEnd=" + commuteEnd + ", worktime=" + worktime
				+ ", overworktime=" + overworktime + ", total=" + total + "]";
	}
	
}
