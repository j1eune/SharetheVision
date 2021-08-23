package com.kh.SharetheVision.ms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.exception.MsException;
import com.kh.SharetheVision.ms.model.service.MsService;
import com.kh.SharetheVision.ms.model.vo.Messenger;

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
		System.out.println("Welcome home! The client locale is {}.:::::"+ locale);
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
		return "msStart";
	}
	
	
	
	
	
//	@RequestMapping(value="msSend.ms" ,method = RequestMethod.POST)
//	@ResponseBody
//	public String msSend(@ModelAttribute Messenger ms,
//						 HttpSession session,
//						 Model model) throws MsException {
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		String fromId = loginUser.getmId();
//		
//		ms.setM_code(fromId);
//		/*
//		 * ms.setM_code2(toId); ms.setMs_content(content);
//		 */
//
//		int result = msService.sendInsert(ms);
//		
//		System.out.println("ms:"+ms.toString());
//		
//		if(result>0) {
//			model.addAttribute("ms", ms);
//			return "success";
//		}else {
//			throw new MsException("메세지 전송 실패");
//		}
//		
//	}
//	
//	@RequestMapping(value="msRead.ms")
//	@ResponseBody
//	public String msRead() {
//		
//		
//		
//		return null;
//	}




}

