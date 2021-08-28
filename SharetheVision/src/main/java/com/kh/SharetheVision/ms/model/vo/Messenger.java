package com.kh.SharetheVision.ms.model.vo;

public class Messenger {
	private int ms_no;
	private String ms_content;
	private String ms_time;
	private int rno;
	private int readcount;
	private String m_code;
	private String m_code2;
	
	public Messenger() {}

	public Messenger(int ms_no, String ms_content, String ms_time, int rno, int readcount, String m_code,
			String m_code2) {
		super();
		this.ms_no = ms_no;
		this.ms_content = ms_content;
		this.ms_time = ms_time;
		this.rno = rno;
		this.readcount = readcount;
		this.m_code = m_code;
		this.m_code2 = m_code2;
	}

	public int getMs_no() {
		return ms_no;
	}

	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}

	public String getMs_content() {
		return ms_content;
	}

	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}

	public String getMs_time() {
		return ms_time;
	}

	public void setMs_time(String ms_time) {
		this.ms_time = ms_time;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getM_code2() {
		return m_code2;
	}

	public void setM_code2(String m_code2) {
		this.m_code2 = m_code2;
	}

	@Override
	public String toString() {
		return "Messenger [ms_no=" + ms_no + ", ms_content=" + ms_content + ", ms_time=" + ms_time + ", rno=" + rno
				+ ", readcount=" + readcount + ", m_code=" + m_code + ", m_code2=" + m_code2 + "]";
	}
	
	
}
