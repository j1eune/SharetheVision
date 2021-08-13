package com.kh.SharetheVision.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("login.me")
	public String login() {
//		return "../home";
		return "../timeandattendance/leaveView";
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
	
	@RequestMapping("updateProfileForm.me")
	public String updateProfileForm() {
		return "memberUpdateForm";
	}
	
	@RequestMapping("updateProfile.me")
	public String updateProfile() {
		return "../home";
	}
	
	@RequestMapping("memberList.me")
	public String memberList() {
		return "memberList";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember() {
		return "memberList";
	}
	
	@RequestMapping("createProject.me")
	public String createProject() {
		return "createProjectForm";
	}
		
}
