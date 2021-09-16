package com.kh.SharetheVision.ms.model.vo;

public class Room {
	private int rno;
	private String fid;
	private String tid;
	private String rsta;
	
	public  Room() {}

	public Room(int rno, String fid, String tid, String rsta) {
		super();
		this.rno = rno;
		this.fid = fid;
		this.tid = tid;
		this.rsta = rsta;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
	

	public String getRsta() {
		return rsta;
	}

	public void setRsta(String rsta) {
		this.rsta = rsta;
	}

	@Override
	public String toString() {
		return "Room [rno=" + rno + ", fid=" + fid + ", tid=" + tid + "]";
	}
	
	
}
