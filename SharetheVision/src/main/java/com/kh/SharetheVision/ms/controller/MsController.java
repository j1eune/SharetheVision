package com.kh.SharetheVision.ms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MsController {

	@RequestMapping("msStart.ms")
	public String msStart() {
		
//		System.out.println("msController IN");
		
		return "msStart";
	}




}

