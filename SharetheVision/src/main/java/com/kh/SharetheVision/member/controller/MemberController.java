package com.kh.SharetheVision.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.SharetheVision.member.model.exception.MemberException;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	private JavaMailSender mailSender;
	
	
	@RequestMapping("login.me")
	public String login() {
		return "../home";
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
	public ModelAndView updatePwdForm(@RequestParam("id") String id, ModelAndView mv) {
		
		mv.addObject("id",id);
		mv.setViewName("changePwd");
		
		return mv;
	}
	
	@RequestMapping("updatePwd.me")
	public void updatePwd(@ModelAttribute Member m, HttpServletRequest request) {
		
		
		m.setPwd(bcrypt.encode(m.getPwd()));
		
		
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
	public String memberList(@RequestParam("condition") String condition, Model model) throws MemberException {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("condition", condition);
		
		ArrayList<Member> list = mService.selectMember(map);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("list", list);
		}
			
		return "memberList";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2, @RequestParam("address3") String address3, Model model) throws MemberException {
		
		String address = "("+address1+") " + address2 + " " + address3;
		String phone = m.getPhone();
		int index = phone.lastIndexOf("-");
		String email = m.getmCode() + "@sv.com";
		
		m.setPwd(bcrypt.encode(phone.substring(index + 1)));
		m.setEmail(email);
		m.setAddress(address);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			model.addAttribute("condition","refresh");
			return "redirect:memberList.me";
		} else {
			throw new MemberException("사원추가에 실패하였습니다.");
		}
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
