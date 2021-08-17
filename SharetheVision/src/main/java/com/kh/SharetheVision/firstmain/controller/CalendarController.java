package com.kh.SharetheVision.firstmain.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		//c.setName(id);  (@ModelAttribute Calendar c,HttpSession session ) {
		//Member loginUser = (Member)session.getAttribute("loginUser");
		//String id = loginUser.getMcode();
		//response.setContentType("application/json; charset=UTF-8");

		int result = cService.addCal(c);
		
		if(result>0) {
			return "success";
		}else {
			System.out.println("dao 등록 실패");
			return "error";
		}
	}
	
	@RequestMapping(value="listCal.do", produces="application/json; charset=UTF-8")
	@ResponseBody 
	public List<Calendar> listCal(@RequestParam("eventId") String mcode, 
						@RequestParam("startDate") String sDate, 
						@RequestParam("endDate") String eDate, 
						Model model) {
		
		List<Calendar> cList = cService.listCal(mcode,sDate,eDate);
		//로그인 유저 세션에서 가져오기
			
		return cList;		
	}
	
	@RequestMapping(value="updateCal.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateCal(@RequestBody Calendar c, Model model) {
		
		int result = cService.updateCal(c);

		model.addAttribute("Calendar",c);
		
		if(result>0) {
			return "success";
		}else {
			System.out.println("dao 수정 실패");
			return "error";
		}
	}
	
	
	@RequestMapping(value="deleteCal.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteCal(@RequestParam("id") String no) {
			
		int result = cService.deleteCal(no);
		
		if(result>0) {
			return "success";
		}else {
			return "error";
		}
	}
	

	
	
	
	
	
	
	
	
}
