package com.kh.SharetheVision.firstmain.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.SharetheVision.firstmain.model.exception.MainException;
import com.kh.SharetheVision.firstmain.model.service.CalendarService;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;
import com.kh.SharetheVision.firstmain.model.vo.Todo;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.project.model.service.ProjectService;
import com.kh.SharetheVision.project.model.vo.Project;

@SessionAttributes("loginUser")
@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	@Autowired
	private ProjectService pService;
	
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
		HashMap<String, String> mapData = new HashMap<String, String>();
		List<Calendar> cList = new ArrayList<Calendar>(); 
		mapData.put("mcode", mcode);
		mapData.put("deptNo", deptNo);
		mapData.put("sDate", sDate); //달력시작(첫빈칸 이전달 말일 계산) 
		mapData.put("eDate", eDate); //달력끝(끝빈칸 다음달 시작일 계산)
		
		cList = cService.listCal(mapData);
		return cList;		
	}
	
	@RequestMapping(value="updateCal", method = RequestMethod.POST)
	@ResponseBody
	public String updateCal(@RequestBody Calendar c, Model model,  HttpSession session) throws MainException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mCode = loginUser.getmCode();
		c.setmCode(mCode);
		int result = cService.updateCal(c);

		model.addAttribute("Calendar",c);
		
		if(result>0) {
			return "success";
		}else {
			return "일정 변경 실패. 일정 등록자 본인인데도 문제가 있다면 행정팀에 문의해 주세요.";
		}
	}
	
	@RequestMapping("deleteCal")
	@ResponseBody
	public String deleteCal(@ModelAttribute Calendar c, @RequestParam("id") Integer no, HttpSession session) throws MainException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mCode = loginUser.getmCode();
		c.setmCode(mCode);
		c.setNo(no);
		int result = cService.deleteCal(c);
		
		if(result>0) {
			return "success";
		}else {
			return "일정 삭제 실패. 일정 등록자 본인인데도 문제가 있다면 행정팀에 문의해 주세요.";
		}
	}		
	
	@ResponseBody
	@RequestMapping("listTo")
	public ArrayList<Todo> listTo(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mcode = loginUser.getmCode();
		ArrayList<Todo> todoList = cService.selectList(mcode);
		if(todoList!=null) {
			return todoList;
		}else {
			throw new MainException("To do list 조회 실패");
		}
	}
		
	@ResponseBody
	@RequestMapping("addTodo")
	public String addTodo(Todo todo, @RequestParam("chName") String chName, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mCode = loginUser.getmCode();
		todo.setChName(chName);
		todo.setmCode(mCode);
		int result = cService.insertTodo(todo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateTo")
	public String updateTo(@RequestParam("dchNo") int dchNo) {
		int result = cService.updateTodo(dchNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteTo")
	public String deleteTo(@RequestParam("dchNo") int dchNo) {
		int result = cService.deleteTodo(dchNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("listProject")
	public ArrayList<Project> listProject(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mCode = loginUser.getmCode();
		ArrayList<Project> pList = pService.selectProject(mCode);
		if(!pList.isEmpty()) {
			return pList;
		}else {
			return pList;
		}
	}
		
}
