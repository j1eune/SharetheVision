package com.kh.SharetheVision.ms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.SharetheVision.ms.model.service.MsService;
import com.kh.SharetheVision.ms.model.vo.ChatVo;

@Component
public class HandlerChat extends TextWebSocketHandler{

	@Autowired
	private MsService msService;
	
	private Map<String,WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	
	// 웹소켓 서버 접속시 메소드 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("Connection handler INNNN");
		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		Map<String, Object> map = session.getAttributes();
		
		String userId = (String)map.get("userId");
		sessionList.put(userId, session);

		// 모든 세션에 채팅 전달
		for (String user : sessionList.keySet()) {
			sessionList.get(user).sendMessage(new TextMessage("<p> [ID]" + userId + "님이  LogIn 하셨습니다. </p>"));
		}
	}
	

	// 서버로 전송된 메세지 처리 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String chat = message.getPayload();
		Gson gson = new Gson();
		ChatVo chatVo = gson.fromJson(chat, ChatVo.class);
		
		// 모든 세션에 채팅 전달
		if(chatVo.isFirst) {
		}else {
			for (String user: sessionList.keySet()) {
				if(sessionList.get(user).equals(session)) {
					sessionList.get(user).sendMessage(new TextMessage(
							"<div class='media'>" + "<p class='mychatp'>" +
							 chatVo.message +"</p>" +"</div>"));
				}else {
					sessionList.get(user).sendMessage(new TextMessage(
							"<div class='media'>" + "<a class='pull-left'>" +
							"<img class='media-object img-circle img-chat' src='resources/assets/images/dp.png'>" +
							"<h4 class='media-heading'>"+ chatVo.userName +"</h4>" +
							"</a>" + "<p class='otherchatp'>" + chatVo.message + "</p>" +"</div>"));
				}
				if(sessionList.size()==1) {
					 chatVo.setCount(1);
				} else {
					 chatVo.setCount(0);
				}
			}
		}
		System.out.println("sessionListSize:"+sessionList.size());
		System.out.println("chatVo.count:"+chatVo.getCount());
		int result = msService.insertMessage(chatVo);
		if(result>0) {
			System.out.println("message DB저장 성공");
		}else {
			System.out.println("message 저장 실패");
		}
	}

	// 서버 연결 종료 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		 // 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거 
		 Map<String,Object> map = session.getAttributes(); 
		 String userId = (String)map.get("userId");
		 sessionList.remove(userId);
		 
		 //리스트 제거시 유저 제외, map wrapping 
		 List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		 list.remove(userId);
		 ConnectChatUserList.getInstance().userMap.put("userlist", list);
		 
		 if(sessionList.size()>0) { 
			 for (String user: sessionList.keySet()) {
				 sessionList.get(user).sendMessage(new TextMessage("<p> [ID]"+userId + "님이 LogOut 하셨습니다." +"</p>")); 
			}
		 } 
		 System.out.println("Close handler outttt");
		
	}
}