package com.kh.SharetheVision.ms;

import java.util.ArrayList;
import java.util.List;

public class ConnectingUserList {
	
	private static ConnectingUserList ccu;
	public List<String> userList = new ArrayList<String>();
	
	
	private ConnectingUserList() {}
	
	public static ConnectingUserList getInstance() {
		
		if (ccu == null) {
			ccu = new ConnectingUserList();
			
		}
		return ccu;
	}

	public List<String> getUserList() {
		return userList;
	}

	public void setUserList(List<String> userList) {
		this.userList = userList;
	}

	
	
}