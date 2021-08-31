package com.kh.SharetheVision.firstmain.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.SharetheVision.firstmain.model.exception.MainException;
import com.kh.SharetheVision.firstmain.model.service.CalendarService;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;
import com.kh.SharetheVision.member.model.vo.Member;



@SessionAttributes("loginUser")
@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@RequestMapping(value = "addCal", method = RequestMethod.POST)
	@ResponseBody
	public String addCal(@RequestBody Calendar c,HttpSession session, HttpServletResponse response) throws MainException{
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mCode = loginUser.getmCode();
		response.setContentType("application/json; charset=UTF-8");
		c.setmCode(mCode);  
		int result = cService.addCal(c);
		if(result>0) {
			return "success";
		}else {
			throw new MainException("일정 생성에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="listCal", produces="application/json; charset=UTF-8")
	@ResponseBody 
	public List<Calendar> listCal(@RequestParam("eventId") String mcode, 
									@RequestParam("edept") String deptNo, 
									@RequestParam("startDate") String sDate, 
									@RequestParam("endDate") String eDate, 
									Model model) {
		List<Calendar> cList = cService.listCal(mcode,deptNo,sDate,eDate);
		return cList;		
	}
	
	@RequestMapping(value="updateCal", method = RequestMethod.POST)
	@ResponseBody
	public String updateCal(@RequestBody Calendar c, Model model) throws MainException {
		
		int result = cService.updateCal(c);

		model.addAttribute("Calendar",c);
		
		if(result>0) {
			return "success";
		}else {
			throw new MainException("일정 변경에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="deleteCal")
	@ResponseBody
	public String deleteCal(@RequestParam("id") String no) throws MainException {
			
		int result = cService.deleteCal(no);
		
		if(result>0) {
			return "success";
		}else {
			throw new MainException("일정 삭제에 실패했습니다.");
		}
	}		
}
