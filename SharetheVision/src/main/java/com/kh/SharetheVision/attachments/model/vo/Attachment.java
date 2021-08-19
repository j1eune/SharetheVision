package com.kh.SharetheVision.attachments.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Attachment {
	private int atNo;
	private int atLevel;
	private String atCategory;
	private String atPath;
	private String atOrigin;
	private String atChange;
	private String atExtention;
	private String atStatus;
	
	public Attachment() {}
	
	public Attachment(int atNo, int atLevel, String atCategory, String atPath, String atOrigin, String atChange,
			String atExtention, String atStatus) {
		super();
		this.atNo = atNo;
		this.atLevel = atLevel;
		this.atCategory = atCategory;
		this.atPath = atPath;
		this.atOrigin = atOrigin;
		this.atChange = atChange;
		this.atExtention = atExtention;
		this.atStatus = atStatus;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public int getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(int atLevel) {
		this.atLevel = atLevel;
	}

	public String getAtCategory() {
		return atCategory;
	}

	public void setAtCategory(String atCategory) {
		this.atCategory = atCategory;
	}

	public String getAtPath() {
		return atPath;
	}

	public void setAtPath(String atPath) {
		this.atPath = atPath;
	}

	public String getAtOrigin() {
		return atOrigin;
	}

	public void setAtOrigin(String atOrigin) {
		this.atOrigin = atOrigin;
	}

	public String getAtChange() {
		return atChange;
	}

	public void setAtChange(String atChange) {
		this.atChange = atChange;
	}

	public String getAtExtention() {
		return atExtention;
	}

	public void setAtExtention(String atExtention) {
		this.atExtention = atExtention;
	}

	public String getAtStatus() {
		return atStatus;
	}

	public void setAtStatus(String atStatus) {
		this.atStatus = atStatus;
	}

	@Override
	public String toString() {
		return "Attachment [atNo=" + atNo + ", atLevel=" + atLevel + ", atCategory=" + atCategory + ", atPath=" + atPath
				+ ", atOrigin=" + atOrigin + ", atChange=" + atChange + ", atExtention=" + atExtention + ", atStatus="
				+ atStatus + "]";
	}
	
	
	
}
