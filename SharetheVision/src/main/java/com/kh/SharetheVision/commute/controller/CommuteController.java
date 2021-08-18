package com.kh.SharetheVision.commute.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String memberNo = "7777";
		int state = 3;
		
		ArrayList<Commute> colist = coService.commuteList(memberNo);
		ArrayList<Overwork> owlist = coService.overworkList(memberNo);
		
		if(colist != null) {
			model.addAttribute("colist", colist);
			
			double total = 0;
			for(Commute co : colist) {
				total += co.getWorktime();
				
				// DB데이터가 오늘이면
				Date date = new Date(System.currentTimeMillis());
				if(co.getEnrollDate().toString().equals(date.toString())) {
					
					if(co.getCommuteStart() != null) {
						String[] startArr = co.getCommuteStart().split(" ");
						model.addAttribute("goToTime", startArr[1]);						
					}
					
					if(co.getCommuteEnd() != null) {
						String[] endArr = co.getCommuteEnd().split(" ");
						model.addAttribute("getOffTime", endArr[1]);						
					}
				}
			}
			String totalStr = Double.toString(total);
			int point = totalStr.indexOf(".");
			String hour = totalStr.substring(0, point);
			String min = totalStr.substring(point+1);
			
			model.addAttribute("total", hour + "h " + min + "m");
		}
		
		if(owlist != null) {
			model.addAttribute("owlist", owlist);
		}
		
		// 상태 변경
		model.addAttribute("state", state);
		
		return "commuteMainView";
	}
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView() {
		return "commuteDetailView";
	}
	
	@RequestMapping("commuteEnter.co")
	public String commuteEnter(HttpSession session, Model model) {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String memberNo = "7777";
				
		HashMap<String, String> map = new HashMap<String, String>();
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String enterTime = sdf.format(date);
		
		map.put("enterTime", enterTime);
		map.put("memberNo", memberNo);
		
		int result = coService.commuteEnter(map);
		
		if(result > 0) {
			return "redirect: commuteMain.co";			
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("commuteOut.co")
	public String commuteOut(HttpSession session) {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = "7777";

		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String outTime = sdf.format(date);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("outTime", outTime);
		map.put("memberNo", memberNo);
		
		int result = coService.commuteOut(map);
		
		if(result > 0) {
			return "redirect: commuteMain.co";				
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("changeState.co")
	public String changeState(@RequestParam("state") int state, HttpSession session) {
		
		System.out.println(state + " : 상태 값");
		
//		Member m = ((Member)session.getAttribute("loginUser"));
		
		Member m = new Member();
		m.setmCode("7777");
		m.setmState(state);
		
		int result = coService.changeState(m);
		
		System.out.println(result + " : 업데이트 결과");
		
		if(result > 0) {
			return "redirect: commuteMain.co";
		} else {
			return "fail";
		}
	}
	
}
