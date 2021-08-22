package com.kh.SharetheVision.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.SharetheVision.attachments.model.service.AttachmentService;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
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
	
	@Autowired
	private AttachmentService aService;
	
	@RequestMapping("createProjectForm.pr")
	public String createProjectFrom(Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("condition", "refresh");
		
		ArrayList<Member> list = mService.selectMember(map);
		model.addAttribute("list",list);
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String mCode = loginUser.getmCode();
		
		// 지금 로그인한 member가 속한 project를 가져온다
		ArrayList<Project> pList = pService.selectProject(mCode);
		model.addAttribute("pList", pList);
		
		// 속한 프로젝트가 있을 경우
		if(!pList.isEmpty()) {
			
			ArrayList<Project> pmList = pService.selectProjectMember(pList);
			model.addAttribute("pmList",pmList);
			String[] memberCode = new String[pmList.size()];
			for(int i = 0; i < memberCode.length; i++) {
				memberCode[i] = pmList.get(i).getmCode();
			}
			
			ArrayList<Attachment> aList = aService.selectProjectMember(memberCode);
			model.addAttribute("aList",aList);
		}
		
		
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
	
	@RequestMapping("changeProject.pr")
	public void completeProject(@RequestParam("pNo") int pNo, HttpServletResponse response,
								@RequestParam("condition") int condition) throws ProjectException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", pNo);
		map.put("condition", condition);
		
		int result = pService.changeProject(map);
		
		
		try {
			if(result > 0) {
					response.getWriter().println(1);
			} else {
					response.getWriter().println(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
