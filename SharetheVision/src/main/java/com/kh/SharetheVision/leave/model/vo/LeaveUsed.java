package com.kh.SharetheVision.leave.model.vo;

import java.sql.Date;

public class LeaveUsed {

	private int leaveUsedNo;
	private String startDate;
	private String endDate;
	private double days;
	private Date createDate;
	private String content;
	private String approval;
	private String status;
	private int type;
	private String memberNo;
	
	public LeaveUsed() {}

	public int getLeaveUsedNo() {
		return leaveUsedNo;
	}

	public void setLeaveUsedNo(int leaveUsedNo) {
		this.leaveUsedNo = leaveUsedNo;
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

	public double getDays() {
		return days;
	}

	public void setDays(double days) {
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

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	@Override
	public String toString() {
		return "LeaveUsed [leaveUsedNo=" + leaveUsedNo + ", startDate=" + startDate + ", endDate=" + endDate + ", days="
				+ days + ", createDate=" + createDate + ", content=" + content + ", approval=" + approval + ", status="
				+ status + ", type=" + type + ", memberNo=" + memberNo + "]";
	}

	
	
}
