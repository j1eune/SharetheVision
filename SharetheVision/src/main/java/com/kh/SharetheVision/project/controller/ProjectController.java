package com.kh.SharetheVision.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.project.model.exception.ProjectException;
import com.kh.SharetheVision.project.model.service.ProjectService;
import com.kh.SharetheVision.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private Project project;
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("createProjectForm.pr")
	public String createProjectFrom(Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("condition", "refresh");
		
		ArrayList<Member> list = mService.selectMember(map);
		model.addAttribute("list",list);
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String mCode = loginUser.getmCode();
		
		ArrayList<Project> pList = pService.selectProject(mCode);
		model.addAttribute("pList", pList);
		
		return "createProjectForm";
	}
	
	@RequestMapping("createProject.pr")
	public String createProject(HttpServletRequest request) throws ProjectException{
		
		String pName = request.getParameter("pName");
		String pIntro = request.getParameter("pIntro");
		String[] mCodeArr = request.getParameterValues("mCode");
		
		project.setpName(pName);
		project.setpIntro(pIntro);
		project.setmCodeArr(mCodeArr);
		
		int result = pService.insertProject(project);
		
		if(result > 0) {
			return "redirect:createProjectForm.pr";
		} else {
			throw new ProjectException("프로젝트 추가에 실패하였습니다."); 
		}
		
	}
	
}
