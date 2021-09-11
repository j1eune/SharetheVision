package com.kh.SharetheVision.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.notice.model.service.NoticeService;
import com.kh.SharetheVision.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	public NoticeController() {}
	
	@RequestMapping(value="notice.no", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String notice(@RequestParam("mCode") String mCode) {
		ArrayList<Notice> no = service.selectNotice(mCode);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			
		return gson.toJson(no);
		
	}

	@RequestMapping("selectNotice.no")
	@ResponseBody
	public String selectNotice(@RequestParam("category") String category, @RequestParam("content") String content, HttpServletRequest request) {
		
		String mCode = ((Member)request.getSession().getAttribute("loginUser")).getmCode();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("content", content);
		map.put("mCode", mCode);
		
		int result = service.readNotice(map);
		Notice notice = service.selectedBoardInfo(map);
		
		int bId = notice.getNoticeNumber();
		
		if (result > 0) {
			if (category.equals("자료실")) {
				return "boardDetail.bo?bId=" + bId;
			} else if (category.equals("프로젝트")) {
				return "createProjectForm.pr";
			} else {
//				결재
				return "";
			}
		} else {
			return "error";
		}
	}
	
}

