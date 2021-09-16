package com.kh.SharetheVision.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyWriter;
	private String replyContent;
	private Date replyCreateDate;
	private String jobName;
	private String deptName;
	private String replyStatus;
	private String memberCode;
	private int boardNo;
	private String replyWriterImage;
	
	public Reply() {}

	public Reply(int replyNo, String jobName, String deptName, String replyWriter, String replyContent,
			Date replyCreateDate, String replyStatus, String memberCode, int boardNo, String replyWriterImage) {
		super();
		this.replyNo = replyNo;
		this.jobName = jobName;
		this.deptName = deptName;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
		this.memberCode = memberCode;
		this.boardNo = boardNo;
		this.replyWriterImage = replyWriterImage;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getReplyWriterImage() {
		return replyWriterImage;
	}

	public void setReplyWriterImage(String replyWriterImage) {
		this.replyWriterImage = replyWriterImage;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", replyContent=" + replyContent
				+ ", replyCreateDate=" + replyCreateDate + ", jobName=" + jobName + ", deptName=" + deptName
				+ ", replyStatus=" + replyStatus + ", memberCode=" + memberCode + ", boardNo=" + boardNo
				+ ", replyWriterImage=" + replyWriterImage + "]";
	}

	
}
