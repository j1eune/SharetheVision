package com.kh.SharetheVision.project.model.vo;

import java.util.Arrays;

public class Project {
	private String pName;
	private String pIntro;
	private String pStatus;
	private String pEnd;
	private int deptNo;
	private int[] mCode;
	
	public Project() {}

	public Project(String pName, String pIntro, String pStatus, String pEnd, int deptNo, int[] mCode) {
		super();
		this.pName = pName;
		this.pIntro = pIntro;
		this.pStatus = pStatus;
		this.pEnd = pEnd;
		this.deptNo = deptNo;
		this.mCode = mCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpIntro() {
		return pIntro;
	}

	public void setpIntro(String pIntro) {
		this.pIntro = pIntro;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public String getpEnd() {
		return pEnd;
	}

	public void setpEnd(String pEnd) {
		this.pEnd = pEnd;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public int[] getmCode() {
		return mCode;
	}

	public void setmCode(int[] mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "Project [pName=" + pName + ", pIntro=" + pIntro + ", pStatus=" + pStatus + ", pEnd=" + pEnd
				+ ", deptNo=" + deptNo + ", mCode=" + Arrays.toString(mCode) + "]";
	}
	
}
