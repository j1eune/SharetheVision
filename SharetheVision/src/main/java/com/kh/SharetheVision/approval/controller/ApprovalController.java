package com.kh.SharetheVision.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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

		String mId = "";

		// 결재 selectbox 회원정보 뿌려주기
		List<Member> aplist = apvService.aplist();

		model.addAttribute("aplist", aplist);

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
