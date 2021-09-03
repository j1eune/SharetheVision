package com.kh.SharetheVision.approval.model.vo;

import oracle.sql.DATE;

public class ApvFile {

	private int afNo;
	private int apvNo;
	private String orgafNm;
	private String savafNm;
	private int afSize;
	private String afPath;
	private DATE afregDate;
	
	public ApvFile() {}

	public ApvFile(int afNo, int apvNo, String orgafNm, String savafNm, int afSize, String afPath, DATE afregDate) {
		super();
		this.afNo = afNo;
		this.apvNo = apvNo;
		this.orgafNm = orgafNm;
		this.savafNm = savafNm;
		this.afSize = afSize;
		this.afPath = afPath;
		this.afregDate = afregDate;
	}

	public int getAfNo() {
		return afNo;
	}

	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
	}

	public String getOrgafNm() {
		return orgafNm;
	}

	public void setOrgafNm(String orgafNm) {
		this.orgafNm = orgafNm;
	}

	public String getSavafNm() {
		return savafNm;
	}

	public void setSavafNm(String savafNm) {
		this.savafNm = savafNm;
	}

	public int getAfSize() {
		return afSize;
	}

	public void setAfSize(int afSize) {
		this.afSize = afSize;
	}

	public String getAfPath() {
		return afPath;
	}

	public void setAfPath(String afPath) {
		this.afPath = afPath;
	}

	public DATE getAfregDate() {
		return afregDate;
	}

	public void setAfregDate(DATE afregDate) {
		this.afregDate = afregDate;
	}

	@Override
	public String toString() {
		return "ApvFile [afNo=" + afNo + ", apvNo=" + apvNo + ", orgafNm=" + orgafNm + ", savafNm=" + savafNm
				+ ", afSize=" + afSize + ", afPath=" + afPath + ", afregDate=" + afregDate + "]";
	}
	
	
	
}
