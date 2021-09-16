package com.kh.SharetheVision.leave.model.vo;

import java.sql.Date;

public class LeaveAnnual {

	private int annualNo;
	private String year;
	private String baseDate;
	private String startDate;
	private String endDate;
	private double total;
	private int adjust;
	private Date createDate;
	private String content;
	private int type;
	private String memberNo;
	private String memberId;
	
	public LeaveAnnual() {}

	public int getAnnualNo() {
		return annualNo;
	}

	public void setAnnualNo(int annualNo) {
		this.annualNo = annualNo;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getBaseDate() {
		return baseDate;
	}

	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getAdjust() {
		return adjust;
	}

	public void setAdjust(int adjust) {
		this.adjust = adjust;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "LeaveAnnual [annualNo=" + annualNo + ", year=" + year + ", baseDate=" + baseDate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", total=" + total + ", adjust=" + adjust + ", createDate="
				+ createDate + ", content=" + content + ", type=" + type + ", memberNo=" + memberNo + ", memberId="
				+ memberId + "]";
	}


	
}
