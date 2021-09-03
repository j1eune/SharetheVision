package com.kh.SharetheVision.approval.model.vo;

import java.sql.Date;

import oracle.sql.DATE;

public class Approval {
	
	private int apNo;
	private String apvType;
	private String mCode;
	private String apvAgr;
	private String apvRef;
	private String apvApp;
	private String apvTitle;
	private String apvCom;
	private DATE apvSdate;
	private DATE apvDdate;
	private DATE apvEdate;
	private String apvStatus;
	
	public Approval() {}
	

	public Approval(int apNo, String apvType, String mCode, String apvAgr, String apvRef, String apvApp,
			String apvTitle, String apvCom, DATE apvSdate, DATE apvDdate, DATE apvEdate, String apvStatus) {
		super();
		this.apNo = apNo;
		this.apvType = apvType;
		this.mCode = mCode;
		this.apvAgr = apvAgr;
		this.apvRef = apvRef;
		this.apvApp = apvApp;
		this.apvTitle = apvTitle;
		this.apvCom = apvCom;
		this.apvSdate = apvSdate;
		this.apvDdate = apvDdate;
		this.apvEdate = apvEdate;
		this.apvStatus = apvStatus;
	}


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


	public DATE getApvSdate() {
		return apvSdate;
	}


	public void setApvSdate(DATE apvSdate) {
		this.apvSdate = apvSdate;
	}


	public DATE getApvDdate() {
		return apvDdate;
	}


	public void setApvDdate(DATE apvDdate) {
		this.apvDdate = apvDdate;
	}


	public DATE getApvEdate() {
		return apvEdate;
	}


	public void setApvEdate(DATE apvEdate) {
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
