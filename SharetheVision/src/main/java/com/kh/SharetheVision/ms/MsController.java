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

	@ResponseBody
	@RequestMapping(value = "rno_{roomId}", produces="application/json; charset=UTF-8")
	public List<Messenger> messageList(@PathVariable int roomId, String userName, Model model,HttpServletResponse response) throws IOException {

		List<Messenger> mList = new ArrayList<Messenger>();
		mList = msService.messageList(roomId);
		response.setContentType("application/json; charset=utf-8");
		
		// 메세지 카운트 0으로 바뀌기 (읽음 처리)
		ChatVo chatVo = new ChatVo();
		chatVo.setUserName(userName);
		chatVo.setRoomId(roomId);
		chatVo.setCount(0);
		
		for(int i = 0; i < mList.size(); i++) {
			if(mList.get(i).getReadcount()==1) {
				msService.updateCount(roomId);
			}
		}
		return mList;
	}

	@ResponseBody
	@RequestMapping("createChat")
	public Room createChat(Room r, String userId, String toId) {

		//같은사람과 대화를 한 방이 존재있는지 체크(select)
		r.setFid(userId);
		r.setTid(toId);
		Room exist = (Room)msService.existChatRoom(r);
		
		// DB에 방이 없을 때  (insert)
		if(exist == null){
			int result = msService.insertRoom(r);
			if(result>0) {
				exist = msService.existChatRoom(r);
				System.out.println("create rNo:"+ r.getRno());
				return exist;
			}else {
				return null;
			}
		// DB에 이미 방이 있을 때	
		}else{
			  System.out.println("Room exist, rno:"+ exist.getRno());
			  return exist;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomList" , produces="application/json; charset=UTF-8")
	public List<ChatVo> RoomList(Room r, String userName, HttpServletResponse response)throws IOException {
		List<ChatVo> chatList = new ArrayList<ChatVo>();
		List<Room> msList = msService.chatRoomList(userName);
		int readCount = 0;
		for (int i = 0; i < msList.size(); i++) {
				ChatVo chatVo = new ChatVo();
				String toId = msList.get(i).getTid();
				String fromId = msList.get(i).getFid();
				chatVo.setRoomId(msList.get(i).getRno());
				//방 참여자 중 본인이 아닌 사람 이름으로 채팅방 이름 표시
				if( toId == userName) {
					chatVo.setUserName(toId);
					chatVo.setToId(fromId);
				}else {
					chatVo.setUserName(fromId);
					chatVo.setToId(toId);
				}
			//방마다 안읽은 메세지 수 카운트
			if(chatVo!=null) {
				readCount = msService.readCount(chatVo);
				chatVo.setCount(readCount);
			}
			chatList.add(chatVo);
		}
		return chatList;
	}

	@ResponseBody
	@RequestMapping(value = "chatstatus", method = { RequestMethod.GET, RequestMethod.POST })
	public void chatStatus(Locale locale, Model model, HttpServletRequest req, int chatstat) {
		System.out.println("채팅 상태 ing : {" + chatstat + "}");
		req.getSession().setAttribute("chatstatus", chatstat);
		return;
	}

}