package com.kh.SharetheVision.ms;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

import com.kh.SharetheVision.member.model.vo.Member;

public class HandshakeInterceptor implements org.springframework.web.socket.server.HandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, 
									WebSocketHandler wsHandler,	Map<String, Object> attributes) throws Exception {
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        
        Member member = (Member)req.getSession().getAttribute("loginUser");
        String userId = member.getmId();
        attributes.put("userId", userId);
        
       return true;

	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
/*	System.out.println("After Handshake");
        
        
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        
        MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
        String nick = dto.getNickname();
        ConnectChatUserMap.getInstance().usersMap.remove(nick, nick);*/
	}

}