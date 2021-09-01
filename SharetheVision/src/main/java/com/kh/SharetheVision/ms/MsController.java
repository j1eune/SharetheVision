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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.service.MsService;
import com.kh.SharetheVision.ms.model.vo.ChatVo;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;
import com.kh.SharetheVision.ms.ConnectChatUserList;

@SessionAttributes("loginUser")
@Controller
public class MsController {

	@Autowired
	private MsService msService;
	
	private Member loginUser;

	@RequestMapping(value = "msStart", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {

		String mId =""; //유저 아이디
		
		//유저정보(메시지발신인) 받아오기
		loginUser = (Member) session.getAttribute("loginUser");
		mId = loginUser.getmId();
		
		//회원정보(메세지수신인) 받아오기
		ArrayList<Member> tolist = msService.tolist();
		
		//참여멤버 리스트
		List<String> list = ConnectChatUserList.getInstance().userMap.get("userlist");
		list.add(mId); //리스트에 유저 추가
		
		//map에 wrapping
		ConnectChatUserList.getInstance().userMap.put("userlist", list);

		model.addAttribute("tolist",tolist);

		return "ms/msStart";
	}
	@ResponseBody
	@RequestMapping(value = "rno_{roomId}", produces="application/json; charset=UTF-8")
	public List<Messenger> messageList(@PathVariable int roomId, Model model, HttpServletResponse response) throws IOException {
		List<Messenger> mList = new ArrayList<Messenger>();
		mList = msService.messageList(roomId);
		response.setContentType("application/json; charset=utf-8");
		
		// 메세지 카운트 0으로 바뀌기 (읽음 처리)
		for(int i = 0; i < mList.size(); i++) {
			if(mList.get(i).getReadcount()==1) {
				msService.updateCount(roomId);
			}
		}
		return mList;
	}

	@ResponseBody
	@RequestMapping("createChat")
	public Room createChat(Room r, String userName, String toId) {
		r.setFid(userName);
		r.setTid(toId);
		//이전기록에서 같은사람과의 대화방이 존재했는지 체크(select)
		Room exist = (Room)msService.existChatRoom(r);
		ChatVo chatVo = new ChatVo();
		chatVo.setToId(toId);
		chatVo.setUserName(userName);
		
		// DB에 방이 없을 때  생성(insert)
		if(exist == null){
			int result = msService.insertRoom(r);
			if(result>0) {
				exist = msService.existChatRoom(r);
				exist.setTid(toId);
				exist.setFid(userName);
				return exist;
			}else {
				return null;
			}
		// DB에 이미 방이 있을 때	
		}else{
			  exist.setTid(toId);
			  exist.setFid(userName);
			  return exist;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomList" , produces="application/json; charset=UTF-8")
	public List<ChatVo> RoomList(Room r, String userName,HttpSession session,HttpServletResponse response)throws IOException {
		loginUser = (Member)session.getAttribute("loginUser");
		int deptNo = loginUser.getDeptNo();
		int readCount = 0;
		List<ChatVo> chatList = new ArrayList<ChatVo>();
		List<Room> msList = msService.chatRoomList(userName,deptNo);

		for (int i = 0; i < msList.size(); i++){
			ChatVo chatVo = new ChatVo();
			String toId = msList.get(i).getTid();
			String fromId = msList.get(i).getFid();
			chatVo.setRoomId(msList.get(i).getRno());
			
			//방 참여자 중 본인이름이 아닌 상대방 이름으로 채팅방 이름 표시
			if( toId.equals(userName)) {
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
		System.out.println("접속 유저 : {" + chatstat + "}");
		req.getSession().setAttribute("chatstatus", chatstat);
	}
	
	@ResponseBody
	@RequestMapping(value = "MSreadCount", produces="application/json; charset=UTF-8")
	public int MSreadCount(HttpSession session, Model model) {
		loginUser = (Member)session.getAttribute("loginUser");
		String userName = loginUser.getName();
		int readCount = msService.hasNotRead(userName);
		model.addAttribute("readCount",readCount);
		return readCount;
	}
	
	@RequestMapping(value = "deleteRoom")
	public String deleteRoom(@RequestParam("roomId") int rno, HttpServletRequest request) {

		int result = msService.deleteRoom(rno);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
}