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
import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.member.model.vo.MemberPagination;
import com.kh.SharetheVision.notice.model.service.NoticeService;
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
	private BoardService bService;
	
	@Autowired
	private NoticeService nService;
	
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
			
		}
		
		
		return "createProjectForm";
	}
	
	@RequestMapping("createProject.pr")
	public String createProject(HttpServletRequest request, HttpSession session) throws ProjectException{
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String pName = request.getParameter("pName");
		String pIntro = request.getParameter("pIntro");
		String[] mCodeArr = request.getParameterValues("mCode");
		
		project.setpName(pName);
		project.setpIntro(pIntro);
		project.setmCodeArr(mCodeArr);
		project.setDeptNo(loginUser.getDeptNo());
		
		int result = pService.insertProject(project);
		int noResult = nService.noticeProject(project);
		
		if(result > 0 && noResult > 0) {
			return "redirect:createProjectForm.pr";
		} else {
			throw new ProjectException("프로젝트 추가에 실패하였습니다."); 
		}
		
	}
	
	@RequestMapping("changeProject.pr")
	public void completeProject(@RequestParam("pNo") int pNo, HttpServletResponse response,
								@RequestParam("condition") int condition,
								@RequestParam("projectName") String projectName, HttpSession session) throws ProjectException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", pNo);
		map.put("condition", condition);
		map.put("projectName", projectName);
		map.put("word", projectName);
		map.put("category", "project");
		map.put("mCode", loginUser.getmCode());
		map.put("deptNo", loginUser.getDeptNo());
		
		
		boolean check = false;
		
		// 게시물 있는지 확인
		int boardCount = bService.selectSearchListCount(map);
		int scrapCount = bService.getScrapListCount(loginUser.getmCode());
		// 스크랩 있을 경우 스크랩 상태 변경
		int sResult = 0;
		
		if(condition == 3 && scrapCount > 0) {
			sResult = bService.deleteProjectScrap(map);
			if(sResult > 0) {
				check = true;
			} else {
				check = false;
			}
		} else if(condition != 3 || (condition == 3 && scrapCount == 0)) {
			check = true;
		}
		
		// 게시물이 있을 경우 게시물 상태 변경
		int bResult = 0;
		
		if(boardCount > 0) {
			bResult = bService.changeBoard(map);
			if(bResult > 0) {
				check = true;
			} else {
				check = false;
			}
		} else {
			check = true;
		}		
		// 프로젝트 상태 변경
		int result = pService.changeProject(map);
		
		try {
			if(result > 0 && check) {
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
							  HttpServletResponse response, Model model, HttpSession session) {
		
		String mCode = ((Member)session.getAttribute("loginUser")).getmCode();
		
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
		map.put("mCode", mCode);
		
		ArrayList<Member> list = mService.pSearchMember(map);

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
