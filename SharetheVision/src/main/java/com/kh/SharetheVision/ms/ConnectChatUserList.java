package com.kh.SharetheVision.ms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConnectChatUserList {

	private static ConnectChatUserList ccum;
	public Map<String, List<String>> userMap = new HashMap<String, List<String>>();
	
	
	private ConnectChatUserList() {}
	
	public static ConnectChatUserList getInstance() {
		
		if (ccum == null) {
			ccum = new ConnectChatUserList();
			ccum.userMap.put("userlist", new ArrayList<String>());
			
		}
		return ccum;
	}
}