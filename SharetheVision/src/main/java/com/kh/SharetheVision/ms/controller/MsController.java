package com.kh.SharetheVision.ms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.exception.MsException;
import com.kh.SharetheVision.ms.model.service.MsService;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;
import com.kh.SharetheVision.ms.model.vo.ChatVo;

@SessionAttributes("loginUser")
@Controller
public class MsController {

	@Autowired
	private MsService msService;
	

	@RequestMapping("msStart.ms")
	public String msStart(Model model) {
		ArrayList<Member> tolist = msService.tolist();
		model.addAttribute("tolist",tolist);
		 
		return "msStart";
	}
	
	@RequestMapping(value = "chatting.do", method = RequestMethod.GET)
	public String home(HttpSession session, Locale locale, Model model) {
		System.out.println("Welcome home! The client locale is {}."+ locale);
		//아이디받아오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mId = loginUser.getmId();
		 //mId = ((Member)req.getSession().getAttribute("loginUser")).getMId();
		
		//리스트get
		List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		//리스트에 유저 추가
		list.add(mId);
		
		model.addAttribute("roomId", "2");
		
		//map에 wrapping
		ConnectChatUserList.getInstance().userMap.put("userlist", list);
		
		for (String str : ConnectChatUserList.getInstance().userMap.get("userlist")) {
			System.out.println("chat컨트롤러에서 세팅한 유저리스트 : " + str);
		}
		return "member/view_chat";
	}
	
	
	//
	@ResponseBody
	@RequestMapping(value="{roomId}.do")
	    public void messageList(@PathVariable int roomId, String userId, Model model, HttpServletResponse response) throws JsonIOException, IOException {
	        
	        List<Messenger> mList = msService.messageList(roomId);
	        response.setContentType("application/json; charset=utf-8");
	 
	        System.out.println("mList:"+mList.toString());
	        
	        // 안읽은 메세지의 숫자 0으로 바뀌기
	        ChatVo message = new ChatVo();
	        message.setUserId(userId);
	        message.setRoomId(roomId);
	        message.setCount(0);
//	        msService.updateCount(message);
	        
	        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	        gson.toJson(mList,response.getWriter());
	    }

	
	@ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(Room r, String userId, String toId){
        System.out.println("create chat.do IN");
		Room exist  =  (Room)msService.chatRoomList(userId);
		System.out.println("exist:"+exist.toString());
		
		r.setFid(userId);
        r.setTid(toId);
 
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("채팅 목록이 없음");
            int result = msService.insertRoom(r);
           
            if(result == 1) {
                System.out.println("채팅 생성 성공");
                return "new";
            }else {
                return "fail";
            }
        }else{
            System.out.println("채팅 목록이 있음");
            return "exist";
        }
    }
	
	@RequestMapping("chatRoomList.do")
    public void createChat(Room room, ChatVo message, String userId, HttpServletResponse response) throws JsonIOException, IOException{
       System.out.println("chatRoomList.do IN");
		List<Room> msList = msService.chatRoomList(userId);
        System.out.println(" msList.size():"+ msList.size());
        for(int i = 0; i < msList.size(); i++) {
        	message.setRoomId(msList.get(i).getRno());
        	message.setUserId(msList.get(i).getTid());
	        message.setCount(1);
        }
        
        response.setContentType("application/json; charset=utf-8");
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(msList,response.getWriter());
    }
    
	
	@ResponseBody
	@RequestMapping(value = "chatstatus.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void chatStatus(Locale locale, Model model,HttpServletRequest req, int chatstat) {
		System.out.println("채팅 상태 ing {}."+ chatstat);	
		req.getSession().setAttribute("chatstatus", chatstat);
		
		return ;
	}
	
}