package com.kh.SharetheVision.commute.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = "7777";
		
		ArrayList<Commute> colist = coService.commuteList(memberNo);
		
		ArrayList<Overwork> owlist = coService.overworkList(memberNo);
		
		if(colist != null) {
			for(Commute co : colist) {
				
				Date date = new Date(System.currentTimeMillis());
				
				// DB데이터가 오늘이면
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
		}
		
		return "commuteMainView";
	}
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView() {
		return "commuteDetailView";
	}
	
	@ResponseBody
	@RequestMapping("commuteEnter.co")
	public String commuteEnter(HttpSession session) {
		
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
			return "success";			
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
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
			return "success";			
		} else {
			return "fail";
		}
	}
	
	
}
