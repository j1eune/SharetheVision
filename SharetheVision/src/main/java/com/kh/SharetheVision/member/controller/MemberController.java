package com.kh.SharetheVision.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.SharetheVision.attachments.model.service.AttachmentService;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.attachments.model.vo.AttachmentRename;
import com.kh.SharetheVision.member.model.exception.MemberException;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;

@SessionAttributes({"loginUser","userAttach"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private AttachmentService aService;
	
	@RequestMapping("home.me")
	public String home() {
		return "../home"; 
	}
	
	@RequestMapping("login.me")
	public String login(@ModelAttribute Member m, Model model) throws MemberException {

		Member member = mService.loginMember(m);
		Attachment attachment = aService.selectProfile(member.getmCode());
		
		boolean check = bcrypt.matches(m.getPwd(), member.getPwd());
		
		if(check) {
			model.addAttribute("loginUser",member);
			model.addAttribute("userAttach",attachment);
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		
		return "redirect:main";
	}
	
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "findPwd";
	}
	
	public void sendEmail(String email, int random) {
		
		String subject = "[SV Company] 비밀번호 변경 인증번호 입니다.";
		String content = "<h4> 문의하신 메일 인증번호는 "+ random + "입니다 </h4>";
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
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("emailCheck.me")
	public ModelAndView emailCheck(@ModelAttribute Member m, ModelAndView mv) throws MemberException {
		Member member = mService.checkEmail(m);
		if(member == null) {
			throw new MemberException("일치하는 사원 정보가 없습니다.");
		}
		
		int random = (int)(Math.random() * 1000000) + 1;
		sendEmail(member.getEmail(), random);
		
		mv.addObject("random", random);
		mv.addObject("mId", m.getmId());
		mv.setViewName("emailCheck");
		
		return mv;
	}
	
	@RequestMapping("updatePwdForm.me")
	public ModelAndView updatePwdForm(@RequestParam("mId") String mId, ModelAndView mv) {
		
		mv.addObject("mId",mId);
		mv.setViewName("changePwd");
		
		return mv;
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(@ModelAttribute Member m, HttpServletRequest request) throws MemberException {
		
		System.out.println("아이디 : " + m.getmId());
		System.out.println("비밀번호 : " + m.getPwd());
		
		m.setPwd(bcrypt.encode(m.getPwd()));
		int result = mService.updatePwd(m);
		
		if(result > 0) {
			return "redirect:home";
		} else {
			throw new MemberException("비밀번호 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("updateProfileForm.me")
	public String updateProfileForm(HttpSession session,Model model) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String mCode = loginUser.getmCode();
		Attachment attachment = aService.selectProfile(mCode);
		model.addAttribute("attachment", attachment);
		
		return "memberUpdateForm";
	}
	
	@RequestMapping("updateProfile.me")
	public String updateProfile(@RequestParam("profile") MultipartFile file, HttpServletRequest request, @RequestParam("address1") String address1,
								@RequestParam("address2") String address2, @RequestParam("address3") String address3, @ModelAttribute Member m,
								@RequestParam("newPwd") String newPwd, @RequestParam("pwd") String pwd, HttpSession session,
								@RequestParam("memberProfile") String memberProfile) throws MemberException {

		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String address = address1+"." + address2 + "." + address3;
		
		if(!newPwd.equals("")) {
			pwd = newPwd;
		}
		
		m.setmCode(loginUser.getmCode());
		m.setPwd(bcrypt.encode(pwd));
		m.setAddress(address);
		
		int mResult = mService.updateMember(m);
		
		int atResult = 0;
		
		if(file != null && !file.isEmpty()) {
			Attachment attachment = AttachmentRename.updateProfile(file, request, loginUser.getmCode());
			if(memberProfile.trim().equals("")) {
				atResult = aService.insertProfile(attachment);
			} else {
				atResult = aService.updateProfile(attachment);
			}
			
			if(atResult > 0 && mResult > 0) {
				return "../home";
			} else {
				throw new MemberException("회원정보 수정에 실패하였습니다.");
			}
		} else {
			if(mResult > 0) {
				return "../home";
			} else {
				throw new MemberException("회원정보 수정에 실패하였습니다.");
			}
		}
		
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
		
		String mCode = "";
		int adminNo = 0;
		
		switch(m.getDeptNo()) {
		case 1: mCode = "Hr"; break;
		case 2: mCode = "Ma"; break;
		case 3: mCode = "Pr"; break;
		case 4: mCode = "Sa"; break;
		case 5: mCode = "Ac"; break;
		}
		
		switch(m.getJobNo()) {
		case 1: mCode += "Em"; adminNo=1; break;
		case 2: mCode += "Su"; adminNo=2; break;
		case 3: mCode += "Ex"; adminNo=3; break;
		case 4: mCode += "Co"; adminNo=4; break;
		case 5: mCode += "Di"; adminNo=5; break;
		}
		
		String address = address1+"." + address2 + "." + address3;
		String phone = m.getPhone();
		int index = phone.lastIndexOf("-");
		
		m.setAdminNo(adminNo);
		m.setmCode(mCode);
		m.setPwd(bcrypt.encode(phone.substring(index + 1)));
		m.setAddress(address);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			model.addAttribute("condition","refresh");
			return "redirect:memberList.me";
		} else {
			throw new MemberException("사원추가에 실패하였습니다.");
		}
	}
	
	@RequestMapping("checkEmail.me")
	public void checkEmail(@RequestParam("email") String email, HttpServletResponse response) throws MemberException {
		
		int random = (int)(Math.random() * 1000000) + 1;
		
		sendEmail(email, random);
		
		try {
			response.getWriter().println(random);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.isComplete();
		
		return "redirect:home";
	}
	
	@RequestMapping("userPwdCheck.me")
	public void userPwdCheck(HttpServletResponse response, HttpSession session,@RequestParam("pwd") String pwd) {
		String userPwd = ((Member)session.getAttribute("loginUser")).getPwd();
		
		boolean check = bcrypt.matches(pwd, userPwd);
		
		try {
			if(check) {
				response.getWriter().println(1);
			} 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
