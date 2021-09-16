package com.kh.SharetheVision.member.controller;

import java.io.File;
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
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.member.model.exception.MemberException;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.member.model.vo.MemberPagination;

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
		return "redirect: main";
	}
	
	@RequestMapping("login.me")
	public void login(@RequestParam("mId") String mId, @RequestParam("pwd") String pwd, 
					  Model model, HttpServletResponse response) throws MemberException {

		Member member = mService.loginMember(mId);
		Attachment attachment = null;
		boolean check = false;
		if(member!= null) {
			attachment = aService.selectProfile(member.getmCode());
			check = bcrypt.matches(pwd, member.getPwd());
		}
		
		
		try {
			if(check) {
				model.addAttribute("loginUser",member);
				model.addAttribute("userAttach",attachment);
				response.getWriter().println(true);
			} else {
				response.getWriter().println(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "findPwd";
	}
	
	public void sendEmail(String email, int random) {
		
		String subject = "[SV Company] 이메일 인증번호 입니다.";
		String content = "<div style='text-align:center;'>"
						+"<h1>인증번호를 알려드립니다.</h1><br><hr style='width: 50%;'><br>"
						+"<h3>안녕하세요. SV Company 입니다.</h3><br>"
						+"요청하신 인증번호를 다음과 같이 알려 드립니다.<br>"
						+"<font color='blue;'>인증번호를 진행 중인 화면에 입력해 주세요.</font><br>"
						+"인증번호는 메일이 발송된 시점부터 <b>3분간 유효</b>합니다."
						+"<br><br><hr style='width: 50%;'><br>"
						+"<div style='text-align:center;'><b>인증번호 : <font color='skyblue'>" + random + "</font></b></div>"
						+"<br><hr style='width: 50%;'><br><br>"
						+"Share the Vision을 이용해 주셔서 감사합니다.</div>";
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
	
	public void deleteFile(HttpServletRequest request, String memberProfile) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buplodatFiles";
		
		File f= new File(savePath + "\\" + memberProfile);
		if(f.exists()) {
			f.delete();
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
								@RequestParam("memberProfile") String memberProfile, Model model) throws MemberException {

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
		
		Member updateMember = mService.loginMember(loginUser.getmId());
		Attachment memberAttach = null;
		
		if(file != null && !file.isEmpty()) {
			Attachment attachment = AttachmentRename.updateProfile(file, request, loginUser.getmCode());
			if(memberProfile.trim().equals("")) {
				atResult = aService.insertProfile(attachment);
			} else {
				deleteFile(request, memberProfile);
				atResult = aService.updateProfile(attachment);
			}
			
			if(atResult > 0 && mResult > 0) {
				memberAttach = aService.selectProfile(loginUser.getmCode());
				
				model.addAttribute("loginUser",updateMember);
				model.addAttribute("userAttach",memberAttach);
				
				return "redirect:main";
			} else {
				throw new MemberException("회원정보 수정에 실패하였습니다.");
			}
		} else {
			if(mResult > 0) {
				memberAttach = aService.selectProfile(loginUser.getmCode());
				
				model.addAttribute("loginUser",updateMember);
				model.addAttribute("userAttach",memberAttach);
				
				return "redirect:main";
			} else {
				throw new MemberException("회원정보 수정에 실패하였습니다.");
			}
		}
		
	}
	
	@RequestMapping("memberList.me")
	public String memberList(@RequestParam("condition") String condition, 
							 @RequestParam(value="page", required=false) Integer page, Model model) throws MemberException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		
		int listCount = mService.getListCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		map.put("page", pi);
		
		ArrayList<Member> list = mService.selectMember(map);
		
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
			model.addAttribute("condition", condition);
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
		session.setComplete();
		
		return "redirect:home";
	}
	
	@RequestMapping("userPwdCheck.me")
	public void userPwdCheck(HttpServletResponse response, HttpSession session,@RequestParam("pwd") String pwd) {
		String userPwd = ((Member)session.getAttribute("loginUser")).getPwd();
		
		boolean check = bcrypt.matches(pwd, userPwd);
		
		try {
			if(check) {
				response.getWriter().println(true);
			} else {
				response.getWriter().println(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("searchMember.me")
	public String searchMember(Model model, @RequestParam("search") String search, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.searchListCount(search);
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("page", pi);
		
		ArrayList<Member> list = mService.searchMember(map);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
			model.addAttribute("search",search);
		} else {
			model.addAttribute("list", list);
		}
			
		return "memberList";
	}
	
	@RequestMapping("checkId.me")
	public void checkId(@RequestParam("mId") String mId, HttpServletResponse response) {
		Member loginUser = mService.loginMember(mId);
		try {
			if(loginUser == null) {
				response.getWriter().println(true);
			} else {
				response.getWriter().println(false);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
