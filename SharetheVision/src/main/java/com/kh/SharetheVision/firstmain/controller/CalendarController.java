//package com.kh.SharetheVision.firstmain.controller;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kh.SharetheVision.firstmain.model.service.CalendarService;
//
//@Controller
//public class CalendarController {
//	
//	@Autowired
//	private CalendarService cService;
//	
//	@RequestMapping(value="addCal.do",produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public String addCal(@ModelAttribute EventData ed, HttpServletResponse response){
//
//		//Member loginUser = (Member)session.getAttribute("loginUser");
//		//String id = loginUser.mcode();
//		//ed.setName(id);
//
//		int reslut = cService.addCal(ed);
//
//		if(result>0){
//			return "success";
//		}else{
//			console.log("일정 등록 실패");
//		}
//	}
//	
//}
