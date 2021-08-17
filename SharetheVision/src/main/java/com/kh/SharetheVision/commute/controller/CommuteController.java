package com.kh.SharetheVision.commute.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String memberNo = "7777";
		
		Commute co = coService.commuteMain(memberNo);
		
		System.out.println(co + " : 컨트롤러");
		
		if(co != null) {
			model.addAttribute("goToTime", co.getCommuteStart());			
		}
		
		return "commuteMainView";
	}
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView() {
		return "commuteDetailView";
	}
	
	@ResponseBody
	@RequestMapping("commuteEnter.co")
	public String commuteEnter(@RequestParam("enterTime") String enterTime, HttpSession session) {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("enterTime", enterTime);
		map.put("memberNo", "7777");
		
		int result = coService.commuteEnter(map);
		
		if(result > 0) {
			return "success";			
		} else {
			return "fail";
		}
		
	}
	
	
}
