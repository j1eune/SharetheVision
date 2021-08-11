package com.kh.SharetheVision.firstmain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.SharetheVision.firstmain.model.service.CalendarService;

@Controller
@RequestMapping("calendar.do")
public class CalendarController {
	
	@Autowired(required=false)
	private CalendarService cService;
	
	@GetMapping(params="method=list")
	public String list() {
		return "../home";
	}
	
	@GetMapping(params="method=data")
	public String data(Model model) {
		model.addAttribute("list", cService.cList());
		return "pageJsonReport";
	}
	
}
