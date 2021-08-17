package com.kh.SharetheVision.member.model.vo;

import java.sql.Date;

public class Member {
	private String mCode;
	private String mId;
	private String name;
	private String pwd;
	private String phone;
	private String address;
	private String email;
	private Date entryDate;
	private Date modifyDate;
	private String mStatus;
	private int mState;
	private int adminNo;
	private int deptNo;
	private int jobNo;
	private String adminName;
	private String jobName;
	private String deptName;
	
	public Member () {}

	public Member(String mCode, String mId, String name, String pwd, String phone, String address, String email,
			Date entryDate, Date modifyDate, String mStatus, int mState, int adminNo, int deptNo, int jobNo,
			String adminName, String jobName, String deptName) {
		super();
		this.mCode = mCode;
		this.mId = mId;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.entryDate = entryDate;
		this.modifyDate = modifyDate;
		this.mStatus = mStatus;
		this.mState = mState;
		this.adminNo = adminNo;
		this.deptNo = deptNo;
		this.jobNo = jobNo;
		this.adminName = adminName;
		this.jobName = jobName;
		this.deptName = deptName;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getmState() {
		return mState;
	}

	public void setmState(int mState) {
		this.mState = mState;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public int getJobNo() {
		return jobNo;
	}

	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
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

	@Override
	public String toString() {
		return "Member [mCode=" + mCode + ", mId=" + mId + ", name=" + name + ", pwd=" + pwd + ", phone=" + phone
				+ ", address=" + address + ", email=" + email + ", entryDate=" + entryDate + ", modifyDate="
				+ modifyDate + ", mStatus=" + mStatus + ", mState=" + mState + ", adminNo=" + adminNo + ", deptNo="
				+ deptNo + ", jobNo=" + jobNo + ", adminName=" + adminName + ", jobName=" + jobName + ", deptName="
				+ deptName + "]";
	}

}
