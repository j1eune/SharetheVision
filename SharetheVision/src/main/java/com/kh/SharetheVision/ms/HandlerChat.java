package com.kh.SharetheVision.ms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.SharetheVision.ms.controller.ConnectChatUserList;
import com.kh.sharethevision.messenger.model.vo.ChatVo;

@Component
public class HandlerChat extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(HandlerChat.class);
	private Map<String,WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();

	
	// 클라이언트 서버 연결 메소드 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		logger.info("{} 세션 연결됨",session.getId());
		
		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		Map<String, Object> map = session.getAttributes();
		
		String userId = (String)map.get("userId");
		sessionList.put(userId, session);

		// 모든 세션에 채팅 전달
		for (String user : sessionList.keySet()) {
			sessionList.get(user).sendMessage(new TextMessage("<p>" + userId + "님  In Messenger. </p>"));
		}
	}
	

	// 서버로 전송된 메세지 처리 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		logger.info("{}로부터 {} 받음",session.getId(), message.getPayload());
		
		String chat = message.getPayload();
		Gson gson = new Gson();
		ChatVo chatVo = gson.fromJson(chat, ChatVo.class);
		
		// 모든 세션에 채팅 전달
		if(chatVo.isFirst) {
		}else {
			for (String user: sessionList.keySet()) {
				if(sessionList.get(user).equals(session)) {
					sessionList.get(user).sendMessage(new TextMessage("<p class='mychat'>"+ chatVo.userId + " : " + chatVo.message+ "</p>"));
				}else {
					sessionList.get(user).sendMessage(new TextMessage("<p class='otherchat'>"+ chatVo.userId + " : " + chatVo.message+ "</p>"));
				}
			}
		}
	}

	// 클라이언트 연결 종료 메소드
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
				 sessionList.get(user).sendMessage(new TextMessage("<p >"+userId + "님  Exit." +"</p>")); 
			}
		 } 
		  logger.info("{} 연결 종료", session.getId());
		
	}	
}