package com.kh.SharetheVision.firstmain.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.SharetheVision.firstmain.model.service.CalendarService;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@RequestMapping(value = "addCal.do", method = RequestMethod.POST)
	@ResponseBody
	public String addCal(@RequestBody Calendar c, HttpServletResponse response){
		System.out.println("controller IN");
		//c.setName(id);  (@ModelAttribute Calendar c,HttpSession session ) {
		//Member loginUser = (Member)session.getAttribute("loginUser");
		//String id = loginUser.getMcode();
//		response.setContentType("application/json; charset=UTF-8");
//		System.out.println("c :"+ c.toString());

		int result = cService.addCal(c);
		
		if(result>0) {
			return "success";
		}else {
			System.out.println("등록 실패");
			return "error";
		}
		
		
	}
	
	
	
}
