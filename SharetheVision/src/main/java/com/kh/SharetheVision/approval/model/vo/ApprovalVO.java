package com.kh.SharetheVision.approval.model.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ApprovalVO {

	private int apvNo;
	private String apvType;
	private String mCode;
	private String apvAgr;
	private String apvRef;
	private String apvApp;
	private String apt;
	private String comment;
	private Date arrive;
	private Date depart;
	private Date apvEdate;
	private String apvStatus;
	private int apvRefNo;
	private MultipartFile fileObj;
	private String atChange;
	private String mName;
	private String mId;

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
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

	public String getApt() {
		return apt;
	}

	public void setApt(String apt) {
		this.apt = apt;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getArrive() {
		return arrive;
	}

	public void setArrive(Date arrive) {
		this.arrive = arrive;
	}

	public Date getDepart() {
		return depart;
	}

	public void setDepart(Date depart) {
		this.depart = depart;
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

	public int getApvRefNo() {
		return apvRefNo;
	}

	public void setApvRefNo(int apvRefNo) {
		this.apvRefNo = apvRefNo;
	}

	public MultipartFile getFileObj() {
		return fileObj;
	}

	public void setFileObj(MultipartFile fileObj) {
		this.fileObj = fileObj;
	}

	public String getAtChange() {
		return atChange;
	}

	public void setAtChange(String atChange) {
		this.atChange = atChange;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "ApprovalVO [apvNo=" + apvNo + ", apvType=" + apvType + ", mCode=" + mCode + ", apvAgr=" + apvAgr
				+ ", apvRef=" + apvRef + ", apvApp=" + apvApp + ", apt=" + apt + ", comment=" + comment + ", arrive="
				+ arrive + ", depart=" + depart + ", apvEdate=" + apvEdate + ", apvStatus=" + apvStatus + ", apvRefNo="
				+ apvRefNo + ", fileObj=" + fileObj + ", atChange=" + atChange + ", mName=" + mName + ", mId=" + mId
				+ "]";
	}
	

}
