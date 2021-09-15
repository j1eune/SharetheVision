package com.kh.SharetheVision.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
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
import com.kh.SharetheVision.approval.model.vo.ApprovalAcceptDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalStatusDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.attachments.model.service.AttachmentService;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.leave.model.service.LeaveService;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService apvService;
	
	@Autowired
	private AttachmentService aService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private CommuteService coService;
	
	@Autowired
	private LeaveService leService;

	@RequestMapping(value = "approval.ap", method = RequestMethod.GET)
	public String approval(HttpSession session, Model model) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		String mCode = m.getmCode();
		String name = m.getName();
		int deptNo = m.getDeptNo();
		
		//TEAM 프로필 가져오기
		ArrayList<Member> profileList = mService.selectTeamMember(deptNo);
		model.addAttribute("profileList",profileList);
		
		// 결재 selectbox 회원정보 뿌려주기
		List<Member> aplist = apvService.aplist();
		model.addAttribute("aplist", aplist);
		
		ApprovalVO ap = new ApprovalVO();
		ap.setmCode(mCode);
		ap.setmId(m.getmId());
		System.out.println("mId = " + m.getmId());
		System.out.println("mCode = " + m.getmCode());

		List<ApprovalVO> listAll = null;
		try {
			// 기안자, 합의자, 참조자, 결재자에 로그인한 유저가 있으면 다 가져오기
			listAll = apvService.selectApproval(ap);
			System.out.println(listAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] mCodeArr = new String[listAll.size()];
		ArrayList<Member> nameList = new ArrayList<Member>();
		Member nameMember = null;
		for(int i = 0; i < listAll.size(); i++) {
			mCodeArr[i] = listAll.get(i).getmCode();
			nameMember = new Member();
			nameMember = mService.selectMemberName(mCodeArr[i]);
			nameList.add(nameMember);
		}
		ArrayList<Attachment> apProfile = aService.selectProjectMember(mCodeArr);
		model.addAttribute("apProfile",apProfile);
		model.addAttribute("nameList", nameList);
//		System.out.println(listAll);
		
		List<ApprovalAcceptDTO> acceptList = apvService.selectApprovalAceeptList();
		List<ApprovalStatusDTO> statusList = apvService.selectApprovalStatusList();
		int statusCompleteCount = 0;
		int statusTotalCount = 0;
		for (ApprovalStatusDTO dto : statusList) {
			if (dto.getSubCode().equals("C")) {
				statusCompleteCount += dto.getCount();
			}
			statusTotalCount += dto.getCount();
		}
		model.addAttribute("statusCompleteCount", statusCompleteCount);
		model.addAttribute("statusTotalCount", statusTotalCount);
		model.addAttribute("acceptList", acceptList);
		model.addAttribute("statusList", statusList);
		ArrayList<ApprovalVO> list = new ArrayList<ApprovalVO>();
		for(ApprovalVO apv : listAll) {
			if(apv.getApvAgr() != null && apv.getApvAgr().indexOf(name) > -1) {
				// 로그인 유저가 합의자면 결재 상태에 상관없음
				list.add(apv);
			} else if(apv.getApvAgr() != null && apv.getApvApp().indexOf(name) > -1 && !apv.getApvStatus().equals("A")) {
				// 합의자가 있는 상황에서 로그인 유저가 결재자고, 결재상태가 A(미결재)가 아닐 때
				list.add(apv);
			} else if(apv.getApvAgr() == null && apv.getApvApp().indexOf(name) > -1) {
				// 합의자가 없는 상황에서 로그인 유저가 결재자 일 때
				list.add(apv);
			} else if(apv.getApvRef() != null && (apv.getApvRef().indexOf(name) > -1 && (apv.getApvStatus().equals("C") || apv.getApvStatus().equals("D")))){
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

		List<ApprovalVO> list = apvService.selectTypeApproval(ap);

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
			String[] avgArr = vo.getApvAgr().split(",");
			String[] refArr = vo.getApvRef().split(",");
			String[] appArr = vo.getApvApp().split(",");
			for (String avg : avgArr) {
				apvService.insertApprovalAccept(new ApprovalAcceptDTO(vo.getApvNo(), avg, "AGR"));
			}
			for (String ref : refArr) {
				apvService.insertApprovalAccept(new ApprovalAcceptDTO(vo.getApvNo(), ref, "REF"));
			}
			for (String app : appArr) {
				apvService.insertApprovalAccept(new ApprovalAcceptDTO(vo.getApvNo(), app, "APP"));
			}
			resultMap.put("result", "SUCCESS");
			if (vo.getFileObj() != null && !vo.getFileObj().isEmpty()) {
				MultipartFile file = vo.getFileObj();
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
		}
		resultMap.put("result", "failed");
		return resultMap;
	}
	
	// 결재상세 화면 ajax
	@ResponseBody
	@RequestMapping(value = "detailApproval.ap", produces = "application/json; charset=utf-8")
	public String detailApproval(@RequestParam("apvNo") int apvNo) {
		ApprovalVO ap = new ApprovalVO();
		ap.setApvNo(apvNo);

		ApprovalVO apv = apvService.selectOne(ap);
		System.out.println(apv);
		if (apv.getApvRef() == null) {
			apv.setApvRef("");
		} else if (apv.getApvAgr() == null) {
			apv.setApvAgr("");
		}
		Attachment profile = aService.selectProfile(apv.getmCode());
		if (profile != null) {
			apv.setAtChange(profile.getAtChange());
		} else {
			apv.setAtChange("");
		}
		ApprovalAttachDTO at = apvService.selectAttachedFile(apvNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("apv", apv);
		map.put("at", at);

		return gson.toJson(map);
	}

	@ResponseBody
	@RequestMapping("approvalAccept.ap")
	public Map<String, Object> approvalAccept(ApprovalAcceptDTO dto, @RequestParam("status") String status, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		dto.setMemId(loginUser.getmId());
		dto.setAcceptType(status);
		Map<String, Object> resultMap = new HashMap<>();
		String approvalType = apvService.selectLoginUserType(dto);
		int count = apvService.selectNotAcceptCount(dto);

		if (approvalType.equals("APP") && count != 0) {
			resultMap.put("message", "아직 합의자가 승인을 완료하지 않았습니다.");
			return resultMap;
		}

		if (status.equals("ACCEPT")) {
			dto.setAcceptYn("Y");
			int updateCount = apvService.updateApprovalAccept(dto);
			if (approvalType.equals("AGR")) {
				if (updateCount > 0) {
					resultMap.put("result", "SUCCESS");
					count = apvService.selectNotAcceptCount(dto);
					if (count == 0) {
						dto.setApprovalStatus("B");
						if (apvService.updateApprovalStatus(dto) == 0) {
							resultMap.put("result", "FAILED");
						}
					}
				} else {
					resultMap.put("result", "FAILED");
				}
			} else if (approvalType.equals("APP")) { 
				if (updateCount > 0) {
					resultMap.put("result", "SUCCESS");
					dto.setApprovalStatus("C");
					if (apvService.updateApprovalStatus(dto) == 0) {
						resultMap.put("result", "FAILED");
					}
				}
			}
		} else if (status.equals("REFUSE")) {
			dto.setAcceptYn("D");
			dto.setApprovalStatus("D");
			if (apvService.updateApprovalAccept(dto) > 0) {
				apvService.updateApprovalStatus(dto);
			}
		} else if (status.equals("CANCEL")) {
			dto.setAcceptYn("A");
			dto.setApprovalStatus("A");
			if (apvService.updateApprovalAccept(dto) > 0) {
				apvService.updateApprovalAccept(dto);
			}
		}
		
		// 휴가
		ApprovalVO apv = new ApprovalVO();
		apv.setApvNo(dto.getApvNo());
		ApprovalVO ap = apvService.selectOne(apv);
		String result = update(ap);
		
		if(result.equals("success")) {
			resultMap.put("list", apvService.selectApprovalAceeptList());			
		}
		
		return resultMap;
	}
	
	public String update(ApprovalVO ap) {
		// 업데이트 하는 쿼리
		// 마지막 C또는 D가 끝나면
//		int apvRefNo = 18;
		
		String type = ap.getApvType();
		int no = ap.getApvRefNo();
		
		int result = 0;
		if(ap.getApvStatus().equals("C") || ap.getApvStatus().equals("D")) {
			System.out.println("결재끝");
			if(type.equals("휴가")) {
				// 휴가신청 update
				System.out.println("휴가신청 입장");
				result = leService.leaveUpdate(no);
			} else if(type.equals("연장근무")) {
				// 연장근무 update
				System.out.println("연장근무 입장");
				result = coService.overworkUpdate(no);
			} else if(type.equals("근태변경")) {
				System.out.println("근태변경 입장");
				
				String[] comArr = ap.getComment().split("\r\n");
				String date = comArr[1].substring(5);
				String start = comArr[2].substring(7);
				String end = comArr[3].substring(7);
				
				Commute co = new Commute();
				co.setCommuteStart(date + " " + start + ":00");
				co.setCommuteEnd(date + " " + end + ":00");
				co.setStatus(0);
				
				try {
					SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
					java.util.Date startDate = sdf2.parse(start);
					java.util.Date endDate = sdf2.parse(end);
					
					long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
					long hour = diffSec/3600;
					long min = diffSec%3600/60;
					
					String mins = (min < 10) ? "0"+min : Long.toString(min);
					String fTime = (hour - 1 + "." + mins);
					
					double workTime = Double.parseDouble(fTime);
					
					co.setWorktime(workTime);
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				co.setCommuteNo(no);
				result = coService.updateCommute(co);
			}
			
		}
		
		return "success";
	}
}
