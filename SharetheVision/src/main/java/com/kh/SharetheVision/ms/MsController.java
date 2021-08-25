package com.kh.SharetheVision.ms;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.service.MsService;
import com.kh.SharetheVision.ms.model.vo.ChatVo;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;

@SessionAttributes("loginUser")
@Controller
public class MsController {

	@Autowired
	private MsService msService;

	@RequestMapping(value = "msStart", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		
		//회원정보(메세지수신인) 받아오기
		ArrayList<Member> tolist = msService.tolist();
		model.addAttribute("tolist",tolist);
		
		//유저정보(메시지발신인) 받아오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		String mId = loginUser.getmId();

		//참여멤버 리스트
		List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		
		//리스트에 유저 추가
		list.add(mId);
		
		//방번호 세팅
		//model.addAttribute("roomId", "2");
		
		//map에 wrapping
		ConnectChatUserList.getInstance().userMap.put("userlist", list);
		
		for (String str : ConnectChatUserList.getInstance().userMap.get("userlist")) {
			System.out.println("chat컨트롤러에서 세팅한 유저리스트 : " + str);
		}

		return "ms/msStart";
	}

	@RequestMapping(value = "rno_{roomId}")
	public void messageList(HttpSession session, @PathVariable int roomId, String userId, Model model,
			HttpServletResponse response) throws JsonIOException, IOException {

		List<Messenger> mList = msService.messageList(roomId);
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println("mList:" + mList.toString());

		// 안읽은 메세지 숫자 0으로 바뀌기 (읽음 처리)
		ChatVo message = new ChatVo();
		message.setUserId(userId);
		message.setRoomId(roomId);
		message.setCount(0);
//	        msService.updateCount(message);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mList, response.getWriter());

		model.addAttribute("mList", mList);
	}

	@ResponseBody
	@RequestMapping("createChat")
	public String createChat(Room r, String userId, String toId) {

		System.out.println("create chat IN");
		
		//같은사람과 대화를 한 방이 존재있는지 체크(select)
		r.setFid(userId);
		r.setTid(toId);
		Room exist = (Room) msService.existChatRoom(r);
		System.out.println("Room exist?:" + exist.toString());
		
		// DB에 방이 없을 때  (insert)
		if(exist == null){
			int result = msService.insertRoom(r);
			if(result>0) {
				return "new";
			}else {
				return "fail";
			}
			
		// DB에 이미 방이 있을 때	
		}else{
				return "exist";
		}
	}

	@RequestMapping("chatRoomList")
	public void RoomList(Room room, ChatVo message, String userId, HttpServletResponse response)throws JsonIOException, IOException {
		List<Room> msList = msService.chatRoomList(userId);
		for (int i = 0; i < msList.size(); i++) {
			message.setRoomId(msList.get(i).getRno());
			message.setUserId(msList.get(i).getTid());
			message.setCount(1);
		}

		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(msList, response.getWriter());
	}

	@ResponseBody
	@RequestMapping(value = "chatstatus", method = { RequestMethod.GET, RequestMethod.POST })
	public void chatStatus(Locale locale, Model model, HttpServletRequest req, int chatstat) {
		System.out.println("채팅 상태 ing : {" + chatstat + "}");
		req.getSession().setAttribute("chatstatus", chatstat);
		return;
	}

}