package com.kh.SharetheVision.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.SharetheVision.approval.model.service.ApprovalService;
import com.kh.SharetheVision.approval.model.vo.Approval;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService apvService; 
	
	@RequestMapping("approval.ap")
	public String approval() {
		return "approval";
	}
	
	@RequestMapping("selectApproval.ap")
	public String selectApproval(HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String mCode = loginUser.getmCode();

		ArrayList<Approval> list = apvService.selectApproval(mCode);

		return "approval";
	}
	
}

