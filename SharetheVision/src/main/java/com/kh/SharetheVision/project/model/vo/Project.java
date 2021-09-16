package com.kh.SharetheVision.project.model.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Project {
	private int pNo;
	private String mCode;
	private String pName;
	private String pIntro;
	private String pStatus;
	private String pEnd;
	private int deptNo;
	private String[] mCodeArr;
	
	public Project() {}

	public Project(int pNo, String mCode, String pName, String pIntro, String pStatus, String pEnd, int deptNo,
			String[] mCodeArr) {
		super();
		this.pNo = pNo;
		this.mCode = mCode;
		this.pName = pName;
		this.pIntro = pIntro;
		this.pStatus = pStatus;
		this.pEnd = pEnd;
		this.deptNo = deptNo;
		this.mCodeArr = mCodeArr;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
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

	public String[] getmCodeArr() {
		return mCodeArr;
	}

	public void setmCodeArr(String[] mCodeArr) {
		this.mCodeArr = mCodeArr;
	}

	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", mCode=" + mCode + ", pName=" + pName + ", pIntro=" + pIntro + ", pStatus="
				+ pStatus + ", pEnd=" + pEnd + ", deptNo=" + deptNo + ", mCodeArr=" + Arrays.toString(mCodeArr) + "]";
	}

	
	
}
