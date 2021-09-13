package com.kh.SharetheVision.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.approval.model.service.ApprovalService;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService apvService;

	@RequestMapping(value = "approval.ap", method = RequestMethod.GET)
	public String approval(HttpSession session, Model model) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		String mCode = m.getmCode();
		String name = m.getName();
		
		// 결재 selectbox 회원정보 뿌려주기
		List<Member> aplist = apvService.aplist();
		model.addAttribute("aplist", aplist);
		
		ApprovalVO ap = new ApprovalVO();
		ap.setmCode(mCode);
		ap.setApvAgr(name);
		ap.setApvRef(name);
		ap.setApvApp(name);
		
		// 기안자, 합의자, 참조자, 결재자에 로그인한 유저가 있으면 다 가져오기
		List<ApprovalVO> listAll = apvService.selectApproval(ap);
		System.out.println(listAll);
		
		ArrayList<ApprovalVO> list = new ArrayList<ApprovalVO>();
		for(ApprovalVO apv : listAll) {
			if(apv.getApvAgr() != null && apv.getApvAgr().equals(name)) {
				// 로그인 유저가 합의자면 결재 상태에 상관없음
				list.add(apv);
			} else if(apv.getApvAgr() != null && apv.getApvApp().equals(name) && !apv.getApvStatus().equals("A")) {
				// 합의자가 있는 상황에서 로그인 유저가 결재자고, 결재상태가 A(미결재)가 아닐 때
				list.add(apv);
			} else if(apv.getApvAgr() == null && apv.getApvApp().equals(name)) {
				// 합의자가 없는 상황에서 로그인 유저가 결재자 일 때
				list.add(apv);
			} else if(apv.getApvRef() != null && (apv.getApvRef().equals(name) && (apv.getApvStatus().equals("C") || apv.getApvStatus().equals("D")))){
				// 로그인 유저가 참조자고, 결재가 끝났을 때
				list.add(apv);
			} else if(apv.getmCode().equals(mCode)) {
				// 로그인 유저가 기안자면 결재 상태에 상관없음
				list.add(apv);
			}
		}
		
		model.addAttribute("list", list);
		

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

	// 타입에 따라 approval 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "selectApproval.ap", produces = "application/json; charset=utf-8")
	public String selectApproval(HttpSession session, @RequestParam(value = "type", required = false) String type) {
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		String mCode = loginUser.getmCode();

		ApprovalVO ap = new ApprovalVO();
		ap.setmCode(mCode);
		ap.setApvType(type);

		List<ApprovalVO> list = apvService.selectApproval(ap);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		return gson.toJson(list);
	}
	
	
	// 결재 작성 AJAX에서 값 받은 후 DB로 데이터 집어넣기
	
	@ResponseBody
	@RequestMapping("approval.ap")
	public Map<String, String> approval(ApprovalVO vo, HttpServletRequest request, HttpSession session) {
		System.out.println("vo = " + vo);
		Member loginUser = (Member) session.getAttribute("loginUser");
		vo.setmCode(loginUser.getmCode());
		int apvNo = apvService.insertApproval(vo);
		System.out.println("APV_NO = " + vo.getApvNo());
		Map<String, String> resultMap = new HashMap<String, String>();
		if (apvNo > 0) {
			MultipartFile file = vo.getFileObj();
			System.out.println("file = " + file);
			System.out.println("name = " + file.getName());
			String upload = request.getSession().getServletContext().getRealPath("/upload");
			String orgFileName = file.getOriginalFilename();
			File path = new File(upload);
			File dest = new File(String.format("%s/%s", upload, orgFileName));
			try {
				if (!path.exists()) {
					path.mkdirs();
				}
				file.transferTo(dest);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmsss");
				String today = sdf.format(new Date());
				String ext = orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				String saveName = String.format("approvalAttach_%s.%s", today, ext);
				File saveFile = new File(String.format("%s/%s", upload, saveName));
				System.out.println("dest = " + dest.getAbsolutePath());
				System.out.println("saveFile = " + saveFile.getAbsolutePath());
				boolean success = dest.renameTo(saveFile);
				System.out.println("success = " + success);
				if (success) {
					ApprovalAttachDTO dto = new ApprovalAttachDTO();
					dto.setApvNo(vo.getApvNo());
					dto.setAptOriginName(orgFileName);
					dto.setAptSaveName(saveName);
					dto.setAptPath(dest.getAbsolutePath());
					dto.setAptFileSize((int) file.getSize());
					int result = apvService.insertApprovalAttach(dto);
					if (result > 0) {
						resultMap.put("result", "success");
						return resultMap;
					}
				} else {
					resultMap.put("result", "fileRenameFailed");
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		resultMap.put("result", "failed");
		return resultMap;
	}
}
