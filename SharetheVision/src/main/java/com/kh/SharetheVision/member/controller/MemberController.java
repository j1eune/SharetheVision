package com.kh.SharetheVision.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("login.me")
	public String login() {
		return "../home";
	}
	
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "findPwd";
	}
	
	@RequestMapping("emailCheck.me")
	public String emailCheck() {
		return "emailCheck";
	}
	
	@RequestMapping("updatePwdForm.me")
	public String updatePwdForm() {
		return "changePwd";
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd() {
		// request로 return 수정
		return "../../../index";
	}
		
}
