package com.kh.SharetheVision.ms.model.vo;

import java.io.Serializable;

public class ChatVo implements Serializable {
	public int roomId;
	public String userId;
	public String message;
	public int count;
	public boolean isFirst;
		
	public ChatVo() {
		super();
	}
	public ChatVo(int roomId, String userId, String message, int count, boolean isFirst) {
		super();
		this.roomId = roomId;
		this.userId = userId;
		this.message = message;
		this.count = count;
		this.isFirst = isFirst;
	}
	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public boolean isFirst() {
		return isFirst;
	}


	public void setFirst(boolean isFirst) {
		this.isFirst = isFirst;
	}


	@Override
	public String toString() {
		return "ChatVo [roomId=" + roomId + ", userId=" + userId + ", message=" + message + ", count=" + count
				+ ", isFirst=" + isFirst + "]";
	}
	
}