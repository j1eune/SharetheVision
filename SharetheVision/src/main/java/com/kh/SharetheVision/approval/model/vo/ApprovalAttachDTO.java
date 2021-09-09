package com.kh.SharetheVision.approval.model.vo;

public class ApprovalAttachDTO {
	private int attachNo;
	private int apvNo;
	private String aptOriginName;
	private String aptSaveName;
	private String aptPath;
	private int aptFileSize;
	private String delYn;
	private String regDate;
	private String updDate;

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
	}

	public String getAptOriginName() {
		return aptOriginName;
	}

	public void setAptOriginName(String aptOriginName) {
		this.aptOriginName = aptOriginName;
	}

	public String getAptSaveName() {
		return aptSaveName;
	}

	public void setAptSaveName(String aptSaveName) {
		this.aptSaveName = aptSaveName;
	}

	public String getAptPath() {
		return aptPath;
	}

	public void setAptPath(String aptPath) {
		this.aptPath = aptPath;
	}

	public int getAptFileSize() {
		return aptFileSize;
	}

	public void setAptFileSize(int aptFileSize) {
		this.aptFileSize = aptFileSize;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdDate() {
		return updDate;
	}

	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}

}
