package com.kh.SharetheVision.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//@Autowired
	private JavaMailSender mailSender;
	
	
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
	public ModelAndView emailCheck(@RequestParam("id") String id, 
							 @RequestParam("email") String email,
							 @RequestParam("name") String name,
							 ModelAndView mv) {
		
		int random = (int)(Math.random() * 1000000) + 1;
		
		String subject = "[SV Company] 비밀번호 변경 인증번호 입니다.";
		String content = "<h2>" + id + " 님, 반갑습니다. <br> </h2>" + 
						 "<h4> 문의하신 메일 인증번호는 "+ random + " 입니다 </h4>";
		String from = "SVCompany0812@gmail.com";
		String to = email;
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			mailSender.send(mail);
			
			mv.addObject("random", random);
			mv.setViewName("emailCheck");
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return mv;
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
	
	@RequestMapping("createProjectForm.me")
	public String createProjectFrom() {
		return "createProjectForm";
	}
	
	@RequestMapping("createProject.me")
	public String cretaeProject() {
		return "createProjectForm";
	}
		
}
