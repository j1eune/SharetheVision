package com.kh.SharetheVision.commute.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model, HttpSession session) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
//		String memberNo = loginUser.getmCode();
//		int state = loginUser.getmState();
		String memberNo = "MaCo2";
		int state = 2;
		
		ArrayList<Commute> colist = coService.commuteList(memberNo);
		System.out.println(colist);
		
		if(colist != null) {
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
			
			model.addAttribute("totalHour", hour);
			model.addAttribute("totalMin", min);
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
		
//		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
		String memberNo = "MaCo2";
		
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
		
//		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
		String memberNo = "MaCo2";

		Commute co = coService.commuteDay(memberNo);
		String start = co.getCommuteStart();
//		String start = "2021-08-19 08:41:47";

		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String end = sdf.format(date);
//		String end = "2021-08-19 17:03:25";
		
		java.util.Date startDate = null;
		java.util.Date endDate = null;
		try {
			startDate = sdf.parse(start);
			endDate = sdf.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
		long hour = diffSec/3600;
		long min = diffSec%3600/60;
		
		Double workTime = 0.0;
		String mins = null;
		if(min > 540) {
			workTime = 8.0;
		} else {
			mins = (min < 10) ? "0"+min : Long.toString(min);
			
			String time = (hour - 1 + "." + mins);
			workTime = Double.parseDouble(time);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("enterTime", start);
		map.put("outTime", end);
		map.put("workTime", workTime);
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
		
//		Member m = ((Member)session.getAttribute("loginUser"));
//		m.setmState(state);
		
//		int result = coService.changeState(m);
		
//		if(result > 0) {
//			return "redirect: commuteMain.co";
//		} else {
//			return "fail";
//		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="commuteChart.co", produces="application/json; charset=utf-8")
	public String commuteChart() {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		ArrayList<Commute> colist = coService.commuteList(memberNo);
		ArrayList<Overwork> owlist = coService.overworkList(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("colist", colist);
		map.put("owlist", owlist);
		
		return gson.toJson(map);
	}
	
}
