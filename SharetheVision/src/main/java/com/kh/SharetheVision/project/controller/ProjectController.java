package com.kh.SharetheVision.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.SharetheVision.attachments.model.service.AttachmentService;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.member.model.vo.MemberPagination;
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
	
	@RequestMapping(value="projectMember.pr", produces="application/json; charset=UTF-8")
	@ResponseBody
	public HashMap<String,Object> projectMember(@RequestParam(value="search", required=false) String search,
							  @RequestParam(value="page", required=false) Integer page,
							  HttpServletResponse response, Model model) {
		
		System.out.println("search : " + search);
		System.out.println("search가 null 인가 : " + search == null);
		System.out.println("search가 빈칸인가? : " + search.trim().equals(""));
		System.out.println("page : " + page);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		if(!search.trim().equals("")) {
			map.put("search", search);
		} else {
			search = null;
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.searchListCount(search);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		map.put("page", pi);
		
		ArrayList<Member> list = mService.searchMember(map);

		HashMap<String,Object> jMap = new HashMap<String, Object>();
		JSONArray jArr = new JSONArray();
		for(Member m : list) {
			JSONObject job = new JSONObject();
			job.put("mCode", m.getmCode());
			job.put("name", m.getName());
			job.put("deptName", m.getDeptName());
			job.put("jobName", m.getJobName());
			job.put("phone", m.getPhone());
			
			jArr.add(job);
		}
		jMap.put("jArr", jArr);
		jMap.put("pi", pi);
		
		
		return jMap;
	}
	
	@RequestMapping("meeting.pr")
	public void meeting(HttpServletResponse response) {
		try {
			String jwt = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6Il9mUEt0VTRqU2lLVGtSaFV2cm01bHciLCJleHAiOjE2MzE4MDQ0MDAsImlhdCI6MTYyOTgwODQwMH0.ywbS3RNvx95bWehc2fWher9dOFUoyJmf_mJc979bvJw"; //
			String restUrl = "https://api.zoom.us/v2/users/me/meetings"; // zoom 회의 생성 
			HashMap<String, Object> requestMap = new HashMap<String, Object>();
			requestMap.put("type", 1);
			
			URL url = new URL(restUrl);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setConnectTimeout(5000); // 서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Authorization", "Bearer " + jwt);

			con.setDoOutput(true); // POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
			ObjectMapper mapper = new ObjectMapper();
			OutputStream os = con.getOutputStream();
			os.write(mapper.writeValueAsString(requestMap).getBytes());
			os.close();
			
			
	    	try (BufferedReader input = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
	    		String line;
	    		StringBuffer buffer = new StringBuffer();
	    		while ((line = input.readLine()) != null) {
	    			buffer.append(line);
	    			
	    			response.getWriter().println(buffer.toString());
	    		}
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("meetingForm.pr")
	public String meetingForm() {
		return "meetingForm";
	}
}
