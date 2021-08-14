package com.kh.SharetheVision.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView() {
		return "commuteMainView";
	}
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView() {
		return "commuteDetailView";
	}
	
}
