package com.kh.SharetheVision.approval.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.SharetheVision.approval.model.service.ApprovalService;
import com.kh.SharetheVision.approval.model.vo.Approval;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService apvService;
	
	@RequestMapping(value="approval.ap", method= RequestMethod.GET)
	public String approval(HttpSession session , Model model) {
		
		
		String mId = "";
		
		
		//결재 selectbox 회원정보 뿌려주기
		ArrayList<Member> aplist = apvService.aplist();
		
		model.addAttribute("aplist",aplist);
		
		
		return "approval";
}
	
	public Attachment saveFile(MultipartFile file, HttpServletRequest request, int apNo) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
			String savePath = root + "\\archive";
		
				File folder = new File(savePath);
		
		if (!folder.exists()) {
			
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String originalFileName = file.getOriginalFilename();
				String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("파일이 없습니다.");
		}
		
		String strApNo = Integer.toString(apNo); 
				
		Attachment att = new Attachment();
		
		
			att.setAtLevel(4);
			att.setAtCategory(strApNo);
			att.setAtPath(renamePath);
			att.setAtOrigin(originalFileName);
			att.setAtChange(renameFileName);
		
		return att;
	}
	
}
