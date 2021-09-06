package com.kh.SharetheVision.approval.model.vo;

import java.sql.Date;

public class Approval {
	
	private int apNo;
	private String apvType;
	private String mCode;
	private String apvAgr;
	private String apvRef;
	private String apvApp;
	private String apvTitle;
	private String apvCom;
	private Date apvSdate;
	private Date apvDdate;
	private Date apvEdate;
	private String apvStatus;
	
	public Approval() {}

	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
	}

	public String getApvType() {
		return apvType;
	}

	public void setApvType(String apvType) {
		this.apvType = apvType;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public String getApvAgr() {
		return apvAgr;
	}

	public void setApvAgr(String apvAgr) {
		this.apvAgr = apvAgr;
	}

	public String getApvRef() {
		return apvRef;
	}

	public void setApvRef(String apvRef) {
		this.apvRef = apvRef;
	}

	public String getApvApp() {
		return apvApp;
	}

	public void setApvApp(String apvApp) {
		this.apvApp = apvApp;
	}

	public String getApvTitle() {
		return apvTitle;
	}

	public void setApvTitle(String apvTitle) {
		this.apvTitle = apvTitle;
	}

	public String getApvCom() {
		return apvCom;
	}

	public void setApvCom(String apvCom) {
		this.apvCom = apvCom;
	}

	public Date getApvSdate() {
		return apvSdate;
	}

	public void setApvSdate(Date apvSdate) {
		this.apvSdate = apvSdate;
	}

	public Date getApvDdate() {
		return apvDdate;
	}

	public void setApvDdate(Date apvDdate) {
		this.apvDdate = apvDdate;
	}

	public Date getApvEdate() {
		return apvEdate;
	}

	public void setApvEdate(Date apvEdate) {
		this.apvEdate = apvEdate;
	}

	public String getApvStatus() {
		return apvStatus;
	}

	public void setApvStatus(String apvStatus) {
		this.apvStatus = apvStatus;
	}

	@Override
	public String toString() {
		return "Approval [apNo=" + apNo + ", apvType=" + apvType + ", mCode=" + mCode + ", apvAgr=" + apvAgr
				+ ", apvRef=" + apvRef + ", apvApp=" + apvApp + ", apvTitle=" + apvTitle + ", apvCom=" + apvCom
				+ ", apvSdate=" + apvSdate + ", apvDdate=" + apvDdate + ", apvEdate=" + apvEdate + ", apvStatus="
				+ apvStatus + "]";
	}
	

	
	
}
