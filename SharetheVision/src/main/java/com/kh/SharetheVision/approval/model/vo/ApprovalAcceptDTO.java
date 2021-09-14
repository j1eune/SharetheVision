package com.kh.SharetheVision.approval.model.vo;

public class ApprovalAcceptDTO {
	private int acceptNo;
	private int apvNo;
	private String approvalType;
	private String memId;
	private String memNm;
	private String jobName;
	private String acceptYn;
	private String approvalStatus;
	private String acceptType;
	private String acceptDate;

	public ApprovalAcceptDTO() {
		acceptYn = "N";
	}

	public ApprovalAcceptDTO(int apvNo, String memId, String approvalType) {
		this();
		this.apvNo = apvNo;
		this.memId = memId;
		this.approvalType = approvalType;
	}

	public int getAcceptNo() {
		return acceptNo;
	}

	public void setAcceptNo(int acceptNo) {
		this.acceptNo = acceptNo;
	}

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
	}

	public String getApprovalType() {
		return approvalType;
	}

	public void setApprovalType(String approvalType) {
		this.approvalType = approvalType;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getAcceptYn() {
		return acceptYn;
	}

	public void setAcceptYn(String acceptYn) {
		this.acceptYn = acceptYn;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getAcceptType() {
		return acceptType;
	}

	public void setAcceptType(String acceptType) {
		this.acceptType = acceptType;
	}

	public String getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(String acceptDate) {
		this.acceptDate = acceptDate;
	}
	
}
