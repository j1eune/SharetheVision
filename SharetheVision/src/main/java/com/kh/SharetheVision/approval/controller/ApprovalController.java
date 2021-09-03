package com.kh.SharetheVision.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	
	@RequestMapping("approval.ap")
	public String approval() {
		
		
		return "approval";
}
	
	
}

