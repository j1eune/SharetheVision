package com.kh.SharetheVision.ms;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;


public class CheckConnectUser implements HttpSessionBindingListener {

	
	@Override
	public void valueBound(HttpSessionBindingEvent e) {
		System.out.println("세션 연결됨" + e.getName());
		ConnectingUserList.getInstance().getUserList().add((String)e.getName());
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent e) {
		System.out.println("세션 연결끊김" + e.getName());
		ConnectingUserList.getInstance().getUserList().remove((String)e.getName());
	}
	

}